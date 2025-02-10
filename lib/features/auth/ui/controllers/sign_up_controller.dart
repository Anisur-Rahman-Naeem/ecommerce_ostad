import 'package:ecommerce_ostad/app/urls.dart';
import 'package:ecommerce_ostad/features/auth/data/models/sign_in_model.dart';
import 'package:ecommerce_ostad/features/auth/data/models/sign_up_params.dart';
import 'package:ecommerce_ostad/features/auth/ui/controllers/read_profile_controller.dart';
import 'package:ecommerce_ostad/features/common/ui/controller/auth_controller.dart';
import 'package:ecommerce_ostad/services/network%20caller/network_caller.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> signUp(SignUpParams params) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
        await Get.find<NetworkCaller>().postRequest(
      Urls.signUpUrl,
      body: params.toJson(),
    );
    if (response.isSuccess) {
      SignInModel signInModel = SignInModel.fromJson(response.responseData);
      await Get.find<AuthController>()
          .saveUserData(signInModel.data!.token!, signInModel.data!.user!);
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
