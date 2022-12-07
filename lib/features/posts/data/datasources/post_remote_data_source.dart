import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import 'package:http/http.dart' as http;

import '../models/posts_response.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts(String country);

  // Future<Unit> updatePost(PostModel postModel);
  // Future<Unit> addPost(PostModel postModel);
}

const BASE_URL = "https://newsapi.org/v2/top-headlines?country=";
const apiKey = "895f81a615674cf784241f7028840a39";

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final http.Client client;

  PostRemoteDataSourceImpl({required this.client});
  @override
  Future<List<PostModel>> getAllPosts(country) async {
    final response = await client.get(
      Uri.parse("$BASE_URL$country&apiKey=$apiKey"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final List<PostModel> postModels = json
          .decode(response.body)['articles']
          .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
          .toList();
      print(postModels);
      return postModels;
    } else {
      throw ServerException();
    }
  }

  // @override
  // Future<Unit> addPost(PostModel postModel) async {
  //   final body = {
  //     "title": postModel.title,
  //     "body": postModel.body,
  //   };

  //   final response =
  //       await client.post(Uri.parse("$BASE_URL/posts/"), body: body);

  //   if (response.statusCode == 201) {
  //     return Future.value(unit);
  //   } else {
  //     throw ServerException();
  //   }
  // }

  // @override
  // Future<Unit> deletePost(int postId) async {
  //   final response = await client.delete(
  //     Uri.parse("$BASE_URL/posts/${postId.toString()}"),
  //     headers: {"Content-Type": "application/json"},
  //   );

  //   if (response.statusCode == 200) {
  //     return Future.value(unit);
  //   } else {
  //     throw ServerException();
  //   }
  // }

  // @override
  // Future<Unit> updatePost(PostModel postModel) async {
  //   final postId = postModel.id.toString();
  //   final body = {
  //     "title": postModel.title,
  //     "body": postModel.body,
  //   };

  //   final response = await client.patch(
  //     Uri.parse("$BASE_URL/posts/$postId"),
  //     body: body,
  //   );

  //   if (response.statusCode == 200) {
  //     return Future.value(unit);
  //   } else {
  //     throw ServerException();
  //   }
  // }
}
