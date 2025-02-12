import 'package:clean_architecture/core/network/error/exceptions.dart';
import 'package:clean_architecture/core/network/error/failures.dart';
import 'package:clean_architecture/features/article/data/data_sources/remote/article_imp_api.dart';
import 'package:clean_architecture/features/article/domain/model/article_model/article_params.dart';
import 'package:clean_architecture/features/article/domain/model/article_model/result.dart';
import 'package:clean_architecture/features/article/domain/repositories/abstract_articles_repository.dart';
import 'package:dartz/dartz.dart';

class ArticlesRepositoryImpl extends AbstractArticlesRepository {
  final ArticleImpApi articlesApi;

  ArticlesRepositoryImpl(
    this.articlesApi,
  );

  // Get By Times Articles
  @override
  Future<Either<Failure, List<Result>>> getArticles(
      ArticlesParams params) async {
    try {
      final result = await articlesApi.getArticles(params);
      return Right(result.results ?? []);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }
}
