/// Events for the FormValidationBloc
///
/// These events represent user interactions with the form.
sealed class FormValidationEvent {}

/// Event triggered when the email field changes
///
/// This event is dispatched when the user types in the email field.
class EmailChanged extends FormValidationEvent {
  final String email;

  EmailChanged(this.email);
}

/// Event triggered when the password field changes
///
/// This event is dispatched when the user types in the password field.
class PasswordChanged extends FormValidationEvent {
  final String password;

  PasswordChanged(this.password);
}

/// Event triggered when the form is submitted
///
/// This event is dispatched when the user submits the form.
class FormSubmitted extends FormValidationEvent {}
