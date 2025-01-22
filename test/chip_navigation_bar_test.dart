import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chip_navigation_bar/chip_navigation_bar.dart';

void main() {
  test('ChipNavigationBarItem creation', () {
    final item = ChipNavigationBarItem(
      icon: Icons.home,
      label: 'Home',
    );

    expect(item.icon, Icons.home);
    expect(item.label, 'Home');
  });
}
