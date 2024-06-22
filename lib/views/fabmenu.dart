import 'package:flutter/material.dart';

class MenuBottomSheet extends StatefulWidget {
  const MenuBottomSheet({super.key});

  @override
  State<MenuBottomSheet> createState() => _MenuBottomSheetState();
}

class _MenuBottomSheetState extends State<MenuBottomSheet> {
  List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.category, 'title': 'Categories', 'ontap': () {}},
    {'icon': Icons.imagesearch_roller_sharp, 'title': 'All Skills', 'ontap': () {}},
    {'icon': Icons.person, 'title': 'All Providers', 'ontap': () {}},
  ];

  @override
  Widget build(BuildContext context) {

    menuItems[0]['ontap'] = () {
      Navigator.pushNamed(context, '/categories');
    };
    menuItems[1]['ontap'] = () {
      Navigator.pushNamed(context, '/allskills');
    };
    menuItems[2]['ontap'] = () {
      Navigator.pushNamed(context, '/allproviders');
    };

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var item in menuItems)
            ListTile(
              leading: Icon(item['icon'], color: Theme.of(context).colorScheme.onPrimary),
              title: Text(item['title'], style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
              onTap: () {
                item['ontap']();
              },
            ),
        ],
      ),
    );
  }
}
