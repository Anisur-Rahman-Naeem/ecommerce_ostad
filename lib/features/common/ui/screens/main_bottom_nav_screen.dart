import 'package:ecommerce_ostad/features/cart/ui/screens/cart_list_screen.dart';
import 'package:ecommerce_ostad/features/category/ui/screens/category_list_screen.dart';
import 'package:ecommerce_ostad/features/common/ui/controller/category_list_controller.dart';
import 'package:ecommerce_ostad/features/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:ecommerce_ostad/features/home/ui/controllers/popular_product_list_controller.dart';
import 'package:ecommerce_ostad/features/home/ui/controllers/product_list_by_remark_controller.dart';
import 'package:ecommerce_ostad/features/home/ui/controllers/home_banner_list_controller.dart';
import 'package:ecommerce_ostad/features/home/ui/screens/home_screen.dart';
import 'package:ecommerce_ostad/features/wishlist/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static const String name = '/bottom-nav-screen';
  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final MainBottomNavController bottomNavController = Get.find<
      MainBottomNavController>();
  final HomeBannerListController _homeBannerListController =
  Get.find<HomeBannerListController>();

  @override
  void initState() {
    super.initState();
    _homeBannerListController.getHomeBannerList();
    Get.find<CategoryListController>().getCategoryList();
    Get.find<PopularProductListController>().getProductList();
  }
  final List<Widget> _screens = const [
    HomeScreen(),
    CategoryListScreen(),
    CartListScreen(),
    WishListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (bottomNavController) {
        return Scaffold(
          body: _screens[bottomNavController.selectedIndex],
          bottomNavigationBar: NavigationBar(
              selectedIndex:bottomNavController.selectedIndex,
              onDestinationSelected: bottomNavController.changeIndex,
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                NavigationDestination(
                    icon: Icon(Icons.category), label: 'Categories'),
                NavigationDestination(
                    icon: Icon(Icons.shopping_cart), label: 'Cart'),
                NavigationDestination(
                    icon: Icon(Icons.favorite_border), label: 'Wishlist'),
              ]),
        );
      }
    );
  }
}
