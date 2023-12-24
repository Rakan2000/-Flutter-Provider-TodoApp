import 'dart:js';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/todo.dart';
import 'package:to_do_app/provider/todo_provider.dart';
// import 'package:provider/provider.dart';
import 'package:to_do_app/views/add_page.dart';
import 'package:to_do_app/views/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => TodoProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/add',
        builder: (context, state) => AddPage(),
      ),
    ],
  );
}
