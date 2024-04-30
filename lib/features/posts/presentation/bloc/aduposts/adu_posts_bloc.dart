import 'package:bloc/bloc.dart';
import 'package:block_test/core/class/failur.dart';
import 'package:block_test/features/posts/domain/entities/post_entities.dart';
import 'package:block_test/features/posts/domain/usecases/add_post_usecases.dart';
import 'package:block_test/features/posts/domain/usecases/delete_post_usecases.dart';
import 'package:block_test/features/posts/domain/usecases/update_post_usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
part 'adu_posts_event.dart';
part 'adu_posts_state.dart';

class AduPostsBloc extends Bloc<AduPostsEvent, AduPostsState> {
  final AddPostUsecases addPostUsecases;
  final UpdatePostUsecases updatePostUsecases;
  final DeletePostUsecases deletePostUsecases;
  AduPostsBloc({required this.addPostUsecases, required this.updatePostUsecases, required this.deletePostUsecases})
      : super(AduPostsInitial()) {
    on<AduPostsEvent>((event, emit) {});
    on<AddPostEvent>((event, emit) async {
      emit(LoadingAduPostsState());
      final add = await addPostUsecases.call(event.postEntities);
      emit(_emitState(add, "doneAdd")) ;
    });
    on<UpdatePostEvent>((event, emit) async {
      emit(LoadingAduPostsState());
      final updateStatus = await updatePostUsecases.call(event.postEntities);
      emit(_emitState(updateStatus, "done update")) ;
    });
    on<DeletePostEvent>((event, emit)async {
      emit(LoadingAduPostsState());
      final deleteState = await deletePostUsecases.call(event.postId);
      emit(_emitState(deleteState, "done delete")) ;
    });
  }
   AduPostsState _emitState(Either<Failur, Unit> either , String message) {
    return either.fold((failur) {
      return ErrorAduPostsState(message: _messageError(failur));
    }, (_) {
      return MessageLoadedAduPostsState(message: message);
    });
  }

  String _messageError(Failur failur) {
    switch (failur.runtimeType) {
      case ServerFailur:
        return 'server';
      case EmpityFailur:
        return 'empity';
      default:
        return 'error';
    }
}
}