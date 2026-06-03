import 'package:flutter/material.dart';

class HomeFloatingButton extends StatelessWidget {
  final VoidCallback onTap;

  const HomeFloatingButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.yellow,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.7, red: 0, green: 0, blue: 0),
              offset: const Offset(4, 4),
              blurRadius: 0,
            ),
          ],
        ),
        child: const Icon(Icons.link, color: Colors.black),
      ),
    );
  }
}

class HomeFloatingButtonLocation extends FloatingActionButtonLocation {
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    // Determine the X and Y coordinates
    // scaffoldGeometry.scaffoldSize provides the full screen dimensions
    double x = scaffoldGeometry.scaffoldSize.width - 80; // Custom X
    double y = scaffoldGeometry.scaffoldSize.height - 150; // Custom Y
    
    return Offset(x, y);
  }
}