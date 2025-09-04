import 'package:flutter/material.dart';

/// A custom bottom navigation bar widget.
///
/// This widget displays a row of [IconButton]s for navigation.
/// The selected screen is highlighted with a different color.
class MyBottomNavigationBar extends StatefulWidget {
  /// The route name of the currently selected screen.
  String selectedScreen = '/home';

  /// Creates a [MyBottomNavigationBar].
  ///
  /// The [selectedScreen] parameter must not be null.
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
