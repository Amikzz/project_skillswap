import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {

  String selectedScreen = '/home';

  MyBottomNavigationBar({super.key, required this.selectedScreen});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Row (
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              widget.selectedScreen = '/home';
            });
            Navigator.pushNamed(context, '/home');
          },
          iconSize: 35,

          icon: const Icon(Icons.home),
          color: widget.selectedScreen == '/home' ? Colors.purple : Colors.grey,
        ),
        IconButton(
          onPressed: () {
            setState(() {
              widget.selectedScreen = '/orders';
            });
            Navigator.pushNamed(context, '/orders');
          },
          iconSize: 30,
          icon: const Icon(Icons.shopping_cart),
          color: widget.selectedScreen == '/orders' ? Colors.purple : Colors.grey,
        ),
        IconButton(
          onPressed: () {
            setState(() {
              widget.selectedScreen = '/notifications';
            });
            Navigator.pushNamed(context, '/notifications');
          },
          iconSize: 30,
          icon: const Icon(Icons.notifications),
          color: widget.selectedScreen == '/notifications' ? Colors.purple : Colors.grey,
        ),
        IconButton(
          onPressed: () {
            setState(() {
              widget.selectedScreen = '/profile';
            });
            Navigator.pushNamed(context, '/profile');
          },
          iconSize: 30,
          icon: const Icon(Icons.person),
          color: widget.selectedScreen == '/profile' ? Colors.purple : Colors.grey,
        ),
      ],
    );
  }
}
