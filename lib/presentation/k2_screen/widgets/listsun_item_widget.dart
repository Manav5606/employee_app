import 'package:flutter/material.dart';
import 'package:manav_s_application6/core/app_export.dart';

// ignore: must_be_immutable
class ListsunItemWidget extends StatelessWidget {
  ListsunItemWidget();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Padding(
        padding: getPadding(
          right: 27,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Sun",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtRobotoRomanRegular15,
            ),
            Padding(
              padding: getPadding(
                top: 66,
              ),
              child: Text(
                "4",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtRobotoRomanRegular15Blue500,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: getPadding(
                  left: 4,
                  top: 23,
                ),
                child: Text(
                  "11",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtRobotoRomanRegular15,
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                top: 24,
              ),
              child: Text(
                "18",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtRobotoRomanRegular15,
              ),
            ),
            Padding(
              padding: getPadding(
                top: 24,
              ),
              child: Text(
                "25",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtRobotoRomanRegular15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
