import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AllSkillsPage extends StatefulWidget {
  const AllSkillsPage({super.key});

  @override
  _AllSkillsPageState createState() => _AllSkillsPageState();
}

class _AllSkillsPageState extends State<AllSkillsPage> {
  List<dynamic> _skills = []; // List to hold skills fetched from API
  List<dynamic> _filteredSkills = []; // List to hold filtered skills for search
  bool _isLoading = true; // Loading state
  final TextEditingController _searchController = TextEditingController(); // Controller for search input

  @override
  void initState() {
    super.initState();
    _fetchSkills(); // Fetch skills when the page initializes
    _searchController.addListener(_filterSkills); // Add listener to handle search input
  }

  // Function to fetch skills from the API with the stored token
  Future<void> _fetchSkills() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null) {
      try {
        var response = await http.get(
          Uri.parse('http://172.20.10.7:8000/api/skills'), // Use the API URL
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        );

        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);

          setState(() {
            _skills = jsonResponse['data']; // Parse the list from 'data' field
            _filteredSkills = _skills; // Initially set the filtered list to be the same as the full list
            _isLoading = false; // Stop loading
          });
        } else {
          setState(() {
            _isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to fetch skills: ${response.statusCode}')),
          );
        }
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No token found')),
      );
    }
  }

  // Function to filter skills based on search input
  void _filterSkills() {
    String query = _searchController.text.toLowerCase(); // Get the search query in lowercase
    setState(() {
      _filteredSkills = _skills.where((skill) {
        return skill['name'].toLowerCase().contains(query); // Check if the skill name contains the search query
      }).toList();
    });
  }

  // Function to show skill details in a dialog
  void _showSkillDetails(BuildContext context, dynamic skill) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info, // Choose the appropriate dialog type
      animType: AnimType.bottomSlide, // Animation type for the dialog
      title: skill['name'],
      titleTextStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
      desc: '', // Set desc to empty; we'll use descText instead
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the text
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Description: ${skill['description']}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Price per hour: \$${skill['priceperhour']}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Category ID: ${skill['category_id']}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("Slug: ${skill['slug']}", style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
      btnOkOnPress: () {
        // Action on OK button press (if needed)
      },
      btnCancelText: 'Close', // Customize button text
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('All Skills'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator()) // Show a loader while data is being fetched
          : Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: TextField(
              controller: _searchController, // Attach the search controller to the TextField
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
                  children: _filteredSkills.map((skill) {
                    return ElevatedButton(
                      onPressed: () {
                        _showSkillDetails(context, skill); // Show skill details on button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.onSecondary,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      ),
                      child: Text(
                        skill['name'],
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}