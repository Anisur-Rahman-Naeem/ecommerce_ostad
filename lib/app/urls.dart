class Urls {
  static const String _baseurl = "https://ecommerce-api.codesilicon.com/api";

  static String verifyEmailUrl(String email) => "$_baseurl/UserLogin/$email";
  static String verifyOtpUrl(String email, String otp) => "$_baseurl/VerifyLogin/$email/$otp";
  static String readProfileUrl= "$_baseurl/ReadProfile";
  static String bannerListUrl= "$_baseurl/ListProductSlider";
}