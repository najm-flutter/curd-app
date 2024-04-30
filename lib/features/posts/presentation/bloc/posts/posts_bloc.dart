import 'package:bloc/bloc.dart';
import 'package:block_test/core/class/failur.dart';
import 'package:block_test/features/posts/domain/entities/post_entities.dart';
import 'package:block_test/features/posts/domain/usecases/get_all_post_usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetAllPostUsecases getAllPostUsecases;
  PostsBloc({required this.getAllPostUsecases}) : super(PostsInitial()) {
    on<PostsEvent>((event, emit) async {
      emit(LoadingPostsState());
      var posts = await getAllPostUsecases.call();
      emit(_emitState(posts));
    });
  }


  PostsState _emitState(Either<Failur, List<PostEntities>> either) {
    return either.fold((failur) {
      return ErrorPostsState(message: _messageError(failur));
    }, (posts) {
      return LoadedPostsState(posts: posts);
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
