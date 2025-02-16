import 'package:clean_architecture/core/network/error/failures.dart';
import 'package:clean_architecture/core/utils/usecases/usecase.dart';
import 'package:clean_architecture/features/article/domain/model/article_model/article_params.dart';
import 'package:clean_architecture/features/article/domain/model/article_model/result.dart';
import 'package:clean_architecture/features/article/domain/repositories/abstract_articles_repository.dart';
import 'package:dartz/dartz.dart';

class ArticlesUsecase extends UseCase<List<Result>, ArticlesParams> {
  final AbstractArticlesRepository repository;
  ArticlesUsecase(this.repository);

  @override
  Future<Either<Failure, List<Result>>> call(ArticlesParams params) async {
    final result = await repository.getArticles(params);
    return result.fold((l) {
      return Left(l);
    }, (r) {
      return Right(r);
    });
  }
}
