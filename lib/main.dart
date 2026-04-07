import 'package:dio_cubit_learning/modules/posts/di/injector.dart';
import 'package:dio_cubit_learning/modules/posts/presentation/screens/error_screen.dart';
import 'package:dio_cubit_learning/modules/posts/presentation/screens/go_router_transition_animation_screen.dart';
import 'package:dio_cubit_learning/modules/posts/presentation/screens/history_screen.dart';
import 'package:dio_cubit_learning/modules/posts/presentation/screens/login_screen.dart';
import 'package:dio_cubit_learning/modules/posts/presentation/screens/post_detail_screen.dart';
import 'package:dio_cubit_learning/modules/posts/presentation/screens/posts_screen.dart';
import 'package:dio_cubit_learning/modules/posts/presentation/screens/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize GetIt
  setup();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      // home: PostPage(),
      debugShowCheckedModeBanner: false,
    );
  }

  final GoRouter _router = GoRouter(
    // initialLocation: '/',
    errorBuilder: (context, state) => ErrorScreen(),
    redirect: (context, state) {
      final isLoggedIn = true;

      if (!isLoggedIn) {
        return '/login';
      }
      return null;
    },
    routes: [
      GoRoute(
        name: RouteName.login,
        path: "/login",
        builder: ((context, state) => LoginScreen()),
      ),
      GoRoute(
        name: RouteName.post,
        path: "/",
        builder: ((context, state) => const PostPage()),

        // Nested Routes with Query Parameter
        routes: [
          GoRoute(
            name: RouteName.details,
            path: "details",
            builder: ((context, state) =>
                PostDetailScreen(postId: state.uri.queryParameters['postId']!)),

            routes: [
              GoRoute(
                name: RouteName.transitionAnimation,
                path: "/animation",
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    transitionDuration: const Duration(milliseconds: 500),
                    fullscreenDialog: false,
                    child: GoRouterTransitionAnimationScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: CurveTween(
                              curve: Curves.easeInOutCirc,
                            ).animate(animation),
                            child: child,
                          );
                        },
                  );
                },
              ),
            ],
          ),
        ],
      ),

      // Normal route with Path Parameter
      // GoRoute(
      //   name: RouteName.history,
      //   path: "/history/:name",
      //   builder: ((context, state) =>
      //       HistoryScreen(name: state.pathParameters["name"]!)),
      // ),

      // Named Route with Path Parameter
      GoRoute(
        name: RouteName.history,
        path: "/history/:name",
        builder: ((context, state) =>
            HistoryScreen(name: state.pathParameters["name"]!)),
      ),
    ],
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API call wit Dio and Cubit')),
      body: Column(children: []),
    );
  }
}
