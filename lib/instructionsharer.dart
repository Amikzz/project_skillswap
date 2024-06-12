import 'package:flutter/material.dart';

class Instructions extends StatelessWidget {
  const Instructions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instructions for Skill Sharers'),
      ),
      body: SafeArea(
        child: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(image: AssetImage('images/register.png')),
                  Text(
                    'How to Register as a Skill Sharer',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'To register as a skill sharer, please follow these instructions:',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '1. Visit the SkillSwap office.',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '2. Meet with one of our admins.',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '3. Our admins will assist you in completing the registration process.',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Office Address:',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '123 SkillSwap Avenue,\nColombo, Sri Lanka.',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Office Hours:',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Monday - Friday: 9 AM - 5 PM\nSaturday: 10 AM - 2 PM',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
