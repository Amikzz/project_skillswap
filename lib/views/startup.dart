import 'package:flutter/material.dart';
import 'package:project_skillswap/customWidgets/startup_elevated_button.dart';
import 'package:project_skillswap/views/login.dart';

/// The startup page of the app.
///
/// This page is shown after the onboarding page. It allows the user to select
/// whether they want to register as a "Skill Seeker" or a "Skill Sharer".
class StartupView extends StatelessWidget {
  /// Creates a [StartupView].
  const StartupView({super.key});

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var isPortrait = orientation == Orientation.portrait;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(isPortrait ? 20.0 : 0),
          child: isPortrait
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildContent(context, isPortrait),
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildContent(context, isPortrait),
          ),
        ),
      ),
    );
  }

  /// Builds the content of the startup page.
  List<Widget> _buildContent(BuildContext context, bool isPortrait) {
    return [
      SizedBox(height: isPortrait ? 50 : 0),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: isPortrait ? 0 : 20.0),
        child: Image(
          image: const AssetImage('images/onboard2.gif'),
          fit: BoxFit.cover,
          height: isPortrait ? 300 : 300,
        ),
      ),
      SizedBox(height: isPortrait ? 30 : 10),
      Flexible(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to SkillSwap",
              style: TextStyle(
                fontSize: isPortrait ? 35 : 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: isPortrait ? 30 : 5),
            Text(
              "Register as a",
              style: TextStyle(
                fontSize: isPortrait ? 25 : 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: isPortrait ? 50 : 15),
            // Custom Elevated Button
            Center(
              child: StartupElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                text: "Skill Seeker",
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            SizedBox(height: isPortrait ? 20 : 15),
            // Custom Elevated Button
            Center(
              child: StartupElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/instructions');
                },
                text: "Skill Sharer",
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                foregroundColor: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ],
        ),
      ),
    ];
  }
}

/// Creates a page route for the login page.
Route createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const LoginView(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
