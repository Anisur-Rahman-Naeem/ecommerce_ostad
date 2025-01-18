import 'package:ecommerce_ostad/features/auth/ui/controllers/email_verification_controller.dart';
import 'package:ecommerce_ostad/features/auth/ui/controllers/otp_verification_controller.dart';
import 'package:ecommerce_ostad/features/auth/ui/controllers/read_profile_controller.dart';
import 'package:ecommerce_ostad/features/common/ui/controller/auth_controller.dart';
import 'package:ecommerce_ostad/features/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:ecommerce_ostad/services/network%20caller/network_caller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(NetworkCaller());
    Get.put(EmailVerficationController());
    Get.put(OTPVerficationController());
    Get.put(ReadProfileController());
    Get.put(AuthController());
  }

}