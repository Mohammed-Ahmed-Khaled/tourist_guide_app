import 'package:flutter/material.dart';
import '../screens/tabs_screen.dart';
import '../screens/sign_up_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../generated/l10n.dart';
import '../widgets/background_image.dart';
import '../widgets/login_button.dart';
import '../widgets/login_form.dart';
import '../widgets/login_title.dart';
import '../widgets/signup_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    required this.togglelanguage,
  });

  final void Function() togglelanguage;

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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TabsScreen(
          togglelanguage: widget.togglelanguage,
        ),
      ),
    );
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
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp(
                              togglelanguage: widget.togglelanguage,
                            ),
                          ),
                        );
                      },
                      child: Text(S.of(context).sign_up),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.015,
                        horizontal: MediaQuery.of(context).size.width * 0.1,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TabsScreen(
                            togglelanguage: widget.togglelanguage,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      S.of(context).continueasguest,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
