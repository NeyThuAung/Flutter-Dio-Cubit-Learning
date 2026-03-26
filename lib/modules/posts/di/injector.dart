import 'package:dio_cubit_learning/core/network/dio_client.dart';
import 'package:dio_cubit_learning/modules/posts/data/datasource/post_remote_data_source.dart';
import 'package:dio_cubit_learning/modules/posts/data/repository_impl/post_repository_impl.dart';
import 'package:dio_cubit_learning/modules/posts/domain/repositories/post_repository.dart';
import 'package:dio_cubit_learning/modules/posts/domain/usecases/get_posts.dart';
import 'package:dio_cubit_learning/modules/posts/presentation/cubits/post_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  // Dio
  getIt.registerLazySingleton(() => DioClient().dio);

  // Data Source
  getIt.registerLazySingleton(() => PostRemoteDataSource(getIt()));

  // Repository
  getIt.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(getIt()),
  );

  // UseCase
  getIt.registerLazySingleton(() => GetPosts(getIt()));

  // Cubit
  getIt.registerFactory(() => PostCubit(getIt()));
}
