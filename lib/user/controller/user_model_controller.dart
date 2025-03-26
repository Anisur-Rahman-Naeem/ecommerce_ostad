import 'package:ecommerce_ostad/app/urls.dart';
import 'package:ecommerce_ostad/services/network%20caller/network_caller.dart';
import 'package:ecommerce_ostad/user/model/user_model.dart';
import 'package:get/get.dart';

class UserModelController extends GetxController {
  late UserInfoModel _userInfoModel;
  bool _inProgress = false;
  
  String? _errorMessage;
  
  bool? get inProgress => _inProgress;
  
  String? get errorMessage => _errorMessage;

  User? get userInfo => _userInfoModel.data;
  
  Future<bool> gettingUserInfo() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(Urls.userProfileUrl);
    if(response.isSuccess) {
      _userInfoModel = UserInfoModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}