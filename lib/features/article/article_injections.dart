import 'package:clean_architecture/core/network/dio_network.dart';
import 'package:clean_architecture/core/utils/injections.dart';
import 'package:clean_architecture/features/article/data/data_sources/remote/article_imp_api.dart';
import 'package:clean_architecture/features/article/data/repositories/articles_repo_impl.dart';
import 'package:clean_architecture/features/article/domain/repositories/abstract_articles_repository.dart';
import 'package:clean_architecture/features/article/domain/usecases/articles_usecase.dart';

initArticlesInjections() {
  getItInstance
      .registerSingleton<ArticleImpApi>(ArticleImpApi(dio: DioNetwork.appAPI));
  getItInstance
      .registerSingleton<ArticlesUsecase>(ArticlesUsecase(getItInstance()));
  getItInstance.registerSingleton<AbstractArticlesRepository>(
      ArticlesRepositoryImpl(getItInstance()));
        // getItInstance.registerSingleton<ArticlesSharedPrefs>(ArticlesSharedPrefs(sl()));
}
