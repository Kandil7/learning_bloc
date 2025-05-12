import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/bloc_learning/examples/repository_pattern_example/user_repository.dart';

// Events
abstract class UserEvent {}

class LoadUsersEvent extends UserEvent {}

// States
abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final List<User> users;
  
  UserLoadedState(this.users);
}

class UserErrorState extends UserState {
  final String message;
  
  UserErrorState(this.message);
}

// BLoC
class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  
  UserBloc(this.userRepository) : super(UserInitialState()) {
    on<LoadUsersEvent>(_onLoadUsers);
  }

  void _onLoadUsers(LoadUsersEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());
    
    try {
      final users = await userRepository.getUsers();
      emit(UserLoadedState(users));
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }
}