import 'package:equatable/equatable.dart';

/// State for the FormValidationBloc
///
/// This state contains all the information needed to render the form.
/// It includes the email, password, validation status, and submission status.
class FormValidationState extends Equatable {
  final String email;
  final String password;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String? errorMessage;

  /// Whether the form is valid
  ///
  /// The form is valid if both the email and password are valid.
  bool get isFormValid => isEmailValid && isPasswordValid;

  /// Constructor for FormValidationState
  const FormValidationState({
    required this.email,
    required this.password,
    required this.isEmailValid,
    required this.isPasswordValid,
    required this.isSubmitting,
    required this.isSuccess,
    required this.isFailure,
    this.errorMessage,
  });

  /// Initial state for the form
  ///
  /// All fields are empty and the form is not being submitted.
  factory FormValidationState.initial() {
    return const FormValidationState(
      email: '',
      password: '',
      isEmailValid: false,
      isPasswordValid: false,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  /// State when the form is being submitted
  ///
  /// The isSubmitting flag is set to true.
  FormValidationState loading() {
    return FormValidationState(
      email: email,
      password: password,
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
    );
  }

  /// State when the form submission is successful
  ///
  /// The isSuccess flag is set to true.
  FormValidationState success() {
    return FormValidationState(
      email: email,
      password: password,
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
    );
  }

  /// State when the form submission fails
  ///
  /// The isFailure flag is set to true and an error message is provided.
  FormValidationState failure(String errorMessage) {
    return FormValidationState(
      email: email,
      password: password,
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
      errorMessage: errorMessage,
    );
  }

  /// Update the email field
  ///
  /// The email is updated and its validity is checked.
  FormValidationState emailChanged(String email) {
    return FormValidationState(
      email: email,
      password: password,
      isEmailValid: _isEmailValid(email),
      isPasswordValid: isPasswordValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  /// Update the password field
  ///
  /// The password is updated and its validity is checked.
  FormValidationState passwordChanged(String password) {
    return FormValidationState(
      email: email,
      password: password,
      isEmailValid: isEmailValid,
      isPasswordValid: _isPasswordValid(password),
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  /// Check if an email is valid
  ///
  /// A valid email must contain an @ symbol and a domain.
  bool _isEmailValid(String email) {
    // Simple email validation
    return email.contains('@') && email.contains('.');
  }

  /// Check if a password is valid
  ///
  /// A valid password must be at least 6 characters long.
  bool _isPasswordValid(String password) {
    // Simple password validation
    return password.length >= 6;
  }

  @override
  List<Object?> get props => [
        email,
        password,
        isEmailValid,
        isPasswordValid,
        isSubmitting,
        isSuccess,
        isFailure,
        errorMessage,
      ];
}
