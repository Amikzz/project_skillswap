import 'package:flutter/material.dart';
import 'package:project_skillswap/customWidgets/skills_info.dart';

class Painting extends StatefulWidget {
  const Painting({super.key});

  @override
  State<Painting> createState() => _PaintingState();
}

class _PaintingState extends State<Painting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Skills',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const SkillInfo(
          title: 'Painting',
          subtitle: '1763 Sharers',
          bannerImage: 'images/skillbanner.png',
          iconImage: 'images/painting.png',
          description: 'Household painting is an essential skill that can transform your living spaces, adding fresh color and new life to your home. Whether you\'re updating a single room, renovating an entire house, or simply refreshing the look of your walls, learning the art of painting can help you achieve professional-looking results on a budget.',
          topContributors: [
            'images/painter1.jpg',
            'images/painter2.jpg',
            'images/painter3.jpg',
            'images/painter4.jpg',
          ]
      ),
    );
  }
}
