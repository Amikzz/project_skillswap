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
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              // Landscape mode
              return Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset('images/register.png'),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListView(
                        children: const [
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
                  ),
                ],
              );
            } else {
              // Portrait mode
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('images/register.png'),
                        const SizedBox(height: 20),
                        const Text(
                          'How to Register as a Skill Sharer',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'To register as a skill sharer, please follow these instructions:',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          '1. Visit the SkillSwap office.',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          '2. Meet with one of our admins.',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          '3. Our admins will assist you in completing the registration process.',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Office Address:',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          '123 SkillSwap Avenue,\nColombo, Sri Lanka.',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Office Hours:',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
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
              );
            }
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Instructions(),
  ));
}
