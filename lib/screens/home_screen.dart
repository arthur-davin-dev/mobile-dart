import 'package:flutter/material.dart';

Future<String> someFutureFunction() {
  Future<String> data = Future.delayed(
    const Duration(seconds: 4),
    () => "New is loaded...",
  );

  return data;
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Future<String> _newFuture;

  @override
  void initState() {
    super.initState();

    _newFuture = someFutureFunction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Example'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: _newFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return const Text('Error');
            }

            return Text(snapshot.data!);
          },
        ),
      ),
    );
  }
}