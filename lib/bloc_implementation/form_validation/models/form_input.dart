import 'package:formz/formz.dart';

/// Email Input Validation Error
enum EmailValidationError {
  /// Email is empty
  empty,

  /// Email is invalid
  invalid,
}

/// Password Input Validation Error
enum PasswordValidationError {
  /// Password is empty
  empty,

  /// Password is too short
  tooShort,
}

/// Email Input Form Field
class Email extends FormzInput<String, EmailValidationError> {
  /// Create a validated email input
  const Email.pure([super.value = '']) : super.pure();

  /// Create a dirty (modified) email input
  const Email.dirty([super.value = '']) : super.dirty();

  // Simple email regex pattern
  static final _emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) return EmailValidationError.empty;
    return _emailRegExp.hasMatch(value) ? null : EmailValidationError.invalid;
  }
}

/// Password Input Form Field
class Password extends FormzInput<String, PasswordValidationError> {
  /// Create a validated password input
  const Password.pure([super.value = '']) : super.pure();

  /// Create a dirty (modified) password input
  const Password.dirty([super.value = '']) : super.dirty();

  static const minLength = 8;

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) return PasswordValidationError.empty;
    return value.length >= minLength ? null : PasswordValidationError.tooShort;
  }
}
