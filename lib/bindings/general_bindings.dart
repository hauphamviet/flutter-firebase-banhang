import 'package:doan/features/shop/controllers/product/cart_controller.dart';
import 'package:doan/features/shop/controllers/product/variation_controller.dart';
import 'package:doan/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

import '../features/shop/controllers/product/checkout_controller.dart';

class GeneralBindings extends Bindings {

  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(CheckoutController());
    //Get.lazyPut(()=>CartController());


  }
}