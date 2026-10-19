class AttachmentItem {
  AttachmentItem({
    required this.id,
    required this.name,
    required this.path,
    required this.type,
    this.duration,
  });

  final String id;
  final String name;
  final String path;
  final AttachmentType type;
  final Duration? duration;
}

enum AttachmentType {
  document,
  audio,
}


