import 'package:flutter/material.dart';

import '../customWidgets/skills_info.dart';

class PosterHanging extends StatefulWidget {
  const PosterHanging({super.key});

  @override
  State<PosterHanging> createState() => _PosterHangingState();
}

class _PosterHangingState extends State<PosterHanging> {
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
          title: 'Poster Hanging',
          subtitle: '987 Sharers',
          bannerImage: 'images/skillbanner.png',
          iconImage: 'images/posterhang.jpg',
          description: 'Poster hanging is the art of hanging posters in a way that is visually appealing and effective. It involves choosing the right location, layout, and framing to create an eye-catching display that captures attention and communicates a message. Poster hangers use their creativity and design skills to enhance the visual impact of posters and create engaging environments that inspire and inform viewers.',
          topContributors: [
            'images/posterhang1.jpg',
            'images/posthang2.jpg',
            'images/woodworker3.jpeg',
            'images/painter4.jpg',
          ]
      ),
    );
  }
}
