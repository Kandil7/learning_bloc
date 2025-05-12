import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class FormEvent {}

class EmailChanged extends FormEvent {
  final String email;
  EmailChanged(this.email);
}

class PasswordChanged extends FormEvent {
  final String password;
  PasswordChanged(this.password);
}

class FormSubmitted extends FormEvent {}

// States
class FormValidationState {
  final String email;
  final String password;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final String? errorMessage;

  bool get isFormValid => isEmailValid && isPasswordValid;

  const FormValidationState({
    required this.email,
    required this.password,
    required this.isEmailValid,
    required this.isPasswordValid,
    required this.isSubmitting,
    required this.isSuccess,
    this.errorMessage,
  });

  factory FormValidationState.initial() {
    return const FormValidationState(
      email: '',
      password: '',
      isEmailValid: false,
      isPasswordValid: false,
      isSubmitting: false,
      isSuccess: false,
      errorMessage: null,
    );
  }

  FormValidationState copyWith({
    String? email,
    String? password,
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isSubmitting,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return FormValidationState(
      email: email ?? this.email,
      password: password ?? this.password,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

// BLoC
class FormValidationBloc extends Bloc<FormEvent, FormValidationState> {
  FormValidationBloc() : super(FormValidationState.initial()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<FormSubmitted>(_onFormSubmitted);
  }

  void _onEmailChanged(EmailChanged event, Emitter<FormValidationState> emit) {
    final isEmailValid = _isEmailValid(event.email);
    emit(state.copyWith(
      email: event.email,
      isEmailValid: isEmailValid,
    ));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<FormValidationState> emit) {
    final isPasswordValid = _isPasswordValid(event.password);
    emit(state.copyWith(
      password: event.password,
      isPasswordValid: isPasswordValid,
    ));
  }

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

  bool _isEmailValid(String email) {
    // Simple email validation
    return email.contains('@') && email.contains('.');
  }

  bool _isPasswordValid(String password) {
    // Password must be at least 6 characters
    return password.length >= 6;
  }
}