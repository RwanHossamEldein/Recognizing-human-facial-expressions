import 'package:flutter/material.dart';
import 'package:recognizing_human_facial_expressions/peresentation/widgets/circle_button.dart';

class TopNavigation extends StatelessWidget {
  const TopNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 16,
      right: 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleButton(icon: Icons.arrow_back_ios_new, onTap: () {}),
          const Text(
            "LIVE ANALYSIS",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          CircleButton(icon: Icons.settings, onTap: () {}),
        ],
      ),
    );
  }
}
