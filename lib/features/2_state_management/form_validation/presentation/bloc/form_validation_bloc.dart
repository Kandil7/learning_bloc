import 'package:flutter_bloc/flutter_bloc.dart';
import 'form_validation_event.dart';
import 'form_validation_state.dart';

/// BLoC for form validation
///
/// This BLoC handles the validation of a form with email and password fields.
/// It validates the fields in real-time and handles form submission.
class FormValidationBloc extends Bloc<FormEvent, FormValidationState> {
  /// Create a new form validation BLoC
  FormValidationBloc() : super(FormValidationState.initial()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<FormSubmitted>(_onFormSubmitted);
  }

  /// Handle email changes
  ///
  /// Validates the email and updates the state
  void _onEmailChanged(EmailChanged event, Emitter<FormValidationState> emit) {
    final isEmailValid = _isEmailValid(event.email);
    emit(state.copyWith(
      email: event.email,
      isEmailValid: isEmailValid,
    ));
  }

  /// Handle password changes
  ///
  /// Validates the password and updates the state
  void _onPasswordChanged(PasswordChanged event, Emitter<FormValidationState> emit) {
    final isPasswordValid = _isPasswordValid(event.password);
    emit(state.copyWith(
      password: event.password,
      isPasswordValid: isPasswordValid,
    ));
  }

  /// Handle form submission
  ///
  /// Validates the form and simulates an API call
  void _onFormSubmitted(FormSubmitted event, Emitter<FormValidationState> emit) async {
    if (state.isFormValid) {
      emit(state.copyWith(isSubmitting: true));
      
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      
      // Simulate success
      emit(state.copyWith(
        isSubmitting: false,
        isSuccess: true,
      ));
    } else {
      // Form is invalid
      emit(state.copyWith(
        errorMessage: 'Please fix the errors in the form',
      ));
    }
  }

  /// Validate an email address
  ///
  /// Returns true if the email contains @ and . characters
  bool _isEmailValid(String email) {
    // Simple email validation
    return email.contains('@') && email.contains('.');
  }

  /// Validate a password
  ///
  /// Returns true if the password is at least 6 characters long
  bool _isPasswordValid(String password) {
    // Password must be at least 6 characters
    return password.length >= 6;
  }
}
