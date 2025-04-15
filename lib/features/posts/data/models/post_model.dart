import 'package:equatable/equatable.dart';
import 'package:helprush_assesment/features/posts/domain/entities/post.dart';

class PostModel extends Equatable {
  final int id;
  final String title;
  final String body;

  const PostModel({required this.id, required this.title, required this.body});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(id: json['id'], title: json['title'], body: json['body']);
  }

  Map<String, dynamic> toJson() => {'id': id, 'title': title, 'body': body};

  @override
  List<Object> get props => [id, title, body];
  Post toEntity() {
    return Post(id: id, title: title, body: body);
  }
}
