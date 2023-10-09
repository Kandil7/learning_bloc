
import 'package:equatable/equatable.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class GetAllTodosEvent extends TodosEvent {}
