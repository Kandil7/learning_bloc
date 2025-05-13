import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/error_handling/data/user_repository.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/error_handling/user/user_event.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/error_handling/user/user_state.dart';

/// BLoC for user data
///
/// This BLoC handles loading user data and error handling.
class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  /// Initialize the BLoC with the initial state and repository
  UserBloc({required this.userRepository}) : super(UserInitial()) {
    // Register event handlers
    on<FetchUsers>(_onFetchUsers);
    on<FetchUserById>(_onFetchUserById);
    on<ClearUser>(_onClearUser);
  }

  /// Handle the fetch users event
  ///
  /// This method fetches all users and handles loading and error states.
  void _onFetchUsers(FetchUsers event, Emitter<UserState> emit) async {
    // Emit loading state
    emit(UserLoading());

    try {
      // Fetch users from repository
      final users = await userRepository.getUsers();
      
      // Emit loaded state with users
      emit(UsersLoaded(users));
    } catch (e) {
      // Emit error state with error message
      emit(UserError(e.toString()));
    }
  }

  /// Handle the fetch user by ID event
  ///
  /// This method fetches a user by ID and handles loading and error states.
  void _onFetchUserById(FetchUserById event, Emitter<UserState> emit) async {
    // Emit loading state
    emit(UserLoading());

    try {
      // Fetch user from repository
      final user = await userRepository.getUserById(event.id);
      
      // Emit loaded state with user
      emit(UserLoaded(user));
    } catch (e) {
      // Emit error state with error message
      emit(UserError(e.toString()));
    }
  }

  /// Handle the clear user event
  ///
  /// This method clears the current user and returns to the initial state.
  void _onClearUser(ClearUser event, Emitter<UserState> emit) {
    emit(UserInitial());
  }
}
