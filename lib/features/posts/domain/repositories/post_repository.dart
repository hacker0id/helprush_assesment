import 'package:dartz/dartz.dart';
import 'package:helprush_assesment/core/errors/failures.dart';
import 'package:helprush_assesment/features/posts/domain/entities/post.dart';

abstract class PostRepository {
  Future<Either<Failure, List<Post>>> getPosts();
}
