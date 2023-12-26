import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/todo.dart';
import 'package:to_do_app/provider/todo_provider.dart';
import 'package:to_do_app/widgets/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo"),
        backgroundColor: Colors.amber.shade300,
        actions: [
          IconButton(
            onPressed: () => GoRouter.of(context).push('/add'),
            icon: const Icon(
              Icons.add_box_outlined,
              size: 30,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: context.watch<TodoProvider>().todos.length,
        itemBuilder: (context, index) =>
            TodoTile(todos: context.watch<TodoProvider>().todos[index])
        // add consumer here

        ,
      ),
    );
  }
}
// Consumer<TodoProvider>(builder: (context, value, child) => SingleChildScrollView(