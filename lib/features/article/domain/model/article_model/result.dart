import 'dart:convert';

import 'media.dart';

class Result {
  String? uri;
  String? url;
  int? id;
  int? assetId;
  String? source;
  String? publishedDate;
  String? updated;
  String? section;
  String? subsection;
  String? nytdsection;
  String? adxKeywords;
  dynamic column;
  String? byline;
  String? type;
  String? title;
  String? abstract;
  List<String>? desFacet;
  List<dynamic>? orgFacet;
  List<String>? perFacet;
  List<String>? geoFacet;
  List<Media>? media;
  int? etaId;

  Result({
    this.uri,
    this.url,
    this.id,
    this.assetId,
    this.source,
    this.publishedDate,
    this.updated,
    this.section,
    this.subsection,
    this.nytdsection,
    this.adxKeywords,
    this.column,
    this.byline,
    this.type,
    this.title,
    this.abstract,
    this.desFacet,
    this.orgFacet,
    this.perFacet,
    this.geoFacet,
    this.media,
    this.etaId,
  });

  factory Result.fromMap(Map<String, dynamic> data) => Result(
        uri: data['uri'] as String?,
        url: data['url'] as String?,
        id: data['id'] as int?,
        assetId: data['asset_id'] as int?,
        source: data['source'] as String?,
        publishedDate: data['published_date'] as String?,
        updated: data['updated'] as String?,
        section: data['section'] as String?,
        subsection: data['subsection'] as String?,
        nytdsection: data['nytdsection'] as String?,
        adxKeywords: data['adx_keywords'] as String?,
        column: data['column'] as dynamic,
        byline: data['byline'] as String?,
        type: data['type'] as String?,
        title: data['title'] as String?,
        abstract: data['abstract'] as String?,
        desFacet: data['des_facet'] as List<String>?,
        orgFacet: data['org_facet'] as List<dynamic>?,
        perFacet: data['per_facet'] as List<String>?,
        geoFacet: data['geo_facet'] as List<String>?,
        media: (data['media'] as List<dynamic>?)
            ?.map((e) => Media.fromMap(e as Map<String, dynamic>))
            .toList(),
        etaId: data['eta_id'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'uri': uri,
        'url': url,
        'id': id,
        'asset_id': assetId,
        'source': source,
        'published_date': publishedDate,
        'updated': updated,
        'section': section,
        'subsection': subsection,
        'nytdsection': nytdsection,
        'adx_keywords': adxKeywords,
        'column': column,
        'byline': byline,
        'type': type,
        'title': title,
        'abstract': abstract,
        'des_facet': desFacet,
        'org_facet': orgFacet,
        'per_facet': perFacet,
        'geo_facet': geoFacet,
        'media': media?.map((e) => e.toMap()).toList(),
        'eta_id': etaId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Result].
  factory Result.fromJson(String data) {
    return Result.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  static List<Result> fromJsonList(List? json) {
    return json?.map((e) => Result.fromJson(e)).toList() ?? [];
  }

  /// `dart:convert`
  ///
  /// Converts [Result] to a JSON string.
  String toJson() => json.encode(toMap());
}
