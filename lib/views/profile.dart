import 'package:flutter/material.dart';
import 'package:project_skillswap/customWidgets/bottom_navigation_bar.dart';
import 'package:project_skillswap/customWidgets/profile_cards.dart';
import 'package:project_skillswap/customWidgets/profile_font.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
                      const SizedBox(
                        height: 20,
                      ),
                      const Center(
                        child: CircleAvatar(
                          backgroundImage: AssetImage("images/profilepic.jpg"),
                          radius: 50,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const ProfileFont(text: "Name", size: 15),
                      const SizedBox(
                        height: 5,
                      ),
                      const ProfileFont(text: "Amika", size: 25),
                      const SizedBox(
                        height: 10,
                      ),
                      const ProfileFont(text: "Account Level", size: 15),
                      const SizedBox(
                        height: 5,
                      ),
                      const ProfileFont(text: "10", size: 25),
                      const SizedBox(
                        height: 0,
                      ),
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
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            ProfileCard(title: 'Personal Details', icon: Icons.person),
                            SizedBox(
                              height: 5,
                            ),
                            ProfileCard(title: 'Settings', icon: Icons.settings),
                            SizedBox(
                              height:5,
                            ),
                            ProfileCard(title: 'Help', icon: Icons.help),
                            SizedBox(
                              height: 5,
                            ),
                            ProfileCard(title: 'Terms and Conditions', icon: Icons.not_interested),
                            SizedBox(
                              height: 5,
                            ),
                            ProfileCard(title: 'Your Data', icon: Icons.data_thresholding_outlined),
                            SizedBox(
                              height: 5,
                            ),
                            ProfileCard(title: 'Log Out', icon: Icons.logout),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
                  ),
          ],
        ),
      bottomNavigationBar: MyBottomNavigationBar(selectedScreen: '/profile'),
    );
  }
}