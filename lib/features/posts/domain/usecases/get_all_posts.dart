import 'package:dartz/dartz.dart';
import 'package:news/core/error/failures.dart';
import 'package:news/features/posts/domain/entities/post.dart';
import 'package:news/features/posts/domain/repositories/posts_repository.dart';

class GetAllPostsUsecase {
  final PostsRepository repository;

  GetAllPostsUsecase(this.repository);

  Future<Either<Failure, List<PostsEntity>>> call(String country) async {
    return await repository.getAllPosts(country);
  }
}
