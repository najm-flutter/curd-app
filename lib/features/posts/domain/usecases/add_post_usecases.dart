import 'package:block_test/core/class/failur.dart';
import 'package:block_test/features/posts/domain/entities/post_entities.dart';
import 'package:block_test/features/posts/domain/repositories/repo_posts.dart';
import 'package:dartz/dartz.dart';

class AddPostUsecases {
  final RepoPosts repoPosts;

  AddPostUsecases({required this.repoPosts});

  Future<Either<Failur, Unit>> call(PostEntities postEntities) async {
    return repoPosts.addPost(postEntities);
  }
}
