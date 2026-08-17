import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:rewo/rewo.dart';

class CloudinaryConfig {
  const CloudinaryConfig({
    required this.cloudName,
    required this.apiKey,
    required this.apiSecret,
    this.folder = 'rewo_chat',
  });

  final String cloudName;
  final String apiKey;
  final String apiSecret;
  final String folder;

  bool get isConfigured =>
      cloudName.isNotEmpty && apiKey.isNotEmpty && apiSecret.isNotEmpty;

  factory CloudinaryConfig.fromEnv() {
    final url = DotEnv.get('CLOUDINARY_URL');
    if (url.isNotEmpty && url.startsWith('cloudinary://')) {
      final match = RegExp(r'^cloudinary://([^:]+):([^@]+)@(.+)$').firstMatch(url);
      if (match != null) {
        return CloudinaryConfig(
          cloudName: match.group(3)!.trim(),
          apiKey: Uri.decodeComponent(match.group(1)!),
          apiSecret: Uri.decodeComponent(match.group(2)!),
          folder: DotEnv.get('CLOUDINARY_FOLDER', fallback: 'rewo_chat'),
        );
      }
    }

    return CloudinaryConfig(
      cloudName: DotEnv.get('CLOUDINARY_CLOUD_NAME'),
      apiKey: DotEnv.get('CLOUDINARY_API_KEY'),
      apiSecret: DotEnv.get('CLOUDINARY_API_SECRET'),
      folder: DotEnv.get('CLOUDINARY_FOLDER', fallback: 'rewo_chat'),
    );
  }
}

class CloudinaryUploadResult {
  const CloudinaryUploadResult({
    required this.publicId,
    required this.url,
    required this.mimeType,
    required this.size,
    required this.filename,
    this.thumbnailUrl,
    this.resourceType,
  });

  final String publicId;
  final String url;
  final String mimeType;
  final int size;
  final String filename;
  final String? thumbnailUrl;
  final String? resourceType;

  Map<String, dynamic> toJson() => {
        'id': publicId,
        'url': url,
        'filename': filename,
        'mime_type': mimeType,
        'size': size,
        if (thumbnailUrl != null) 'thumbnail_url': thumbnailUrl,
        if (resourceType != null) 'resource_type': resourceType,
      };
}

class CloudinaryService {
  CloudinaryService(this._config);

  final CloudinaryConfig _config;

  Map<String, dynamic> createSignedUploadParams({
    required String userId,
    String resourceType = 'video',
  }) {
    if (!_config.isConfigured) {
      throw StateError('Cloudinary is not configured');
    }
    final timestamp =
        (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString();
    final folder = userId.isEmpty
        ? _config.folder
        : '${_config.folder}/$userId';
    final signature = _sign({
      'folder': folder,
      'timestamp': timestamp,
    });
    final type = switch (resourceType) {
      'video' => 'video',
      'image' => 'image',
      _ => 'auto',
    };
    return {
      'cloud_name': _config.cloudName,
      'api_key': _config.apiKey,
      'timestamp': timestamp,
      'signature': signature,
      'folder': folder,
      'upload_url':
          'https://api.cloudinary.com/v1_1/${_config.cloudName}/$type/upload',
      'resource_type': type,
    };
  }

  Future<CloudinaryUploadResult> upload({
    required List<int> bytes,
    required String filename,
    required String mimeType,
    String? userId,
  }) async {
    if (!_config.isConfigured) {
      throw StateError(
        'Cloudinary is not configured. Set CLOUDINARY_URL or '
        'CLOUDINARY_CLOUD_NAME, CLOUDINARY_API_KEY, CLOUDINARY_API_SECRET.',
      );
    }

    final timestamp =
        (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString();
    final folder = userId == null || userId.isEmpty
        ? _config.folder
        : '${_config.folder}/$userId';
    final signature = _sign({
      'folder': folder,
      'timestamp': timestamp,
    });

    final uri = Uri.parse(
      'https://api.cloudinary.com/v1_1/${_config.cloudName}/auto/upload',
    );
    final request = http.MultipartRequest('POST', uri)
      ..fields['api_key'] = _config.apiKey
      ..fields['timestamp'] = timestamp
      ..fields['signature'] = signature
      ..fields['folder'] = folder
      ..files.add(
        http.MultipartFile.fromBytes(
          'file',
          bytes,
          filename: filename,
        ),
      );

    final response = await request.send();
    final body = await response.stream.bytesToString();
    if (response.statusCode >= 400) {
      throw BadRequestException(
        'Cloudinary upload failed (${response.statusCode}): $body',
      );
    }

    final json = jsonDecode(body) as Map<String, dynamic>;
    final secureUrl = json['secure_url'] as String? ?? '';
    if (secureUrl.isEmpty) {
      throw BadRequestException('Cloudinary upload returned no URL');
    }

    final resourceType = json['resource_type'] as String?;
    String? thumbnailUrl;
    if (resourceType == 'video') {
      thumbnailUrl = secureUrl
          .replaceFirst('/upload/', '/upload/so_0/');
    }

    return CloudinaryUploadResult(
      publicId: json['public_id'] as String? ?? '',
      url: secureUrl,
      mimeType: mimeType,
      size: json['bytes'] as int? ?? bytes.length,
      filename: filename,
      thumbnailUrl: thumbnailUrl,
      resourceType: resourceType,
    );
  }

  String _sign(Map<String, String> params) {
    final keys = params.keys.toList()..sort();
    final payload = keys.map((key) => '$key=${params[key]}').join('&');
    return sha1.convert(utf8.encode('$payload${_config.apiSecret}')).toString();
  }
}

String guessMimeType(String filename, {String? provided}) {
  if (provided != null && provided.trim().isNotEmpty) return provided.trim();
  final lower = filename.toLowerCase();
  if (lower.endsWith('.jpg') || lower.endsWith('.jpeg')) return 'image/jpeg';
  if (lower.endsWith('.png')) return 'image/png';
  if (lower.endsWith('.gif')) return 'image/gif';
  if (lower.endsWith('.webp')) return 'image/webp';
  if (lower.endsWith('.mp4')) return 'video/mp4';
  if (lower.endsWith('.mov')) return 'video/quicktime';
  if (lower.endsWith('.m4a')) return 'audio/mp4';
  if (lower.endsWith('.aac')) return 'audio/aac';
  if (lower.endsWith('.mp3')) return 'audio/mpeg';
  if (lower.endsWith('.wav')) return 'audio/wav';
  if (lower.endsWith('.ogg')) return 'audio/ogg';
  if (lower.endsWith('.pdf')) return 'application/pdf';
  if (lower.endsWith('.doc')) return 'application/msword';
  if (lower.endsWith('.docx')) {
    return 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
  }
  return 'application/octet-stream';
}
