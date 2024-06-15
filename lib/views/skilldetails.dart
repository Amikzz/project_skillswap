import 'package:flutter/material.dart';
import 'package:project_skillswap/models/trendingskillmodel.dart';
import 'package:project_skillswap/customWidgets/skills_info.dart';

class SkillDetailPage extends StatefulWidget {
  final Skill skill;

  const SkillDetailPage({super.key, required this.skill});

  @override
  State<SkillDetailPage> createState() => _SkillDetailPageState();
}

class _SkillDetailPageState extends State<SkillDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.skill.title)),
      body: SkillInfo(
        title: widget.skill.title,
        subtitle: widget.skill.subtitle,
        bannerImage: widget.skill.bannerImage,
        iconImage: widget.skill.iconImage,
        description: widget.skill.description,
        topContributors: widget.skill.topContributors,
      ),
    );
  }
}
