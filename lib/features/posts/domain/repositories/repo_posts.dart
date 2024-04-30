import 'package:block_test/core/class/failur.dart';
import 'package:block_test/features/posts/domain/entities/post_entities.dart';
import 'package:dartz/dartz.dart';

abstract class RepoPosts {
Future<Either<Failur ,List<PostEntities>>> getAllPosts() ;
Future<Either<Failur ,Unit>> deletePost(int postId) ;
Future<Either<Failur ,Unit>> updatePost(PostEntities postEntities) ;
Future<Either<Failur ,Unit>> addPost(PostEntities postEntities) ;
}