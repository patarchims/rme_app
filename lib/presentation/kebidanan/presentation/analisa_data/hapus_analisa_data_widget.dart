// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/perina/bloc/analisa/analisa_bloc.dart';
import 'package:sizer/sizer.dart';

import 'package:hms_app/presentation/component/component.dart';

class HapusAnalisaDataWidget extends StatelessWidget {
  final String kodeAnalisa;
  const HapusAnalisaDataWidget({
    super.key,
    required this.kodeAnalisa,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 2.5,
      margin: EdgeInsets.all(5.sp),
      height: 50.sp,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.sp)),
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
              'Apakah Anda yakin menghapus data ini?',
              textAlign: TextAlign.center,
              style: greyTextStyle.copyWith(
                  fontSize: 8.sp, fontWeight: FontWeight.normal),
            ),
            Container(
              color: Colors.transparent,
              margin: EdgeInsets.only(top: 5.sp),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width / 4 - 3.5 * 24,
                    height: 25.sp,
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
                  Expanded(
                      child: SizedBox(
                    height: 25.sp,
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
                          context.read<AnalisaBloc>().add(
                              OnDeleteAnalisaKeperawatan(
                                  kodeAnalisa: kodeAnalisa));

                          Get.back();
                        },
                        child: Text(
                          "Ya",
                          style: whiteTextStyle.copyWith(
                            fontSize: 8.sp,
                          ),
                        )),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
