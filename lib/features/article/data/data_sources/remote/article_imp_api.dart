import 'package:clean_architecture/features/article/data/data_sources/remote/abstract_article_api.dart';
import 'package:clean_architecture/features/article/domain/model/article_model/result.dart';
import 'package:dio/dio.dart';

class ArticleImpApi extends AbstractArticleApi {
  final Dio dio;
  ArticleImpApi({required this.dio});

  // article method
  @override
  Future <ApiResponse<List<Result>>> getArticles() {
  }
}
