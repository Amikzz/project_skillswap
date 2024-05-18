import 'package:flutter/material.dart';
import 'package:project_skillswap/customWidgets/haveanaccount_login_signup.dart';
import 'package:project_skillswap/customWidgets/textfield_login_signup.dart';
import 'package:project_skillswap/customWidgets/startup_elevated_button.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("Sign Up",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            const Icon(Icons.person_add_alt_1_rounded, size: 70, color: Colors.black),
            Container(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                  children: [
                    const TextfieldLoginRegistration(hint: 'Name'),
                    const SizedBox(height: 25),
                    const TextfieldLoginRegistration(hint: 'Email'),
                    const SizedBox(height: 25),
                    const TextfieldLoginRegistration(hint: 'Password'),
                    const SizedBox(height: 25),
                    const TextfieldLoginRegistration(hint: 'Confirm Password'),
                    const SizedBox(height: 25),
                    const TextfieldLoginRegistration(hint: 'Phone Number'),
                    const SizedBox(height: 25),
                    const TextfieldLoginRegistration(hint: 'Address'),
                    const SizedBox(height: 25),
                    const TextfieldLoginRegistration(hint: 'Date of birth'),
                    const SizedBox(height: 25),
                    StartupElevatedButton(
                        onPressed: () { },
                        text: "Sign Up",
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white
                    ),
                    HaveAccountLoginSignup(
                        text1: "Already have an account?",
                        text2: "Login",
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        }
                    ),
          ],),
        ),
        ],)
      );
  }
}