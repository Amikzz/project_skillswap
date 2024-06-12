import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {

  final String title;
  final IconData icon;

  const ProfileCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 30,
                ),
                const SizedBox(width: 15),
                Text(
                  title,
                  style: const  TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ]
          ),
          Row(
              children: [
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 25,
                ),
              ]
          )
        ]
    );
  }
}
