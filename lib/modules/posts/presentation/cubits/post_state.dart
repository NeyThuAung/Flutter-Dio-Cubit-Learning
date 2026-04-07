part of 'post_cubit.dart';

@immutable
sealed class PostState {}

// Initial State
final class PostInitial extends PostState {}

// Loading State
final class PostLoading extends PostState {}

// Success State
final class PostSuccess extends PostState {
  final List<Post> posts;

  PostSuccess(this.posts);
}

// Error State
final class PostError extends PostState {
  final String message;

  PostError(this.message);
}
