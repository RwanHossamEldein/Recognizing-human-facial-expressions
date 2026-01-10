import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart' show StateProvider;
import 'package:recognizing_human_facial_expressions/service/tflite_emotion_service.dart';

final imageProvider = StateProvider<File?>((ref) => null);

final tfliteServiceProvider = Provider<TfliteEmotionService>((ref) {
  final service = TfliteEmotionService();
  service.loadModel(); // load model init
  return service;
});
