import 'package:ecommerce_ostad/app/urls.dart';
import 'package:ecommerce_ostad/features/home/data/models/slider_model.dart';
import 'package:ecommerce_ostad/features/home/data/models/slider_pagination_response.dart';
import 'package:ecommerce_ostad/services/network%20caller/network_caller.dart';
import 'package:get/get.dart';

class SliderListController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  SlidePaginationModel? _slidePaginationModel;

  List<SliderModel>? get bannerList => _slidePaginationModel?.data?.results ?? [];

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getSliders() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(Urls.homeSliderUrl);
    if (response.isSuccess) {
      _slidePaginationModel = SlidePaginationModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
