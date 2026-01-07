import 'package:flutter/material.dart';
import 'package:recognizing_human_facial_expressions/peresentation/widgets/emotion_bar.dart';

class AnalysisBottomSheet extends StatelessWidget {
  const AnalysisBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFF1C2626),
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "CURRENT STATE",
            style: TextStyle(
              color: Color(0xFF367C7D),
              fontSize: 10,
              letterSpacing: 2,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "HAPPY",
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          EmotionBar(label: "Happiness", value: 0.98),
          EmotionBar(label: "Surprise", value: 0.15),
          EmotionBar(label: "Neutral", value: 0.05),
        ],
      ),
    );
  }
}
