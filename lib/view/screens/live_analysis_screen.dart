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
    final imageFile = ref.watch(imageProvider); // الصورة الحالية
    final state = ref.watch(
      emotionViewModelProvider,
    ); // state فيه result / loading
    final viewModel = ref.read(emotionViewModelProvider.notifier);

    return Scaffold(
      backgroundColor: const Color(0xFF151D1D),
      body: Stack(
        children: [
          // الصورة الرئيسية
          Positioned.fill(
            child: imageFile != null
                ? Image.file(imageFile, fit: BoxFit.cover)
                : Image.network(
                    "https://lh3.googleusercontent.com/aida-public/AB6AXuCqaUt86lkALAlaKtZD7M8_m5s3Dj3YgkKU9bpYF4trBm5jvHnkEBbbyCBIcibsB6deblwkcm4eVO3GXBMrymDctmelWETrguPW5eG0UPbcDo7Mh1XofoNfJr2Hh1LB8gtZ0A2Q-jWUeg-T0sZyTXl_l49jeOH6QYhzfkQTDuv-L1LPrNgCGNxU1ue_Zoy6poUBfeBzp1vCU3CK204m0yceqNs3ETii1rgX0rxRi6MJx9zdL4Bht1AIIVRXAjkCRBjt1FFgTc-mKe-Y",
                    fit: BoxFit.cover,
                  ),
          ),

          // HUD و TopBar
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
                  "LIVE ANALYSIS",
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
