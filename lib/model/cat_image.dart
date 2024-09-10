// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CatImage {
  final String id;
  final int width;
  final int height;
  final String url;
  CatImage({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
  });

  CatImage copyWith({
    String? id,
    int? width,
    int? height,
    String? url,
  }) {
    return CatImage(
      id: id ?? this.id,
      width: width ?? this.width,
      height: height ?? this.height,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'width': width,
      'height': height,
      'url': url,
    };
  }

  factory CatImage.fromMap(Map<String, dynamic> map) {
    return CatImage(
      id: map['id'] as String? ?? '',
      width: map['width'] as int? ?? 0,
      height: map['height'] as int? ?? 0,
      url: map['url'] as String? ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CatImage.fromJson(String source) =>
      CatImage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CatImage(id: $id, width: $width, height: $height, url: $url)';
  }

  @override
  bool operator ==(covariant CatImage other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.width == width &&
        other.height == height &&
        other.url == url;
  }

  @override
  int get hashCode {
    return id.hashCode ^ width.hashCode ^ height.hashCode ^ url.hashCode;
  }
}
