import 'package:flutter/material.dart';

import '../utils/color.dart';

class ButtonSuccess extends StatelessWidget {
  final String buttonText;
  final double width;
  final double height;
  final VoidCallback? onPressed;

  const ButtonSuccess(
      {Key? key,
      required this.onPressed,
      required this.buttonText,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: AppColors.success.withOpacity(0.8),
      height: height,
      minWidth: width,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        child: Text(
          buttonText,
          style: const TextStyle(
              fontSize: 20,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w700,
              fontFamily: "Montserrat"),
        ),
      ),
    );
  }
}
