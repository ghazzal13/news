import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:news/core/network/network_info.dart';
import 'package:news/features/posts/data/datasources/post_local_data_source.dart';
import 'package:news/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:news/features/posts/data/repositories/posts_repository_impl.dart';
import 'package:news/features/posts/domain/repositories/posts_repository.dart';
import 'package:news/features/posts/domain/usecases/get_all_posts.dart';
import 'package:news/features/posts/presentation/blocs/posts/posts_bloc.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //bloc
  //
  sl.registerFactory(() => PostsBloc(getAllPosts: sl()));
  // sl.registerFactory(() => AddUpdateDeletePostBloc(
  //     addPost: sl(), updatePost: sl(), deletePost: sl()));

//usecase
//
  sl.registerLazySingleton(() => GetAllPostsUsecase(sl()));
  // sl.registerLazySingleton(() => AddPostUsecase(sl()));
  // sl.registerLazySingleton(() => DeletePostUsecase(sl()));
  // sl.registerLazySingleton(() => UpdatePostUsecase(sl()));

  //repository
  //
  sl.registerLazySingleton<PostsRepository>(() => PostsRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  //datasourse
  //
  sl.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImpl(client: sl()));
  //
  sl.registerLazySingleton<PostLocalDataSource>(
      () => PostLocalDataSourceImpl(sharedPreferences: sl()));

  //
  //
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
