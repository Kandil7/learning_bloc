import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/form_validation/form_validation_bloc.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/form_validation/form_validation_event.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/form_validation/form_validation_state.dart';

/// Form Validation Page
///
/// This page demonstrates how to use BLoC for form validation.
class FormValidationPage extends StatelessWidget {
  const FormValidationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormValidationBloc(),
      child: const FormValidationView(),
    );
  }
}

/// Form Validation View
///
/// This widget contains the form UI and interacts with the FormValidationBloc.
class FormValidationView extends StatelessWidget {
  const FormValidationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Validation with BLoC'),
      ),
      body: BlocListener<FormValidationBloc, FormValidationState>(
        listener: (context, state) {
          // Show a snackbar when the form is submitted successfully
          if (state.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Form submitted successfully!'),
                backgroundColor: Colors.green,
              ),
            );
          }
          
          // Show a snackbar when the form submission fails
          if (state.isFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'An error occurred'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Explanation text
              const Padding(
                padding: EdgeInsets.only(bottom: 24.0),
                child: Text(
                  'This example demonstrates how to use BLoC for form validation. '
                  'The form validates email and password fields in real-time as the user types. '
                  'The submit button is only enabled when the form is valid.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              
              // Form fields
              const _EmailField(),
              const SizedBox(height: 16),
              const _PasswordField(),
              const SizedBox(height: 24),
              const _SubmitButton(),
              
              // Demo credentials
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Demo Credentials:',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text('Email: test@example.com'),
                    Text('Password: password123'),
                  ],
                ),
              ),
              
              // Code explanation
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Key Concepts:',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text('• BlocListener: Responds to state changes without rebuilding'),
                    Text('• BlocBuilder: Rebuilds UI components based on state'),
                    Text('• Form validation: Validates fields as the user types'),
                    Text('• State management: Tracks form state and submission status'),
                    SizedBox(height: 16),
                    Text(
                      'Implementation Details:',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text('1. Events are dispatched when field values change'),
                    Text('2. The BLoC validates the fields and updates the state'),
                    Text('3. The UI rebuilds based on the new state'),
                    Text('4. The submit button is enabled/disabled based on form validity'),
                    Text('5. Success/failure messages are shown using BlocListener'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Email Field Widget
///
/// This widget displays the email field and dispatches events when the value changes.
class _EmailField extends StatelessWidget {
  const _EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormValidationBloc, FormValidationState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          onChanged: (value) {
            context.read<FormValidationBloc>().add(EmailChanged(value));
          },
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'Enter your email',
            prefixIcon: const Icon(Icons.email),
            border: const OutlineInputBorder(),
            errorText: !state.isEmailValid && state.email.isNotEmpty
                ? 'Please enter a valid email'
                : null,
          ),
        );
      },
    );
  }
}

/// Password Field Widget
///
/// This widget displays the password field and dispatches events when the value changes.
class _PasswordField extends StatelessWidget {
  const _PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormValidationBloc, FormValidationState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          onChanged: (value) {
            context.read<FormValidationBloc>().add(PasswordChanged(value));
          },
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Enter your password',
            prefixIcon: const Icon(Icons.lock),
            border: const OutlineInputBorder(),
            errorText: !state.isPasswordValid && state.password.isNotEmpty
                ? 'Password must be at least 6 characters'
                : null,
          ),
        );
      },
    );
  }
}

/// Submit Button Widget
///
/// This widget displays the submit button and dispatches the form submission event.
class _SubmitButton extends StatelessWidget {
  const _SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormValidationBloc, FormValidationState>(
      buildWhen: (previous, current) =>
          previous.isFormValid != current.isFormValid ||
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: state.isFormValid && !state.isSubmitting
                ? () {
                    context.read<FormValidationBloc>().add(FormSubmitted());
                  }
                : null,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: state.isSubmitting
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : const Text(
                    'Submit',
                    style: TextStyle(fontSize: 16),
                  ),
          ),
        );
      },
    );
  }
}
