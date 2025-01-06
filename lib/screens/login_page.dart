import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourist_guide_app/widgets/login_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> _login() async {
    if (formKey.currentState!.validate()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String savedEmail = prefs.getString('email') ?? '';
      String savedPassword = prefs.getString('password') ?? '';

      if (emailController.text == savedEmail &&
          passwordController.text == savedPassword) {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => WelcomePage(),
        //   ),
        // );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text(AppLocalizations.of(context)!.invalid_email_or_password),
          backgroundColor: Colors.red.withOpacity(0.6),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          duration: Duration(seconds: 1),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/main_back.jpg",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
            child: ListView(
              children: [
                SizedBox(height: screenHeight * 0.2),
                Center(
                  child: Text(
                    AppLocalizations.of(context)!.login,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: screenWidth * 0.099,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                LoginForm(
                  emailController: emailController,
                  passwordController: passwordController,
                  formKey: formKey,
                  hidePassword: hidePassword,
                  togglePassword: togglePassword,
                ),
                SizedBox(height: screenHeight * 0.05),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.015,
                        horizontal: screenWidth * 0.1,
                      ),
                    ),
                    onPressed: _login,
                    child: Text(
                      AppLocalizations.of(context)!.login,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: screenWidth * 0.05,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                TextButton(
                  onPressed: () {
                    //             Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => SignUpPage(),
                    //   ),
                    // );
                  },
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.new_here,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Text(
                          AppLocalizations.of(context)!.sign_up,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.046,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
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

  void togglePassword() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }
}
