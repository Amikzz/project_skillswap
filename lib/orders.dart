import 'package:flutter/material.dart';
import 'package:project_skillswap/customWidgets/bottom_navigation_bar.dart';
import 'package:project_skillswap/customWidgets/order_card.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _MyCartState();
}

class _MyCartState extends State<Orders> {

  List<Map<String, dynamic>> orders = [
    {'title': 'Painting', 'image': 'images/painting.png', 'worker': 'Sujith Gunasinghe', 'status': 'In Progress', 'statusColor': Colors.green, 'price': 10000.00},
    {'title': 'Electrical', 'image': 'images/electrical.png', 'worker': 'Kamal Perera', 'status': 'In Progress', 'statusColor': Colors.green, 'price': 8000.00},
    {'title': 'Plumbing', 'image': 'images/plumbing.jpg', 'worker': 'Hirantha Kumara', 'status': 'Completed', 'statusColor': Colors.blue, 'price': 5000.00},
    {'title': 'Woodwork', 'image': 'images/woodwork.png', 'worker': 'Dilshan Bandara', 'status': 'Completed', 'statusColor': Colors.blue, 'price': 7000.00}
  ];

  String selectedScreen = '/orders';

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
                      const Text(
                        'Orders',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.shopping_cart_rounded, size: 30, color: Theme.of(context).colorScheme.onPrimary),
                    ],
                  ),
                  const SizedBox(height: 20),
                  for (var order in orders)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OrderCard(
                        title: order['title'],
                        image: order['image'],
                        worker: order['worker'],
                        status: order['status'],
                        statusColor: order['statusColor'],
                        price: order['price'],
                      ),
                    ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total spent so far:',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '30000.00',
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                    )
                    ],
                    ),
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
