# 🎯 Chip Navigation Bar

A highly customizable chip-style navigation bar for Flutter with smooth animations and a modern design.

## ✨ Features
- **Easy to use**: Simple and intuitive API.
- **Highly customizable**: Customize colors, sizes, animations, and more.
- **Smooth animations**: Built-in fade and scale animations for a polished look.
- **RTL support**: Supports right-to-left layouts.
- **Haptic feedback**: Optional haptic feedback on item tap.
- **Gradient backgrounds**: Apply gradient backgrounds to the navigation bar.
- **Customizable shadows**: Add shadows to the selected item.
- **Flexible item alignment**: Control the alignment of items within the navigation bar.

## 📦 Installation

Add the package to your `pubspec.yaml` file:
```yaml
dependencies:
  chip_navigation_bar: ^1.0.0
```
Then run: 
```bash
flutter pub get
```

## 🛠 Parameters of `ChipNavigationBar`

| Parameter         | Type                | Description                                                             | Default Value      |
|-------------------|---------------------|-------------------------------------------------------------------------|--------------------|
| `items`           | `List<ChipNavigationBarItem>` | List of `ChipNavigationBarItem`.                                      | *Required*         |
| `currentIndex`    | `int`              | Index of the currently selected item.                                   | *Required*         |
| `onTap`           | `Function(int)`    | Callback function when an item is tapped.                               | *Required*         |
| `backgroundColor` | `Color`            | Optional background color of the navigation bar.                        | `null`             |
| `height`          | `double`           | Height of the navigation bar.                                           | `56.0`             |
| `pageColors`      | `List<Color>`      | Optional list of colors for each page.                                  | `null`             |
| `width`           | `double`           | Optional width of the navigation bar.                                   | `null`             |
| `animationDuration`           | `Duration`    | Duration of the animation for item transitions.                               | `Duration(milliseconds: 300)`         |
| `animationCurve` | `Curve`            | Animation curve for item transitions.                        | `Curves.easeInOut`             |
| `selectedItemShadow`          | `BoxShadow`           | Optional shadow for the selected item.                                           | `null`             |
| `enableHapticFeedback`      | `bool`      | Whether to enable haptic feedback on item tap.                                  | `false`             |
| `itemPadding`     | `EdgeInsetsGeometry`  | Padding around each item.                             | `EdgeInsets.symmetric(horizontal: 12, vertical: 8)`             |
| `borderRadius`    | `BorderRadius`        | Border radius of the navigation bar. | `BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0))`             |
| `selectedItemBorderRadius`| `BorderRadius`|    Border radius of the selected item.                                | `BorderRadius.circular(16.0)`             |
| `iconSize`           | `double`           |           Size of the icons.                         | `24.0`             |
| `labelFontSize`           | `double`           |                  Font size of the labels.                  | `14.0`             |
| `backgroundGradient`           | `Gradient`           |            Optional gradient background for the navigation bar.                        | `null`             |
| `itemWidth`           | `double`           |            Optional fixed width for each item.                        | `null`             |
| `itemSpacing`           | `double`           |         Spacing between items.                           | `0.0`             |
| `labelFontWeight`           | `FontWeight`           |    Font weight of the labels.                                | `FontWeight.bold`             |
| `labelPadding`           | `EdgeInsetsGeometry`           |   Padding between the icon and label.                                 | `EdgeInsets.only(left: 8.0)`             |
| `itemAlignment`           | `MainAxisAlignment`           |            Alignment of items within the navigation bar.                        | `MainAxisAlignment.spaceAround`             |
| `isRTL`           | `bool`           |        Whether to use a right-to-left layout.                            | `false`             |


## 🛠 Parameters of `ChipNavigationBarItem`

| Parameter         | Type                | Description                                                             | Default Value      |
|-------------------|---------------------|-------------------------------------------------------------------------|--------------------|
| `icon`           | `IconData`           |      Icon for the navigation item.                              | *Required*             |
| `label`           | `String`           |           Label for the navigation item.                         | *Required*             |
| `activeColor`           | `Color`           |     Background color of the selected item.                               | *Required*             |
| `inactiveIconColor`           | `Color`           |    Color of the icon when the item is not selected.                                | `Colors.grey`             |
| `activeIconColor`           | `Color`           |       Color of the icon when the item is selected.                             | `Colors.white`             |
| `activeLabelColor	`           | `Color`           |       Color of the label when the item is selected.                             | `Colors.white`             |



## 🚀 Usage

#### 🔥 Basic Example

```dart
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
      inactiveIconColor: Colors.grey,
      activeIconColor: Colors.white,
      activeLabelColor: Colors.white,
    ),
    const ChipNavigationBarItem(
      icon: Icons.favorite,
      label: 'Favorites',
      activeColor: Colors.red,
      inactiveIconColor: Colors.grey,
      activeIconColor: Colors.white,
      activeLabelColor: Colors.white,
    ),
    const ChipNavigationBarItem(
      icon: Icons.settings,
      label: 'Settings',
      activeColor: Colors.green,
      inactiveIconColor: Colors.grey,
      activeIconColor: Colors.white,
      activeLabelColor: Colors.white,
    ),
    const ChipNavigationBarItem(
      icon: Icons.info,
      label: 'About',
      activeColor: Colors.orange,
      inactiveIconColor: Colors.grey,
      activeIconColor: Colors.white,
      activeLabelColor: Colors.white,
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
          color: _items[_currentIndex].activeColor?.withOpacity(0.2),
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
```

#### 🔥 Advanced Example
```dart
bottomNavigationBar: ChipNavigationBar(
  items: _items,
  currentIndex: _currentIndex,
  onTap: (index) {
    setState(() {
      _currentIndex = index;
    });
  },
  backgroundColor: Colors.blue,
  height: 60.0,
  animationDuration: const Duration(milliseconds: 500),
  selectedItemShadow: BoxShadow(
    color: Colors.black.withOpacity(0.2),
    blurRadius: 6.0,
    offset: const Offset(0, 3),
  ),
  enableHapticFeedback: true,
  iconSize: 28.0,
  labelFontSize: 16.0,
  backgroundGradient: LinearGradient(
    colors: [Colors.blue.shade100, Colors.blue.shade200],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  itemSpacing: 8.0,
  isRTL: false,
  borderRadius: const BorderRadius.vertical(
    top: Radius.circular(20.0),
  ),
  selectedItemBorderRadius: BorderRadius.circular(20.0),
  labelFontWeight: FontWeight.bold,
  labelPadding: const EdgeInsets.only(left: 8.0),
  itemAlignment: MainAxisAlignment.spaceAround,
),
```

## 🚀 Showcase
![demo](https://s7.gifyu.com/images/SetPw.gif)(https://gifyu.com/image/SetPw)

---

## 🤝 Contributing

Contributions are welcome! Please open an issue or submit a pull request for any bugs, improvements, or new features.