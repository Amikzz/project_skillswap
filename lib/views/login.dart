import 'package:flutter/material.dart';
import 'package:project_skillswap/customWidgets/haveanaccount_login_signup.dart';
import 'package:project_skillswap/customWidgets/textfield_login_signup.dart';
import 'package:project_skillswap/customWidgets/startup_elevated_button.dart';
import 'package:project_skillswap/views/home.dart';
import 'package:project_skillswap/views/signup.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var isPortrait = orientation == Orientation.portrait;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: isPortrait
            ? ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildContent(context, isPortrait),
            ),
          ],
        )
            : ListView(
              children: [
                Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildContent(context, isPortrait),
                        ),
              ],
            ),
      ),
    );
  }

  List<Widget> _buildContent(BuildContext context, bool isPortrait) {
    return [
      Expanded(
        flex: isPortrait ? 0 : 1,
        child: Image.asset(
          'images/loginpage.png',
          width: isPortrait ? 300 : null,
          height: isPortrait ? 300 : null,
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(width: isPortrait ? 0 : 20, height: isPortrait ? 40 : 0),
      Expanded(
        flex: isPortrait ? 0 : 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Welcome to SkillSwap",
                style: TextStyle(
                  fontSize: isPortrait ? 30.0 : 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            SizedBox( height: isPortrait ? 15.0 : 5.0 ),
            Container(
              padding: EdgeInsets.all( isPortrait ? 25.0 : 5.0 ),
              child: Column(
                children: [
                  const TextfieldLoginRegistration(
                    hint: 'Email',
                    icon: Icons.email,
                  ),
                  const SizedBox(height: 5),
                  const TextfieldLoginRegistration(
                    hint: 'Password',
                    isPassword: true,
                    icon: Icons.lock,
                  ),
                  SizedBox(height: isPortrait ? 25.0 : 10.0),
                  StartupElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(createRoute());
                    },
                    text: "Login",
                    backgroundColor:
                    Theme.of(context).colorScheme.primary,
                    foregroundColor:
                    Theme.of(context).colorScheme.onPrimary,
                  ),
                  HaveAccountLoginSignup(
                    text1: "Don't have an account?",
                    text2: "Sign Up",
                    onPressed: () {
                      Navigator.of(context).push(createRoute2());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ];
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
