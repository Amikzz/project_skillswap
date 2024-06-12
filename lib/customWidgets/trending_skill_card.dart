import 'package:flutter/material.dart';

class TrendingCard extends StatelessWidget {
  final String text1;
  final String text2;
  final String image;
  final void Function() onPressed;

  const TrendingCard({super.key, required this.text1, required this.text2, required this.image, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(image),
            ),
            const SizedBox(width: 20,),
            Text(
              "$text1 \n$text2",
              style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                decoration: TextDecoration.none,
              ),
            ),
          ],
        )
        );
  }
}
