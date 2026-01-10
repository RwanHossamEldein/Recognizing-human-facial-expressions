import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageService {
  bool _isPickingImage = false; // ✅ Flag للحماية

  Future<File?> pickImage() async {
    // لو في picker شغال بالفعل، ارجع null
    if (_isPickingImage) {
      print('⚠️ Image picker already active');
      return null;
    }

    try {
      _isPickingImage = true; // قفل

      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85, // اختياري - لتقليل حجم الصورة
      );

      if (image != null) {
        return File(image.path);
      }
      return null;
    } catch (e) {
      print('Error picking image: $e');
      return null;
    } finally {
      _isPickingImage = false; // فك القفل دائماً
    }
  }

  Future<File?> pickImageFromCamera() async {
    if (_isPickingImage) {
      print('⚠️ Image picker already active');
      return null;
    }

    try {
      _isPickingImage = true;

      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
      );

      if (image != null) {
        return File(image.path);
      }
      return null;
    } catch (e) {
      print('Error taking photo: $e');
      return null;
    } finally {
      _isPickingImage = false;
    }
  }
}
