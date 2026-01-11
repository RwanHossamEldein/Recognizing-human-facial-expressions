import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recognizing_human_facial_expressions/service/image_service.dart';
import 'package:recognizing_human_facial_expressions/view/widgets/analysis_bottom_sheet.dart';
import 'package:recognizing_human_facial_expressions/view/widgets/circle_button.dart';
import 'package:recognizing_human_facial_expressions/view/widgets/face_hud_cverlay.dart';
import 'package:recognizing_human_facial_expressions/view_model/emotion_analysis_provider.dart';
import 'package:recognizing_human_facial_expressions/view_model/emotion_analysis_view_model.dart';

class LiveAnalysisScreen extends ConsumerWidget {
  const LiveAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageFile = ref.watch(imageProvider);
    final state = ref.watch(emotionViewModelProvider);
    final viewModel = ref.read(emotionViewModelProvider.notifier);

    return Scaffold(
      backgroundColor: const Color(0xFF151D1D),
      body: Stack(
        children: [
          Positioned.fill(
            child: imageFile != null
                ? Image.file(imageFile, fit: BoxFit.cover)
                : Image.network(
                    "https://www.cio.com/wp-content/uploads/2025/02/3829539-0-75501800-1740132217-shutterstock_2482705481.jpg?quality=50&strip=all",
                    fit: BoxFit.cover,
                  ),
          ),

          Positioned(
            top: 40,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleButton(
                  icon: Icons.arrow_back_ios_new,
                  size: 18,
                  onTap: () {
                    ref.read(imageProvider.notifier).state = null;
                  },
                ),
                const Text(
                  "EMOTION ANALYSIS",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                CircleButton(icon: Icons.settings, size: 18, onTap: () {}),
              ],
            ),
          ),
          const FaceHudOverlay(),

          // BottomSheet
          Align(
            alignment: Alignment.bottomCenter,
            child: AnalysisBottomSheet(state: state),
          ),

          // Loading Indicator
          if (state.isLoading)
            const Positioned.fill(
              child: ColoredBox(
                color: Colors.black38,
                child: Center(
                  child: CircularProgressIndicator(color: Color(0xFF367C7D)),
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Upload button
            CircleButton(
              icon: Icons.photo,
              size: 18,
              onTap: () async {
                final imageService = ImageService();
                File? image = await imageService.pickImage();
                if (image != null) {
                  ref.read(imageProvider.notifier).state = image;
                  await viewModel.analyzeImage(image);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
