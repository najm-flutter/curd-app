import 'dart:convert';

import 'package:block_test/core/class/execption.dart';
import 'package:block_test/core/constant/api_link.dart';
import 'package:block_test/features/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> addPost(PostModel postModel);
  Future<Unit> updatePost(PostModel postModel);
  Future<Unit> deletePost(int postId);
}

Map<String, String> header = {'Content-Type': 'application/json'};

class RemoteDataSourceImp implements RemoteDataSource {
  final http.Client httpClient;

  RemoteDataSourceImp({required this.httpClient});
  @override
  Future<List<PostModel>> getAllPosts() async {
    var reponse =
        await httpClient.get(Uri.parse("${ApiLink.link}/posts/"));

    if (reponse.statusCode == 200 || reponse.statusCode == 201) {
      List data = jsonDecode(reponse.body);
      List<PostModel> dataToListModel = data.map<PostModel>((e) => PostModel.fromJson(e)).toList();
      return dataToListModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addPost(PostModel postModel) async {
    Map<String, String> body = {
      "title": postModel.title,
      "body": postModel.body,
    };
    var reponse = await httpClient
        .post(Uri.parse('${ApiLink.link}/posts/'), body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
    if (reponse.statusCode == 200 || reponse.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deletePost(int postId) async {
    var reponse = await httpClient
        .delete(Uri.parse('${ApiLink.link}/posts/$postId'), headers: {'Content-Type': 'application/json'});
    if (reponse.statusCode == 200 || reponse.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updatePost(PostModel postModel) async {
     Map<String, String> body = {
      "title": postModel.title,
      "body": postModel.body,
    };
    var reponse = await httpClient
        .patch(Uri.parse('${ApiLink.link}/posts/${postModel.postId}'), body: body, headers: {'Content-Type': 'application/json'});
    if (reponse.statusCode == 200 || reponse.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
