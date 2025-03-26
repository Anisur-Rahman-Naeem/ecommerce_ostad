import 'package:ecommerce_ostad/app/urls.dart';
import 'package:ecommerce_ostad/services/network%20caller/network_caller.dart';
import 'package:ecommerce_ostad/user/controller/user_model_controller.dart';
import 'package:ecommerce_ostad/user/model/user_model.dart' as userinfo;
import 'package:ecommerce_ostad/user/model/user_model.dart';
import 'package:get/get.dart';

class CartCheckoutController extends GetxController {
  bool _inProgress = false;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool get inProgress => _inProgress;

  userinfo.UserInfoModel  _userInfoModel = userinfo.UserInfoModel();

  User? get getuserinfo => _userInfoModel.data;

  // Future<void> _loadUserData() async {
  //   final userController = Get.find<UserModelController>();
  //
  //   if (userController.userInfo == null) {
  //     bool success = await userController.gettingUserInfo();
  //     if (success) {
  //       userinfo.User user = userController.userInfo!;
  //     } else {
  //       _errorMessage = "Failed to load user information";
  //     }
  //   } else {
  //     userinfo.User user = userController.userInfo!;
  //   }
  //
  //   update(); // Notify UI of changes
  // }

  Future<bool> cartCheckout(User instance) async{
    bool isSuccess = false;
    _inProgress = false;
    update();
    Map<String, dynamic> requestBody = {
      'payment_method' : 'cod',
      "shipping_address": {
        "full_name": '${instance.firstName.toString()} ${instance.lastName.toString()}',
        "address": "Shovandandi-4370, Patiya",
        "city": instance.city.toString(),
        "postal_code": "4370",
        "phone": instance.phone.toString()
      }
    };
    final NetworkResponse response = await Get.find<NetworkCaller>().postRequest(Urls.cartCheckoutUrl, body: requestBody);
    if(response.isSuccess) {
      isSuccess = true;
    }
    else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}