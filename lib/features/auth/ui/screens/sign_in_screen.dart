import 'package:ecommerce_ostad/features/auth/ui/controllers/sign_In_controller.dart';
import 'package:ecommerce_ostad/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:ecommerce_ostad/features/auth/ui/widgets/app_icon_widget.dart';
import 'package:ecommerce_ostad/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecommerce_ostad/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerce_ostad/features/common/ui/widgets/snack_bar_message.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = "/sign-in";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final SignInController _signInController = Get.find<SignInController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(height: 80),
                const AppLogoWidget(),
                const SizedBox(height: 16),
                Text(
                  "Welcome Back",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "Please Enter your email address",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _emailTEController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: "Email Address"),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter your email address";
                    }
                    if (EmailValidator.validate(value!) == false) {
                      return "Enter a valid email address";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _passwordTEController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(hintText: "Password"),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter your password";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                GetBuilder<SignInController>(builder: (controller) {
                  if (controller.inProgress) {
                    return const CenteredCircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: _onTapNextButton,
                    child: const Text("Sign in"),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapNextButton() async {
    if (_formkey.currentState!.validate()) {
      bool isSuccess = await _signInController.signIn(
        _emailTEController.text.trim(),
        _passwordTEController.text.trim(),
      );
      if (isSuccess) {
        if (mounted) {
          Navigator.pushNamed(
            context,
            MainBottomNavScreen.name,
            arguments: _emailTEController.text.trim(),
          );
        }
      } else {
        if (mounted) {
          showSnackBarMessage(context, _signInController.errorMessage!);
        }
      }
    }
  }
}
