import 'dart:async';
import 'package:flutterbloc_cleanarchitecture/services/session_manager/session_controller.dart';

import '../../views/views.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    SessionController().getUserFromPreference().then((value) {
      if (SessionController().isLogin ?? false) {
        Timer(
          const Duration(seconds: 3),
          () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false,
          ),
        );
      } else {
        Timer(
          const Duration(seconds: 3),
          () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false,
          ),
        );
      }
    }).onError((error, stackTrace) {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false,
        ),
      );
    });
  }
}
