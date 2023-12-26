import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/todo.dart';
import 'package:to_do_app/provider/todo_provider.dart';

class TodoTile extends StatelessWidget {
  //final Todo todo;
  Todo todos;
  TodoTile({Key? key, required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        child: ListTile(
          title: Text(todos.title),
          trailing: Consumer<TodoProvider>(
            builder: (context, value, child) => Checkbox(
              fillColor: MaterialStateProperty.all<Color>(Colors.white),
              checkColor: Colors.amber.shade300,
              side: MaterialStateBorderSide.resolveWith(
                (states) =>
                    BorderSide(width: 1.0, color: Colors.amber.shade300),
              ),
              value: todos.done,
              onChanged: (value) {
                context.read<TodoProvider>().finishTask(todos.id);
              },
            ),
          ),
          leading: IconButton(
              onPressed: /*  */
                  () {
                final noteProvider =
                    Provider.of<TodoProvider>(context, listen: false);

                noteProvider.deleteTask(todos.id);
              },
              icon: Icon(Icons.delete)),
        ),
      ),
    );
  }
}
