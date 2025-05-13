/// Events for the UserBloc
///
/// These events represent user-related actions.
sealed class UserEvent {}

/// Event to fetch all users
class FetchUsers extends UserEvent {}

/// Event to fetch a user by ID
class FetchUserById extends UserEvent {
  final int id;

  FetchUserById(this.id);
}

/// Event to clear the current user
class ClearUser extends UserEvent {}
