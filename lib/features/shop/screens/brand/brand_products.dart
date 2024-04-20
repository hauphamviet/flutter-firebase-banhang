import 'package:doan/common/widgets/appbar/appbar.dart';
import 'package:doan/common/widgets/brands/brand_card.dart';
import 'package:doan/common/widgets/products/sortable/sortable_products.dart';
import 'package:doan/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:doan/features/shop/controllers/brand_controller.dart';
import 'package:doan/features/shop/models/brand_model.dart';
import 'package:doan/utils/constants/sizes.dart';
import 'package:doan/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;

    return Scaffold(
      appBar: TAppBar(title: Text(brand.name)),
      body: SingleChildScrollView(
        child: Padding(
           padding: const EdgeInsets.all(TSizes.defaultSpace),
           child: Column(
             children: [
               /// Brand Detail
               TBrandCard(showBorder: true, brand: brand),
               const SizedBox(height: TSizes.spaceBtwSections),

               FutureBuilder(
                 future: controller.getBrandProducts(brandId: brand.id),
                 builder: (context, snapshot) {
                   
                   const loader = TVerticalProductShimmer();
                   final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                   if (widget != null) return widget;

                  final brandProducts = snapshot.data!;
                   return TSortableProducts(products: brandProducts);
                 }
               ),
             ],
           ),
        ),
      ),
    );
  }
}
