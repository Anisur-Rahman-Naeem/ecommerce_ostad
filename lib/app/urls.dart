class Urls {
  static const String _baseurl = "https://ecom-rs8e.onrender.com/api";

  static String signInUrl = "$_baseurl/auth/login";
  static String signUpUrl = "$_baseurl/auth/signup";
  static String verifyOtpUrl =  "$_baseurl/auth/verify-otp";
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