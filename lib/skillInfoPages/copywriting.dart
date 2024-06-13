import 'package:flutter/material.dart';

import '../customWidgets/skills_info.dart';

class CopyWriting extends StatefulWidget {
  const CopyWriting({super.key});

  @override
  State<CopyWriting> createState() => _CopyWritingState();
}

class _CopyWritingState extends State<CopyWriting> {
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
          title: 'Copy Writing',
          subtitle: '987 Sharers',
          bannerImage: 'images/skillbanner.png',
          iconImage: 'images/copywrite.jpg',
          description: 'Copy writing is the art of writing persuasive and engaging content that motivates people to take action. It involves creating compelling headlines, engaging body copy, and clear calls to action to drive conversions and achieve marketing goals. Copywriters use their creativity and writing skills to craft messages that resonate with their target audience and inspire them to make a purchase, sign up for a service, or take another desired action.',
          topContributors: [
            'images/webdev1.jpeg',
            'images/copywrite1.jpg',
            'images/webdev3.jpg',
            'images/copywrite2.jpg',
          ]
      ),
    );
  }
}
