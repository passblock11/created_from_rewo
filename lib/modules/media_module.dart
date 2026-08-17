import 'package:rewo/rewo.dart';

import '../auth/token_service.dart';
import '../services/binary_multipart.dart';
import '../services/cloudinary_service.dart';

class MediaModule implements RewoModule {
  @override
  String get name => 'media';

  @override
  void register(Rewo app) {
    if (!app.container.isRegistered<TokenService>()) return;

    final tokens = app.container.resolve<TokenService>();
    final authMiddleware = [JwtMiddleware(tokens.accessJwt).handler];
    final cloudinary = CloudinaryService(CloudinaryConfig.fromEnv());
    app.singleton<CloudinaryService>(cloudinary);

    app.post('/api/media', _upload, middleware: authMiddleware);
    app.post('/api/media/sign', _signUpload, middleware: authMiddleware);
  }

  static const _maxProxyBytes = 25 * 1024 * 1024;
  static const _maxVideoBytes = 5 * 1024 * 1024 * 1024;

  Future<Map<String, dynamic>> _signUpload(RequestContext ctx) async {
    final userId = _requireUserId(ctx);
    final body = await ctx.jsonBody();
    final resourceType = (body['resource_type'] as String? ?? 'video').trim();
    final size = body['size'];
    if (size is int && size > _maxVideoBytes) {
      throw BadRequestException('File too large (max 5 GB)');
    }
    if (size is num && size > _maxVideoBytes) {
      throw BadRequestException('File too large (max 5 GB)');
    }

    final cloudinary = ctx.container.resolve<CloudinaryService>();
    return cloudinary.createSignedUploadParams(
      userId: userId,
      resourceType: resourceType,
    );
  }

  Future<Map<String, dynamic>> _upload(RequestContext ctx) async {
    final userId = _requireUserId(ctx);
    final contentType = ctx.headers['content-type'] ?? '';
    if (!contentType.startsWith('multipart/form-data')) {
      throw BadRequestException('Expected multipart/form-data upload');
    }

    final bytes = await ctx.bodyBytes;
    final form = parseMultipartForm(bytes, contentType);
    final file = form.files['file'];
    if (file == null || file.bytes.isEmpty) {
      throw BadRequestException('file field is required');
    }

    if (file.bytes.length > _maxProxyBytes) {
      throw BadRequestException(
        'File too large for direct upload (max 25 MB). '
        'Use /api/media/sign for large videos.',
      );
    }

    final cloudinary = ctx.container.resolve<CloudinaryService>();
    final mimeType = guessMimeType(
      file.filename,
      provided: file.contentType,
    );
    final uploaded = await cloudinary.upload(
      bytes: file.bytes,
      filename: file.filename,
      mimeType: mimeType,
      userId: userId,
    );

    return uploaded.toJson();
  }

  String _requireUserId(RequestContext ctx) {
    final userId = ctx.userId;
    if (userId == null) throw UnauthorizedException('Not authenticated');
    return userId;
  }
}
