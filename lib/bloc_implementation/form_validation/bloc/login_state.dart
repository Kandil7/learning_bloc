import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import '../models/form_input.dart';

/// Login Form State
///
/// This class represents the state of the login form.
class LoginState extends Equatable {
  /// Email input
  final Email email;

  /// Password input
  final Password password;

  /// Form status
  final FormzSubmissionStatus status;

  /// Error message
  final String? errorMessage;

  /// Creates a new LoginState instance
  const LoginState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage,
  });

  /// Creates a copy of this LoginState with the given fields replaced with new values
  LoginState copyWith({
    Email? email,
    Password? password,
    FormzSubmissionStatus? status,
    String? errorMessage,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  /// Whether the form is valid
  bool get isValid => Formz.validate([email, password]);

  @override
  List<Object?> get props => [email, password, status, errorMessage];
}
