import 'package:dio_cubit_learning/modules/posts/domain/entities/post.dart';

class PostModel extends Post {
  PostModel({required int id, required String title})
    : super(postId: id, title: title);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(id: json['id'], title: json['title']);
  }
}
