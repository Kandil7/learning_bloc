import 'package:equatable/equatable.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/error_handling/data/user_repository.dart';

/// State for the UserBloc
///
/// This state represents the different states of user data loading.
sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

/// Initial state
///
/// This is the initial state of the UserBloc.
class UserInitial extends UserState {}

/// Loading state
///
/// This state indicates that data is being loaded.
class UserLoading extends UserState {}

/// Loaded state for multiple users
///
/// This state contains a list of users that have been loaded.
class UsersLoaded extends UserState {
  final List<User> users;

  const UsersLoaded(this.users);

  @override
  List<Object?> get props => [users];
}

/// Loaded state for a single user
///
/// This state contains a single user that has been loaded.
class UserLoaded extends UserState {
  final User user;

  const UserLoaded(this.user);

  @override
  List<Object?> get props => [user];
}

/// Error state
///
/// This state indicates that an error occurred while loading data.
class UserError extends UserState {
  final String message;

  const UserError(this.message);

  @override
  List<Object?> get props => [message];
}
