import '../k3_screen/widgets/listsun1_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:manav_s_application6/core/app_export.dart';
import 'package:manav_s_application6/widgets/custom_button.dart';
import 'package:manav_s_application6/widgets/custom_drop_down.dart';
import 'package:manav_s_application6/widgets/custom_text_form_field.dart';

class K3Screen extends StatelessWidget {
  TextEditingController group2500Controller = TextEditingController();

  List<String> dropdownItemList = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: false,
        body: Container(
          height: size.height,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: double.maxFinite,
                  padding: getPadding(
                    left: 16,
                    top: 17,
                    right: 16,
                    bottom: 17,
                  ),
                  decoration: AppDecoration.txtFillBlue500,
                  child: Text(
                    "Add Employee Details",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtRobotoRomanMedium18,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: getPadding(
                    left: 16,
                    top: 84,
                    right: 16,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        focusNode: FocusNode(),
                        controller: group2500Controller,
                        hintText: "Joseph Manadan",
                        textInputAction: TextInputAction.done,
                        prefix: Container(
                          margin: getMargin(
                            left: 8,
                            top: 8,
                            right: 12,
                            bottom: 8,
                          ),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgUser,
                          ),
                        ),
                        prefixConstraints: BoxConstraints(
                          maxHeight: getVerticalSize(
                            40,
                          ),
                        ),
                      ),
                      CustomDropDown(
                        focusNode: FocusNode(),
                        icon: Container(
                          margin: getMargin(
                            left: 30,
                            right: 8,
                          ),
                          child: CustomImageView(
                            svgPath: ImageConstant
                                .imgArrowdropdownfill1wght400grad0opsz243,
                          ),
                        ),
                        hintText: "Flutter Developer",
                        margin: getMargin(
                          top: 23,
                        ),
                        items: dropdownItemList,
                        prefix: Container(
                          margin: getMargin(
                            left: 8,
                            top: 8,
                            right: 12,
                            bottom: 8,
                          ),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgBag,
                          ),
                        ),
                        prefixConstraints: BoxConstraints(
                          maxHeight: getVerticalSize(
                            40,
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                      Padding(
                        padding: getPadding(
                          top: 23,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: getPadding(
                                all: 8,
                              ),
                              decoration: AppDecoration.outlineGray300.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder4,
                              ),
                              child: Row(
                                children: [
                                  CustomImageView(
                                    svgPath: ImageConstant
                                        .imgEventfill0wght300grad0opsz2411,
                                    height: getSize(
                                      24,
                                    ),
                                    width: getSize(
                                      24,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 9,
                                      top: 4,
                                      bottom: 2,
                                    ),
                                    child: Text(
                                      "Today",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtRobotoRomanRegular14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CustomImageView(
                              svgPath: ImageConstant.imgArrowright,
                              height: getSize(
                                20,
                              ),
                              width: getSize(
                                20,
                              ),
                              margin: getMargin(
                                top: 10,
                                bottom: 10,
                              ),
                            ),
                            Container(
                              padding: getPadding(
                                all: 8,
                              ),
                              decoration: AppDecoration.outlineGray300.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder4,
                              ),
                              child: Row(
                                children: [
                                  CustomImageView(
                                    svgPath: ImageConstant
                                        .imgEventfill0wght300grad0opsz2411,
                                    height: getSize(
                                      24,
                                    ),
                                    width: getSize(
                                      24,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 9,
                                      top: 3,
                                      bottom: 3,
                                    ),
                                    child: Text(
                                      "Till now",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtRobotoRomanRegular14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: getPadding(
                    left: 16,
                    top: 169,
                    right: 16,
                    bottom: 169,
                  ),
                  decoration: AppDecoration.fillBlack90066,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.maxFinite,
                        child: Container(
                          padding: getPadding(
                            left: 16,
                            top: 24,
                            right: 16,
                            bottom: 24,
                          ),
                          decoration: AppDecoration.fillWhiteA700.copyWith(
                            borderRadius: BorderRadiusStyle.customBorderTL16,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: CustomButton(
                                      height: getVerticalSize(
                                        36,
                                      ),
                                      text: "No date",
                                      margin: getMargin(
                                        right: 8,
                                      ),
                                      variant: ButtonVariant.FillBlue500,
                                      fontStyle: ButtonFontStyle
                                          .RobotoRomanRegular14WhiteA700,
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomButton(
                                      height: getVerticalSize(
                                        36,
                                      ),
                                      text: "Today",
                                      margin: getMargin(
                                        left: 8,
                                      ),
                                      fontStyle:
                                          ButtonFontStyle.RobotoRomanRegular14,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 24,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomImageView(
                                      svgPath: ImageConstant.imgVolume,
                                      height: getSize(
                                        24,
                                      ),
                                      width: getSize(
                                        24,
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 8,
                                        top: 2,
                                      ),
                                      child: Text(
                                        "September 2022",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtRobotoRomanMedium18Bluegray900,
                                      ),
                                    ),
                                    CustomImageView(
                                      svgPath: ImageConstant.imgPlay,
                                      height: getSize(
                                        24,
                                      ),
                                      width: getSize(
                                        24,
                                      ),
                                      margin: getMargin(
                                        left: 9,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: getVerticalSize(
                                  287,
                                ),
                                child: ListView.separated(
                                  padding: getPadding(
                                    left: 2,
                                    top: 24,
                                    right: 4,
                                    bottom: 35,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: getVerticalSize(
                                        27,
                                      ),
                                    );
                                  },
                                  itemCount: 7,
                                  itemBuilder: (context, index) {
                                    return Listsun1ItemWidget();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: getMargin(
                          bottom: 40,
                        ),
                        padding: getPadding(
                          top: 24,
                          bottom: 24,
                        ),
                        decoration: AppDecoration.outlineGray1002,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: getMargin(
                                top: 8,
                                bottom: 8,
                              ),
                              decoration: AppDecoration.fillWhiteA700,
                              child: Row(
                                children: [
                                  CustomImageView(
                                    svgPath: ImageConstant
                                        .imgEventfill0wght300grad0opsz2411,
                                    height: getVerticalSize(
                                      23,
                                    ),
                                    width: getHorizontalSize(
                                      20,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 12,
                                      top: 1,
                                      bottom: 2,
                                    ),
                                    child: Text(
                                      "No date",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtRobotoRomanRegular16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CustomButton(
                              height: getVerticalSize(
                                40,
                              ),
                              width: getHorizontalSize(
                                73,
                              ),
                              text: "Cancel",
                            ),
                            CustomButton(
                              height: getVerticalSize(
                                40,
                              ),
                              width: getHorizontalSize(
                                73,
                              ),
                              text: "Save",
                              variant: ButtonVariant.FillBlue500,
                              fontStyle:
                                  ButtonFontStyle.RobotoRomanMedium14WhiteA700,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              padding: getPadding(
                left: 16,
                top: 12,
                right: 16,
                bottom: 12,
              ),
              decoration: AppDecoration.outlineGray1001,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    height: getVerticalSize(
                      40,
                    ),
                    width: getHorizontalSize(
                      73,
                    ),
                    text: "Cancel",
                  ),
                  CustomButton(
                    height: getVerticalSize(
                      40,
                    ),
                    width: getHorizontalSize(
                      73,
                    ),
                    text: "Save",
                    margin: getMargin(
                      left: 16,
                    ),
                    variant: ButtonVariant.FillBlue500,
                    fontStyle: ButtonFontStyle.RobotoRomanMedium14WhiteA700,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
