import 'package:flutter/material.dart';
import 'package:helprush_assesment/features/posts/domain/entities/post.dart';

class PostListItem extends StatelessWidget {
  final Post post;

  const PostListItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.teal.shade300,
      ),
      child: ListTile(
        // contentPadding: EdgeInsets.all(6),
        title: Text(
          post.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(post.body),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Post Title: ${post.title}')),
          ); // Please Use post.id to show post id & change the String to ID
        },
      ),
    );
  }
}
