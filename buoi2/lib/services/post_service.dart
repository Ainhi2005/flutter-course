import 'dart:convert';

import 'package:demo_vd_buoi2/models/post.dart';
import 'package:http/http.dart' as http;

class PostService {
  static const _baseUrl = 'https://jsonplaceholder.typicode.com';
  // lấy list post
  static Future<List<Post>> getPosts({int limit = 20}) async {
    final uri = Uri.parse('$_baseUrl/posts').replace(
      //posts?_limit=10=> param
      queryParameters: {'_limit': '$limit'},
    );

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(
        response.body,
      ); //jsonDecode để cover json-> obj dạng list
      // sau đó map để biến đổi từng phần tử , sau đó fromjson để convert sanh obj
      return data.map((e) => Post.fromJson(e)).toList();
    }
    throw Exception('không tải được bài viết (HTTP ${response.statusCode})');
  }

  // lấy 1 bài viết
  static Future<Post> getPost(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/posts/$id'));
    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    }
    throw Exception("không tìm thấy bài viết");
  }
}
