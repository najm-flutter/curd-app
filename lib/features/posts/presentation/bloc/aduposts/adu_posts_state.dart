part of 'adu_posts_bloc.dart';

sealed class AduPostsState extends Equatable {
  const AduPostsState();

  @override
  List<Object> get props => [];
}

final class AduPostsInitial extends AduPostsState {}

final class LoadingAduPostsState extends AduPostsState {}

final class MessageLoadedAduPostsState extends AduPostsState {
  final String message;

  const MessageLoadedAduPostsState({required this.message});
  @override
  List<Object> get props => [message];
}

final class ErrorAduPostsState extends AduPostsState {
  final String message;

  const ErrorAduPostsState({required this.message});
  @override
  List<Object> get props => [message];
}
