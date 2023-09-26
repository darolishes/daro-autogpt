import 'package:flutter/material.dart';
import 'package:auto_gpt_flutter_client/services/auth_service.dart';
import 'login_form.dart';

class FirebaseAuthView extends StatefulWidget {
  const FirebaseAuthView({Key? key}) : super(key: key);

  @override
  _FirebaseAuthViewState createState() => _FirebaseAuthViewState();
}

class _FirebaseAuthViewState extends State<FirebaseAuthView> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onLogin(String email, String password) async {
    final user = await _authService.signInWithEmailAndPassword(
      email,
      password,
    );
    if (user != null) {
      print("Successfully signed in with Email: ${user.user?.email}");
    }
  }

  void _onGoogleSignIn() async {
    final user = await _authService.signInWithGoogle();
    if (user != null) {
      print("Successfully signed in with Google: ${user.user?.displayName}");
    }
  }

  void _onGithubSignIn() async {
    final user = await _authService.signInWithGitHub();
    if (user != null) {
      print("Successfully signed in with GitHub: ${user.user?.displayName}");
    }
  }

  void _onForgotPassword() {
    // Implementieren Sie die Logik für "Passwort vergessen"
    print("Forgot password clicked");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: LoginForm(
            emailController: _emailController,
            passwordController: _passwordController,
            onLogin: _handleLogin,
            onGoogleSignIn: _handleGoogleSignIn,
            onGithubSignIn: _handleGithubSignIn,
            onForgotPassword: _handleForgotPassword,
          ),
        ),
      ),
    );
  }
}
