import 'package:clean_architecture/core/network/dio_network.dart';
import 'package:clean_architecture/core/utils/injections.dart';
import 'package:clean_architecture/features/article/data/data_sources/remote/article_imp_api.dart';

initArticlesInjections() {
  sl.registerSingleton(ArticleImpApi(dio:DioNetwork.appAPI));
}
