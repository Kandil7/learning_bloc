/// Base class for all form validation events
abstract class FormEvent {}

/// Event triggered when the email field changes
class EmailChanged extends FormEvent {
  /// The new email value
  final String email;
  
  /// Create a new EmailChanged event
  EmailChanged(this.email);
}

/// Event triggered when the password field changes
class PasswordChanged extends FormEvent {
  /// The new password value
  final String password;
  
  /// Create a new PasswordChanged event
  PasswordChanged(this.password);
}

/// Event triggered when the form is submitted
class FormSubmitted extends FormEvent {}
