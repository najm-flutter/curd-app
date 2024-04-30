
import 'package:block_test/features/posts/domain/entities/post_entities.dart';
import 'package:block_test/features/posts/presentation/pages/post_details.dart';
import 'package:flutter/material.dart';

class PostList extends StatelessWidget {
  const PostList({super.key, required this.posts});
  final List<PostEntities> posts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  posts[index].title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                  posts[index].title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                contentPadding: const EdgeInsets.all(5),
                onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  PostDetails(postEntities: posts[index]),)),
              );
            },
            separatorBuilder: (context, index) => const Divider(thickness: 1),
            itemCount: posts.length));
  }
}
