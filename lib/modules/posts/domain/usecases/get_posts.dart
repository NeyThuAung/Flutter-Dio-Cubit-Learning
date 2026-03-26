import 'package:dio_cubit_learning/modules/posts/domain/entities/post.dart';
import 'package:dio_cubit_learning/modules/posts/domain/repositories/post_repository.dart';

class GetPosts {
  final PostRepository postRepository;

  GetPosts(this.postRepository);

  Future<List<Post>> call() async {
    return await postRepository.getPosts();
  }
}
