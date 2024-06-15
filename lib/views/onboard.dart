import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_skillswap/views/startup.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  String textHolder = "Get the Services you need right at your fingertips";
  String buttonText = "Next";

  @override
  void initState() {
    super.initState();
    checkFirstSeen();
  }

  void checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstSeen = prefs.getBool('first_seen') ?? true;

    if (!isFirstSeen) {
      navigateToStartup();
    }
  }

  void clickNext() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      if (buttonText == "Next") {
        textHolder = "Best Platform for Skill Sharing and Hiring";
        buttonText = "Get Started";
      } else {
        prefs.setBool('first_seen', false);
        navigateToStartup();
      }
    });
  }

  void navigateToStartup() {
    Navigator.of(context).pushReplacement(createRoute());
  }

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var isPortrait = orientation == Orientation.portrait;

    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(isPortrait ? 20.0 : 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: Image(
                      image: const AssetImage('images/onboard.gif'),
                      fit: BoxFit.cover,
                      height: isPortrait ? 300 : 200,
                    ),
                  ),
                  SizedBox(height: isPortrait ? 150 : 20),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: Text(
                      textHolder,
                      key: ValueKey<String>(textHolder),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isPortrait ? 35 : 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  SizedBox(height: isPortrait ? 80 : 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: isPortrait ? 40 : 20,
                        vertical: isPortrait ? 20 : 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fixedSize: Size(isPortrait ? 240 : 180, isPortrait ? 70 : 50),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                    onPressed: clickNext,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          buttonText,
                          style: TextStyle(
                            fontSize: isPortrait ? 20 : 15,
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
        ],
      ),
    );
  }
}

Route createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const StartupView(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
