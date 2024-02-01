// signup_page.dart
import 'package:flutter/material.dart';
import 'package:vibes/models/user_model.dart';

import 'package:vibes/viewModel/authVM.dart';


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthViewModel _viewModel = AuthViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _handleSignUp(),
              child: Text('Sign Up'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the login page
              },
              child: Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSignUp() async {
    AuthModel authModel = AuthModel(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    bool success = await _viewModel.signUp(authModel);

    if (success) {
      Navigator.pushReplacementNamed(context, "/login");
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Sign Up Failed'),
          content: Text('Failed to create an account. Please try again.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
