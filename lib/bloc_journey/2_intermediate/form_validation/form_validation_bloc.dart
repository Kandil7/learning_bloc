import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/form_validation/form_validation_event.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/form_validation/form_validation_state.dart';

/// BLoC for form validation
///
/// This BLoC handles form validation logic, including email and password validation,
/// and form submission.
class FormValidationBloc extends Bloc<FormValidationEvent, FormValidationState> {
  /// Initialize the BLoC with the initial state
  FormValidationBloc() : super(FormValidationState.initial()) {
    // Register event handlers
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<FormSubmitted>(_onFormSubmitted);
  }

  /// Handle the email changed event
  ///
  /// Updates the state with the new email and its validity.
  void _onEmailChanged(EmailChanged event, Emitter<FormValidationState> emit) {
    emit(state.emailChanged(event.email));
  }

  /// Handle the password changed event
  ///
  /// Updates the state with the new password and its validity.
  void _onPasswordChanged(PasswordChanged event, Emitter<FormValidationState> emit) {
    emit(state.passwordChanged(event.password));
  }

  /// Handle the form submitted event
  ///
  /// Validates the form and emits success or failure states.
  void _onFormSubmitted(FormSubmitted event, Emitter<FormValidationState> emit) async {
    // Check if the form is valid
    if (state.isFormValid) {
      // Emit loading state
      emit(state.loading());
      
      try {
        // Simulate API call
        await Future.delayed(const Duration(seconds: 2));
        
        // Check if the credentials are valid (for demo purposes)
        if (state.email == 'test@example.com' && state.password == 'password123') {
          // Emit success state
          emit(state.success());
        } else {
          // Emit failure state with error message
          emit(state.failure('Invalid credentials'));
        }
      } catch (e) {
        // Emit failure state with error message
        emit(state.failure(e.toString()));
      }
    } else {
      // Emit failure state with error message
      emit(state.failure('Please fix the errors in the form'));
    }
  }
}
