import 'package:dio_cubit_learning/modules/posts/di/injector.dart';
import 'package:dio_cubit_learning/modules/posts/presentation/screens/posts_screen.dart';
import 'package:flutter/material.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  setup(); // 🔗 initialize GetIt

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: PostPage(), debugShowCheckedModeBanner: false,);
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('API call wit Dio and Cubit')),
        body: Column(
          children: [
          ],
        ),
    );
  }
}
