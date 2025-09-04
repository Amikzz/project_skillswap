import 'package:flutter/material.dart';

/// A widget that displays information about an order.
///
/// This widget is used to display the details of an order, including the
/// title, image, worker, status, and price.
class OrderCard extends StatelessWidget {
  /// The title of the order.
  final String title;

  /// The path to the image for the order.
  final String image;

  /// The name of the worker assigned to the order.
  final String worker;

  /// The status of the order, e.g., "In Progress".
  final String status;

  /// The color of the status text.
  final Color statusColor;

  /// The price of the order.
  final double price;

  /// Creates an [OrderCard] widget.
  ///
  /// All parameters are required.
  const OrderCard(
      {super.key,
      required this.title,
      required this.image,
      required this.worker,
      required this.status,
      required this.statusColor,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            spreadRadius: 0.5,
            offset: Offset(0, 0),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(image),
              ),
              Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Text(
                    worker,
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'Roboto',
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Status',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 15,
                      fontFamily: 'Roboto',
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 20),
                Text(
                  "Rs. $price",
                  style: const TextStyle(
                    color: Colors.red,
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ]
          ),
        ],
      ),
    );
  }
}
