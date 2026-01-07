import 'package:flutter/material.dart';

class EmotionBar extends StatelessWidget {
  final String label;
  final double value;

  const EmotionBar({required this.label, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(color: Colors.white70)),
            Text(value.toString(), style: const TextStyle(color: Colors.white)),
          ],
        ),
        const SizedBox(height: 6),
        LinearProgressIndicator(
          value: value,
          backgroundColor: Colors.black26,
          color: const Color(0xFF367C7D),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
