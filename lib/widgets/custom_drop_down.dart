import 'package:flutter/material.dart';
import 'package:manav_s_application6/core/app_export.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.focusNode,
      this.icon,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.items,
      this.onChanged,
      this.selectedItem,
      this.selectedValue,
      this.key,
      this.validator});

  DropDownShape? shape;

  DropDownPadding? padding;

  DropDownVariant? variant;

  DropDownFontStyle? fontStyle;

  Alignment? alignment;
  Key? key;
  double? width;

  EdgeInsetsGeometry? margin;

  FocusNode? focusNode;

  Widget? icon;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;
  String? selectedItem;

  String? selectedValue;
  List<String>? items;

  Function(String)? onChanged;

  FormFieldValidator<String>? validator;

  // @override
  // Widget build(BuildContext context) {
  //   return alignment != null
  //       ? Align(
  //           alignment: alignment ?? Alignment.center,
  //           child: _buildDropDownWidget(),
  //         )
  //       : _buildDropDownWidget();
  // }

  // _buildDropDownWidget() {
  //   return Container(
  //     width: width ?? double.maxFinite,
  //     margin: margin,
  //     child: DropdownButtonFormField(
  //       focusNode: focusNode,
  //       icon: icon,
  //       style: _setFontStyle(),
  //       decoration: _buildDecoration(),
  //       items: items?.map<DropdownMenuItem<String>>((String value) {
  //         return DropdownMenuItem<String>(
  //           value: value,
  //           child: Text(
  //             value,
  //             overflow: TextOverflow.ellipsis,
  //           ),
  //         );
  //       }).toList(),
  //       onChanged: (value) {
  //         onChanged!(value.toString());
  //       },
  //       validator: validator,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildDropDownWidget(context),
          )
        : _buildDropDownWidget(context);
  }

  _buildDropDownWidget(BuildContext context) {
    return Container(
      key: key,
      decoration: BoxDecoration(),
      width: width ?? double.maxFinite,
      margin: margin,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext context) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < items!.length; i++)
                      Column(
                        children: [
                          ListTile(
                            title: Text(items![i]),
                            onTap: () {
                              Navigator.pop(context, items![i]);
                            },
                          ),
                          if (i != items!.length - 1)
                            Divider(color: Colors.grey),
                        ],
                      ),
                  ],
                ),
              );
            },
          ).then((value) {
            if (value != null) {
              onChanged!(value.toString());
            }
          });
        },
        child: InputDecorator(
          decoration: _buildDecoration(),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  selectedValue ?? "Flutter Developer",
                  style: _setFontStyle(),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              icon ?? Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: _setFontStyle(),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      default:
        return TextStyle(
          color: ColorConstant.blueGray900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          height: getVerticalSize(
            1.19,
          ),
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            4.00,
          ),
        );
    }
  }

  _setBorderStyle() {
    switch (variant) {
      case DropDownVariant.OutlineGray300:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.gray300,
            width: 1,
          ),
        );
      case DropDownVariant.None:
        return InputBorder.none;
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.gray300,
            width: 1,
          ),
        );
    }
  }

  _setFilled() {
    switch (variant) {
      case DropDownVariant.OutlineGray300:
        return false;
      case DropDownVariant.None:
        return false;
      default:
        return false;
    }
  }

  _setPadding() {
    switch (padding) {
      default:
        return getPadding(
          top: 10,
          bottom: 10,
        );
    }
  }
}

enum DropDownShape {
  RoundedBorder4,
}

enum DropDownPadding {
  PaddingT10,
}

enum DropDownVariant {
  None,
  OutlineGray300,
}

enum DropDownFontStyle {
  RobotoRomanRegular16,
}
