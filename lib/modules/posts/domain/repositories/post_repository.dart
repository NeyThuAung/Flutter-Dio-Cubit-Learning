import 'package:dio_cubit_learning/modules/posts/domain/entities/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
}
