import 'package:block_test/features/posts/domain/entities/post_entities.dart';
import 'package:block_test/features/posts/presentation/widgets/post_details/delete_btn_widget.dart';
import 'package:block_test/features/posts/presentation/widgets/post_details/edit_btn_widget.dart';
import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  final PostEntities postEntities;
  const PostDetails({super.key, required this.postEntities});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _bodyBuiler(context),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('Title'),
    );
  }

  Widget _bodyBuiler(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            postEntities.title,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const Divider(
            thickness: 1,
          ),
          Text(
            postEntities.body,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [DeleteBtnWidget(postEntities: postEntities), EditBtnWidget(postEntities: postEntities)],
          )
        ],
      ),
    );
  }
}
