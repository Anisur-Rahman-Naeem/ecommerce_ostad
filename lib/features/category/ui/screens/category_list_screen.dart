import 'package:ecommerce_ostad/features/common/ui/controller/category_list_controller.dart';
import 'package:ecommerce_ostad/features/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:ecommerce_ostad/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerce_ostad/features/home/ui/widgets/category_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  static const name = "/category-list-screen";

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  final CategoryListController _categoryListController = Get.find<CategoryListController>();
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController.addListener(loadMoreData);
    _categoryListController.getCategoryList();
    super.initState();
  }

  void loadMoreData(){
      if(_scrollController.position.extentAfter<300) {
        _categoryListController.getCategoryList();
      }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) => _onPop,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: _onPop,
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text("Category list"),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Get.find<CategoryListController>().refreshCategoryList();
          },
          child: GetBuilder<CategoryListController>(
            builder: (controller) {
              if (controller.initialInProgress) {
                return const CenteredCircularProgressIndicator();
              }

              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      controller: _scrollController,
                        itemCount: controller.categoryList.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, crossAxisSpacing: 4, mainAxisSpacing: 16),
                        itemBuilder: (context, index) {
                          return FittedBox(
                            child: CategoryitemWIdget(categoryModel: controller.categoryList[index],),
                          );
                        }),
                  ),
                  Visibility(
                      visible: controller.inProgress,
                      child: const LinearProgressIndicator()),
                ],
              );
            }
          ),
        ),
      ),
    );
  }

  void _onPop() {
    Get.find<MainBottomNavController>().backToHome();
  }
}
