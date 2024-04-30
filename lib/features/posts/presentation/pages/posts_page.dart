import 'package:block_test/core/class/loading_widget.dart';
import 'package:block_test/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:block_test/features/posts/presentation/pages/add_update_page.dart';
import 'package:block_test/features/posts/presentation/widgets/massege_error.dart';
import 'package:block_test/features/posts/presentation/widgets/post_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      floatingActionButton: _floatingActionButton(context) ,
      body: _bodyBuiler(),
    );
  }

  AppBar _appBar() => AppBar(
        title: const Text("Posts"),
      );
      Widget _floatingActionButton (BuildContext context){
        return FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddUpdatePage(isUpdate: false)  ,)) ;
        },
        child: const Icon(Icons.add),
      );
      }
  Widget _bodyBuiler() {
    return BlocBuilder<PostsBloc, PostsState>(
      builder: (context, state) {
        if (state is LoadingPostsState) {
          return const LoadingWidget();
        } else if (state is LoadedPostsState) {
          return RefreshIndicator(
            onRefresh: () => _onRefresh(context),
            child: PostList(
              posts: state.posts,
            ),
          );
        }
        if (state is ErrorPostsState) {
          return MassegeError(
            string: state.message,
          );
        }
        return const LoadingWidget();
      },
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<PostsBloc>(context).add(GetPostsEvent());
  }
}
