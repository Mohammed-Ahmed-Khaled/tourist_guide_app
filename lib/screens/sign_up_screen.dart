import 'package:flutter/material.dart';
import '../generated/l10n.dart';
import '../widgets/custom_text_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key, required this.title});
  final String title;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool hidden_Password = true;
  bool confirm_password = true;
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _savedUserData() async {
  final prefernce = await SharedPreferences.getInstance();
  await prefernce.setString("Name", fullName.text);
  await prefernce.setString("Email", email.text);
  await prefernce.setString("Password", password.text);
  await prefernce.setString("confirmPassword", confirmPassword.text);
  if (phoneNumber.text.isNotEmpty) {
    await prefernce.setInt("Phone", int.parse(phoneNumber.text));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Phone number is empty!')),
    );
    return;
  }

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('User data saved successfully!')),
  );
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
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: Form(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(height: screenHeight * 0.02),
                    CustomTextFormField(
                      prefixIcon: Icon(Icons.person),
                      label: S.of(context).fullName,
                      controller: fullName,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return S.of(context).EnterName;
                        } else if (!isFirstCharacter(value!)) {
                          return S.of(context).FirstCpital;
                        }
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomTextFormField(
                      prefixIcon: Icon(Icons.email),
                      label: S.of(context).Email,
                      controller: email,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return S.of(context).EnterEmail;
                        } else if (!value!.contains('@')) {
                          return S.of(context).ValidEmail;
                        }
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomTextFormField(
                      prefixIcon: Icon(Icons.lock),
                      label: S.of(context).Password,
                      controller: password,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return S.of(context).EnterPassword;
                        } else if (value!.length < 6) {
                          return S.of(context).ValidPassword;
                        }
                      },
                      obscureText: hidden_Password,
                      suffixIcon: IconButton(
                        onPressed: togglePassword,
                        icon: Icon(hidden_Password
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomTextFormField(
                      prefixIcon: Icon(Icons.lock),
                      label: S.of(context).ConfirmPassword,
                      controller: confirmPassword,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return S.of(context).EnterPassword;
                        } else if (!isEqual(value!, password.text)) {
                          return S.of(context).PasswordsMatch;
                        }
                      },
                      obscureText: confirm_password,
                      suffixIcon: IconButton(
                        onPressed: toggleConfirmPassword,
                        icon: Icon(confirm_password
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomTextFormField(
                      label: S.of(context).Phone,
                      controller: phoneNumber,
                      isPhoneNumber: true,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _savedUserData();
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const LoginPage()),
                          // );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02,
                          horizontal: screenWidth * 0.1,
                        ),
                        backgroundColor: Color.fromARGB(255, 101, 48, 20),
                      ),
                      child: Text(
                        S.of(context).SignUP,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: screenWidth * 0.045,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  togglePassword() {
    setState(() {
      hidden_Password = !hidden_Password;
    });
  }

  toggleConfirmPassword() {
    setState(() {
      confirm_password = !confirm_password;
    });
  }

  bool isFirstCharacter(String text) {
    return text.isNotEmpty && text[0] == text[0].toUpperCase();
  }

  bool isEqual(String pass, String confirm) {
    return pass == confirm;
  }
}
