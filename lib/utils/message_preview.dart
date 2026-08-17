const _supportedTypes = {
  'text',
  'image',
  'video',
  'audio',
  'document',
  'sticker',
  'location',
  'contact',
  'poll',
  'event',
  'album',
};

bool isSupportedMessageType(String type) => _supportedTypes.contains(type);

String deletedMessagePreview({required String viewerId, required String senderId}) {
  return senderId == viewerId
      ? 'You deleted this message'
      : 'This message was deleted';
}

String previewForMessageType(String type, Map<String, dynamic> metadata) {
  switch (type) {
    case 'image':
      return '📷 Photo';
    case 'video':
      return '🎥 Video';
    case 'album':
      final items = metadata['items'] as List?;
      final count = items?.length ?? 0;
      if (count <= 0) return '📷 Album';
      final videos = items!.where((item) {
        if (item is! Map) return false;
        return item['type'] == 'video';
      }).length;
      final images = count - videos;
      if (videos > 0 && images > 0) {
        return '📷 $count items';
      }
      if (videos > 0) {
        return videos == 1 ? '🎥 Video' : '🎥 $videos videos';
      }
      return count == 1 ? '📷 Photo' : '📷 $count photos';
    case 'audio':
      return '🎤 Voice message';
    case 'document':
      final name = metadata['filename'] as String?;
      return name != null && name.trim().isNotEmpty
          ? '📄 $name'
          : '📄 Document';
    case 'sticker':
      final emoji = metadata['emoji'] as String?;
      return emoji ?? '🎨 Sticker';
    case 'location':
      final label = metadata['label'] as String?;
      return label != null && label.trim().isNotEmpty
          ? '📍 $label'
          : '📍 Location';
    case 'contact':
      final name = metadata['name'] as String?;
      return name != null && name.trim().isNotEmpty
          ? '👤 $name'
          : '👤 Contact';
    case 'poll':
      final question = metadata['question'] as String?;
      return question != null && question.trim().isNotEmpty
          ? '📊 $question'
          : '📊 Poll';
    case 'event':
      final title = metadata['title'] as String?;
      return title != null && title.trim().isNotEmpty
          ? '📅 $title'
          : '📅 Event';
    default:
      return '';
  }
}
