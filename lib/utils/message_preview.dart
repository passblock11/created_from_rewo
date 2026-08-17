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
};

bool isSupportedMessageType(String type) => _supportedTypes.contains(type);

String previewForMessageType(String type, Map<String, dynamic> metadata) {
  switch (type) {
    case 'image':
      return '📷 Photo';
    case 'video':
      return '🎥 Video';
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
