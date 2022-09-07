import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/color.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final Color? suffixColor;
  final TextEditingController? textEditingController;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final FormFieldValidator<String>? validator;
  final Function(String text) onChanged;
  final int? maxLength;
  final String? validationError;
  const InputField(
      {Key? key,
      required this.validationError,
      required this.hintText,
      required this.onChanged,
      this.suffixIcon,
      this.suffixColor,
      this.prefixIcon,
      this.maxLength,
      this.validator,
      this.textEditingController})
      : super(key: key);

  InputBorder get border => OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.borderPurpleColor,
        ),
        borderRadius: BorderRadius.circular(7),
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Column(
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.borderPurpleColor,
              ),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Center(
              child: TextFormField(
                controller: textEditingController,
                maxLength: maxLength,
                onChanged: onChanged,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white.withOpacity(0.8)),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 13),
                  border: InputBorder.none,
                  constraints: BoxConstraints(maxHeight: 40, minHeight: 40),
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
          ),
          SizedBox(
            height: 3,
          ),
          if (validationError != null)
            Text(
              validationError!,
              style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFFEA003D),
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700),
            )
        ],
      ),
    );
  }
}
