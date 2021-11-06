import 'package:flutter/material.dart';
import 'package:premiun_deluxe_motorsport/shared/themes/app_text_styles.dart';

class TextProofPurchase extends StatelessWidget {
  final String label;

  const TextProofPurchase({ Key? key, required this.label }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyles.title_comprovante,
    );
  }
}