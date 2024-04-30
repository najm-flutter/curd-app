import 'package:equatable/equatable.dart';

class PostEntities extends Equatable {
  final int userId;
  final int postId;
  final String title;
  final String body;
  const PostEntities({required this.postId, required this.title, required this.body, required this.userId});

  @override
  List<Object?> get props => [userId, postId, title, body];
}
