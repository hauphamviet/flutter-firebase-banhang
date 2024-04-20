import 'package:doan/common/widgets/appbar/appbar.dart';
import 'package:doan/common/widgets/loaders/animation_loader.dart';
import 'package:doan/features/shop/controllers/product/cart_controller.dart';
import 'package:doan/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:doan/features/shop/screens/checkout/checkout.dart';
import 'package:doan/navigation_menu.dart';
import 'package:doan/utils/constants/image_strings.dart';
import 'package:doan/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title:
              Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: Obx(
        () {
          // Nothing Found Widget
          final emptyWidget = TAnimationLoaderWidget(
            text: 'Whoops! Cart is Empty',
            animation: TImages.animalIcon,
            showAction: true,
            actionText: 'Lest\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          if (controller.cartItems.isEmpty) {
            return emptyWidget;
          } else {
            return const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),

                /// Items in Cart
                child: TCartItems(),
              ),
            );
          }
        },
      ),

      /// Checkout
      bottomNavigationBar: controller.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: ElevatedButton(
                onPressed: () => Get.to(() => const CheckoutScreen()),
                child: Obx(() =>
                    Text('Checkout  \$${controller.totalCartPrice.value}')),
              ),
            ),
    );
  }
}
