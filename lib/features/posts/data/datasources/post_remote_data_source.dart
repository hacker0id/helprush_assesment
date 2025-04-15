import 'package:dio/dio.dart';
import 'package:helprush_assesment/core/errors/exceptions.dart';
import 'package:helprush_assesment/features/posts/data/models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getPosts();
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final Dio dio;

  PostRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<PostModel>> getPosts() async {
    try {
      final response = await dio.get(
        'https://jsonplaceholder.typicode.com/posts',
      );
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((post) => PostModel.fromJson(post))
            .toList();
      } else {
        throw ServerException();
      }
    } on DioException {
      throw ServerException();
    }
  }
}
