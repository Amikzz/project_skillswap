import 'package:flutter/material.dart';
import 'package:project_skillswap/customWidgets/trending_skill_card.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _HomeState();
}

class _HomeState extends State<MyHome> {
  String selectedScreen = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          Navigator.pushNamed(context, '/menu');
                        },
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        child: const Icon(Icons.menu_book_rounded),
                        ),
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('images/profilepic.jpg'),
                    )
                  ]
                ),
                const SizedBox(height: 50),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Welcome back, \nAmika!",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
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
                            onPressed: () { },
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
                const SizedBox(height: 20),
                const Text(
                  "Trending Skills",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(height: 20),
                const TrendingCard(
                    text1: "Painting",
                    text2: "1763 Sharers",
                    image: 'images/painting.png',
                ),
                const SizedBox(height: 20),
                const TrendingCard(
                  text1: "Woodwork",
                  text2: "1453 Sharers",
                  image: 'images/woodwork.png',
                ),
                const SizedBox(height: 20),
                const TrendingCard(
                  text1: "Web Development",
                  text2: "1182 Sharers",
                  image: 'images/webdevlop.png',
                ),
                const SizedBox(height: 20),
                const TrendingCard(
                  text1: "Copy writing",
                  text2: "987 Sharers",
                  image: 'images/copywrite.jpg',
                ),
                const SizedBox(height: 20),
                const TrendingCard(
                  text1: "Poster Hanging",
                  text2: "987 Sharers",
                  image: 'images/posterhang.jpg',
                ),
            ],
            ),
          ],
          ),
        ),
      bottomNavigationBar: Row (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  selectedScreen = '/home';
                });
                Navigator.pushNamed(context, '/home');
              },
              iconSize: 35,

              icon: const Icon(Icons.home),
              color: selectedScreen == '/home' ? Colors.purple : Colors.grey,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedScreen = '/orders';
                });
                Navigator.pushNamed(context, '/orders');
              },
              iconSize: 30,
              icon: const Icon(Icons.shopping_cart),
              color: selectedScreen == '/orders' ? Colors.purple : Colors.grey,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedScreen = '/notifications';
                });
                Navigator.pushNamed(context, '/notifications');
              },
              iconSize: 30,
              icon: const Icon(Icons.notifications),
              color: selectedScreen == '/notifications' ? Colors.purple : Colors.grey,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  selectedScreen = '/profile';
                });
                Navigator.pushNamed(context, '/profile');
              },
              iconSize: 30,
              icon: const Icon(Icons.person),
              color: selectedScreen == '/profile' ? Colors.purple : Colors.grey,
            ),
          ],
        ),
      );
  }
}
