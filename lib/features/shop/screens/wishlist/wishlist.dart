import 'package:doan/common/widgets/appbar/appbar.dart';
import 'package:doan/common/widgets/icons/t_circular.dart';
import 'package:doan/common/widgets/layouts/grid_layout.dart';
import 'package:doan/common/widgets/loaders/animation_loader.dart';
import 'package:doan/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:doan/features/shop/controllers/product/favourites_controller.dart';
import 'package:doan/features/shop/screens/home/home.dart';
import 'package:doan/navigation_menu.dart';
import 'package:doan/utils/constants/image_strings.dart';
import 'package:doan/utils/constants/sizes.dart';
import 'package:doan/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen())),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),

            child: Obx(
              () => FutureBuilder(
                future: controller.favoriteProducts(),
                builder: (context, snapshot) {
                  /// Nothing Found Widget
                  final emptyWidget = TAnimationLoaderWidget(
                    text: 'Whoops! Wishlist is Empty...',
                    animation: TImages.animalIcon,
                    showAction: true,
                    actionText: 'Let\'s add some',
                    onActionPressed: () => Get.off(() => const NavigationMenu()),
                  );

                  const loader = TVerticalProductShimmer(itemCount: 6);
                  final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader, nothingFound: emptyWidget);
                  if (widget != null) return widget;

                  final products = snapshot.data!;

                  return Column(
                    children: [
                      TGridLayout(itemCount: products.length, itemBuilder: (_, index) => TProductCardVertical(product: products[index])),
                    ],
                  );
                }
              ),
            ),
        ),
      ),
    );
  }
}
