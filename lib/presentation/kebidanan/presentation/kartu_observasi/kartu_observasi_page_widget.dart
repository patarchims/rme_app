import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/alert/custom_dialog.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/component/title/title_component.dart';
import 'package:hms_app/presentation/kebidanan/bloc/kartu_observasi/kartu_observasi_bloc.dart';
import 'package:hms_app/presentation/kebidanan/presentation/kartu_observasi/tambah_kartu_observasi_page_widget.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:hms_app/presentation/screens/emty_page.dart';
import 'package:sizer/sizer.dart';

class KartuObservasiPageWidget extends StatelessWidget {
  const KartuObservasiPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KartuObservasiBloc, KartuObservasiState>(
      builder: (context, state) {
        if (state.status == KartuObservasiStaus.isLoadingGet) {
          return Expanded(
              child: HeaderContentWidget(widget: Loading.expandedLoading()));
        }

        return Expanded(
            child: HeaderContentWidget(
                backgroundColor: ThemeColor.bgColor,
                isENableAdd: true,
                onPressed: () {
                  // TAMBAH DATA
                  CustomDialogWidget.getDialog(
                      widget: SizedBox(
                          height: Get.height - 100.sp,
                          width: Get.width,
                          child: const TambahKartuObservasiPageWidget()),
                      color: ThemeColor.blueColor);
                },
                title: "TAMBAH",
                widget: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.only(
                              top: 5.sp, bottom: 0, right: 5.sp, left: 5.sp),
                          child: Table(
                              border: TableBorder.all(),
                              columnWidths: const {
                                // 0: FlexColumnWidth(0.4),
                              },
                              children: [
                                TableRow(children: [
                                  TitleWidget.headerCenterTitle2(title: "JAM"),
                                  TitleWidget.headerCenterTitle2(title: "T"),
                                  TitleWidget.headerCenterTitle2(title: "N"),
                                  TitleWidget.headerCenterTitle2(title: "P"),
                                  TitleWidget.headerCenterTitle2(title: "S"),
                                  TitleWidget.headerCenterTitle2(title: "CVP"),
                                  TitleWidget.headerCenterTitle2(title: "EKG"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "UKURAN KI"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "UKURAN KA"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "REDAKSI KI"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "REDAKSI KA"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "GERAK ANGGOTA BADAN"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "KESADARAN"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "SPUTUM WARNA"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "ISI CUP"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "KETERANGAN"),
                                  TitleWidget.headerCenterTitle2(
                                      title: "ACTION"),
                                ]),
                              ])),
                      if (state.kartuObservasi.isEmpty) ...[
                        Container(
                          height: 200.sp,
                          margin: EdgeInsets.only(right: 5.sp, left: 5.sp),
                          decoration: BoxDecoration(
                              color: ThemeColor.primaryColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(0.sp)),
                          child: EmtyScren(
                            subTitle: "Data Kosong",
                            textStyle: blackTextStyle,
                          ),
                        ),
                      ],
                      if (state.kartuObservasi.isNotEmpty) ...[
                        Container(
                            padding: EdgeInsets.only(right: 5.sp, left: 5.sp),
                            child: Table(
                                border: TableBorder.all(),
                                columnWidths: const {},
                                children: state.kartuObservasi.map((e) {
                                  return TableRow(children: [
                                    TitleWidget.contentTitle(
                                        title: e.jam.substring(11, 19)),
                                    TitleWidget.contentTitle(title: e.t),
                                    TitleWidget.contentTitle(title: e.n),
                                    TitleWidget.contentTitle(title: e.p),
                                    TitleWidget.contentTitle(title: e.s),
                                    TitleWidget.contentTitle(title: e.cvp),
                                    TitleWidget.contentTitle(title: e.ekg),
                                    TitleWidget.contentTitle(
                                        title: e.pupilKiri),
                                    TitleWidget.contentTitle(
                                        title: e.pupilKanan),
                                    TitleWidget.contentTitle(
                                        title: e.redaksiKiri),
                                    TitleWidget.contentTitle(
                                        title: e.redaksiKanan),
                                    TitleWidget.contentTitle(
                                        title: e.anggotaBadan),
                                    TitleWidget.contentTitle(
                                        title: e.kesadaran),
                                    TitleWidget.contentTitle(
                                        title: e.sputumWarna),
                                    TitleWidget.contentTitle(title: e.isiCup),
                                    TitleWidget.contentTitle(
                                        title: e.keterangan),
                                    Wrap(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              elevation: 1,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2.sp),
                                              ),
                                              backgroundColor:
                                                  ThemeColor.primaryColor),
                                          child: const Icon(
                                            FontAwesomeIcons.trash,
                                            color: Colors.red,
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2.sp),
                                              ),
                                              backgroundColor:
                                                  ThemeColor.primaryColor),
                                          onPressed: () {},
                                          child: const Icon(
                                            FontAwesomeIcons.pencil,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    )
                                  ]);
                                }).toList())),
                      ]
                    ],
                  ),
                )));
      },
    );
  }
}
