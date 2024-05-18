import 'package:flutter/material.dart';

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
                        const TextField(
                          decoration: InputDecoration(
                          hintStyle: TextStyle(
                          fontFamily: 'Roboto',
                        ),
                          hintText: 'Email',
                        ),
                        ),
                        const SizedBox(height: 40),
                        const TextField(
                          decoration: InputDecoration(
                          hintStyle: TextStyle(
                          fontFamily: 'Roboto',
                        ),
                          hintText: 'Password',
                        ),
                        ),
                        const SizedBox(height: 50),
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
                              'Sign In',
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
                              Navigator.pushNamed(context, '/signup');
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              ),
                            ),
                          ),
                    ]
              ),]
        ),),
        ]
    )
    );
  }
}
