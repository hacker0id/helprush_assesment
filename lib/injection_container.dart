import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:helprush_assesment/core/network/network_info.dart';
import 'package:helprush_assesment/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:helprush_assesment/features/posts/data/repositories/post_repository_impl.dart';
import 'package:helprush_assesment/features/posts/domain/repositories/post_repository.dart';
import 'package:helprush_assesment/features/posts/domain/usecases/get_posts.dart';
import 'package:helprush_assesment/features/posts/presentation/bloc/post_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - Posts
  // Bloc
  sl.registerFactory(() => PostBloc(getPosts: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetPosts(sl()));

  // Repository
  sl.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()),
  );

  // Data sources
  sl.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSourceImpl(dio: sl()),
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
