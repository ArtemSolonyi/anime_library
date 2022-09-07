import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../login/page/login-error-state.dart';
import '../../login/page/login-state.dart';
import '../../utils/color.dart';
import '../../widgets/button-purple.dart';
import '../../widgets/input-field.dart';

class RegisterPage extends StatelessWidget {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final FormErrorState error = FormErrorState();

  RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formStore = Provider.of<FormStore>(context);
    return Scaffold(
      backgroundColor: const Color(0xFF100E19),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Регистрация',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.opacityRed,
                        fontFamily: 'Montserrat')),
                Text(' / ',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: AppColors.whiteColorOpacity,
                        fontFamily: 'Montserrat')),
                InkWell(
                  onTap: () {
                    context.go('/login');
                  },
                  child: Text(
                    'Авторизация',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.whiteColorOpacity,
                        fontFamily: 'Montserrat'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 360,
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 25),
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
                    SizedBox(
                      height: 25,
                    ),
                    Observer(builder: (context) {
                      return InputField(
                          validationError: error.username,
                          hintText: 'Придумай имя',
                          onChanged: (username) {
                            formStore.setUsername(username);
                            error.validateUsername(username);
                          });
                    }),
                    Observer(
                      builder: (context) {
                        return InputField(
                          validationError: error.email,
                          hintText: 'Почта',
                          onChanged: (email) {
                            formStore.setEmail(email);
                            error.validateEmail(email);
                          },
                        );
                      },
                    ),
                    Observer(builder: (context) {
                      return InputField(
                        validationError: error.password,
                        hintText: 'Пароль',
                        onChanged: (password) {
                          formStore.setPassword(password);
                          error.validatePassword(password);
                        },
                      );
                    }),
                    Observer(builder: (context) {
                      return InputField(
                        validationError: formStore.errorMessage,
                        hintText: 'Ты робот?',
                        onChanged: (String text) {},
                      );
                    }),
                    ButtonPurple(
                        height: 40,
                        width: 250,
                        buttonText: "Зарегистрироваться",
                        onPressed: () {
                          if (!error.validateRegisterStore()) {
                            print('qq');
                            return;
                          }
                          formStore.register();
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
