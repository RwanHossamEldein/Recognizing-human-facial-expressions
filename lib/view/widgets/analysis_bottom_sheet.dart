import 'package:flutter/material.dart';
import '../../view_model/emotion_analysis_states.dart';
import 'emotion_bar.dart';

class AnalysisBottomSheet extends StatelessWidget {
  final EmotionState state;

  const AnalysisBottomSheet({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    final result = state.result;

    return Container(
      height: 320,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFF1C2626),
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "CURRENT STATE",
              style: TextStyle(
                color: Color(0xFF367C7D),
                fontSize: 10,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              result?.dominantEmotion.emotion.toUpperCase() ?? "NONE",
              style: const TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            if (result != null)
              ...result.emotions.map(
                (e) => EmotionBar(label: e.emotion, value: e.confidence),
              )
            else
              const Center(
                child: Text("No data", style: TextStyle(color: Colors.white70)),
              ),
          ],
        ),
      ),
    );
  }
}
