import 'package:flutter/material.dart';
import 'package:project_skillswap/customWidgets/haveanaccount_login_signup.dart';
import 'package:project_skillswap/customWidgets/textfield_login_signup.dart';
import 'package:project_skillswap/customWidgets/startup_elevated_button.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController datePicker = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height:30),
              const Text("Welcome to SkillSwap",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
              const Text("Register to Get Started",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                      children: [
                        const TextfieldLoginRegistration(hint: 'Name', icon: Icons.person),
                        const SizedBox(height: 5),
                        const TextfieldLoginRegistration(hint: 'Email', icon: Icons.email),
                        const SizedBox(height: 5),
                        const TextfieldLoginRegistration(
                            hint: 'Password',
                            isPassword: true,
                            icon: Icons.lock,
                        ),
                        const SizedBox(height: 5),
                        const TextfieldLoginRegistration(
                            hint: 'Confirm Password',
                            isPassword: true,
                            icon: Icons.lock,
                        ),
                        const SizedBox(height: 5),
                        const TextfieldLoginRegistration(hint: 'Phone Number', icon: Icons.phone),
                        const SizedBox(height: 5),
                        const TextfieldLoginRegistration(hint: 'Address', icon: Icons.location_on),
                        const SizedBox(height: 5),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Date of Birth',
                            icon: const Icon(Icons.calendar_today),
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontFamily: 'Roboto',
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          controller: datePicker,
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                            ).then((value) {
                              if (value != null) {
                                datePicker.text = value.toString().substring(0, 10);
                              }
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        StartupElevatedButton(
                            onPressed: () { },
                            text: "Sign Up",
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            foregroundColor: Theme.of(context).colorScheme.onPrimary,
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
              ),
          ],)
        ],
      )
      );
  }
}