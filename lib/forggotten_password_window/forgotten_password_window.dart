import 'package:anime_library/widgets/button-purple.dart';
import 'package:anime_library/widgets/input-field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/color.dart';

class ForgottenPasswordWindow extends StatefulWidget {
  const ForgottenPasswordWindow({Key? key}) : super(key: key);

  @override
  State<ForgottenPasswordWindow> createState() =>
      _ForgottenPasswordWindowState();
}

class _ForgottenPasswordWindowState extends State<ForgottenPasswordWindow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF100E19),
      body: Center(
        child: Container(
          width: 360,
          height: 231,
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
              Text('Подтверждение почты',
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
              Container(
                height: 80,
                width: 320,
                child: InputField(
                    validationError: null,
                    hintText: "Введи почту",
                    onChanged: (p) {}),
              ),
              ButtonPurple(
                  onPressed: () {},
                  buttonText: 'Подтвердить ',
                  width: 200,
                  height: 40)
            ],
          ),
        ),
      ),
    );
  }
}
