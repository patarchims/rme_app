import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hms_app/domain/models/odontogram/odontogram_model.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:sizer/sizer.dart';

import 'package:hms_app/domain/models/gigi/gigi_model.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';

enum KategoriGigi { Dewasa, Remaja }

class ButtonOdontogramWidget extends StatelessWidget {
  final GigiModel gigiModel;
  final Function(String value)? onTap;
  final List<OdontogramModel> ontogramList;

  const ButtonOdontogramWidget({
    Key? key,
    required this.gigiModel,
    this.onTap,
    required this.ontogramList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var img = ontogramList.where((e) => e.number == gigiModel.numberGigi);
    log(ontogramList.toString());
    log(gigiModel.toString());
    log(img.toString());
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!((img.isEmpty) ? gigiModel.images : img.first.imageUrl);
        }
      },
      hoverColor: ThemeColor.primaryColor.withOpacity(0.6),
      child: Padding(
        padding: EdgeInsets.all(2.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (img.isEmpty)
                ? SizedBox()
                : (img.first.imageUrl == "15" ||
                        img.first.imageUrl == "24" ||
                        img.first.imageUrl == "34" ||
                        img.first.imageUrl == "35")
                    ? SizedBox(height: 5.sp)
                    : Container(),
            Text(
              gigiModel.numberGigi.toString(),
              overflow: TextOverflow.ellipsis,
              style: blackCalibriTextStyle,
            ),
            (img.isEmpty)
                ? Image.asset(
                    "assets/odon/" + gigiModel.images + ".png",
                    height: 15.sp,
                  )
                : (img.first.imageUrl == "15" ||
                        img.first.imageUrl == "24" ||
                        img.first.imageUrl == "34" ||
                        img.first.imageUrl == "35" ||
                        img.first.imageUrl == "36" ||
                        img.first.imageUrl == "37" ||
                        img.first.imageUrl == "70" ||
                        img.first.imageUrl == "71" ||
                        img.first.imageUrl == "72" ||
                        img.first.imageUrl == "73" ||
                        img.first.imageUrl == "38")
                    ? Image.asset(
                        "assets/odon/" + img.first.imageUrl + ".png",
                        height: 20.sp,
                      )
                    : Image.asset(
                        "assets/odon/" + img.first.imageUrl + ".png",
                        height: 15.sp,
                      ),
            (img.isEmpty)
                ? SizedBox()
                : (img.first.imageUrl == "36" ||
                        img.first.imageUrl == "37" ||
                        img.first.imageUrl == "38")
                    ? SizedBox(height: 5.sp)
                    : Container(),
          ],
        ),
      ),
    );
  }
}
