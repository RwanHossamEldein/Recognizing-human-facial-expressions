import 'dart:io';
import 'package:flutter_riverpod/legacy.dart'
    show StateNotifier, StateNotifierProvider;

import 'package:recognizing_human_facial_expressions/view_model/emotion_analysis_states.dart';
import '../service/tflite_emotion_service.dart';

class EmotionViewModel extends StateNotifier<EmotionState> {
  EmotionViewModel(this.service) : super(EmotionState()) {
    _init();
  }

  final TfliteEmotionService service;

  Future<void> _init() async {
    await service.loadModel();
  }

  Future<void> analyzeImage(File image) async {
    state = state.copyWith(isLoading: true);

    try {
      final input = service.preprocess(image);
      final result = service.predict(input);

      state = state.copyWith(isLoading: false, result: result);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

final emotionViewModelProvider =
    StateNotifierProvider<EmotionViewModel, EmotionState>((ref) {
      return EmotionViewModel(TfliteEmotionService());
    });
