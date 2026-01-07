import 'package:flutter/material.dart';

class CameraPreviewWidget extends StatelessWidget {
  const CameraPreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.network(
        "https://lh3.googleusercontent.com/aida-public/AB6AXuCqaUt86lkALAlaKtZD7M8_m5s3Dj3YgkKU9bpYF4trBm5jvHnkEBbbyCBIcibsB6deblwkcm4eVO3GXBMrymDctmelWETrguPW5eG0UPbcDo7Mh1XofoNfJr2Hh1LB8gtZ0A2Q-jWUeg-T0sZyTXl_l49jeOH6QYhzfkQTDuv-L1LPrNgCGNxU1ue_Zoy6poUBfeBzp1vCU3CK204m0yceqNs3ETii1rgX0rxRi6MJx9zdL4Bht1AIIVRXAjkCRBjt1FFgTc-mKe-Y",
        fit: BoxFit.cover,
      ),
    );
  }
}
