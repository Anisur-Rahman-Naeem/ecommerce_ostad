import 'package:ecommerce_ostad/app/app_colors.dart';
import 'package:ecommerce_ostad/app/app_theme_data.dart';
import 'package:ecommerce_ostad/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class CrafyBaby extends StatelessWidget {
  const CrafyBaby({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.dark,
      routes: {
        '/' : (context) => const SplashScreen()
      },
    );
  }
}
