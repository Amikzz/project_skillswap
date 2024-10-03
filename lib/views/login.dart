import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_skillswap/customWidgets/haveanaccount_login_signup.dart';
import 'package:project_skillswap/customWidgets/textfield_login_signup.dart';
import 'package:project_skillswap/customWidgets/startup_elevated_button.dart';
import 'package:project_skillswap/views/home.dart';
import 'package:project_skillswap/views/signup.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false; // Loading state variable
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  Future<void> _loginUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true; // Start loading
      });

      // Get email and password
      String email = _emailController.text;
      String password = _passwordController.text;

      try {
        var response = await http.post(
          Uri.parse('http://172.20.10.7:8000/api/login'), // Change to your login URL
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'email': email,
            'password': password,
          }),
        );

        if (response.statusCode == 200) {
          // Parse the response and save the token
          var data = jsonDecode(response.body);
          String token = data['token']; // Adjust according to your API response

          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', token);

          // Navigate to home
          Navigator.of(context).pushReplacement(createRoute());
        } else {
          var errorMessage = jsonDecode(response.body)['message'] ?? 'Login failed';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMessage)),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      } finally {
        setState(() {
          _isLoading = false; // Stop loading
        });
      }
    }
  }

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
        child: Form(
          key: _formKey, // Assign form key
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
              SizedBox(height: isPortrait ? 15.0 : 5.0),
              Container(
                padding: EdgeInsets.all(isPortrait ? 25.0 : 5.0),
                child: Column(
                  children: [
                    TextfieldLoginRegistration(
                      hint: 'Email',
                      icon: Icons.email,
                      controller: _emailController, // Added controller
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        // Add more email validation if needed
                        return null;
                      },
                    ),
                    const SizedBox(height: 5),
                    TextfieldLoginRegistration(
                      hint: 'Password',
                      isPassword: true,
                      icon: Icons.lock,
                      controller: _passwordController, // Added controller
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: isPortrait ? 25.0 : 10.0),
                    StartupElevatedButton(
                      onPressed: _isLoading ? null : _loginUser, // Disable button while loading
                      text: _isLoading ? 'Logging in...' : "Login",
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      isLoading: _isLoading // Pass loading state
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