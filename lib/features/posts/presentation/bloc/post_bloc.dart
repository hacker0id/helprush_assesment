library post_bloc;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:helprush_assesment/core/constants/strings.dart';
import 'package:helprush_assesment/core/errors/failures.dart';
import 'package:helprush_assesment/core/usecases/usecase.dart';
import 'package:helprush_assesment/features/posts/domain/entities/post.dart';
import 'package:helprush_assesment/features/posts/domain/usecases/get_posts.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPosts getPosts;

  PostBloc({required this.getPosts}) : super(PostInitial()) {
    on<FetchPosts>((event, emit) async {
      emit(PostLoading());
      final failureOrPosts = await getPosts(NoParams());
      failureOrPosts.fold(
        (failure) => emit(PostError(message: _mapFailureToMessage(failure))),
        (posts) => emit(PostLoaded(posts: posts)),
      );
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailureMessage;
      case NetworkFailure:
        return AppStrings.networkFailureMessage;
      default:
        return AppStrings.unexpectedError;
    }
  }
}
