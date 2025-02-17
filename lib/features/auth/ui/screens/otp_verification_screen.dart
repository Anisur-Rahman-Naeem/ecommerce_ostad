import 'dart:async';

import 'package:ecommerce_ostad/app/app_colors.dart';
import 'package:ecommerce_ostad/app/app_constants.dart';
import 'package:ecommerce_ostad/features/auth/ui/controllers/otp_verification_controller.dart';
import 'package:ecommerce_ostad/features/auth/ui/widgets/app_icon_widget.dart';
import 'package:ecommerce_ostad/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecommerce_ostad/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerce_ostad/features/common/ui/widgets/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.email});

  static const String name = "/otp-verification";

  final String email;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final RxInt _remainingTime = AppConstants.resendOtpTimeOutInSecs.obs;
  late Timer timer;
  final RxBool _enableResendCodeButton = false.obs;
  final OTPVerficationController _otpVerficationController =
  Get.find<OTPVerficationController>();

  @override
  void initState() {
    super.initState();
    _startResendCodeTime();
  }

  void _startResendCodeTime() {
    _enableResendCodeButton.value = false;
    _remainingTime.value = AppConstants.resendOtpTimeOutInSecs;
    timer = Timer.periodic(
      const Duration(seconds: 1),
          (t) {
        _remainingTime.value--;
        setState(() {});
        if (_remainingTime.value == 0) {
          t.cancel();
          _enableResendCodeButton.value = true;
        }
      },
    );
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
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  "A 6 digit otp has been sent to your email address",
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 24),
                PinCodeTextField(
                  length: 4,
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
                  validator: (String? value) {
                    if (value?.length != 4) {
                      return 'Enter your otp';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                GetBuilder<OTPVerficationController>(
                    builder: (controller) {
                      if (controller.inProgress) {
                        return const CenteredCircularProgressIndicator();
                      }
                      else {
                        return ElevatedButton(
                          onPressed: _onTapNextButton,
                          child: const Text("Next"),
                        );
                      }
                    }
                ),
                const SizedBox(height: 24),
                //TODO: enable button when 120s is done and invisible the text
                Obx(
                      () =>
                      Visibility(
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
                      ),
                ),
                Obx(
                      () =>
                      Visibility(
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

  Future<void> _onTapNextButton() async {
    if (_formkey.currentState!.validate()) {
      final bool response = await _otpVerficationController.verifyOtp(
          widget.email, _otpTEController.text);
      if (response) {
        if (mounted) {
          Navigator.pushNamedAndRemoveUntil(
              context, MainBottomNavScreen.name, (predicate) => false);
        }
      }
    } else {
      if (mounted) {
        showSnackBarMessage(context, _otpVerficationController.errorMessage!);
      }
    }
  }

@override
void dispose() {
  timer.cancel();
  super.dispose();
}}
