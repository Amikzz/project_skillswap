import 'package:flutter/material.dart';

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
                    const TextField(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontFamily: 'Roboto',
                        ),
                        hintText: 'Name',
                      ),
                    ),
                    const SizedBox(height: 25),
                    const TextField(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                        fontFamily: 'Roboto',
                      ),
                        hintText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 25),
                    const TextField(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontFamily: 'Roboto',
                        ),
                        hintText: 'Password',
                      ),
                    ),
                    const SizedBox(height: 25),
                    const TextField(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontFamily: 'Roboto',
                        ),
                        hintText: 'Confirm Password',
                      ),
                    ),
                    const SizedBox(height: 25),
                    const TextField(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontFamily: 'Roboto',
                        ),
                        hintText: 'Phone',
                      ),
                    ),
                    const SizedBox(height: 25),
                    const TextField(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontFamily: 'Roboto',
                        ),
                        hintText: 'Address',
                      ),
                    ),
                    const SizedBox(height: 25),
                    const TextField(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontFamily: 'Roboto',
                        ),
                        hintText: 'Date of birth',
                      ),
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        fixedSize: const Size(220, 60),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                            ),
                          ),
                        ),
                  ],
                ),
          ],
            ),
        ),
        ]
        )
      );
  }
}
