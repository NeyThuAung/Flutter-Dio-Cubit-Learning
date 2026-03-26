import 'package:dio/dio.dart';
import 'package:dio_cubit_learning/modules/posts/data/models/post_model.dart';

class PostRemoteDataSource {
  final Dio dio;

  PostRemoteDataSource(this.dio);

  Future<List<PostModel>> getPosts() async {
    final response = await dio.get("posts");

    return (response.data as List)
        .map((e) => PostModel.fromJson(e))
        .toList();
  }
}
