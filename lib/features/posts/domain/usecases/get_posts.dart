import 'package:dartz/dartz.dart';
import 'package:helprush_assesment/core/errors/failures.dart';
import 'package:helprush_assesment/core/usecases/usecase.dart';

import '../entities/post.dart';
import '../repositories/post_repository.dart';

class GetPosts implements UseCase<List<Post>, NoParams> {
  final PostRepository repository;

  GetPosts(this.repository);

  @override
  Future<Either<Failure, List<Post>>> call(NoParams params) async {
    return await repository.getPosts();
  }
}
