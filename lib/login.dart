import 'package:flutter/material.dart';
import 'package:project_skillswap/customWidgets/haveanaccount_login_signup.dart';
import 'package:project_skillswap/customWidgets/textfield_login_signup.dart';
import 'package:project_skillswap/customWidgets/startup_elevated_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
          appBar: AppBar(
          ),
          body: Column(
            children: [
              const Center(
                child: Image(
                  image: AssetImage(
                      'images/SkillSwap-removebg-preview.png',
                  ),
                  height: 350,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                      children: [
                        const TextfieldLoginRegistration(hint: 'Email'),
                        const SizedBox(height: 20),
                        const TextfieldLoginRegistration(hint: 'Password'),
                        const SizedBox(height: 50),
                        StartupElevatedButton(
                            onPressed: () { },
                            text: "Login",
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white
                        ),
                        HaveAccountLoginSignup(
                            text1: "Don't have an account?",
                            text2: "Sign Up",
                            onPressed: () {
                              Navigator.pushNamed(context, '/signup');
                            }
                        ),]
        ),),
        ]
    )
    );
  }
}
