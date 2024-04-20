import 'package:doan/common/widgets/appbar/appbar.dart';
import 'package:doan/common/widgets/appbar/tabbar.dart';
import 'package:doan/common/widgets/containers/search_container.dart';
import 'package:doan/common/widgets/layouts/grid_layout.dart';
import 'package:doan/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:doan/common/widgets/texts/section_heading.dart';
import 'package:doan/features/shop/controllers/category_controller.dart';
import 'package:doan/features/shop/screens/brand/all_brands.dart';
import 'package:doan/features/shop/screens/brand/brand_products.dart';
import 'package:doan/features/shop/screens/store/widgets/category_tab.dart';
import 'package:doan/utils/constants/colors.dart';
import 'package:doan/utils/constants/sizes.dart';
import 'package:doan/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/shimmers/brands_shimmer.dart';
import '../../controllers/brand_controller.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: const [TCartCounterIcon()],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: 440,
              automaticallyImplyLeading: false,
              backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,

              flexibleSpace: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    /// Search
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const TSearchContainer(
                        text: 'Search in Store', showBorder: true, showBackground: false, padding: EdgeInsets.zero),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    /// Featured Brands
                    TSectionHeading(title: 'Featured Brands', onPressed: () => Get.to(() => const AllBrandsScreen())),
                    const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                    /// Brands GRID
                    Obx(
                      (){
                        if (brandController.isLoading.value) return const TBrandsShimmer();
                        
                        if (brandController.featuredBrands.isEmpty) {
                          return Center(
                            child: Text('No Data Found', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
                        }

                        return TGridLayout(
                            itemCount: brandController.featuredBrands.length,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              final brand = brandController.featuredBrands[index];

                              return TBrandCard(showBorder: true, brand: brand, onTap: () => Get.to(() => BrandProducts(brand: brand)),);
                            }
                        );
                      }
                    ),
                  ],
                ),
              ),
              /// Tabs
              bottom: TTabBar(tabs: categories.map((category) => Tab(child: Text(category.name))).toList()),
            ),
          ];
        },

          body: TabBarView(
            children: categories.map((category) => TCategoryTab(category: category)).toList()
          ),
        ),
      ),
    );
  }
}

