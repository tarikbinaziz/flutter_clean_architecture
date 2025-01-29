import 'package:clean_architecture/features/article/domain/model/article_model/result.dart';

abstract class AbstractArticleApi {
  // get all articles result
  Future<List<Result>> getArticles();
}
