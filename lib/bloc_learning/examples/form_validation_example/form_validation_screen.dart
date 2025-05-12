import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/bloc_learning/examples/form_validation_example/form_validation_bloc.dart';

class FormValidationScreen extends StatelessWidget {
  const FormValidationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormValidationBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Form Validation Example'),
          centerTitle: true,
        ),
        body: BlocConsumer<FormValidationBloc, FormValidationState>(
          listener: (context, state) {
            if (state.isSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Form submitted successfully!'),
                  backgroundColor: Colors.green,
                ),
              );
            }
            
            if (state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage!),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildExplanation(),
                  const SizedBox(height: 24),
                  _EmailInput(),
                  const SizedBox(height: 16),
                  _PasswordInput(),
                  const SizedBox(height: 24),
                  _SubmitButton(),
                  if (state.isSubmitting) ...[  
                    const SizedBox(height: 16),
                    const Center(child: CircularProgressIndicator()),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildExplanation() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue[200]!),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Form Validation with BLoC',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'This example demonstrates how to use BLoC pattern for form validation:',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 4),
          Text('• Email must contain @ and . characters', style: TextStyle(fontSize: 14)),
          Text('• Password must be at least 6 characters', style: TextStyle(fontSize: 14)),
          Text('• Form submission is enabled only when all fields are valid', style: TextStyle(fontSize: 14)),
          Text('• BlocConsumer is used to show feedback on form submission', style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormValidationBloc, FormValidationState>(
      buildWhen: (previous, current) => 
          previous.email != current.email || 
          previous.isEmailValid != current.isEmailValid,
      builder: (context, state) {
        return TextField(
          onChanged: (value) {
            context.read<FormValidationBloc>().add(EmailChanged(value));
          },
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            helperText: 'Must contain @ and . characters',
            errorText: !state.isEmailValid && state.email.isNotEmpty
                ? 'Invalid email format'
                : null,
            prefixIcon: const Icon(Icons.email),
            border: const OutlineInputBorder(),
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormValidationBloc, FormValidationState>(
      buildWhen: (previous, current) => 
          previous.password != current.password || 
          previous.isPasswordValid != current.isPasswordValid,
      builder: (context, state) {
        return TextField(
          onChanged: (value) {
            context.read<FormValidationBloc>().add(PasswordChanged(value));
          },
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            helperText: 'Must be at least 6 characters',
            errorText: !state.isPasswordValid && state.password.isNotEmpty
                ? 'Password too short'
                : null,
            prefixIcon: const Icon(Icons.lock),
            border: const OutlineInputBorder(),
          ),
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormValidationBloc, FormValidationState>(
      buildWhen: (previous, current) => 
          previous.isFormValid != current.isFormValid || 
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state.isFormValid && !state.isSubmitting
              ? () {
                  context.read<FormValidationBloc>().add(FormSubmitted());
                }
              : null,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            textStyle: const TextStyle(fontSize: 16),
          ),
          child: const Text('SUBMIT'),
        );
      },
    );
  }
}