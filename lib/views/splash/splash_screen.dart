import 'package:flutter/material.dart';
import 'package:flutterbloc_cleanarchitecture/config/components/internet_exception_widget.dart';

import 'package:flutterbloc_cleanarchitecture/config/components/round_button.dart';
import 'package:flutterbloc_cleanarchitecture/config/routes/routes_name.dart';
import 'package:flutterbloc_cleanarchitecture/services/splash/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices services = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    services.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // InterNetExceptionWidget(onPress: () {}),

          Text('splash screen'),

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
