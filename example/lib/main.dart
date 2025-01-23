import 'package:flutter/material.dart';
import 'package:chip_navigation_bar/chip_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<ChipNavigationBarItem> _items = [
    const ChipNavigationBarItem(
      icon: Icons.home,
      label: 'Home',
      activeColor: Colors.blue,
    ),
    const ChipNavigationBarItem(
      icon: Icons.favorite,
      label: 'Favorites',
      activeColor: Colors.red,
    ),
    const ChipNavigationBarItem(
      icon: Icons.settings,
      label: 'Settings',
      activeColor: Colors.green,
    ),
    const ChipNavigationBarItem(
      icon: Icons.info,
      label: 'About',
      activeColor: Colors.orange,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Chip Navigation Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          color: _items[_currentIndex].activeColor?.withValues(alpha: 0.2),
          child: Text(
            'Selected Page: ${_items[_currentIndex].label}',
            style: const TextStyle(fontSize: 24),
          ),
        ),
        bottomNavigationBar: ChipNavigationBar(
          items: _items,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
