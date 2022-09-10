import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';

import '../../utils/color.dart';
import '../../widgets/button.success.dart';
import '../../widgets/input-field.dart';
import 'login-error-state.dart';
import 'login-state.dart';

class LoginView extends StatefulWidget {
  const LoginView();

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ReactionDisposer? disposer;
  final FormStore formStore = FormStore();
  final FormErrorState error = FormErrorState();
  late String validationError = 'Ошибка';
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    disposer = reaction<int>(
      (_) => formStore.statusCode,
      (statusCode) {
        if (statusCode != 201) {
          return;
        }
        context.go('/home');
      },
    );
  }

  @override
  dispose() {
    super.dispose();
    disposer?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    context.go('/register');
                  },
                  child: Text('Регистрация',
                      style: TextStyle(
                          fontSize: 20, color: AppColors.whiteColorOpacity)),
                ),
                Text(' / ',
                    style: TextStyle(
                        fontSize: 20, color: AppColors.whiteColorOpacity)),
                Text(
                  'Авторизация',
                  style: TextStyle(fontSize: 20, color: AppColors.opacityRed),
                ),
              ],
            ),
            Container(
              width: 360,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 2.0, color: AppColors.blueColor),
              ),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 15),
                    const Text(
                      'Авторизация',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Montserrat',
                        color: AppColors.borderPurpleColor,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Привет, я тебя знаю?',
                      style: TextStyle(
                        color: AppColors.whiteOpacityColor,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        height: 100,
                        child: Observer(builder: (context) {
                          return InputField(
                              validationError: error.username,
                              onChanged: (username) {
                                formStore.setUsername(username);
                                error.validateUsername(username);
                              },
                              hintText: 'Введи имя');
                        }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        height: 80,
                        child: Observer(builder: (context) {
                          return InputField(
                            validationError: error.password,
                            onChanged: (password) {
                              formStore.setPassword(password);
                              error.validatePassword(password);
                            },
                            hintText: 'Введите Пароль',
                            suffixIcon: Icon(Icons.remove_red_eye),
                            suffixColor: AppColors.borderPurpleColor,
                          );
                        }),
                      ),
                    ),
                    Observer(
                      builder: (_) => Text(
                        formStore.errorMessage,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    ButtonSuccess(
                      onPressed: () {
                        if (!error.validateStore()) {
                          return;
                        }
                        formStore.login();
                      },
                      buttonText: "Войти",
                      width: 100,
                      height: 40,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, bottom: 10),
                      child: Row(children: [
                        InkWell(
                          onTap: () {
                            context.go('/reset-password');
                          },
                          child: Text(
                            'Забыл пароль',
                            style: TextStyle(
                                color: Color(0xFFECC153),
                                fontFamily: 'Montserrat',
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
