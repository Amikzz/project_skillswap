import 'package:flutter/material.dart';
import 'package:project_skillswap/lists/categorieslist.dart';

class SkillCategoriesPage extends StatelessWidget {

  const SkillCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skill Categories'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Card(
                elevation: 2,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Theme.of(context).colorScheme.onSecondary,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: Colors.transparent, // Remove divider lines
                  ),
                  child: ExpansionTile(
                    title: Text(
                      category.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    children: category.skills.map((skill) {
                      return ListTile(
                        title: Text(
                          skill,
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
