import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/post.dart';

abstract class PostsRepository {
  Future<Either<Failure, List<PostsEntity>>> getAllPosts(String country);
  Future<Either<Failure, Unit>> changeApi(String country);
}
