import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';
import '../widgets/email_input.dart';
import '../widgets/password_input.dart';
import '../widgets/login_button.dart';

/// Login Page
///
/// This page demonstrates form validation using BLoC.
class LoginPage extends StatelessWidget {
  /// Route name for navigation
  static const routeName = '/login';

  /// Creates a new LoginPage instance
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Form Validation')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider(
          create: (_) => LoginBloc(),
          child: const LoginForm(),
        ),
      ),
    );
  }
}

/// Login Form
///
/// This widget displays the login form and interacts with the LoginBloc.
class LoginForm extends StatelessWidget {
  /// Creates a new LoginForm instance
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Login Successful!'),
                backgroundColor: Colors.green,
              ),
            );
        } else if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Login Failed'),
                backgroundColor: Colors.red,
              ),
            );
        }
      },
      child: Column(
        children: [
          const SizedBox(height: 16),
          const Text(
            'Form Validation with BLoC',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'This example demonstrates form validation using BLoC pattern.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'Try logging in with:',
            textAlign: TextAlign.center,
          ),
          const Text(
            'Email: test@example.com',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
            'Password: password123',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),
          const EmailInput(),
          const SizedBox(height: 16),
          const PasswordInput(),
          const SizedBox(height: 24),
          const LoginButton(),
          const SizedBox(height: 32),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state.status.isInProgress) {
                return const CircularProgressIndicator();
              }
              return const SizedBox.shrink();
            },
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
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
                Text('• FormzInput: Base class for form inputs with validation'),
                Text('• BlocListener: Responds to state changes without rebuilding'),
                Text('• BlocBuilder: Rebuilds UI when state changes'),
                Text('• Form validation with BLoC pattern'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
