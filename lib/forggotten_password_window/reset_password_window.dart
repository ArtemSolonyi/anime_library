import 'package:anime_library/widgets/button.success.dart';
import 'package:anime_library/widgets/input-field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPasswordWindow extends StatefulWidget {
  const ResetPasswordWindow({Key? key}) : super(key: key);

  @override
  State<ResetPasswordWindow> createState() => _ResetPasswordWindowState();
}

class _ResetPasswordWindowState extends State<ResetPasswordWindow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF100E19),
      body: Center(
          child: Container(
        padding: EdgeInsets.only(left: 20, top: 15, right: 20),
        height: 301,
        width: 360,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: Color(0xFF1F1B2E)),
        ),
        child: Column(
          children: [
            Text('Сброс пароля',
                style: TextStyle(
                    color: Color(0xFF645BA3),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Montserrat')),
            Text('Я не смотрю...',
                style: TextStyle(
                    color: Color(0xFFFFFFFF).withOpacity(0.3),
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Montserrat')),
            SizedBox(height: 25),
            InputField(
                validationError: null,
                hintText: 'Придумай новый пароль',
                suffixIcon: Icon(Icons.remove_red_eye),
                onChanged: (p) {}),
            InputField(
                validationError: null,
                suffixIcon: Icon(Icons.remove_red_eye),
                hintText: 'Придумай новый пароль',
                onChanged: (p) {}),
            ButtonSuccess(
                onPressed: () {},
                buttonText: 'Восстановить',
                width: 200,
                height: 40)
          ],
        ),
      )),
    );
  }
}
