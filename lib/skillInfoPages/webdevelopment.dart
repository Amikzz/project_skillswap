import 'package:flutter/material.dart';

import '../customWidgets/skills_info.dart';

class WebDevelopment extends StatefulWidget {
  const WebDevelopment({super.key});

  @override
  State<WebDevelopment> createState() => _WebDevelopmentState();
}

class _WebDevelopmentState extends State<WebDevelopment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Skills',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto',
            fontSize: 20.0,
          ),
        ),
      ),
      body: const SkillInfo(
          title: 'Web Development',
          subtitle: '1182 Sharers',
          bannerImage: 'images/skillbanner.png',
          iconImage: 'images/webdevlop.png',
          description: 'Web development is the process of building websites and applications for the internet. It involves the use of programming languages, frameworks, and tools to create interactive and dynamic web pages. Web developers are responsible for designing, coding, and maintaining websites to ensure they function properly and meet the needs of users.',
          topContributors: [
            'images/webdev1.jpeg',
            'images/webdev2.jpeg',
            'images/webdev3.jpg',
            'images/webdev4.jpg',
          ]
      ),
    );
  }
}
