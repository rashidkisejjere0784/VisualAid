import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../utils/theme/Palette.dart';
import '../../widgets/logo.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_img_button.dart';
import 'package:therapp2/services/widgets/custom_text_input_field.dart';

class CareTakerLogin extends StatelessWidget {
  const CareTakerLogin({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Palette.background,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logo(40),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Care Taker Login ",
                style: TextStyle(
                    color: Palette.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              customTextInputField("Email", emailController, width, false),
              const SizedBox(
                height: 15,
              ),
              customTextInputField("Password", passwordController, width, true),
              const SizedBox(
                height: 15,
              ),
              customButton(width, "Login", Palette.primaryDark,
                  Palette.textColorBright, () {}),
              const SizedBox(
                height: 15,
              ),
              customImageButton(
                  width,
                  'assets/images/google logo.png',
                  "Sign In With Google",
                  Palette.lightBlue,
                  Palette.textColorDark,
                  () {})
            ],
          )),
    );
  }
}
