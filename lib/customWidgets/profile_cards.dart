import 'package:flutter/material.dart';

/// A widget that displays a card with a title, an icon, and a navigation arrow.
///
/// This widget is typically used in a user's profile screen to provide
/// navigation to different sections of the app, such as "Settings" or "My Orders".
class ProfileCard extends StatelessWidget {
  /// The title of the card.
  final String title;

  /// The icon to be displayed on the card.
  final IconData icon;

  /// The callback function that is called when the card is tapped.
  ///
  /// If this is null, the card will be disabled.
  final VoidCallback? onTap;

  /// Creates a [ProfileCard] widget.
  ///
  /// The [title] and [icon] parameters must not be null.
  const ProfileCard({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap, // Trigger the onTap callback when button is pressed
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.background),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(15)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        shadowColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.secondary),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Theme.of(context).colorScheme.onPrimary,
                size: 30,
              ),
              const SizedBox(width: 15),
              Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Theme.of(context).colorScheme.onPrimary,
                size: 25,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
