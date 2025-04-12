import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:image_video/model/post.dart';

abstract class IPostRepository {
  Future<List<Post>> getPosts();
}

class PostRepository implements IPostRepository {
  @override
  Future<List<Post>> getPosts() async {
    try {
      final String response = await rootBundle.loadString('lib/api_json.json');
      final List<dynamic> data = json.decode(response);
      return data.map((json) => Post.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load posts: $e');
    }
  }
}
