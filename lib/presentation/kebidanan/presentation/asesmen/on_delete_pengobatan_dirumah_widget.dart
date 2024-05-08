// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/kebidanan/bloc/kebidanan/kebidanan_bloc.dart';
import 'package:hms_app/presentation/kebidanan/repository/riwayat_pengobatan_response_model.dart';
import 'package:sizer/sizer.dart';

import 'package:hms_app/presentation/component/component.dart';

class OnDeletePengobatanDirumahWidget extends StatelessWidget {
  final RiwayatPengobatanDirumahModel riwayatPengobatanDirumahModel;
  const OnDeletePengobatanDirumahWidget({
    super.key,
    required this.riwayatPengobatanDirumahModel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.sp,
      width: 150.sp,
      child: Scaffold(
        backgroundColor: ThemeColor.transparentColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Pesan',
                textAlign: TextAlign.center,
                style: primaryTextStyle.copyWith(
                    fontSize: 9.sp, color: ThemeColor.primaryColor)),
            Text(
              'Apakah Anda yakin ingin data ini ?',
              textAlign: TextAlign.center,
              style: greyTextStyle.copyWith(
                  fontSize: 8.sp, fontWeight: FontWeight.normal),
            ),
            Container(
              color: Colors.transparent,
              margin: EdgeInsets.only(top: 5.sp),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25.sp,
                    width: 60.sp,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ThemeColor.whiteColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.sp),
                                side: const BorderSide(
                                    color: ThemeColor.primaryColor,
                                    width: 1,
                                    style: BorderStyle.solid))),
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "Tidak",
                          style: primaryTextStyle.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 8.sp,
                              color: ThemeColor.primaryColor),
                        )),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  SizedBox(
                    height: 25.sp,
                    width: 60.sp,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: ThemeColor.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: const BorderSide(
                                    color: ThemeColor.primaryColor,
                                    width: 1,
                                    style: BorderStyle.solid))),
                        onPressed: () {
                          context.read<KebidananBloc>().add(
                              OnDeleteRiwayatPengobatanDirumahKebidanan(
                                  noReg: riwayatPengobatanDirumahModel.noreg,
                                  noRiwayat:
                                      riwayatPengobatanDirumahModel.kdRiwayat));
                          context
                              .read<KebidananBloc>()
                              .add(OnGetRiwayatPengobatanDirumah(
                                noReg: riwayatPengobatanDirumahModel.noreg,
                              ));

                          Get.back();
                        },
                        child: Text(
                          "Ya",
                          style: whiteTextStyle.copyWith(
                            fontSize: 8.sp,
                          ),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
