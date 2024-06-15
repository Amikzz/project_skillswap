import 'package:flutter/material.dart';
import 'package:project_skillswap/lists/skilllist.dart';
import 'package:project_skillswap/views/skilldetails.dart';
import 'package:project_skillswap/customWidgets/bottom_navigation_bar.dart';
import 'package:project_skillswap/views/fabmenu.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _HomeState();
}

class _HomeState extends State<MyHome> {
  String selectedScreen = '/home';

  void _showMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (context) => const MenuBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20.0),
            children: [
              Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                        onPressed: () {
                          _showMenu(context);
                        },
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: const Icon(Icons.menu_book_rounded),
                        ),
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('images/profilepic.jpg'),
                    )
                  ]
                ),
                Column(
                  children: [
                    const SizedBox(height: 30),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Welcome back, \nAmika!",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for a skill',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: const Color(0xFF26202C),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey, // Shadow color
                            spreadRadius: 2, // Spread radius
                            blurRadius: 8, // Blur radius
                            offset: Offset(4, 4), // Shadow position
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Share your skills with the world!",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/instructions');
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  fixedSize: const Size(140, 40),
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  elevation: 8,
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Continue",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward_rounded, size: 20,),
                                  ],
                                ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Trending Skills",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: skills.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                            child: ListTile(
                              leading: Image.asset(skills[index].iconImage),
                              title: Text(skills[index].title),
                              subtitle: Text(skills[index].subtitle),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SkillDetailPage(skill: skills[index]),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                ],
            ),
          ],
          ),
        ),
      bottomNavigationBar: MyBottomNavigationBar(selectedScreen: selectedScreen),
      );
  }
}
