import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../login/page/login-state.dart';

import 'RegisterPage.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Provider<FormStore>(
        create: (_) => FormStore(), child: RegisterRedirect());
  }
}

class RegisterRedirect extends StatelessWidget {
  const RegisterRedirect({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formStore = Provider.of<FormStore>(context);
    return Scaffold(
      backgroundColor: Color(0xFF100E19),
      body: Observer(
        builder: (_) {
          if (formStore.statusCode == 200) {
            return BLockConfirmEmail();
          }
          return RegisterPage();
        },
      ),
    );
  }
}

class BLockConfirmEmail extends StatelessWidget {
  const BLockConfirmEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 86,
        width: 240,
        padding: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Color(0xFF1F1B2E)),
        ),
        child: Column(
          children: [
            Text(
              'Подтверди почту',
              style: TextStyle(
                color: Color(0xFF645BA3),
                fontSize: 20,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Или я не смогу тебя впустить...',
              style: TextStyle(
                  color: Color(0xFFFFFFFF).withOpacity(0.2), fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}
