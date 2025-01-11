import 'package:Tourist_guide/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../generated/l10n.dart';
import '../widgets/background_image.dart';
import '../widgets/login_button.dart';
import '../widgets/login_form.dart';
import '../widgets/login_title.dart';
import '../widgets/signup_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordHidden = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _loginUser() async {
    if (!_formKey.currentState!.validate()) return;
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('Email') ?? '';
    final savedPassword = prefs.getString('Password') ?? '';

    if (_emailController.text == savedEmail &&
        _passwordController.text == savedPassword) {
      _showSnackBar(S.of(context).login_successful, isError: false);
      // Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomePage()));
    } else {
      _showSnackBar(S.of(context).invalid_email_or_password, isError: true);
    }
  }

  void _showSnackBar(String message, {bool isError = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.01),
            child: ListView(
              children: [
                SizedBox(height: screenHeight * 0.2),
                const LoginTitle(),
                SizedBox(height: screenHeight * 0.05),
                LoginForm(
                  emailController: _emailController,
                  passwordController: _passwordController,
                  formKey: _formKey,
                  hidePassword: _isPasswordHidden,
                  togglePassword: _togglePasswordVisibility,
                ),
                SizedBox(height: screenHeight * 0.05),
                LoginButton(onPressed: _loginUser),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S.of(context).new_here),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUp(),
                          ),
                        );
                      },
                      child: Text(S.of(context).sign_up),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
