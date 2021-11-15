import 'package:flutter/material.dart';
import 'package:premiun_deluxe_motorsport/shared/themes/app_colors.dart';
import 'package:premiun_deluxe_motorsport/shared/themes/app_text_styles.dart';

class SmallButtonMainMenu extends StatelessWidget {
  final String label;
  final Icon icon;
  final VoidCallback onPressed; 

  const SmallButtonMainMenu({ Key? key, required this.label, required this.icon, required this.onPressed }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 146,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColors.menuButtom,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon,
            const SizedBox(height: 25,),
            Text(
              label,
              style: TextStyles.titleSemiBold
            ),
          ],
        ),
      
      ),
    );
  }
}