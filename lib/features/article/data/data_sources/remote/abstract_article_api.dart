import 'package:clean_architecture/features/article/domain/model/article_model/article_params.dart';
import 'package:clean_architecture/features/article/domain/model/article_model/article_response_model.dart';
import 'package:clean_architecture/features/article/domain/model/article_model/result.dart';

abstract class AbstractArticleApi {
  // get all articles result
  Future<ApiResponse<List<Result>>> getArticles(ArticlesParams params);
}
