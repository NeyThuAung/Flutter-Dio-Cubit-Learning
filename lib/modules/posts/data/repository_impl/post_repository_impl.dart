import 'package:dio_cubit_learning/modules/posts/data/datasource/post_remote_data_source.dart';
import 'package:dio_cubit_learning/modules/posts/domain/entities/post.dart';
import 'package:dio_cubit_learning/modules/posts/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remote;

  PostRepositoryImpl(this.remote);

  @override
  Future<List<Post>> getPosts() async {
    return await remote.getPosts();
  }
}
