import 'package:block_test/features/posts/domain/entities/post_entities.dart';
import 'package:block_test/features/posts/presentation/pages/add_update_page.dart';
import 'package:flutter/material.dart';

class EditBtnWidget extends StatelessWidget {
  const EditBtnWidget({super.key, required this.postEntities});
  final PostEntities postEntities;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddUpdatePage(
                isUpdate: true,
                postEntities: postEntities,
              ),
            )),
        icon: const Icon(Icons.edit),
        label: const Text('edit'));
  }
}
