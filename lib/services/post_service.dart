import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/models/post.dart';

Future<List<Post>> fetchPosts() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
  );

  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body);

    return body
        .map((dynamic item) => Post.fromJson(item))
        .toList();
  } else {
    throw Exception('Failed to load posts');
  }
}