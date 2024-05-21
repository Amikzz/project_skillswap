import 'package:flutter/material.dart';
import 'package:project_skillswap/customWidgets/startup_elevated_button.dart';

class StartupView extends StatelessWidget {
  const StartupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Image(
                  image: AssetImage('images/onboardimg3.png'),
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 60),
                const Text(
                  "Welcome to SkillSwap",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Register as a",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(height: 30),
                //Custom Elevated Button
                StartupElevatedButton(onPressed: () {
                  Navigator.pushNamed(context, '/login');
                  },
                  text: "Skill Seeker",
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                const SizedBox(height: 20),
                //Custom Elevated Button
                StartupElevatedButton(onPressed: () {
                  Navigator.pushNamed(context, '/login');
                  },
                  text: "Skill Sharer",
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
              ],
                ),
          ),
          )
        );
  }
}
