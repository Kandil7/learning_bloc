import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/todo_app/bloc/todos_event.dart';
import 'package:learning_bloc/todo_app/bloc/todos_state.dart';


import '../api/todo_api.dart';



class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodosApi todosApi;
  TodosBloc({required this.todosApi}) : super(LoadingState()) {
    on<TodosEvent>((event, emit) async {
      if (event is GetAllTodosEvent) {
        emit(LoadingState());
        try {
          final todos = await todosApi.getAllTodos();
          emit(LoadedState(todos));
        } catch (e) {
          emit(const ErrorState(
              "Something Went Wrong, Please Try Again Later !"));
        }
      }
    });
  }
}
