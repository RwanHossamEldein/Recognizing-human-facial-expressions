import '../model/emotion_analysis_result.dart';

class EmotionState {
  final bool isLoading;
  final EmotionAnalysisResult? result;
  final String? error;

  EmotionState({this.isLoading = false, this.result, this.error});

  EmotionState copyWith({
    bool? isLoading,
    EmotionAnalysisResult? result,
    String? error,
  }) {
    return EmotionState(
      isLoading: isLoading ?? this.isLoading,
      result: result ?? this.result,
      error: error,
    );
  }
}
