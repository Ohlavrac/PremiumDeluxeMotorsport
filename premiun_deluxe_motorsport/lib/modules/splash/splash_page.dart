import 'package:flutter/material.dart';
import 'package:premiun_deluxe_motorsport/shared/themes/app_colors.dart';
import 'package:premiun_deluxe_motorsport/shared/themes/app_text_styles.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Premiun Deluxe",
            style: TextStyles.titleSplashpage,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1, bottom: 1),
            child: Divider(
              color: AppColors.secondary,
              height: 1,
              indent: 70,
              endIndent: 70,
              thickness: 3,
            ),  
          ),
          Text(
            "Motorsports",
            style: TextStyles.title2Splashpage,
          ),
        ],
      ),
    );
  }
}