import 'package:doan/common/widgets/appbar/appbar.dart';
import 'package:doan/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';
import 'package:doan/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:doan/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:doan/utils/constants/colors.dart';
import 'package:doan/utils/constants/sizes.dart';
import 'package:doan/utils/device/device_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/products/ratings/rating_indicator.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Appbar
      appBar: TAppBar(title: Text('Reviews & Rating'), showBackArrow: true),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Rating and reviews are verified and are from people who use the same type of device that you see"),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Overall Product Rating
              const TOverallProductRating(),
              const TRatingBarIndicator(rating: 3.5),
              Text("12,611", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// User Reviews List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
