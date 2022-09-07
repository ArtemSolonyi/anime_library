import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../login/page/login-state.dart';

class EmailActivationPage extends StatefulWidget {
  final String tempKey;

  const EmailActivationPage({Key? key, required this.tempKey})
      : super(key: key);

  @override
  State<EmailActivationPage> createState() => _EmailActivationPageState();
}

class _EmailActivationPageState extends State<EmailActivationPage> {
  final FormStore formStore = FormStore();
  ReactionDisposer? disposer;
  @override
  void initState() {
    super.initState();
    print('qqs');
    formStore.activationEmail(widget.tempKey);
    disposer = reaction<int>(
      (_) => formStore.statusCode,
      (msg) {
        print('смотри поменялось');
        if (msg != 200) {
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
    return Container();
  }
}
