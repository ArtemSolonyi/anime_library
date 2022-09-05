import 'package:anime_library/register/page/register_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../login/page/login-error-state.dart';
import '../../login/page/login-state.dart';
import '../../utils/color.dart';
import '../../widgets/button-purple.dart';
import '../../widgets/input-field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final FormErrorState error = FormErrorState();
  final FormStore formStore = FormStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF100E19),
      body: SafeArea(
          child: Center(
        child: Container(
          width: 360,
          padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 25),
          decoration: BoxDecoration(
              color: const Color(0xFF100E19),
              border: Border.all(width: 2.0, color: AppColors.blueColor),
              borderRadius: BorderRadius.circular(20)),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Регистрация',
                      style: TextStyle(
                          color: Color(0xFF645BA3),
                          fontFamily: 'Montserrat',
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Привет, познакомимся?',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                        fontFamily: 'Montserrat',
                        color: Color(0xFFFFFFFF).withOpacity(0.2),
                      ),
                    ),
                  ],
                ),
                InputField(
                    hintText: 'Придумай имя',
                    validator: (value) {
                      return error.validateUsername(value.toString());
                    },
                    onChanged: formStore.setUsername),
                SizedBox(
                  height: 30,
                ),
                InputField(
                    hintText: 'Почта',
                    validator: (value) {
                      return error.validateEmail(value.toString());
                    },
                    onChanged: formStore.setEmail),
                SizedBox(
                  height: 30,
                ),
                InputField(
                  hintText: 'Пароль',
                  validator: (value) {
                    return error.validatePassword(value.toString());
                  },
                  onChanged: formStore.setUsername,
                ),
                SizedBox(
                  height: 30,
                ),
                InputField(
                  hintText: 'Ты робот?',
                  onChanged: (String text) {},
                ),
                SizedBox(
                  height: 30,
                ),
                ButtonPurple(
                    height: 40,
                    width: 250,
                    buttonText: "Зарегистрироваться",
                    onPressed: () {
                      formStore.login();
                    }),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
