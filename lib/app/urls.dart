class Urls {
  static const String _baseurl = "https://ecom-rs8e.onrender.com/api";

  static String signInUrl = "$_baseurl/auth/login";
  static String signUpUrl = "$_baseurl/auth/signup";
  static String verifyOtpUrl =  "$_baseurl/auth/verify-otp";
  static String readProfileUrl= "$_baseurl/ReadProfile";
  static String homeSliderUrl= "$_baseurl/slides";
  static String bannerListUrl= "$_baseurl/ListProductSlider";
  static String categoryListUrl= "$_baseurl/categories";

  static String productListByRemarkUrl(String remark) =>
      "$_baseurl/ListProductByRemark/$remark";
  static String productListByCategoryUrl(String categoryId) =>
      "$_baseurl/products?category=$categoryId";
  static String productDetailsUrl(String productId) =>
      "$_baseurl/products/id/$productId";
  static String deleteItemUrl(String itemId) =>
      "$_baseurl/cart/$itemId";
  static String reviewListUrl= "$_baseurl/reviews";
  static String writingReviewUrl= "$_baseurl/review";
  static String productList = "$_baseurl/products";
  static String wishListsUrl = "$_baseurl/wishlist";
  static String cartListsUrl = "$_baseurl/cart";
}