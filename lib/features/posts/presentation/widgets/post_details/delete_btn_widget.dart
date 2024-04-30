import 'package:block_test/core/class/loading_widget.dart';
import 'package:block_test/core/class/snack_message.dart';
import 'package:block_test/features/posts/domain/entities/post_entities.dart';
import 'package:block_test/features/posts/presentation/bloc/aduposts/adu_posts_bloc.dart';
import 'package:block_test/features/posts/presentation/pages/posts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteBtnWidget extends StatelessWidget {
  const DeleteBtnWidget({super.key, required this.postEntities}) ;
 final PostEntities postEntities ;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () => showDialog(
              context: context,
              builder: (context) => _dialogWidget(),
            ),
        icon: const Icon(Icons.delete),
        label: const Text('delete'));
  }

  Widget _dialogWidget() {
    return BlocConsumer<AduPostsBloc, AduPostsState>(
      listener: (context, state) {
        if (state is ErrorAduPostsState) {
          SnackMessage().errorSnackMessage(context, state.message);
        } else if (state is MessageLoadedAduPostsState) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => PostsPage(),
              ),
              (route) => false);
          SnackMessage().doneSnackMessage(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is LoadingAduPostsState) {
          return const AlertDialog(title: LoadingWidget());
        }
        return AlertDialog(
          title: const Center(child: Text("are you sure?")),
          actions: [
            TextButton(
                onPressed: () => context.read<AduPostsBloc>().add(DeletePostEvent(postId: postEntities.postId)),
                child: const Text("yse")),
            TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text("no"))
          ],
        );
      },
    );
  }
}
