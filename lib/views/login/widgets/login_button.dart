// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login_bloc/login_bloc.dart';

class LoginButton extends StatelessWidget {
  final fromKey;
  const LoginButton({super.key, required this.fromKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => current.password != previous.password,
        builder: (context, state) {
          return ElevatedButton(
              onPressed: () {
                if (fromKey.currentState!.validate()) {
                  if (kDebugMode) {
                    print('Login buttton successfully clicked');
                  }
                }
              },
              child: const Text('Login'));
        });
  }
}
