/// State for the form validation BLoC
class FormValidationState {
  /// The current email value
  final String email;
  
  /// The current password value
  final String password;
  
  /// Whether the email is valid
  final bool isEmailValid;
  
  /// Whether the password is valid
  final bool isPasswordValid;
  
  /// Whether the form is currently being submitted
  final bool isSubmitting;
  
  /// Whether the form was successfully submitted
  final bool isSuccess;
  
  /// Error message to display, if any
  final String? errorMessage;

  /// Whether the entire form is valid
  bool get isFormValid => isEmailValid && isPasswordValid;

  /// Create a new form validation state
  const FormValidationState({
    required this.email,
    required this.password,
    required this.isEmailValid,
    required this.isPasswordValid,
    required this.isSubmitting,
    required this.isSuccess,
    this.errorMessage,
  });

  /// Create the initial state for the form
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

  /// Create a copy of this state with some fields replaced
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
