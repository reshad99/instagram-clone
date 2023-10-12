// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
    int? id;
    String? description;
    int? likes;
    int? comments;
    bool? liked;
    List<Media>? media;

    Post({
        this.id,
        this.description,
        this.likes,
        this.comments,
        this.liked,
        this.media,
    });

    Post copyWith({
        int? id,
        String? description,
        int? likes,
        int? comments,
        bool? liked,
        List<Media>? media,
    }) => 
        Post(
            id: id ?? this.id,
            description: description ?? this.description,
            likes: likes ?? this.likes,
            comments: comments ?? this.comments,
            liked: liked ?? this.liked,
            media: media ?? this.media,
        );

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        description: json["description"],
        likes: json["likes"],
        comments: json["comments"],
        liked: json["liked"],
        media: json["media"] == null ? [] : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "likes": likes,
        "comments": comments,
        "liked": liked,
        "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x.toJson())),
    };
}

class Media {
    String? path;
    String? extension;
    String? mimeType;
    String? fileSize;
    String? width;
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
