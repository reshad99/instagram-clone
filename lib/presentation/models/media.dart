import 'package:hive_flutter/adapters.dart';
part 'media.g.dart';

@HiveType(typeId: 3)
class Media {
  @HiveField(0)
  String? path;
  @HiveField(1)
  String? extension;
  @HiveField(2)
  String? mimeType;
  @HiveField(3)
  String? fileSize;
  @HiveField(4)
  String? width;
  @HiveField(5)
  String? height;

  Media({
    this.path,
    this.extension,
    this.mimeType,
    this.fileSize,
    this.width,
    this.height,
  });

  Media copyWith({
    String? path,
    String? extension,
    String? mimeType,
    String? fileSize,
    String? width,
    String? height,
  }) =>
      Media(
        path: path ?? this.path,
        extension: extension ?? this.extension,
        mimeType: mimeType ?? this.mimeType,
        fileSize: fileSize ?? this.fileSize,
        width: width ?? this.width,
        height: height ?? this.height,
      );

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        path: json["path"],
        extension: json["extension"],
        mimeType: json["mime_type"],
        fileSize: json["file_size"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "extension": extension,
        "mime_type": mimeType,
        "file_size": fileSize,
        "width": width,
        "height": height,
      };
}
