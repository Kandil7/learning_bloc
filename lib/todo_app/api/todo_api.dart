
import 'package:dio/dio.dart';

import '../models/todo.dart';

class TodosApi {
  Future<List<Todo>> getAllTodos() async {
    final dio = Dio();
    try {
      const String url = "https://jsonplaceholder.typicode.com/todos";

      var response = await dio.get(url);

      List<Todo> todos = response.data
          .map<Todo>((jsonTodo) => Todo.fromJson(jsonTodo))
          .toList();

      return todos;
    } catch (e) {
      rethrow;
    }
  }
}
