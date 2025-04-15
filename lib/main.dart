import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helprush_assesment/core/constants/strings.dart';
import 'package:helprush_assesment/features/posts/presentation/bloc/post_bloc.dart';
import 'package:helprush_assesment/features/posts/presentation/pages/posts_page.dart';
import 'package:helprush_assesment/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      home: BlocProvider(
        create: (context) => di.sl<PostBloc>()..add(FetchPosts()),
        child: const PostsPage(),
      ),
    );
  }
}
