import 'package:anime_library/widgets/button.success.dart';
import 'package:anime_library/widgets/input-field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../settings/settings_error_store.dart';
import '../settings/settings_store.dart';

class ResetPasswordWindow extends StatefulWidget {
  const ResetPasswordWindow({Key? key}) : super(key: key);

  @override
  State<ResetPasswordWindow> createState() => _ResetPasswordWindowState();
}

class _ResetPasswordWindowState extends State<ResetPasswordWindow> {
  final SettingsErrorStore settingsErrorState = SettingsErrorStore();
  @override
  Widget build(BuildContext context) {
    final settingsStore = Provider.of<SettingsStore>(context);
    return Scaffold(
      backgroundColor: Color(0xFF100E19),
      body: Observer(
        builder: (_) {
          if (settingsStore.passwordSuccessfullyChanged == true) {
            context.go('/home');
          }
          return ResetPassword(
              settingsErrorState: settingsErrorState,
              settingsStore: settingsStore);
        },
      ),
    );
  }
}

class ResetPassword extends StatelessWidget {
  const ResetPassword({
    Key? key,
    required this.settingsErrorState,
    required this.settingsStore,
  }) : super(key: key);

  final SettingsErrorStore settingsErrorState;
  final SettingsStore settingsStore;

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
            const Text('Сброс пароля',
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
            const SizedBox(height: 25),
            InputField(
                validationError: null,
                hintText: 'Придумай новый пароль',
                suffixIcon: const Icon(Icons.remove_red_eye),
                onChanged: (firstPassword) {
                  settingsErrorState.setFirstPassword(firstPassword);
                }),
            Observer(builder: (_) {
              return InputField(
                  validationError: !settingsErrorState.isConfirmationPassword
                      ? "Passwords do not match"
                      : '',
                  suffixIcon: const Icon(Icons.remove_red_eye),
                  hintText: 'Подтверди новый пароль',
                  onChanged: (passwordConfirmation) {
                    settingsErrorState
                        .setPasswordConfirmation(passwordConfirmation);
                  });
            }),
            ButtonSuccess(
                onPressed: () {
                  if (settingsErrorState.isConfirmationPassword) {
                    settingsStore.changePassword(
                        settingsErrorState.passwordConfirmation);
                  }
                },
                buttonText: 'Восстановить',
                width: 200,
                height: 40)
          ],
        ),
      )),
    );
  }
}
