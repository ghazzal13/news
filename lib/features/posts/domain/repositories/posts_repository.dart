import 'package:dartz/dartz.dart';
import 'package:news/core/error/failures.dart';
import 'package:news/features/posts/domain/entities/post.dart';

abstract class PostsRepository {
  Future<Either<Failure, List<PostsEntity>>> getAllPosts(String country);
  Future<Either<Failure, Unit>> changeApi(String country);
  // Future<Either<Failure, Unit>> addPost(PostsEntity post);
  // Future<Either<Failure, Unit>> updatePost(PostsEntity post);
}
