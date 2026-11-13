// import 'package:flutter/material.dart';
// // import 'package:lottie/lottie.dart';

// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:my_app/models/post.dart';

// void main() {
//   runApp(const MyApp());
// }

// Future<String> someFutureFunction(){
//   Future<String> data = Future.delayed(
//     Duration(seconds: 4),()=>"New is loaded..."
//   );
//   return data;
// }

// Future<List<Post>> fetchPosts() async {
//   final response = await http.get(
//     Uri.parse('https://jsonplaceholder.typicode.com/posts'),
//   );

//   if (response.statusCode == 200) {
//     List<dynamic> body = jsonDecode(response.body);
//     return body.map((dynamic item) => Post.fromJson(item)).toList();
//   } else {
//     throw Exception('Failed to load posts');
//   }
// }

// class PostListScreen extends StatefulWidget {
//   const PostListScreen({super.key});

//   @override
//   State<PostListScreen> createState() => _PostListScreenState();
// }

// class _PostListScreenState extends State<PostListScreen> {
//   late Future<List<Post>> futurePosts;

//   @override
//   void initState() {
//     super.initState();
//     // Cache the fetch call in initState so it doesn't refetch on every rebuild
//     futurePosts = fetchPosts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('API List Example')),
//       body: FutureBuilder<List<Post>>(
//         future: futurePosts,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('No posts found.'));
//           }

//           final posts = snapshot.data!;
//           return ListView.builder(
//             itemCount: posts.length,
//             itemBuilder: (context, index) {
//               final post = posts[index];
//               return ListTile(
//                 leading: CircleAvatar(child: Text('${post.id}')),
//                 title: Text(
//                   post.title,
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 subtitle: Text(post.body),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
//       home: const HomeScreen(),
//     );
//   }
// }



// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late final Future<String> _newFuture;

//   @override
//   void initState() {
//     super.initState();
//     _newFuture = someFutureFunction();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<String>(
//       future: _newFuture,
//       builder: (context, snapshot) {
//         if(snapshot.connectionState!=ConnectionState.done){
//           return const CircularProgressIndicator();
//         }
//         if(snapshot.hasError) return Text('Error');
//         return Text(snapshot.data!);
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';

import 'screens/users_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const UsersScreen(),
    );
  }
}