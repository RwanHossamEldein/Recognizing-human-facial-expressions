import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';
import '../model/emotion_analysis_result.dart';
import '../model/emotion_result_model.dart';

class TfliteEmotionService {
  late Interpreter _interpreter;
  bool _loaded = false;

  final emotions = [
    'angry',
    'disgust',
    'fear',
    'happy',
    'sad',
    'surprise',
    'neutral',
  ];

  Future<void> loadModel() async {
    _interpreter = await Interpreter.fromAsset('assets/emotion_model.tflite');
    _loaded = true;
  }

  Float32List preprocess(File imageFile) {
    final image = img.decodeImage(imageFile.readAsBytesSync())!;
    final resized = img.copyResize(image, width: 48, height: 48);
    final gray = img.grayscale(resized);

    final input = Float32List(48 * 48);

    for (int y = 0; y < 48; y++) {
      for (int x = 0; x < 48; x++) {
        input[y * 48 + x] = gray.getPixel(x, y).r / 255.0;
      }
    }
    return input;
  }

  EmotionAnalysisResult predict(Float32List input) {
    if (!_loaded) throw Exception("Model not loaded");

    final input4D = List.generate(
      1,
      (_) => List.generate(48, (_) => List.generate(48, (_) => [0.0])),
    );

    for (int y = 0; y < 48; y++) {
      for (int x = 0; x < 48; x++) {
        input4D[0][y][x][0] = input[y * 48 + x];
      }
    }

    final output = List.generate(1, (_) => List.filled(7, 0.0));
    _interpreter.run(input4D, output);

    final results = List.generate(
      7,
      (i) => EmotionResultModel(emotions[i], output[0][i]),
    );

    final dominant = results.reduce(
      (a, b) => a.confidence > b.confidence ? a : b,
    );

    return EmotionAnalysisResult(emotions: results, dominantEmotion: dominant);
  }
}
