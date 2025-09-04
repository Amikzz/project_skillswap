import 'package:flutter/material.dart';

/// A widget that displays detailed information about a skill.
///
/// This widget is used to display the details of a skill, including the
/// title, subtitle, banner image, icon image, description, and top contributors.
class SkillInfo extends StatelessWidget {
  /// The title of the skill.
  final String title;

  /// The subtitle of the skill.
  final String subtitle;

  /// The path to the banner image for the skill.
  final String bannerImage;

  /// The path to the icon image for the skill.
  final String iconImage;

  /// The description of the skill.
  final String description;

  /// A list of paths to the images of the top contributors for the skill.
  final List<String> topContributors;

  /// Creates a [SkillInfo] widget.
  ///
  /// All parameters are required.
  const SkillInfo({
    super.key,
    required this.title,
    required this.subtitle,
    required this.bannerImage,
    required this.iconImage,
    required this.description,
    required this.topContributors,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                    color: Colors.grey[200],
                    child: Image.asset(
                      bannerImage,
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                    )
                ),
                Positioned(
                  top: 150,
                  child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Theme.of(context).colorScheme.background,
                      child: Image.asset(
                        iconImage,
                        fit: BoxFit.cover,
                      )
                  ),
                ),
                Positioned(
                  top: 255,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: 280,
                  child: Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.green,
                      fontFamily: 'Roboto',
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 110.0, left: 25.0, right: 25.0, bottom: 20.0),
              child: Text(
                description,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 15.0,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Contributors',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 20.0),
              child: Row(
                children: topContributors.map((imagePath) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(imagePath),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    backgroundColor: Colors.green,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'Hire this Skill',
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.background,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      decoration: TextDecoration.none,
                    ),
                  )
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ],
    );
  }
}
