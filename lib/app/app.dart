import 'package:ecommerce_ostad/app/app_theme_data.dart';
import 'package:ecommerce_ostad/app/controller_binder.dart';
import 'package:ecommerce_ostad/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce_ostad/features/auth/ui/screens/sign_in_screen.dart';
import 'package:ecommerce_ostad/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:ecommerce_ostad/features/auth/ui/screens/splash_screen.dart';
import 'package:ecommerce_ostad/features/category/ui/screens/category_list_screen.dart';
import 'package:ecommerce_ostad/features/product/review/ui/screens/reviews_list_screen.dart';
import 'package:ecommerce_ostad/features/product/review/ui/screens/writing_review_screen.dart';
import 'package:ecommerce_ostad/features/product/ui/screens/product_details_screen.dart';
import 'package:ecommerce_ostad/features/product/ui/screens/product_list_screen.dart';
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
      onGenerateRoute: (RouteSettings settings){
        late Widget widget;
        if (settings.name == SplashScreen.name) {
          widget = const SplashScreen();
        } else if (settings.name == SignInScreen.name){
          widget = const SignInScreen();
        } else if (settings.name == OtpVerificationScreen.name) {
          final String email = settings.arguments as String;
          widget = OtpVerificationScreen(email: email);
        }else if (settings.name == SignUpScreen.name) {
          widget = const SignUpScreen();
        }else if (settings.name == MainBottomNavScreen.name) {
          widget = const MainBottomNavScreen();
        }else if (settings.name == CategoryListScreen.name) {
          widget = const CategoryListScreen();
        }else if (settings.name == ProductListScreen.name) {
          Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
          widget = ProductListScreen(categoryName: args['categoryName'], categoryId: args['categoryId'],);
        }else if (settings.name == ProductDetailsScreen.name) {
          int productId = settings.arguments as int;
          widget = ProductDetailsScreen(productId: 1,);
        }else if (settings.name == ReviewsListScreen.name) {
          int productId = settings.arguments as int;
          widget = ReviewsListScreen(productId: productId);
        }else if (settings.name == WritingReviewScreen.name) {
          widget = WritingReviewScreen();
        }
        return MaterialPageRoute(builder: (ctx) {
          return widget;
        },);
      },
    );
  }
}
