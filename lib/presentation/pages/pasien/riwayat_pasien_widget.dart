import 'package:flutter/material.dart';

import 'package:hms_app/domain/models/response/detail_pasien_model_response.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:sizer/sizer.dart';

class RiwayatPasienWidget extends StatelessWidget {
  final List<RiwayatPasienModel> riwayatPasien;
  const RiwayatPasienWidget({
    super.key,
    required this.riwayatPasien,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: riwayatPasien
          .asMap()
          .entries
          .map((e) => Container(
                padding: EdgeInsets.all(2.sp),
                margin: EdgeInsets.only(bottom: 2.sp),
                decoration: BoxDecoration(
                    color: Colors.lightBlue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(
                      2.sp,
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "NO. ${e.key + 1}",
                      style: whiteCalibriTextStyle.copyWith(fontSize: 5.sp),
                    ),
                    Text(
                      e.value.noreg,
                      style: whiteCalibriTextStyle.copyWith(
                          fontSize: 5.sp,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.solid,
                          decorationColor: Colors.white),
                    ),
                    Text(
                      "Umur Pasien : ${e.value.noreg}",
                      style: whiteCalibriTextStyle.copyWith(fontSize: 5.sp),
                    ),
                    Text(
                      "Tujuan : ${e.value.bagian}",
                      style: whiteCalibriTextStyle.copyWith(fontSize: 5.sp),
                    ),
                    Text(
                      "Dokter : ${e.value.dokter}",
                      style: whiteCalibriTextStyle.copyWith(fontSize: 5.sp),
                    ),
                    Text(
                      "Debitur : ${e.value.debitur}",
                      style: whiteCalibriTextStyle.copyWith(fontSize: 5.sp),
                    ),
                    Text(
                      "No. SEP : ${e.value.noSep}",
                      style: whiteCalibriTextStyle.copyWith(fontSize: 5.sp),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
