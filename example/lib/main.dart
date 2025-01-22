import 'package:flutter/material.dart';
import 'package:chip_navigation_bar/chip_navigation_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<String> _pages = [
    'Home Page',
    'Search Page',
    'Profile Page',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chip Navigation Bar Example')),
      body: Center(child: Text(_pages[_currentIndex])),
      bottomNavigationBar: ChipNavigationBar(
        items: [
          ChipNavigationBarItem(icon: Icons.home, label: 'Home'),
          ChipNavigationBarItem(icon: Icons.search, label: 'Search'),
          ChipNavigationBarItem(icon: Icons.person, label: 'Profile'),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
