import 'package:flutter/material.dart';
import 'package:recipe_finder/core/constant/design/color_constant.dart';
import 'package:recipe_finder/core/extension/context_extension.dart';
import 'package:recipe_finder/product/widget/alert_dialog/question_alert_dialog.dart';
import 'package:recipe_finder/product/widget/button/recipe_circular_button.dart';

import '../../../core/constant/navigation/navigation_constants.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../product/widget/button/drawer_button.dart';

class DrawerMyAccountView extends StatelessWidget {
  const DrawerMyAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.instance.russianViolet,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstants.instance.russianViolet,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back,
                    color: ColorConstants.instance.white)),
            Text(
              'My Account',
              style: TextStyle(color: ColorConstants.instance.white),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Container(
          height: context.screenHeight,
          width: context.screenWidth,
          decoration: BoxDecoration(
            color: ColorConstants.instance.white,
            borderRadius: context.radiusTopCircularHigh,
          ),
          child: Column(children: [
            context.mediumSizedBox,
          ]),
        ),
      ),
    );
  }
}
