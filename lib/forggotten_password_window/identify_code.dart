import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utils/color.dart';
import '../widgets/input-field.dart';

class IdentifyCode extends StatefulWidget {
  const IdentifyCode({Key? key}) : super(key: key);

  @override
  State<IdentifyCode> createState() => _IdentifyCodeState();
}

class _IdentifyCodeState extends State<IdentifyCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF100E19),
      body: Center(
        child: Container(
          width: 340,
          height: 166,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 2.0, color: AppColors.blueColor),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 15,
              ),
              Text('Идентификация кода',
                  style: TextStyle(
                      color: Color(0xFF645BA3),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Montserrat',
                      fontSize: 24)),
              Text('Как ты мог забыть свой пароль?',
                  style: TextStyle(
                      color: Color(0xFFFFFFFF).withOpacity(0.3),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Montserrat',
                      fontSize: 10)),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                  width: 230,
                  child: PinCodeTextField(
                    animationType: AnimationType.scale,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                    ],
                    keyboardType: TextInputType.numberWithOptions(
                        decimal: true, signed: true),
                    pinTheme: PinTheme.defaults(
                        borderRadius: BorderRadius.circular(5),
                        selectedColor: AppColors.borderPurpleColor,
                        shape: PinCodeFieldShape.box,
                        fieldWidth: 50,
                        fieldHeight: 50),
                    autoFocus: true,
                    textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white.withOpacity(0.8)),
                    onChanged: (h) {},
                    length: 4,
                    appContext: context,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class InputCodeConfirm extends StatelessWidget {
  final TextEditingValue? textEditingController;
  final Function(String text) onChanged;

  const InputCodeConfirm({
    Key? key,
    required this.onChanged,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      animationType: AnimationType.scale,
      keyboardType: TextInputType.phone,
      animationDuration: Duration(seconds: 4),
      pinTheme: PinTheme.defaults(
          borderRadius: BorderRadius.circular(5),
          selectedColor: AppColors.borderPurpleColor,
          shape: PinCodeFieldShape.box,
          fieldWidth: 50,
          fieldHeight: 50),
      autoFocus: true,
      textStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Colors.white.withOpacity(0.8)),
      onChanged: onChanged,
      length: 4,
      appContext: context,
    );
  }
}
