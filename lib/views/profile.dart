import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../customWidgets/bottom_navigation_bar.dart';
import '../customWidgets/profile_cards.dart';
import '../customWidgets/profile_font.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _isLoading = false; // Loading state variable

  // Function to log the user out
  Future<void> _logoutUser(BuildContext context) async {
    setState(() {
      _isLoading = true; // Start loading
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null) {
      try {
        var response = await http.post(
          Uri.parse('http://172.20.10.7:8000/api/logout'),
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        );

        if (response.statusCode == 200) {
          // Logout successful, remove the token
          await prefs.remove('token');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Logged out successfully')),
          );

          // Navigate to login page
          Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
        } else {
          var errorMessage = jsonDecode(response.body)['message'] ?? 'Logout failed';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMessage)),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No token found, please log in first')),
      );
    }

    setState(() {
      _isLoading = false; // Stop loading
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'My Profile',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.person, size: 30, color: Theme.of(context).colorScheme.onPrimary),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage("images/profilepic.jpg"),
                        radius: 50,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const ProfileFont(text: "Name", size: 15),
                    const SizedBox(height: 5),
                    const ProfileFont(text: "Amika", size: 25),
                    const SizedBox(height: 10),
                    const ProfileFont(text: "Account Level", size: 15),
                    const SizedBox(height: 5),
                    const ProfileFont(text: "10", size: 25),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(0),
                child: Column(
                  children: [
                    Divider(
                      color: Theme.of(context).colorScheme.onPrimary,
                      thickness: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const ProfileCard(title: 'Personal Details', icon: Icons.person),
                          const SizedBox(height: 5),
                          const ProfileCard(title: 'Settings', icon: Icons.settings),
                          const SizedBox(height: 5),
                          const ProfileCard(title: 'Help', icon: Icons.help),
                          const SizedBox(height: 5),
                          const ProfileCard(title: 'Terms and Conditions', icon: Icons.not_interested),
                          const SizedBox(height: 5),
                          const ProfileCard(title: 'Your Data', icon: Icons.data_thresholding_outlined),
                          const SizedBox(height: 5),
                          ProfileCard(
                            title: 'Log Out',
                            icon: Icons.logout,
                            onTap: () => _logoutUser(context), // Call logout function
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(selectedScreen: '/profile'),
      // Display loading indicator overlay
      floatingActionButton: _isLoading
          ? const CircularProgressIndicator() // Show loading spinner
          : null,
    );
  }
}