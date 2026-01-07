import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const CircleButton({required this.icon, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: const Color(0xFF2D3E3E),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}
