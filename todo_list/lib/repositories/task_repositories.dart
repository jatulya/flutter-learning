import 'package:todo_list/data/models/todo.dart';

abstract class TaskRepositories {
  Future<List<Todo>> getTasks();
  Future<void> addTask(Todo newTask);
  Future<void> updateTask(Todo task);
  Future<void> deleteTodo(Todo todo);
}
