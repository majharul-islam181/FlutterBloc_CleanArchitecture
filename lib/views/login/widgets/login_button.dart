// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc_cleanarchitecture/config/routes/routes_name.dart';
import 'package:flutterbloc_cleanarchitecture/utils/enums.dart';
import 'package:flutterbloc_cleanarchitecture/utils/flash_bar_helper.dart';
import '../../../bloc/login_bloc/login_bloc.dart';

class LoginButton extends StatelessWidget {
  final fromKey;
  const LoginButton({super.key, required this.fromKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          current.postApiStatus != previous.postApiStatus,
      listener: (context, state) {
        if (state.postApiStatus == PostApiStatus.error) {
          FlashBarHelper.flushBarErrorMessage(state.error.toString(), context);

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(state.error.toString())));
        }
        if (state.postApiStatus == PostApiStatus.success) {
          Navigator.pushNamed(context, RoutesName.homeScreen);
          // FlashBarHelper.flushBarSuccessMessage('Login successful', context);
        }
        //Loading
        // if (state.postApiStatus == PostApiStatus.loading) {
        //   ScaffoldMessenger.of(context)
        //     ..hideCurrentSnackBar()
        //     ..showSnackBar(const SnackBar(content: Text('Loading......')));
        // }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
          buildWhen: (previous, current) =>
              current.postApiStatus != previous.postApiStatus,
          builder: (context, state) {
            return ElevatedButton(
                onPressed: () {
                  if (fromKey.currentState!.validate()) {
                    context.read<LoginBloc>().add(LoginButtonEvent());
                  }
                },
                child: state.postApiStatus == PostApiStatus.loading
                    ? const CircularProgressIndicator()
                    : const Text('Login'));
          }),
    );
  }
}
