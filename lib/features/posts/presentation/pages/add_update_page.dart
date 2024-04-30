import 'package:block_test/core/class/loading_widget.dart';
import 'package:block_test/core/class/snack_message.dart';
import 'package:block_test/features/posts/domain/entities/post_entities.dart';
import 'package:block_test/features/posts/presentation/bloc/aduposts/adu_posts_bloc.dart';
import 'package:block_test/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:block_test/features/posts/presentation/pages/posts_page.dart';
import 'package:block_test/features/posts/presentation/widgets/adu/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUpdatePage extends StatelessWidget {
  const AddUpdatePage({super.key, this.postEntities, required this.isUpdate});
  final PostEntities? postEntities;
  final bool isUpdate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _bodyBuiler(),
    );
  }

  AppBar _appBar() => AppBar(
        title: const Text("Posts"),
      );
  Widget _bodyBuiler() {
    return BlocConsumer<AduPostsBloc, AduPostsState>(
      listener: (context, state) {
        if (state is ErrorAduPostsState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }
        if (state is MessageLoadedAduPostsState) {
         SnackMessage().doneSnackMessage(context, state.message) ;
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) =>const PostsPage(),
              ),
              (route) => false);
        }
      },
      builder: (context, state) {
        if (state is LoadingAduPostsState) {
          return const LoadingWidget();
        }
        if (state is LoadedPostsState) {
          return FormWidget(isUpdate: isUpdate, postEntities: isUpdate ? postEntities : null);
        }
        return FormWidget(isUpdate: isUpdate, postEntities: isUpdate ? postEntities : null);
      },
    );
  }
}
