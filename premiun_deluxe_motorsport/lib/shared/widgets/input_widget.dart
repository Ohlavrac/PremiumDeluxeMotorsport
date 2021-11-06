import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:premiun_deluxe_motorsport/shared/themes/app_text_styles.dart';

class InputWidget extends StatelessWidget {
  final String label;
  final void Function(String value) onChanged;
  final void Function(String value)? onSubmite;

  const InputWidget({ Key? key, required this.label, required this.onChanged, this.onSubmite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 385,
      height: 60,
      child: TextFormField(
        onChanged: onChanged,
        onFieldSubmitted: onSubmite,
        controller: null, //depois ver esse controler pode precisar mexer
        decoration: InputDecoration(
          label: Text(
            label,
            style: TextStyles.title_input,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white)
          ),
        ),
        style: TextStyles.title_input,
      ),
    );
  }
}