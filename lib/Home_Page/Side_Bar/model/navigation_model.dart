import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;

  NavigationModel({this.title, this.icon});
}

List<NavigationModel> navigationItems = [
  NavigationModel(
    title: "Home",
    icon: Icons.home,
  ),
  NavigationModel(title: "Pages", icon: Icons.add_circle_outline),
  NavigationModel(title: "Search", icon: Icons.search),
  NavigationModel(title: "Desktop View", icon: Icons.desktop_mac),
  NavigationModel(title: "Settings", icon: Icons.settings),
];
