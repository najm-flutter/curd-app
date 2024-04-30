import 'package:block_test/core/class/failur.dart';
import 'package:block_test/features/posts/domain/repositories/repo_posts.dart';
import 'package:dartz/dartz.dart';

class DeletePostUsecases {
 final RepoPosts repoPosts ;

  DeletePostUsecases({required this.repoPosts}); 
  Future<Either<Failur ,Unit>> call (int postId)async {
    return repoPosts.deletePost(postId) ;
  }

}