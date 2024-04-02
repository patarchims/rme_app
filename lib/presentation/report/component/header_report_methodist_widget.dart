import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:hms_app/presentation/component/resources/app_config.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:sizer/sizer.dart';

class HeaderReportMethodistWidget extends StatelessWidget {
  const HeaderReportMethodistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return Column(
      children: [
        SizedBox(
          width: Get.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                SetApp.logoApp(
                  appSetup: AppConstant.appSetup,
                ),
                height: 35.sp,
              ),
              SizedBox(
                width: Get.width / 2.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      SetApp.nameApp(appSetup: AppConstant.appSetup)
                          .toUpperCase(),
                      style: blackTextStyle.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 12.sp),
                    ),
                    Text(
                      SetApp.alamatApp(appSetup: AppConstant.appSetup),
                      textAlign: TextAlign.center,
                      style: blackTextStyle.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 6.sp),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                height: 50.sp,
                margin: EdgeInsets.only(left: 5.sp),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(2.sp))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleWidget.titleText(
                        title: "RM", subTitle: singlePasien.first.mrn),
                    TitleWidget.titleText(
                        title: "Nama", subTitle: singlePasien.first.namaPasien),
                    TitleWidget.titleText(
                        title: "Jenis Kelamin",
                        subTitle: singlePasien.first.jenisKelamin),
                    TitleWidget.titleText(
                        title: "Tanggal Lahir",
                        subTitle: (singlePasien.first.tglLahir.length > 6)
                            ? tglIndo(
                                singlePasien.first.tglLahir.substring(0, 10))
                            : ""),
                  ],
                ),
              )),
            ],
          ),
        ),
        SizedBox(
          height: 5.sp,
        ),
        Divider(
          height: 1.sp,
          color: ThemeColor.blackColor,
          thickness: 2.sp,
        ),
      ],
    );
  }
}
