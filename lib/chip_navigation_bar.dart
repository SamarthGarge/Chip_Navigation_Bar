library chip_navigation_bar;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For haptic feedback

class ChipNavigationBar extends StatefulWidget {
  final List<ChipNavigationBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final Color? backgroundColor;
  final double height;
  final List<Color>? pageColors;
  final double? width;
  final Duration animationDuration;
  final Curve animationCurve;
  final BoxShadow? selectedItemShadow;
  final bool enableHapticFeedback;
  final EdgeInsetsGeometry itemPadding;
  final BorderRadius borderRadius;
  final BorderRadius selectedItemBorderRadius;
  final double iconSize;
  final double labelFontSize;
  final Gradient? backgroundGradient;
  final double? itemWidth;
  final double itemSpacing;
  final FontWeight labelFontWeight;
  final EdgeInsetsGeometry labelPadding;
  final MainAxisAlignment itemAlignment;
  final bool isRTL;

  const ChipNavigationBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.backgroundColor,
    this.height = 56.0,
    this.pageColors,
    this.width,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
    this.selectedItemShadow,
    this.enableHapticFeedback = false,
    this.itemPadding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(16.0),
      topRight: Radius.circular(16.0),
    ),
    this.selectedItemBorderRadius = const BorderRadius.all(Radius.circular(16.0)),
    this.iconSize = 24.0,
    this.labelFontSize = 14.0,
    this.backgroundGradient,
    this.itemWidth,
    this.itemSpacing = 0.0,
    this.labelFontWeight = FontWeight.bold,
    this.labelPadding = const EdgeInsets.only(left: 8.0),
    this.itemAlignment = MainAxisAlignment.spaceAround,
    this.isRTL = false,
  }) : assert(items.length > 1, 'There must be at least two items.');

  @override
  _ChipNavigationBarState createState() => _ChipNavigationBarState();
}

class _ChipNavigationBarState extends State<ChipNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: widget.isRTL ? TextDirection.rtl : TextDirection.ltr,
      child: Container(
        color: widget.backgroundColor ?? Theme.of(context).colorScheme.surface,
        child: ClipRRect(
          borderRadius: widget.borderRadius,
          child: Container(
            width: widget.width ?? double.infinity,
            height: widget.height,
            decoration: BoxDecoration(
              gradient: widget.backgroundGradient,
              color: widget.pageColors != null &&
                      widget.currentIndex < widget.pageColors!.length
                  ? widget.pageColors![widget.currentIndex]
                  : widget.backgroundColor ?? Theme.of(context).colorScheme.surface,
            ),
            child: Row(
              mainAxisAlignment: widget.itemAlignment,
              children: widget.items.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;

                final isSelected = widget.currentIndex == index;

                return GestureDetector(
                  onTap: () {
                    if (widget.enableHapticFeedback) {
                      HapticFeedback.mediumImpact();
                    }
                    widget.onTap(index);
                  },
                  child: AnimatedContainer(
                    duration: widget.animationDuration,
                    curve: widget.animationCurve,
                    width: widget.itemWidth,
                    padding: widget.itemPadding,
                    margin: EdgeInsets.only(
                      right: index < widget.items.length - 1 ? widget.itemSpacing : 0,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? item.activeColor ?? Colors.blue
                          : Colors.transparent,
                      borderRadius: widget.selectedItemBorderRadius,
                      boxShadow: isSelected
                          ? [
                              widget.selectedItemShadow ??
                                  BoxShadow(
                                    color: Colors.white.withValues(alpha: 0.2),
                                    blurRadius: 4.0,
                                    offset: const Offset(0, 2),
                                  ),
                            ]
                          : null,
                    ),
                    child: AnimatedSwitcher(
                      duration: widget.animationDuration,
                      transitionBuilder: (child, animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      child: isSelected
                          ? Row(
                              key: ValueKey<String>(item.label),
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  item.icon,
                                  size: widget.iconSize,
                                  color: item.activeIconColor ?? Colors.white,
                                ),
                                Padding(
                                  padding: widget.labelPadding,
                                  child: Text(
                                    item.label,
                                    style: TextStyle(
                                      color: item.activeLabelColor ?? Colors.white,
                                      fontWeight: widget.labelFontWeight,
                                      fontSize: widget.labelFontSize,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Icon(
                              item.icon,
                              key: ValueKey<String>('${item.label}_icon'),
                              size: widget.iconSize,
                              color: item.inactiveIconColor ?? Colors.grey,
                            ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
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