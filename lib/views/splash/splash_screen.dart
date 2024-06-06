import 'package:flutter/material.dart';
import 'package:flutterbloc_cleanarchitecture/config/components/internet_exception_widget.dart';

import 'package:flutterbloc_cleanarchitecture/config/components/round_button.dart';
import 'package:flutterbloc_cleanarchitecture/config/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InterNetExceptionWidget(onPress: () {})
          // RoundButton(
          //   title: 'title',
          //   onPress: () {},
          //   height: 200,
          // ),
          // // const LoadingWidget(),
          // Center(
          //     child: TextButton(
          //         onPressed: () {
          //           Navigator.pushNamed(context, RoutesName.homeScreen);
          //         },
          //         child: const Text("Home"))),
        ],
      ),
    );
  }
}
