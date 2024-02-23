import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:therapp2/services/utils/theme/Palette.dart';
import 'package:therapp2/services/widgets/logo.dart';
import 'package:therapp2/services/widgets/custom_icon_button.dart';
import 'package:therapp2/routes/routes.dart';

class LoginAsPage extends StatelessWidget {
  const LoginAsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

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
                "Login as: ",
                style: TextStyle(
                    color: Palette.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15,),
              customIconButton(width / 1.1, Icons.accessibility, "User",
                  Palette.primaryDark, Palette.textColorBright, (){
                Get.toNamed(AppRoutes.userLogin);
                  }),
              const SizedBox(height: 15,),

              customIconButton(width / 1.1, Icons.favorite, "Care Taker",
                  Palette.lightBlue, Palette.textColorDark, (){
                    Get.toNamed(AppRoutes.careTakerLogin);
                  }),
            ],
          )),
    );
  }
}
