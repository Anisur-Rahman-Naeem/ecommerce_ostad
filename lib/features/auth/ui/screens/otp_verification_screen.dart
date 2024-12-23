import 'dart:async';

import 'package:ecommerce_ostad/app/app_colors.dart';
import 'package:ecommerce_ostad/app/app_constants.dart';
import 'package:ecommerce_ostad/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:ecommerce_ostad/features/auth/ui/widgets/app_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  static const String name = "/otp-verification";

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final RxInt _remainingTime = AppConstants.resendOtpTimeOutInSecs.obs;
  late Timer timer;
  final RxBool _enableResendCodeButton = false.obs;

  @override
  void initState() {
    super.initState();
    _startResendCodeTime();
  }

  void _startResendCodeTime() {
    _enableResendCodeButton.value = false;
    _remainingTime.value = AppConstants.resendOtpTimeOutInSecs;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      _remainingTime.value--;
      setState(() {});
      if (_remainingTime.value == 0) {
        t.cancel();
        _enableResendCodeButton.value = true;
      }
    });
  }

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
                  "Enter OTP Code",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  "A 4 digit otp has been sent to your email address",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 24),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  animationDuration: const Duration(milliseconds: 300),
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      activeFillColor: AppColors.themeColor,
                      inactiveColor: AppColors.themeColor,
                      borderRadius: BorderRadius.circular(8)),
                  keyboardType: TextInputType.number,
                  appContext: context,
                  controller: _otpTEController,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // if (_formkey.currentState!.validate()) {}
                    Navigator.pushNamed(context, CompleteProfileScreen.name);
                  },
                  child: const Text("Next"),
                ),
                const SizedBox(height: 24),
                //TODO: enable button when 120s is done and invisible the text
                Obx(() => Visibility(
                  visible: !_enableResendCodeButton.value,
                  child: RichText(
                        text: TextSpan(
                          text: "This code will be expire in ",
                          style: const TextStyle(color: Colors.grey),
                          children: [
                            TextSpan(
                              text: '${_remainingTime}s',
                              style: const TextStyle(
                                color: AppColors.themeColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                )),
                Obx(
                  () => Visibility(
                    visible: _enableResendCodeButton.value,
                    child: TextButton(
                      onPressed: () {
                        _startResendCodeTime();
                      },
                      child: const Text('Resend Code'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
