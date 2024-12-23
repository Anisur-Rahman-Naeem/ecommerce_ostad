import 'package:ecommerce_ostad/app/app_theme_data.dart';
import 'package:ecommerce_ostad/app/controller_binder.dart';
import 'package:ecommerce_ostad/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:ecommerce_ostad/features/auth/ui/screens/email_verification_screen.dart';
import 'package:ecommerce_ostad/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:ecommerce_ostad/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../features/common/ui/screens/main_bottom_nav_screen.dart';

class CrafyBaby extends StatelessWidget {
  const CrafyBaby({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,
      initialBinding: ControllerBinder(),
      routes: {
        '/': (context) => const SplashScreen(),
        EmailVerificationScreen.name: (context) =>
            const EmailVerificationScreen(),
        OtpVerificationScreen.name: (context) => const OtpVerificationScreen(),
        CompleteProfileScreen.name: (context) => const CompleteProfileScreen(),
        MainBottomNavScreen.name : (context) => const MainBottomNavScreen()
      },
    );
  }
}
