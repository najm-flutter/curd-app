part of 'adu_posts_bloc.dart';

sealed class AduPostsEvent extends Equatable {
  const AduPostsEvent();

  @override
  List<Object> get props => [];
}

class AddPostEvent extends AduPostsEvent {
  final PostEntities postEntities;

  const AddPostEvent({required this.postEntities});
  @override
  List<Object> get props => [postEntities];
}

class UpdatePostEvent extends AduPostsEvent {
  final PostEntities postEntities;

  const UpdatePostEvent({required this.postEntities});
  @override
  List<Object> get props => [postEntities];
}

class DeletePostEvent extends AduPostsEvent {
  final int postId;

  const DeletePostEvent({required this.postId});
  @override
  List<Object> get props => [postId];
}
