import 'package:flutter/material.dart';
import 'package:chip_navigation_bar/chip_navigation_bar.dart'; // Import the ChipNavigationBar

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
      inactiveIconColor: Colors.white,
      activeIconColor: Colors.white,
      activeLabelColor: Colors.black,
    ),
    const ChipNavigationBarItem(
      icon: Icons.favorite,
      label: 'Favorites',
      activeColor: Colors.red,
      inactiveIconColor: Colors.white,
      activeIconColor: Colors.white,
      activeLabelColor: Colors.black,
    ),
    const ChipNavigationBarItem(
      icon: Icons.settings,
      label: 'Settings',
      activeColor: Colors.green,
      inactiveIconColor: Colors.white,
      activeIconColor: Colors.white,
      activeLabelColor: Colors.black,
    ),
    const ChipNavigationBarItem(
      icon: Icons.info,
      label: 'About',
      activeColor: Colors.orange,
      inactiveIconColor: Colors.white,
      activeIconColor: Colors.white,
      activeLabelColor: Colors.black,
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

        // Implementing the ChipNavigationBar
        bottomNavigationBar: ChipNavigationBar(
          items: _items,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          // Default is Color.white
          backgroundColor: Colors.white,

          // Custome border radius
          borderRadius: BorderRadius.all(Radius.circular(160)), 
          
          // Custom height
          height: 60.0,

          // Custom animation duration
          animationDuration:
              const Duration(milliseconds: 50), 
          
          // Background gradient
          backgroundGradient: LinearGradient(
            colors: [Colors.black87, Colors.black54],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),

          // Enable haptic feedback
          enableHapticFeedback: true,

          // Custom item spacing
          itemSpacing: 8.0,

          // Set to true for RTL support
          isRTL: false,

          // Custom shadow for selected item
          selectedItemShadow: BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 6.0,
            offset: const Offset(0, 3),
          ),

          // Custom selected item border radius
          selectedItemBorderRadius:
              BorderRadius.circular(20.0),

          // Custom icon size
          iconSize: 28.0,

          // Custom label font size
          labelFontSize: 16.0, 

          // Custom label font weight
          labelFontWeight: FontWeight.bold,

          // Custom label padding
          labelPadding:
              const EdgeInsets.only(left: 8.0), 
          
          // Custom item alignment
          itemAlignment: MainAxisAlignment.spaceAround, 
        ),
      ),
    );
  }
}
