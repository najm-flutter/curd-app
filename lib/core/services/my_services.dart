import 'package:block_test/features/posts/data/datasources/local_data_source.dart';
import 'package:block_test/features/posts/data/datasources/remote_data_source.dart';
import 'package:block_test/features/posts/data/repositories/repo_post_imp.dart';
import 'package:block_test/features/posts/domain/repositories/repo_posts.dart';
import 'package:block_test/features/posts/domain/usecases/add_post_usecases.dart';
import 'package:block_test/features/posts/domain/usecases/delete_post_usecases.dart';
import 'package:block_test/features/posts/domain/usecases/get_all_post_usecases.dart';
import 'package:block_test/features/posts/domain/usecases/update_post_usecases.dart';
import 'package:block_test/features/posts/presentation/bloc/aduposts/adu_posts_bloc.dart';
import 'package:block_test/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

GetIt sl = GetIt.instance ; 

Future<void> init () async {
  //!features
  
  //*bloc
  sl.registerFactory(() => PostsBloc(getAllPostUsecases: sl())) ;
  sl.registerFactory(() => AduPostsBloc(addPostUsecases: sl(), updatePostUsecases: sl(), deletePostUsecases: sl())) ;
  //*useCases 
  sl.registerLazySingleton(() => GetAllPostUsecases(repoPosts: sl())) ;
  sl.registerLazySingleton(() => AddPostUsecases(repoPosts: sl())) ;
  sl.registerLazySingleton(() => UpdatePostUsecases(repoPosts: sl())) ;
  sl.registerLazySingleton(() => DeletePostUsecases(repoPosts: sl())) ; 

  //data source 
  sl.registerLazySingleton<RepoPosts>(() => RepoPostsImp(remoteDataSource: sl(), localDataSource: sl())) ;
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImp(httpClient: sl()));
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImp(sharedPreferences: sl())) ;
  //core 

  //packeg
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance() ;
  sl.registerLazySingleton(() => http.Client()) ;
  sl.registerLazySingleton(() => sharedPreferences) ;
}