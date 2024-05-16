import 'package:flutter/material.dart';
import 'package:project_skillswap/startup.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}


class _OnboardViewState extends State<OnboardView> {

  String textHolder = "Get the Services you need right at your fingertips";
  String buttonText = "Next";
  void clickNext() {
    setState(() {
      if(buttonText == "Next"){
        textHolder = "The Best Platform for Skill Sharing and Skill Hiring";
        buttonText = "Get Started";
      }
      else{
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const StartupView())
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Image(
                  image: AssetImage('images/onboardimg.png')
                ),
                const SizedBox(height: 100),
                Text(
                    textHolder,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                const SizedBox(height: 130),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    fixedSize: const Size(240, 70),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                    onPressed: clickNext,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          buttonText,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto'
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                )
              ],
            ),
          )
      ),
    ),
      debugShowCheckedModeBanner: false,
    );
  }
}