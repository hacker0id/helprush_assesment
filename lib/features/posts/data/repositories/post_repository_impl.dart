import 'package:dartz/dartz.dart';
import 'package:helprush_assesment/core/constants/strings.dart';
import 'package:helprush_assesment/core/errors/exceptions.dart';
import 'package:helprush_assesment/core/errors/failures.dart';
import 'package:helprush_assesment/core/network/network_info.dart';
import 'package:helprush_assesment/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:helprush_assesment/features/posts/domain/entities/post.dart';
import 'package:helprush_assesment/features/posts/domain/repositories/post_repository.dart';

import '../models/post_model.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  PostRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Post>>> getPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getPosts();
        // Convert PostModel list to Post list
        return Right(remotePosts.map((model) => model.toEntity()).toList());
      } on ServerException {
        return Left(ServerFailure(AppStrings.serverFailureMessage));
      }
    } else {
      return Left(NetworkFailure(AppStrings.networkFailureMessage));
    }
  }
}
