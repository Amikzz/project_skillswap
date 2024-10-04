import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:awesome_dialog/awesome_dialog.dart';

class AllProviderPage extends StatefulWidget {
  const AllProviderPage({super.key});

  @override
  _AllProviderPageState createState() => _AllProviderPageState();
}

class _AllProviderPageState extends State<AllProviderPage> {
  List<dynamic> providers = [];
  List<dynamic> filteredProviders = [];
  bool isLoading = true;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchProviders();

    // Add a listener to the search controller
    searchController.addListener(() {
      filterProviders();
    });
  }

  Future<void> fetchProviders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token'); // Retrieve the token from shared preferences

    final response = await http.get(
      Uri.parse('http://172.20.10.7:8000/api/skillsharer'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        providers = jsonData['data']; // Assign the 'data' part of the JSON to the providers list
        filteredProviders = providers; // Initialize filteredProviders with all providers
        isLoading = false;
      });
    } else {
      // Handle error
      setState(() {
        isLoading = false;
      });
    }
  }

  void filterProviders() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredProviders = providers.where((provider) {
        return provider['user']['name'].toLowerCase().contains(query) ||
            provider['skill_level'].toLowerCase().contains(query);
      }).toList();
    });
  }

  void showProviderDetails(dynamic provider) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info, // Use lowercase 'info'
      animType: AnimType.bottomSlide, // Use lowercase 'bottomSlide'
      title: provider['user']['name'],
      desc: '', // Set desc to empty; we will define the custom layout below
      btnOkOnPress: () {},
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start (left)
          children: [
            Text('Name: ${provider['user']['name']}', style: _getDescTextStyle()),
            const SizedBox(height: 5), // Add spacing between lines
            Text('Skill Level: ${provider['skill_level']}', style: _getDescTextStyle()),
            const SizedBox(height: 5), // Add spacing between lines
            Text('Experience: ${provider['years_of_experience']} years', style: _getDescTextStyle()),
            const SizedBox(height: 5),
            Text('Availability: ${provider['availability']}', style: _getDescTextStyle()),
            const SizedBox(height: 5),
            Text('Phone: ${provider['user']['phone']}', style: _getDescTextStyle()),
            const SizedBox(height: 5),
            Text('Email: ${provider['user']['email']}', style: _getDescTextStyle()),
            const SizedBox(height: 5),
            Text('Address: ${provider['user']['address']}', style: _getDescTextStyle()),
          ],
        ),
      ),
    ).show();
  }

// Helper method to get the style for description text
  TextStyle _getDescTextStyle() {
    return TextStyle(
      fontSize: 16,
      color: Theme.of(context).colorScheme.onPrimary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('All Providers'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator()) // Show loader while fetching data
          : Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search for a skill or provider',
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
                return GridView.builder(
                  padding: const EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: orientation == Orientation.portrait ? 1 : 2,
                    childAspectRatio: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: filteredProviders.length, // Use filteredProviders here
                  itemBuilder: (context, index) {
                    final provider = filteredProviders[index];
                    return GestureDetector(
                      onTap: () => showProviderDetails(provider),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).colorScheme.onSecondary,
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.5),
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage('images/profilepic.jpg'),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  provider['user']['name'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                                Text(
                                  'Skill Level: ${provider['skill_level']}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Roboto',
                                    color: Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}