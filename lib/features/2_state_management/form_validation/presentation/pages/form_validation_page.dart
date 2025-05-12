import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/form_validation_bloc.dart';
import '../bloc/form_validation_state.dart';
import '../widgets/email_input.dart';
import '../widgets/form_explanation.dart';
import '../widgets/password_input.dart';
import '../widgets/submit_button.dart';

/// Page for demonstrating form validation with BLoC
class FormValidationPage extends StatelessWidget {
  /// Create a new form validation page
  const FormValidationPage({Key? key}) : super(key: key);

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
                  const FormExplanation(),
                  const SizedBox(height: 24),
                  const EmailInput(),
                  const SizedBox(height: 16),
                  const PasswordInput(),
                  const SizedBox(height: 24),
                  const SubmitButton(),
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
}
