import 'package:bloc/bloc.dart';
import 'package:dio_cubit_learning/modules/posts/domain/entities/post.dart';
import 'package:dio_cubit_learning/modules/posts/domain/usecases/get_posts.dart';
import 'package:meta/meta.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final GetPosts getPosts;

  PostCubit(this.getPosts) : super(PostInitial());

  void fetchPosts() async {
    emit(PostLoading());

    try {
      final posts = await getPosts();
      emit(PostSuccess(posts));
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }
}
