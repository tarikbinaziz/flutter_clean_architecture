import 'package:clean_architecture/core/network/error/dio_error_handler.dart';
import 'package:clean_architecture/core/network/error/exceptions.dart';
import 'package:clean_architecture/core/utils/constant/network_constant.dart';
import 'package:clean_architecture/features/article/data/data_sources/remote/abstract_article_api.dart';
import 'package:clean_architecture/features/article/domain/model/article_model/article_params.dart';
import 'package:clean_architecture/features/article/domain/model/article_model/article_response_model.dart';
import 'package:clean_architecture/features/article/domain/model/article_model/result.dart';
import 'package:dio/dio.dart';

class ArticleImpApi extends AbstractArticleApi {
  final Dio dio;
  ArticleImpApi({required this.dio});

  // article method
  @override
  Future<ApiResponse<List<Result>>> getArticles(ArticlesParams params) async {
    try {
      final result = await dio.get(
        getArticlePath(params.period),
      );

      if (result.data == null) {
        throw ServerException("Unknown Error", result.statusCode);
      }
      return ApiResponse.fromJson<List<Result>>(
          result.data, Result.fromJsonList);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        throw CancelTokenException(handleDioError(e), e.response?.statusCode);
      } else {
        throw ServerException(handleDioError(e), e.response?.statusCode);
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}
