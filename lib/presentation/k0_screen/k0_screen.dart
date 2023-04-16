import 'package:flutter/material.dart';
import 'package:manav_s_application6/core/app_export.dart';
import 'package:manav_s_application6/widgets/custom_floating_button.dart';

class K0Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray100,
        body: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                padding: getPadding(
                  left: 16,
                  top: 17,
                  right: 16,
                  bottom: 17,
                ),
                decoration: AppDecoration.txtFillBlue500,
                child: Text(
                  "Employee List",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtRobotoRomanMedium18,
                ),
              ),
              Spacer(),
              CustomImageView(
                svgPath: ImageConstant.imgGroup5363,
                height: getVerticalSize(
                  218,
                ),
                width: getHorizontalSize(
                  261,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 5,
                  bottom: 338,
                ),
                child: Text(
                  "No employee records found",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtRobotoRomanMedium18Bluegray900,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: CustomFloatingButton(
          height: 50,
          width: 50,
          child: CustomImageView(
            svgPath: ImageConstant.imgPlus,
            height: getVerticalSize(
              25.0,
            ),
            width: getHorizontalSize(
              25.0,
            ),
          ),
        ),
      ),
    );
  }
}
