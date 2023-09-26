import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function(String, String) onLogin;
  final Function onGoogleSignIn;
  final Function onGithubSignIn;
  final Function onForgotPassword;

  LoginForm({
    required this.emailController,
    required this.passwordController,
    required this.onLogin,
    required this.onGoogleSignIn,
    required this.onGithubSignIn,
    required this.onForgotPassword,
  });

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              'Anmelden',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'email@example.com',
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bitte geben Sie eine E-Mail-Adresse ein';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Passwort',
                labelText: 'Passwort',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bitte geben Sie ein Passwort ein';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  onLogin(emailController.text, passwordController.text);
                }
              },
              child: Text('Anmelden'),
            ),
            TextButton(
              onPressed: () => onForgotPassword(),
              child: Text('Passwort vergessen?'),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.asset('assets/google_logo.svg.png'),
                  onPressed: () => onGoogleSignIn(),
                ),
                IconButton(
                  icon: Image.asset('assets/github_logo.svg.png'),
                  onPressed: () => onGithubSignIn(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
