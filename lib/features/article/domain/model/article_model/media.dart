import 'dart:convert';

import 'media_metadatum.dart';

class Media {
  String? type;
  String? subtype;
  String? caption;
  String? copyright;
  int? approvedForSyndication;
  List<MediaMetadatum>? mediaMetadata;

  Media({
    this.type,
    this.subtype,
    this.caption,
    this.copyright,
    this.approvedForSyndication,
    this.mediaMetadata,
  });

  factory Media.fromMap(Map<String, dynamic> data) => Media(
        type: data['type'] as String?,
        subtype: data['subtype'] as String?,
        caption: data['caption'] as String?,
        copyright: data['copyright'] as String?,
        approvedForSyndication: data['approved_for_syndication'] as int?,
        mediaMetadata: (data['media-metadata'] as List<dynamic>?)
            ?.map((e) => MediaMetadatum.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'type': type,
        'subtype': subtype,
        'caption': caption,
        'copyright': copyright,
        'approved_for_syndication': approvedForSyndication,
        'media-metadata': mediaMetadata?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Media].
  factory Media.fromJson(String data) {
    return Media.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Media] to a JSON string.
  String toJson() => json.encode(toMap());
}
