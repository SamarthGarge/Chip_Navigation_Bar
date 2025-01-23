library chip_navigation_bar;

import 'package:flutter/material.dart';

class ChipNavigationBar extends StatefulWidget {
  final List<ChipNavigationBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final Color? backgroundColor;
  final double height;
  final List<Color>? pageColors;
  final double? width;

  const ChipNavigationBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.backgroundColor,
    this.height = 56.0,
    this.pageColors,
    this.width,
  }) : assert(items.length > 1, 'There must be at least two items.');

  @override
  _ChipNavigationBarState createState() => _ChipNavigationBarState();
}

class _ChipNavigationBarState extends State<ChipNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.pageColors != null &&
                widget.currentIndex < widget.pageColors!.length
            ? widget.pageColors![widget.currentIndex]
            : widget.backgroundColor ?? Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;

          final isSelected = widget.currentIndex == index;

          return GestureDetector(
            onTap: () => widget.onTap(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 30),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected
                    ? item.activeColor ?? Colors.blue
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: Colors.white.withValues(alpha: 0.2),
                          blurRadius: 4.0,
                          offset: Offset(0, 2),
                        ),
                      ]
                    : null,
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 30),
                transitionBuilder: (child, animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: isSelected
                    ? Row(
                        key: ValueKey<String>(item.label),
                        children: [
                          Icon(
                            item.icon,
                            color: item.activeIconColor ?? Colors.white,
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            item.label,
                            style: TextStyle(
                              color: item.activeLabelColor ?? Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    : Icon(
                        item.icon,
                        key: ValueKey<String>('${item.label}_icon'),
                        color: item.inactiveIconColor ?? Colors.grey,
                      ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class ChipNavigationBarItem {
  final IconData icon;
  final String label;
  final Color? activeColor;
  final Color? inactiveIconColor;
  final Color? activeIconColor;
  final Color? activeLabelColor;

  const ChipNavigationBarItem({
    required this.icon,
    required this.label,
    this.activeColor,
    this.inactiveIconColor,
    this.activeIconColor,
    this.activeLabelColor,
  });
}

