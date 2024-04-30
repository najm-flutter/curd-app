import 'package:block_test/core/class/check_internet.dart';
import 'package:block_test/core/class/execption.dart';
import 'package:block_test/core/class/failur.dart';
import 'package:block_test/features/posts/data/datasources/local_data_source.dart';
import 'package:block_test/features/posts/data/datasources/remote_data_source.dart';
import 'package:block_test/features/posts/data/models/post_model.dart';
import 'package:block_test/features/posts/domain/entities/post_entities.dart';
import 'package:block_test/features/posts/domain/repositories/repo_posts.dart';
import 'package:dartz/dartz.dart';
typedef Action = Future<Unit> Function(); 
class RepoPostsImp implements RepoPosts {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  RepoPostsImp({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failur, List<PostEntities>>> getAllPosts() async {
    if (await IsConnectInternet().isConnectInternet) {
      try {
        final remotePosts = await remoteDataSource.getAllPosts();
        return right(remotePosts);
      } on ServerException {
        return left(ServerFailur());
      }
    } else {
      try {
        final localPosts = await localDataSource.getAllPosts();
        return right(localPosts);
      } on EmpityException {
        return left(EmpityFailur());
      }
    }
  }

  @override
  Future<Either<Failur, Unit>> addPost(PostEntities postEntities) async {
    return _multiActions(() async {
      return await remoteDataSource.addPost(PostModel(
          postId: postEntities.postId,
          title: postEntities.title,
          body: postEntities.body,
          userId: postEntities.userId));
    });
  }

  @override
  Future<Either<Failur, Unit>> deletePost(int postId) {
    return _multiActions(() async {
      return remoteDataSource.deletePost(postId);
    });
  }

  @override
  Future<Either<Failur, Unit>> updatePost(PostEntities postEntities) {
    return _multiActions(() async {
      return remoteDataSource.updatePost(PostModel(
          postId: postEntities.postId,
          title: postEntities.title,
          body: postEntities.body,
          userId: postEntities.userId));
    });
  }

  Future<Either<Failur, Unit>> _multiActions(Action action) async {
    if (await IsConnectInternet().isConnectInternet) {
      try {
        final remotPosts = await action();
        return right(remotPosts);
      } on ServerException {
        return left(ServerFailur());
      }
    } else {
      return left(OfflineFailur());
    }
  }
}
