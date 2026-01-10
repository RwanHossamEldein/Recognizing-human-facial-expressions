import 'package:flutter/material.dart';
import 'package:recognizing_human_facial_expressions/view/widgets/scanning_line.dart';

class FaceHudOverlay extends StatelessWidget {
  const FaceHudOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 240,
        height: 320,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white24),
        ),
        child: Stack(children: const [ScanningLine()]),
      ),
    );
  }
}
