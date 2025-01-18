import 'package:ecommerce_ostad/app/urls.dart';
import 'package:ecommerce_ostad/features/auth/ui/controllers/read_profile_controller.dart';
import 'package:ecommerce_ostad/features/common/ui/controller/auth_controller.dart';
import 'package:ecommerce_ostad/services/network%20caller/network_caller.dart';
import 'package:get/get.dart';

class OTPVerficationController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool _shouldNavigationCompleteProfile = false;

  bool get shouldNavigateCompleteProfile => _shouldNavigationCompleteProfile;

  Future<bool> verifyOtp(String email, String otp) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      Urls.verifyOtpUrl(email, otp),
    );
    if (response.isSuccess) {
      _errorMessage = null;

      isSuccess = true;
      String token = response.responseData['data'];
      await Get.find<ReadProfileController>().readProfileData(token);

      if (Get.find<ReadProfileController>().profileModel == null) {
        _shouldNavigationCompleteProfile= true;
      } else {
        await Get.find<AuthController>().saveUserData(
            token, Get.find<ReadProfileController>().profileModel!);
        _shouldNavigationCompleteProfile = false;
        //TODO: save user data & access token
      }
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
