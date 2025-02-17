import 'package:ecommerce_ostad/app/urls.dart';
import 'package:ecommerce_ostad/features/auth/data/models/sign_in_model.dart';
import 'package:ecommerce_ostad/features/common/ui/controller/auth_controller.dart';
import 'package:ecommerce_ostad/services/network%20caller/network_caller.dart';
import 'package:get/get.dart';

class OTPVerficationController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;


  Future<bool> verifyOtp(String email, String otp) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final Map<String, dynamic> requestParams = {"email": email, "otp": otp};

    final NetworkResponse response =
        await Get.find<NetworkCaller>().postRequest(
      Urls.verifyOtpUrl,
      body: requestParams,
    );
    if (response.isSuccess) {
      AuthSuccessModel authsuccessModel = AuthSuccessModel.fromJson(response.responseData);
      await Get.find<AuthController>()
          .saveUserData(authsuccessModel.data!.token!, authsuccessModel.data!.user!);
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
