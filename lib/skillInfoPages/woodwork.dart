import 'package:flutter/material.dart';
import 'package:project_skillswap/customWidgets/skills_info.dart';

class WoodWork extends StatefulWidget {
  const WoodWork({super.key});

  @override
  State<WoodWork> createState() => _WoodWorkState();
}

class _WoodWorkState extends State<WoodWork> {
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
          title: 'WoodWork',
          subtitle: '1453 Sharers',
          bannerImage: 'images/skillbanner.png',
          iconImage: 'images/woodwork.png',
          description: 'Woodworking is a versatile skill that combines creativity, craftsmanship, and utility, allowing individuals to create furniture, art, and repairs. It fosters problem-solving abilities and meticulous attention to detail, making it suitable for both novices and experienced artisans.',
          topContributors: [
            'images/woodworker1.jpg',
            'images/woodworker2.jpg',
            'images/woodworker3.jpeg',
            'images/woodworker4.jpg',
          ]
      ),
    );
  }
}
