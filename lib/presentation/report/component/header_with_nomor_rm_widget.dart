import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:sizer/sizer.dart';

import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/resources/app_config.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:table_desk/table_desk.dart';

class HeaderWithNomorRMWidget extends StatelessWidget {
  const HeaderWithNomorRMWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;

    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 5.sp),
      child: TableDesk(
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.white, width: 1),
        ),
        child: TableDeskRow(
          border: const BorderSide(width: 1, color: Colors.white),
          gaps: [
            TableGap.weight(),
            TableGap.width(10),
            TableGap.weight(),
          ],
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              width: Get.width / 2,
              height: 40.sp,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                        SetApp.logoApp(appSetup: AppConstant.appSetup)),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        SetApp.nameApp(appSetup: AppConstant.appSetup),
                        style: blackTextStyle.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 9.sp),
                      ),
                      Text(
                        SetApp.alamatApp(appSetup: AppConstant.appSetup),
                        style: blackTextStyle.copyWith(fontSize: 4.sp),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: const VerticalDivider(),
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleText(title: "RM", subTitle: singlePasien.first.mrn),
                  titleText(
                      title: "Nama", subTitle: singlePasien.first.namaPasien),
                  titleText(
                      title: "Tanggal Lahir",
                      subTitle: (singlePasien.first.tglLahir.length > 6)
                          ? tglIndo(
                              singlePasien.first.tglLahir.substring(0, 10))
                          : ""),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container titleText({required String title, required String subTitle}) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 5.sp),
      child: TableDesk(
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.white, width: 1),
        ),
        child: TableDeskRow(
          border: const BorderSide(width: 1, color: Colors.white),
          gaps: [
            TableGap.width(150),
            TableGap.width(10),
            TableGap.weight(),
          ],
          children: [
            Container(
                color: Colors.white,
                child: Text(
                  title,
                  style: blackTextStyle.copyWith(fontSize: 5.sp),
                )),
            Container(
              color: Colors.white,
              child: Text(
                ":",
                style: blackTextStyle.copyWith(fontSize: 5.sp),
              ),
            ),
            Container(
              color: Colors.white,
              child: Text(
                subTitle,
                style: blackTextStyle.copyWith(fontSize: 5.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
