import 'package:flutter/material.dart';

Widget buildSidebar() {
  return Container(
    width: 250,
    color: Colors.black,
    padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Menu", style: TextStyle(color: Colors.white, fontSize: 24)),
        SizedBox(height: 20),
        Text("Home", style: TextStyle(color: Colors.white)),
        Text("Profile", style: TextStyle(color: Colors.white)),
        Text("Settings", style: TextStyle(color: Colors.white)),
      ],
    ),
  );
}