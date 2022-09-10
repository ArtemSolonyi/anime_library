import 'package:anime_library/forggotten_password_window/identify_code.dart';
import 'package:anime_library/widgets/button-purple.dart';
import 'package:anime_library/widgets/input-field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../settings/settings_error_store.dart';
import '../settings/settings_store.dart';
import '../utils/color.dart';

class ForgottenPasswordWindow extends StatefulWidget {
  const ForgottenPasswordWindow({Key? key}) : super(key: key);

  @override
  State<ForgottenPasswordWindow> createState() => _ForgottenPasswordWindow();
}

class _ForgottenPasswordWindow extends State<ForgottenPasswordWindow> {
  @override
  Widget build(BuildContext context) {
    return Provider<SettingsStore>(
        create: (_) => SettingsStore(), child: _ForgottenPasswordWindowView());
  }
}

class _ForgottenPasswordWindowView extends StatelessWidget {
  const _ForgottenPasswordWindowView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsStore = Provider.of<SettingsStore>(context);
    return Scaffold(
        backgroundColor: Color(0xFF100E19),
        body: Observer(builder: (_) {
          if (settingsStore.statusCode == 200) {
            return IdentifyCode();
          }
          return ConfirmationEmail();
        }));
  }
}

class ConfirmationEmail extends StatelessWidget {
  SettingsErrorStore settingsErrorStore = SettingsErrorStore();

  ConfirmationEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsStore = Provider.of<SettingsStore>(context);
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
              const SizedBox(
                height: 15,
              ),
              const Text('Подтверждение почты',
                  style: TextStyle(
                      color: Color(0xFF645BA3),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Montserrat',
                      fontSize: 24)),
              Text('Как ты мог забыть свой пароль?',
                  style: TextStyle(
                      color: const Color(0xFFFFFFFF).withOpacity(0.3),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Montserrat',
                      fontSize: 10)),
              const SizedBox(
                height: 25,
              ),
              Container(
                height: 80,
                width: 320,
                child: Observer(builder: (context) {
                  return InputField(
                      validationError: settingsStore.errorMessage.isNotEmpty
                          ? settingsStore.errorMessage
                          : settingsErrorStore.errorEmailForChangePassword,
                      hintText: "Введи почту",
                      onChanged: (email) {
                        settingsStore.setEmail(email);
                        settingsErrorStore.validateEmail(email);
                      });
                }),
              ),
              ButtonPurple(
                  onPressed: () {
                    if (settingsErrorStore.errorEmailForChangePassword == '') {
                      settingsStore.requestOnChangePassword();
                    }
                    return;
                  },
                  buttonText: 'Подтвердить',
                  width: 200,
                  height: 40)
            ],
          ),
        ),
      ),
    );
  }
}
