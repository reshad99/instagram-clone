enum FileType { video, image, audio, text }

extension ConvertFile on FileType {
  static FileType fromString(String? str) {
    switch (str?.toLowerCase()) {
      case 'video':
        return FileType.video;
      case 'image':
        return FileType.image;
      case 'audio':
        return FileType.audio;
      case 'text':
        return FileType.text;
      default:
        return FileType.image;
    }
  }

  String get chatText {
    switch (this) {
      case FileType.audio:
        return "🎵 audio";
      case FileType.image:
        return "📷 photo";
      case FileType.video:
        return "🎥 video";
      default:
        return "GIF";
    }
  }

  String get name {
    switch (this) {
      case FileType.audio:
        return 'audio';
      case FileType.video:
        return 'video';
      case FileType.image:
        return 'image';
      case FileType.text:
        return 'text';
      default:
        return 'text';
    }
  }
}
