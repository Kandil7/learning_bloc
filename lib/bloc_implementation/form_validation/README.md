# Form Validation with BLoC

This directory contains an example of form validation using BLoC pattern.

## Overview

Form validation is a common requirement in most applications. This example demonstrates how to implement form validation using the BLoC pattern and the Formz package.

## Implementation

### Form Inputs

```dart
class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([String value = '']) : super.dirty(value);

  static final _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) return EmailValidationError.empty;
    return _emailRegExp.hasMatch(value) ? null : EmailValidationError.invalid;
  }
}
```

### Login State

```dart
class LoginState extends Equatable {
  final Email email;
  final Password password;
  final FormzSubmissionStatus status;
  final String? errorMessage;

  const LoginState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage,
  });

  bool get isValid => Formz.validate([email, password]);

  // ...
}
```

### Login Events

```dart
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends LoginEvent {
  final String email;
  const EmailChanged(this.email);
  // ...
}

class PasswordChanged extends LoginEvent {
  final String password;
  const PasswordChanged(this.password);
  // ...
}

class FormSubmitted extends LoginEvent {
  const FormSubmitted();
}
```

### Login BLoC

```dart
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<FormSubmitted>(_onFormSubmitted);
  }

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

  // ...
}
```

### UI Integration

```dart
BlocBuilder<LoginBloc, LoginState>(
  buildWhen: (previous, current) => previous.email != current.email,
  builder: (context, state) {
    return TextField(
      onChanged: (email) =>
          context.read<LoginBloc>().add(EmailChanged(email)),
      decoration: InputDecoration(
        labelText: 'Email',
        errorText: state.email.displayError != null
            ? _getErrorText(state.email.error)
            : null,
      ),
    );
  },
)
```

## Key Concepts

### 1. FormzInput

`FormzInput` is a base class from the Formz package that provides form input validation. It has two type parameters: the input type and the error type.

### 2. Pure vs Dirty

- **Pure**: The initial state of the input, before any user interaction.
- **Dirty**: The state of the input after user interaction.

### 3. Validation

Validation is performed in the `validator` method of the `FormzInput` class. It returns an error if the input is invalid, or null if it's valid.

### 4. Form Status

The form status is tracked using `FormzSubmissionStatus` from the Formz package. It can be one of the following:
- `initial`: The form has not been submitted yet.
- `inProgress`: The form is being submitted.
- `success`: The form was submitted successfully.
- `failure`: The form submission failed.

### 5. BlocBuilder and BlocListener

- `BlocBuilder`: Rebuilds the UI when the state changes.
- `BlocListener`: Performs side effects (like showing a snackbar) when the state changes.

## Use Cases

Form validation with BLoC is useful for:

1. **Login Forms**: Validate email and password inputs.
2. **Registration Forms**: Validate user registration data.
3. **Profile Forms**: Validate user profile data.
4. **Payment Forms**: Validate payment information.

## Next Steps

After understanding form validation with BLoC, you can:

1. Implement more complex form validation.
2. Add more form fields.
3. Implement form submission to a backend API.
4. Add more validation rules.
