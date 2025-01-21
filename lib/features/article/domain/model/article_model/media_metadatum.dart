import 'dart:convert';

class MediaMetadatum {
  String? url;
  String? format;
  int? height;
  int? width;

  MediaMetadatum({this.url, this.format, this.height, this.width});

  factory MediaMetadatum.fromMap(Map<String, dynamic> data) {
    return MediaMetadatum(
      url: data['url'] as String?,
      format: data['format'] as String?,
      height: data['height'] as int?,
      width: data['width'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'url': url,
        'format': format,
        'height': height,
        'width': width,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MediaMetadatum].
  factory MediaMetadatum.fromJson(String data) {
    return MediaMetadatum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MediaMetadatum] to a JSON string.
  String toJson() => json.encode(toMap());
}
