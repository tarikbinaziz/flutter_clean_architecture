import 'dart:convert';

import 'result.dart';

class ArticleModel {
  String? status;
  String? copyright;
  int? numResults;
  List<Result>? results;

  ArticleModel({
    this.status,
    this.copyright,
    this.numResults,
    this.results,
  });

  factory ArticleModel.fromMap(Map<String, dynamic> data) => ArticleModel(
        status: data['status'] as String?,
        copyright: data['copyright'] as String?,
        numResults: data['num_results'] as int?,
        results: (data['results'] as List<dynamic>?)
            ?.map((e) => Result.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'copyright': copyright,
        'num_results': numResults,
        'results': results?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ArticleModel].
  factory ArticleModel.fromJson(String data) {
    return ArticleModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ArticleModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
