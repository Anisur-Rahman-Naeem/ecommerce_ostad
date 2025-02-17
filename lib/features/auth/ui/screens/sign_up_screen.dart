import 'package:ecommerce_ostad/features/auth/data/models/sign_up_params.dart';
import 'package:ecommerce_ostad/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:ecommerce_ostad/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:ecommerce_ostad/features/auth/ui/widgets/app_icon_widget.dart';
import 'package:ecommerce_ostad/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerce_ostad/features/common/ui/widgets/snack_bar_message.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = "/complete-profile";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // "first_name": "Meskatul",
  // "last_name": "Islam",
  // "email": "meskatcse@mail.com",
  // "password": "123456",
  // "phone": "01754658781",
  // "city": "Chattogram"
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final SignUpController _signUpController = SignUpController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 60),
              const AppLogoWidget(
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 16),
              Text(
                "Complete Profile",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                "Get started with us with your details",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 24),
              _buildForm(),
              const SizedBox(height: 24),
              GetBuilder<SignUpController>(builder: (controller) {
                return Visibility(
                  visible: controller.inProgress == false,
                  replacement: const CenteredCircularProgressIndicator(),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        _signUp();
                      }
                    },
                    child: const Text("Sign up"),
                  ),
                );
              }),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _emailTEController,
            decoration: const InputDecoration(
              hintText: 'Email',
            ),
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
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _firstNameTEController,
            decoration: const InputDecoration(
              hintText: 'First Name',
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter valid first name';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _lastNameTEController,
            decoration: const InputDecoration(
              hintText: 'Last Name',
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter valid last name';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _mobileTEController,
            keyboardType: TextInputType.phone,
            maxLength: 11,
            decoration: const InputDecoration(
              hintText: 'Mobile',
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter valid mobile number';
              }
              if (RegExp(r'^01[3-9]\d{8}$').hasMatch(value!) == false) {
                return 'Enter valid mobile number';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _cityTEController,
            decoration: const InputDecoration(
              hintText: 'City',
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter valid city name';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _passwordTEController,
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
            validator: (String? value) {
              if ((value?.trim().isEmpty ?? true) || value!.length < 6) {
                return 'Enter a password more than 6 letters';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Future<void> _signUp() async {
    SignUpParams params = SignUpParams(
      password: _passwordTEController.text,
      email: _emailTEController.text.trim(),
      firstName: _firstNameTEController.text.trim(),
      lastName: _lastNameTEController.text.trim(),
      city: _cityTEController.text.trim(),
      mobile: _mobileTEController.text.trim(),
    );
    final bool isSuccess = await _signUpController.signUp(params);
    if (isSuccess) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OtpVerificationScreen(
          email: _emailTEController.text,
        )),
      );
    } else {
      showSnackBarMessage(context, _signUpController.errorMessage!);
    }
  }

  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    _emailTEController.dispose();
    super.dispose();
  }
}
