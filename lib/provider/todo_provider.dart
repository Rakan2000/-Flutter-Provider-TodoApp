import 'package:flutter/material.dart';
import 'package:to_do_app/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> todos = [Todo(title: "title", id: 1)];

  void addTodo(String title) {
    var todo = Todo(
        title: title,
        id: todos.isNotEmpty ? todos[todos.length - 1].id + 1 : 1);
    todos.insert(0, todo);
    notifyListeners();
  }

  void finishTask(int id) {
    var checked = todos[todos.indexWhere((element) => element.id == id)];
    checked.done = !checked.done;
    notifyListeners();
  }

  void deleteTask(int id) {
    todos.removeWhere((elementId) => elementId.id == id);
    notifyListeners();
  }
}
