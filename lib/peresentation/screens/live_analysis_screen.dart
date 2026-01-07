import 'package:flutter/material.dart';
import 'package:recognizing_human_facial_expressions/peresentation/widgets/analysis_bottom_sheet.dart';
import 'package:recognizing_human_facial_expressions/peresentation/widgets/camera_preview_widget.dart';
import 'package:recognizing_human_facial_expressions/peresentation/widgets/face_hud_cverlay.dart';
import 'package:recognizing_human_facial_expressions/peresentation/widgets/top_navigation.dart';

class LiveAnalysisScreen extends StatelessWidget {
  const LiveAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151D1D),
      body: Stack(
        children: [
          const CameraPreviewWidget(),

          const TopNavigation(),

          const FaceHudOverlay(),

          // const StatusChip(),
          Align(
            alignment: Alignment.bottomCenter,
            child: const AnalysisBottomSheet(),
          ),
        ],
      ),
    );
  }
}
