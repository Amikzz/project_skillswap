import 'package:flutter/material.dart';
import 'package:project_skillswap/customWidgets/haveanaccount_login_signup.dart';
import 'package:project_skillswap/customWidgets/textfield_login_signup.dart';
import 'package:project_skillswap/customWidgets/startup_elevated_button.dart';
import 'package:project_skillswap/home.dart';
import 'package:project_skillswap/signup.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
          appBar: AppBar(
          ),
          body: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(height: 30),
                  const Center(
                    child: Text(
                      "Welcome to SkillSwap",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    )
                  ),
                  const SizedBox(height: 30),
                  Container(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                          children: [
                            const TextfieldLoginRegistration(hint: 'Email', icon: Icons.email),
                            const SizedBox(height: 20),
                            const TextfieldLoginRegistration(hint: 'Password', isPassword: true, icon: Icons.lock),
                            const SizedBox(height: 50),
                            StartupElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(createRoute());
                                },
                                text: "Login",
                                backgroundColor: Theme.of(context).colorScheme.primary,
                                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                            ),
                            HaveAccountLoginSignup(
                                text1: "Don't have an account?",
                                text2: "Sign Up",
                                onPressed: () {
                                  Navigator.of(context).push(createRoute2());
                                }
                            ),]
                      ),),
                      ]
                  ),
            ],
          )
    );
  }
}

Route createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const MyHome(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {

      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

Route createRoute2() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const SignupView(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {

      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
