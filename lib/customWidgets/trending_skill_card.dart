import 'package:flutter/material.dart';

class TrendingCard extends StatelessWidget {
  final String text1;
  final String text2;
  final String image;

  const TrendingCard({super.key, required this.text1, required this.text2, required this.image});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
        backgroundColor: Colors.grey[200],
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
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Roboto',
                decoration: TextDecoration.none,
              ),
            ),
          ],
        )
        );
  }
}
