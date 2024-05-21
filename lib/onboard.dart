import 'package:flutter/material.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  String textHolder = "Get the Services you need right at your fingertips";
  String buttonText = "Next";
  String urlHolder = 'images/onboardimg.png';

  void clickNext() {
    setState(() {
      if (buttonText == "Next") {
        textHolder = "The Best Platform for Skill Sharing and Skill Hiring";
        buttonText = "Get Started";
        urlHolder = 'images/onboardimg2.png';
      } else {
        Navigator.pushNamed(context, '/startup');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  final scaleAnimation = Tween<double>(
                    begin: 0.0,
                    end: 1.0,
                  ).animate(animation);
                  return ScaleTransition(
                    scale: scaleAnimation,
                    child: child,
                  );
                },
                child: Image(
                  key: ValueKey<String>(urlHolder),
                  image: AssetImage(urlHolder),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 100),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  final scaleAnimation = Tween<double>(
                    begin: 0.0,
                    end: 1.0,
                  ).animate(animation);
                  return ScaleTransition(
                    scale: scaleAnimation,
                    child: child,
                  );
                },
                child: Text(
                  textHolder,
                  key: ValueKey<String>(textHolder),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
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
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
