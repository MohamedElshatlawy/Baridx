import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class SplashViewModel {
  SplashViewModel();

  init({required BuildContext context}) async {
    Future.delayed(const Duration(seconds: 3), () async {
      if (context.mounted) {
        context.go('/customerInfoScreen');
      }
    });
  }
}
