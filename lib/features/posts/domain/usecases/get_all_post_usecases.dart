import 'package:block_test/core/class/failur.dart';
import 'package:block_test/features/posts/domain/entities/post_entities.dart';
import 'package:block_test/features/posts/domain/repositories/repo_posts.dart';
import 'package:dartz/dartz.dart';

class GetAllPostUsecases {
 final RepoPosts repoPosts ;
  GetAllPostUsecases({required this.repoPosts});
  Future<Either<Failur  , List<PostEntities>>> call () async {
    return repoPosts.getAllPosts() ;
  }
}