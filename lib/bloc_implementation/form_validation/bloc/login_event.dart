import 'package:equatable/equatable.dart';

/// Base class for all login events
abstract class LoginEvent extends Equatable {
  /// Creates a new LoginEvent instance
  const LoginEvent();

  @override
  List<Object> get props => [];
}

/// Event when the email is changed
class EmailChanged extends LoginEvent {
  /// New email value
  final String email;

  /// Creates a new EmailChanged event
  const EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

/// Event when the password is changed
class PasswordChanged extends LoginEvent {
  /// New password value
  final String password;

  /// Creates a new PasswordChanged event
  const PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

/// Event when the form is submitted
class FormSubmitted extends LoginEvent {
  /// Creates a new FormSubmitted event
  const FormSubmitted();
}
