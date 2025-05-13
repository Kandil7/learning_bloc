import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../models/form_input.dart';
import 'login_event.dart';
import 'login_state.dart';

/// Login BLoC
///
/// This BLoC manages the state of the login form.
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  /// Creates a new LoginBloc instance
  LoginBloc() : super(const LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<FormSubmitted>(_onFormSubmitted);
  }

  /// Handle the EmailChanged event
  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        status: FormzSubmissionStatus.initial,
        errorMessage: null,
      ),
    );
  }

  /// Handle the PasswordChanged event
  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        status: FormzSubmissionStatus.initial,
        errorMessage: null,
      ),
    );
  }

  /// Handle the FormSubmitted event
  Future<void> _onFormSubmitted(
    FormSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (!state.isValid) {
      // If the form is invalid, update the fields to show validation errors
      emit(
        state.copyWith(
          email: Email.dirty(state.email.value),
          password: Password.dirty(state.password.value),
          status: FormzSubmissionStatus.initial,
        ),
      );
      return;
    }

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      // Simulate a network request
      await Future.delayed(const Duration(seconds: 1));

      // Check if the credentials are valid (for demo purposes)
      if (state.email.value == 'test@example.com' &&
          state.password.value == 'password123') {
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } else {
        emit(
          state.copyWith(
            status: FormzSubmissionStatus.failure,
            errorMessage: 'Invalid credentials',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
