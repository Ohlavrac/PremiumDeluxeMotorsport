import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:premiun_deluxe_motorsport/shared/themes/app_text_styles.dart';

class InputNumberWidget extends StatelessWidget {
  final String label;
  final void Function(String value) onChanged;

  const InputNumberWidget({ Key? key, required this.label, required this.onChanged }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 385,
      height: 60,
      child: TextFormField(
        onChanged: onChanged,
        controller: null, //depois ver esse controler pode precisar mexer
        decoration: InputDecoration(
          label: Text(
            label,
            style: TextStyles.titleInput,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white)
          ),
        ),
        style: TextStyles.titleInput,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}