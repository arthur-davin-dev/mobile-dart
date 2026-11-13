import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/models/user.dart';

Future<List<User>> getUserData() async {
  final response = await http.get(
    Uri.https('jsonplaceholder.typicode.com', 'users'),
  );
  if (response.statusCode == 200) {
    final list = jsonDecode(response.body) as List;
    return list.map((data) => User.fromJson(data)).toList();
  } else {
    // The server did not return 200 OK → throw an exception
    throw Exception('Failed to load users');
  }
}
