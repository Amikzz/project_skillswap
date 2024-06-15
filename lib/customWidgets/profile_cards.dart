import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {

  final String title;
  final IconData icon;

  const ProfileCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.background),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(15)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              )
          ),
          shadowColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.secondary),
        ),
      child: Row(
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
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
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
      ),
    );
  }
}
