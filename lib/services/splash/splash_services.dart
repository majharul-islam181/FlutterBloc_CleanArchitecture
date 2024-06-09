import 'dart:async';
import '../../views/views.dart';


class SplashServices {
  void isLogin(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const LoginScreen()), 
        (route) => false,
      ),
    );
  }
}
