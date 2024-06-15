import 'package:flutter/material.dart';
import 'package:project_skillswap/customWidgets/bottom_navigation_bar.dart';
import 'package:project_skillswap/lists/notifications.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationState();
}

class _NotificationState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Notifications',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.notifications, size: 30, color: Theme.of(context).colorScheme.onPrimary),
                  ],
                ),
                const SizedBox(height: 40),
                for (var notification in notifications)
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSecondary,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Image.asset(notification['image'], width: 50, height: 50),
                        const SizedBox(width: 20),
                        Expanded( // Added Expanded to prevent overflow
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notification['title'],
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                notification['subtitle'],
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 15,
                                ),
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
      ),
      bottomNavigationBar: MyBottomNavigationBar(selectedScreen: '/notifications'),
    );
  }
}
