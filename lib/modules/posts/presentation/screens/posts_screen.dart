import 'package:dio_cubit_learning/modules/posts/di/injector.dart';
import 'package:dio_cubit_learning/modules/posts/presentation/cubits/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PostCubit>()..fetchPosts(),
      child: const _PostView(),
    );
  }
}

class _PostView extends StatelessWidget {
  const _PostView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
        centerTitle: true,
      ),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          // 🔄 Loading
          if (state is PostLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // ✅ Success
          if (state is PostSuccess) {
            if (state.posts.isEmpty) {
              return const Center(
                child: Text("No posts found"),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                context.read<PostCubit>().fetchPosts();
              },
              child: ListView.separated(
                padding: const EdgeInsets.all(12),
                itemCount: state.posts.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final post = state.posts[index];

                  return Card(
                    elevation: 2,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(post.postId.toString()),
                      ),
                      title: Text(post.title),
                    ),
                  );
                },
              ),
            );
          }

          // ❌ Error
          if (state is PostError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    state.message,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      context.read<PostCubit>().fetchPosts();
                    },
                    child: const Text("Retry"),
                  ),
                ],
              ),
            );
          }

          // 🟡 Initial
          return Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<PostCubit>().fetchPosts();
              },
              child: const Text("Load Posts"),
            ),
          );
        },
      ),
    );
  }
}