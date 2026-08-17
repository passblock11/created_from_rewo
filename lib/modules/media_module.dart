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

    if (file.bytes.length > 25 * 1024 * 1024) {
      throw BadRequestException('File too large (max 25 MB)');
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
