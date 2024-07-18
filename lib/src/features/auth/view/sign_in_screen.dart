import 'package:comments/src/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/custom_text_field.dart';
import 'auth_base.dart';
import '../viewmodel/auth_viewmodel.dart';
import 'auth_screen.dart';

class SignInScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return AuthBaseWidget(
      title: 'Comments',
      buttonWidget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60.0),
        child: ElevatedButton(
          onPressed: authViewModel.isLoading
              ? null
              : () {
                  if (_formKey.currentState?.validate() ?? false) {
                    authViewModel.signIn(_emailController.text,
                        _passwordController.text, context);
                  }
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: authViewModel.isLoading
              ? const CircularProgressIndicator()
              : const Text('Login'),
        ),
      ),
      switchAuthModeWidget: TextButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => SignUpScreen()));
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'New here? ',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Signup',
              style: TextStyle(color: AppTheme.primaryColor),
            ),
          ],
        ),
      ),
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: _emailController,
                labelText: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: _passwordController,
                labelText: 'Password',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              if (authViewModel.errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    authViewModel.errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
