import 'dart:convert';

import 'package:block_test/core/class/execption.dart';
import 'package:block_test/core/constant/shaerdkey.dart';
import 'package:block_test/features/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> cashedPosts(List<PostModel> postModel);
}

class LocalDataSourceImp implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImp({required this.sharedPreferences});
  @override
  Future<Unit> cashedPosts(List<PostModel> listPostModel) {
    List modelTojson = listPostModel.map<Map<String, dynamic>>((e) => e.toJson()).toList();
    sharedPreferences.setString(SharedKey.cashedPosts, jsonEncode(modelTojson));
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getAllPosts() async {
    String? data = sharedPreferences.getString(SharedKey.cashedPosts);
    if (data != null) {
      List dataDecode = jsonDecode(data);
      List<PostModel> listPostModel = dataDecode.map<PostModel>((e) => PostModel.fromJson(e)).toList();
      return listPostModel;
    } else {
      throw EmpityException();
    }
  }
}
