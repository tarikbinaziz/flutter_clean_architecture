import 'package:clean_architecture/core/network/error/failures.dart';
import 'package:clean_architecture/features/article/domain/model/article_model/article_params.dart';
import 'package:clean_architecture/features/article/domain/model/article_model/result.dart';
import 'package:dartz/dartz.dart';

abstract class AbstractArticlesRepository {
  // Gent Ny Times Articles
  Future<Either<Failure, List<Result>>> getArticles(ArticlesParams params);
}

/*
Either is a functional programming concept that represents a value that 
can be one of two possible types. It is commonly used for error handling and
result encapsulation in Dart and Flutter applications, particularly when
working with the fpdart package.

How Either Works:
  Either<L, R> has two generic types:
    L (Left) → Typically represents failure or an error.
    R (Right) → Typically represents success or a valid result.
  By convention:
    Left holds Failure (error).
    Right holds Success (data).

Why Use Either?
✅ Prevents Exceptions – No need for try-catch everywhere.
✅ Explicit Error Handling – Clearly separates success and failure states.
✅ Functional Approach – Encourages predictable, structured code.
*/