import 'package:flutter/material.dart';
import 'package:project_skillswap/customWidgets/bottom_navigation_bar.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationState();
}

class _NotificationState extends State<Notifications> {

  List<Map<String, dynamic>> notifications = [
    {'title': 'Skill Request', 'subtitle': 'Sujith Gunasinghe has requested a session for Painting.', 'image': 'images/painting.png'},
    {'title': 'Skill Offer', 'subtitle': 'Tharindu Liyanage has offered a session for Web Development.', 'image': 'images/webdevlop.png'},
    {'title': 'Session Confirmation', 'subtitle': 'Your session with Ranjith De Silva for Guitar Lessons has been confirmed.', 'image': 'images/guitar.png'},
    {'title': 'New Message', 'subtitle': 'You have a new message from Emily Ruwan Jayasinghe.', 'image': 'images/message.png'},
    {'title': 'New Message', 'subtitle': 'You have a new message from Sujith Gunasinghe.', 'image': 'images/message.png'},
    {'title': 'Skill Request', 'subtitle': 'Chathura Rathnayaka has requested a session for Cooking.', 'image': 'images/cooking.png'},
    {'title': 'Skill Offer', 'subtitle': 'Mahesh Senanayaka has offered a session for Data Science.', 'image': 'images/webdevlop.png'},
    {'title': 'Session Confirmation', 'subtitle': 'Your session with Ruwanthi Jayawardana for Yoga Lessons has been confirmed.', 'image': 'images/yoga.png'},
    {'title': 'New Message', 'subtitle': 'You have a new message from Ranjith De Silva.', 'image': 'images/message.png'},
    {'title': 'New Message', 'subtitle': 'You have a new message from Priya Rajapaksha.', 'image': 'images/message.png'},
    {'title': 'Skill Request', 'subtitle': 'Olivia Johnson has requested a session for Digital Marketing.', 'image': 'images/digitalmarketing.jpg'},
    {'title': 'Skill Offer', 'subtitle': 'Ishara Nanayakkkara has offered a session for Graphic Design.', 'image': 'images/graphicdesign.png'},
    {'title': 'Session Confirmation', 'subtitle': 'Your session with Linda Carter for Spanish Lessons has been confirmed.', 'image': 'images/spanishlesson.jpg'},
    {'title': 'New Message', 'subtitle': 'You have a new message from Rajesh Kumar.', 'image': 'images/message.png'},
    {'title': 'New Message', 'subtitle': 'You have a new message from Maria Silva.', 'image': 'images/message.png'},
  ];

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
