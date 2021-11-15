import 'package:flutter/material.dart';
import 'package:premiun_deluxe_motorsport/shared/themes/app_colors.dart';
import 'package:premiun_deluxe_motorsport/shared/themes/app_text_styles.dart';

class LargeButon extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const LargeButon({ Key? key, required this.label, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 385,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyles.titleButtons,
        ),
        style: ElevatedButton.styleFrom(
          primary: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          )
        ),
      ),
    );
  }
}