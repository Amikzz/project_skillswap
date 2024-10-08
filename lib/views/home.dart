import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_skillswap/customWidgets/bottom_navigation_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart'; // For picking images from camera
import 'package:path_provider/path_provider.dart'; // For accessing local storage
import 'package:battery_plus/battery_plus.dart'; // Import battery_plus

import 'fabmenu.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _HomeState();
}

class _HomeState extends State<MyHome> {
  String selectedScreen = '/home';
  List<dynamic> trendingSkills = [];
  bool _isLoading = true;
  String _city = "Fetching city..."; // Variable to hold the city name
  File? _imageFile; // To store the selected image
  int _batteryPercentage = 100; // Battery percentage
  String _userName = "..."; // Placeholder for the user's name

  final Battery _battery = Battery(); // Create a battery instance

  @override
  void initState() {
    super.initState();
    _fetchSkills();
    _getCurrentLocation(); // Fetch user's location when the app starts
    _loadImage(); // Load the image from local storage when the app starts
    _getBatteryPercentage(); // Fetch battery percentage when the app starts
    _fetchProfile(); // Fetch the user profile to get the user's name
  }

  // Fetch the user's profile
  Future<void> _fetchProfile() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token'); // Get token from shared preferences

      if (token == null) {
        throw Exception('Token not found');
      }

      final response = await http.get(
        Uri.parse('http://172.20.10.7:8000/api/profile'), // Replace with your profile API endpoint
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == true) {
          setState(() {
            _userName = data['data']['name']; // Update the user name
          });
        } else {
          throw Exception('Failed to load profile');
        }
      } else {
        throw Exception('Failed to fetch profile');
      }
    } catch (error) {
      setState(() {
        _userName = "Unknown User"; // Fallback in case of error
      });
      print('Error fetching profile: $error');
    }
  }

  // Fetch battery percentage
  Future<void> _getBatteryPercentage() async {
    final int batteryLevel = await _battery.batteryLevel;
    setState(() {
      _batteryPercentage = batteryLevel;
    });
  }

  // Load the image from local storage
  Future<void> _loadImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString('profile_image');
    if (imagePath != null) {
      setState(() {
        _imageFile = File(imagePath);
      });
    }
  }

  // Save the image to local storage
  Future<void> _saveImage(File image) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    const fileName = 'profile_image.png';
    final file = File('$path/$fileName');
    await file.writeAsBytes(await image.readAsBytes());

    prefs.setString('profile_image', file.path);
    setState(() {
      _imageFile = file;
    });
  }

  // Function to pick an image from the camera
  Future<void> _pickImageFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      File imageFile = File(image.path);
      await _saveImage(imageFile); // Save the image to local storage
    }
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled
      setState(() {
        _city = "Location services are disable.";
      });
      return;
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _city = "Location permissions are denied.";
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _city = "Location permissions are permanently denied.";
      });
      return;
    }

    // If permission is granted, get the current position
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // Use reverse geocoding to get the city from coordinates
    List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude, position.longitude);

    // Update the city in the UI
    setState(() {
      _city = placemarks[0].locality ?? "Unknown city";
    });
  }

  Future<void> _fetchSkills() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token'); // Get token from shared preferences
      if (token == null) {
        throw Exception('Token not found');
      }

      final response = await http.get(
        Uri.parse('http://172.20.10.7:8000/api/skills'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == true) {
          List<dynamic> skillsData = data['data'];
          //map data
          skillsData = skillsData.map((skill) {
            return {
              'id': skill['id'],
              'name': skill['name'],
              'description': skill['description'],
              'slug': skill['slug'],
              'pricePerHour': skill['priceperhour'],
              'categoryId': skill['category_id'],
              'createdAt': DateTime.parse(skill['created_at']),
              'updatedAt': DateTime.parse(skill['updated_at']),
            };
          }).toList();

          // Shuffle and pick random skills
          skillsData.shuffle();
          setState(() {
            trendingSkills = skillsData.take(min(5, skillsData.length)).toList();
            _isLoading = false;
          });

        } else {
          throw Exception('Failed to load skills');
        }
      } else {
        throw Exception('Failed to fetch skills');
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
        trendingSkills = []; // Set empty in case of error
      });
      print('Error fetching skills: $error');
    }
  }

  void _showSkillDetailsDialog(Map<String, dynamic> skill) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.bottomSlide,
      title: skill['name'],
      desc: '', // Set the desc to empty; we will define the custom layout below
      btnOkOnPress: () {}, // Action on OK button press
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      // Use the body property to create a custom layout
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start (left)
          children: [
            Text('ID: ${skill['id']}', style: _getDescTextStyle()),
            const SizedBox(height: 5), // Add spacing between lines
            Text('Description: ${skill['description']}', style: _getDescTextStyle()),
            const SizedBox(height: 5),
            Text('Slug: ${skill['slug']}', style: _getDescTextStyle()),
            const SizedBox(height: 5),
            Text('Price per Hour: Rs.${skill['pricePerHour']}', style: _getDescTextStyle()),
            const SizedBox(height: 5),
            Text('Category ID: ${skill['categoryId']}', style: _getDescTextStyle()),
            const SizedBox(height: 5),
            Text('Created At: ${skill['createdAt']}', style: _getDescTextStyle()),
            const SizedBox(height: 5),
            Text('Updated At: ${skill['updatedAt']}', style: _getDescTextStyle()),
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
                    GestureDetector(
                      onTap: _pickImageFromCamera, // Access camera on tap
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: _imageFile != null
                            ? FileImage(_imageFile!) // Display the selected image
                            : const AssetImage('images/profilepic.jpg')
                        as ImageProvider, // Fallback to default image
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 30),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Welcome back, \n$_userName", // Display the fetched user name
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Theme.of(context).colorScheme.onPrimary),
                        const SizedBox(width: 10),
                        Text(
                          _city, // Display the dynamically fetched city
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        const Expanded(child: SizedBox(width: 130)),
                        Icon(Icons.battery_std_rounded, color: Theme.of(context).colorScheme.onPrimary),
                        const SizedBox(width: 10),
                        Text(
                            '$_batteryPercentage%', // Display battery percentage
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Roboto',
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Container(
                      height: 1,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: const Color(0xFF26202C),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(4, 4),
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
                                  Icon(Icons.arrow_forward_rounded, size: 20),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Recommended Skills",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _isLoading
                        ? const CircularProgressIndicator()
                        : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: trendingSkills.length,
                      itemBuilder: (context, index) {
                        var skill = trendingSkills[index];
                        return Container(
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: ListTile(
                            leading: const Icon(Icons.lightbulb_rounded),
                            title: Text(
                                skill['name']),
                            onTap: () {
                              _showSkillDetailsDialog(skill); // Show skill details dialog on tap
                            },
                          ),
                        );
                      },
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