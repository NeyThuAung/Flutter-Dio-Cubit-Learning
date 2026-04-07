import 'package:dio_cubit_learning/modules/posts/presentation/screens/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PostDetailScreen extends StatelessWidget {
  final String postId;

  const PostDetailScreen({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // GoRouter.of(context).go("/");
            context.goNamed(RouteName.post);
          },
        ),
        title: Text('Post Detail'),
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              "This is query parameter PostId  -  $postId",
            ),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(RouteName.transitionAnimation);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrangeAccent,
                elevation: 0,
              ),
              child: Text('Go Animation', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
