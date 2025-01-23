# Chip Navigation Bar

A customizable chip-style navigation bar for Flutter.

## Features
- Easy to use
- Highly customizable
- Smooth animations

## Parameters of `ChipNavigationBar`

| Parameter         | Type                | Description                                                             | Default Value      |
|-------------------|---------------------|-------------------------------------------------------------------------|--------------------|
| `items`           | `List<ChipNavigationBarItem>` | List of `ChipNavigationBarItem`.                                      | *Required*         |
| `currentIndex`    | `int`              | Index of the currently selected item.                                   | *Required*         |
| `onTap`           | `Function(int)`    | Callback function when an item is tapped.                               | *Required*         |
| `backgroundColor` | `Color`            | Optional background color of the navigation bar.                        | `null`             |
| `height`          | `double`           | Height of the navigation bar.                                           | `56.0`             |
| `pageColors`      | `List<Color>`      | Optional list of colors for each page.                                  | `null`             |
| `width`           | `double`           | Optional width of the navigation bar.                                   | `null`             |


## Usage

```dart
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

bottomNavigationBar: ChipNavigationBar(
    items: _items,
    currentIndex: _currentIndex,
    onTap: (index) {
      setState(() {
        _currentIndex = index;
        });
      },
    ),
```
## 🚀Showcase
![demo](https://s7.gifyu.com/images/SeWug.gif)(https://gifyu.com/image/SeWug)


