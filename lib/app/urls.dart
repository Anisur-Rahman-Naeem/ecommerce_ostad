class Urls {
  static const String _baseurl = "https://ecommerce-api.codesilicon.com/api";

  static String verifyEmailUrl(String email) => "$_baseurl/UserLogin/$email";
  static String verifyOtpUrl(String email, String otp) => "$_baseurl/VerifyLogin/$email/$otp";
  static String readProfileUrl= "$_baseurl/ReadProfile";
  static String bannerListUrl= "$_baseurl/ListProductSlider";
  static String categoryListUrl= "$_baseurl/CategoryList";

  static String productListByRemarkUrl(String remark) =>
      "$_baseurl/ListProductByRemark/$remark";
  static String productListByCategoryUrl(int categoryId) =>
      "$_baseurl/ListProductByCategory/$categoryId";
  static String productDetailsUrl(int productId) =>
      "$_baseurl/ProductDetailsById/$productId";
}