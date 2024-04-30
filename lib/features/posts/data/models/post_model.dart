import 'package:block_test/features/posts/domain/entities/post_entities.dart';

class PostModel extends PostEntities {
 const PostModel({required super.postId, required super.title, required super.body, required super.userId});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(postId: json["id"], title: json["title"], body: json["body"], userId: json["userId"]);
  } 
   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = postId;
    data['userId'] = userId;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
