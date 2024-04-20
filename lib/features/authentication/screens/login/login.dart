import 'package:doan/common/styles/spacing_styles.dart';
import 'package:doan/features/authentication/screens/login/widgets/login_form.dart';
import 'package:doan/features/authentication/screens/login/widgets/login_header.dart';
import 'package:doan/utils/constants/colors.dart';
import 'package:doan/utils/constants/image_strings.dart';
import 'package:doan/utils/constants/sizes.dart';
import 'package:doan/utils/constants/text_strings.dart';
import 'package:doan/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const TLoginHeader(),

              const TLoginForm(),

              /// Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),
              /// Footer
              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}