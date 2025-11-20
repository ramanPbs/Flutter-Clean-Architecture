import 'package:flutter/cupertino.dart';

class CustomBottomNavigationItem {
  final IconData iconUrl;
  final IconData selectedIconUrl;
  final String label;
  final Color color;

  CustomBottomNavigationItem({
    required this.iconUrl,
    required this.label,
    required this.color,
    required this.selectedIconUrl,
  });
}
