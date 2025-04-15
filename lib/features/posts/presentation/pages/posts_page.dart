import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helprush_assesment/core/constants/strings.dart';
import 'package:helprush_assesment/features/posts/presentation/bloc/post_bloc.dart';
import 'package:helprush_assesment/features/posts/presentation/widgets/post_list_item.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(AppStrings.posts),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostInitial) {
            return const Center(child: Text(AppStrings.pullToRefresh));
          } else if (state is PostLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.teal),
            );
          } else if (state is PostError) {
            return Center(child: Text(state.message));
          } else if (state is PostLoaded) {
            return RefreshIndicator(
              color: Colors.teal,
              onRefresh: () async {
                context.read<PostBloc>().add(FetchPosts());
              },
              child: ListView.builder(
                padding: EdgeInsets.all(10),

                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  return PostListItem(post: state.posts[index]);
                },
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
