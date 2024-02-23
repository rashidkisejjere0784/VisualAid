import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:therapp2/services/utils/theme/Palette.dart';
import 'package:therapp2/services/widgets/logo.dart';
import 'package:therapp2/routes/routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Use Future.delayed to wait for a specified duration
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to the desired page after the specified duration
      Get.offAllNamed(AppRoutes.loginAs);
    });

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Palette.background,
        child: Center(
          child: logo(50),
        ),
      ),
    );
  }
}