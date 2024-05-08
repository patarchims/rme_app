import 'package:flutter/material.dart';

import 'package:hms_app/domain/models/gigi/gigi_model.dart';
import 'package:hms_app/domain/models/odontogram/odontogram_model.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:sizer/sizer.dart';

class BoxGigiDisableWidget extends StatelessWidget {
  final GigiModel gigiModel;
  final List<OdontogramModel> ontogramList;
  const BoxGigiDisableWidget({
    super.key,
    required this.gigiModel,
    required this.ontogramList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          gigiModel.numberGigi.toString(),
          overflow: TextOverflow.ellipsis,
          style: blackCalibriTextStyle,
        ),
        (gigiModel.kategori == GigiKategori.geraham)
            ? Image.asset(
                "assets/odon/48.png",
                height: 15.sp,
              )
            : Image.asset(
                "assets/odon/49.png",
                height: 15.sp,
              )
      ],
    );
  }
}
