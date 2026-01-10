import 'emotion_result_model.dart';

class EmotionAnalysisResult {
  final List<EmotionResultModel> emotions;
  final EmotionResultModel dominantEmotion;

  EmotionAnalysisResult({
    required this.emotions,
    required this.dominantEmotion,
  });
}
