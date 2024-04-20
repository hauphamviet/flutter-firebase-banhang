
import 'package:doan/common/widgets/loaders/loader.dart';
import 'package:doan/common/widgets/success_screen/success_screen.dart';
import 'package:doan/data/repositories/authentication/authentication_repository.dart';
import 'package:doan/features/shop/controllers/product/cart_controller.dart';
import 'package:doan/features/shop/controllers/product/checkout_controller.dart';
import 'package:doan/features/shop/models/order_model.dart';
import 'package:doan/navigation_menu.dart';
import 'package:doan/utils/constants/enums.dart';
import 'package:doan/utils/constants/image_strings.dart';
import 'package:doan/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/order/order_repository.dart';

class OrderController extends GetxController {

  // Variables
  final cartController = CartController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  // Fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrder = await orderRepository.fetchUserOrder();
      return userOrder;
    } catch (e) {
      TLoaders.warningSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    }
  }

  // Add methods for order processing
  void processOrder(double totalAmount) async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing your order', TImages.animalIcon);

      final userId = AuthenticationRepository.instance.authUser.uid;
      if (userId.isEmpty) return;

      // Add Detail
      final order = OrderModel(
          id: UniqueKey().toString(),
          userId: userId,
          status: OrderStatus.pending,
          totalAmount: totalAmount,
          orderDate: DateTime.now(),
          paymentMethod: checkoutController.selectedPaymentMethod.value.name,
          deliveryDate: DateTime.now(),
          items: cartController.cartItems.toList(),
      );
      
      // Save
      await orderRepository.saveOrder(order, userId);
      
      // Update
      cartController.clearCart();
      
      // Update the cart 
      Get.off(() => SuccessScreen(
          image: TImages.visa,
          title: 'Payment Success', 
          subTitle: 'Your item will be shipped soon', 
          onPressed: () => Get.offAll(() => const NavigationMenu()),
      ));
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }




}