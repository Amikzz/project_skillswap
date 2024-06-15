import 'package:flutter/material.dart';
import 'package:project_skillswap/lists/categorieslist.dart';

class AllSkillsPage extends StatelessWidget {
  const AllSkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Skills'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for a skill',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: OrientationBuilder(
              builder: (context, orientation) {
                return GridView.count(
                  crossAxisCount: orientation == Orientation.portrait ? 1 : 2,
                  childAspectRatio: orientation == Orientation.portrait ? 6 : 5,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  children: categories
                      .expand((category) => category.skills)
                      .map((skill) => ElevatedButton(
                    onPressed: () {
                      // Handle button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.onSecondary,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    child: Text(
                      skill,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ))
                      .toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
