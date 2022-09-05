import 'package:flutter/material.dart';

import '../utils/color.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final Color? suffixColor;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final FormFieldValidator<String>? validator;
  final Function(String text) onChanged;
  final int? maxLength;

  const InputField(
      {Key? key,
      required this.hintText,
      required this.onChanged,
      this.suffixIcon,
      this.suffixColor,
      this.prefixIcon,
      this.maxLength,
      this.validator})
      : super(key: key);

  InputBorder get border => OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.borderPurpleColor,
        ),
        borderRadius: BorderRadius.circular(7),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.borderPurpleColor,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          child: TextFormField(
            maxLength: maxLength,
            onChanged: onChanged,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: hintText,
              suffixIconColor: Colors.purple,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.4),
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  fontFamily: 'Montserrat'),
            ),
          ),
        ),
      ],
    );
  }
}
