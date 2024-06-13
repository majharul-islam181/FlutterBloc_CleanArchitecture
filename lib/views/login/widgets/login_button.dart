// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc_cleanarchitecture/utils/enums.dart';

import '../../../bloc/login_bloc/login_bloc.dart';

class LoginButton extends StatelessWidget {
  final fromKey;
  const LoginButton({super.key, required this.fromKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.postApiStatus == PostApiStatus.error) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(state.error.toString())));
        }
        if (state.postApiStatus == PostApiStatus.success) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(state.error.toString())));
        }

        if (state.postApiStatus == PostApiStatus.loading) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(content: Text('Loading......')));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
          buildWhen: (previous, current) =>
              current.password != previous.password,
          builder: (context, state) {
            return ElevatedButton(
                onPressed: () {
                  if (fromKey.currentState!.validate()) {
                    context.read<LoginBloc>().add(LoginButtonEvent());
                  }
                },
                child: const Text('Login'));
          }),
    );
  }
}
