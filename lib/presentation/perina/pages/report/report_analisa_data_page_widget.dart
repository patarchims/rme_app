import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/component/qr_code/qr_code_widget.dart';
import 'package:hms_app/presentation/perina/bloc/report_asesmen_bayi/report_asesmen_bayi_bloc.dart';
import 'package:hms_app/presentation/report/component/header_report_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class ReportAnalisaDataPageWidget extends StatefulWidget {
  const ReportAnalisaDataPageWidget({super.key});

  @override
  State<ReportAnalisaDataPageWidget> createState() =>
      _ReportAnalisaDataPageWidgetState();
}

class _ReportAnalisaDataPageWidgetState
    extends State<ReportAnalisaDataPageWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);
    // AuthState authState = context.watch<AuthBloc>().state;

    return BlocConsumer<ReportAsesmenBayiBloc, ReportAsesmenBayiState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.status == ReportAsesmenBayiStatus.isLoadingGet) {
          return Scaffold(
            backgroundColor: ThemeColor.transparentColor,
            body: Loading.expandedLoading(),
          );
        }

        return Scaffold(
            backgroundColor: ThemeColor.transparentColor,
            body: Container(
              width: Get.width,
              height: Get.height,
              margin: EdgeInsets.all(2.sp),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                    style: BorderStyle.solid,
                  )),
              child: RawScrollbar(
                thumbColor: ThemeColor.darkColor,
                thumbVisibility: true,
                interactive: true,
                thickness: 5.sp,
                controller: _scrollController,
                trackVisibility: false,
                radius: Radius.circular(5.sp),
                child: ListView(
                  controller: _scrollController,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 5.sp),
                        child: Text("RM. 12",
                            textAlign: TextAlign.right,
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.sp),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.sp),
                            child: const HeaderAllWidget(),
                          ),
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 5.sp),
                            child: TableDesk(
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Colors.white, width: 1),
                              ),
                              child: TableDeskRow(
                                border: const BorderSide(
                                    width: 1, color: Colors.white),
                                gaps: [
                                  TableGap.weight(),
                                  TableGap.width(10),
                                  TableGap.weight(),
                                ],
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white),
                                    width: Get.width / 2.5,
                                    height: 40.sp,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "ANALISA DATA",
                                          textAlign: TextAlign.center,
                                          style: blackTextStyle.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 9.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    child: const VerticalDivider(),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TitleWidget.titleText(
                                            title: "RM",
                                            subTitle: singlePasien.first.mrn),
                                        TitleWidget.titleText(
                                            title: "Nama",
                                            subTitle:
                                                singlePasien.first.namaPasien),
                                        TitleWidget.titleText(
                                            title: "Tanggal Lahir",
                                            subTitle: (singlePasien
                                                        .first.tglLahir.length >
                                                    6)
                                                ? tglIndo(singlePasien
                                                    .first.tglLahir
                                                    .substring(0, 10))
                                                : ""),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Divider(),
                          SizedBox(
                            height: 5.sp,
                          ),
                          SizedBox(
                              child: Table(
                                  border: TableBorder.all(),
                                  columnWidths: const {
                                0: FlexColumnWidth(0.5),
                                1: FlexColumnWidth(1),
                              },
                                  children: [
                                TableRow(children: [
                                  TitleWidget.headerCenterTitle2(
                                      title: "NO.", color: Colors.white),
                                  TitleWidget.headerCenterTitle2(
                                      title: "Tgl/Jam\nDitemukan",
                                      color: Colors.white),
                                  TitleWidget.headerCenterTitle2(
                                      title: "DATA", color: Colors.white),
                                  TitleWidget.headerCenterTitle2(
                                      title: "PROBLEM", color: Colors.white),
                                  TitleWidget.headerCenterTitle2(
                                      title: "Tgl/Jam\nTeratasi",
                                      color: Colors.white),
                                  TitleWidget.headerCenterTitle2(
                                      title: "NAMA \nPERAWAT",
                                      color: Colors.white),
                                ]),
                              ])),
                          if (state.analisaData.isEmpty) ...[
                            SizedBox(
                                child: Table(
                                    border: TableBorder.all(),
                                    columnWidths: const {
                                  0: FlexColumnWidth(0.5),
                                },
                                    children: [
                                  TableRow(children: [
                                    TitleWidget.emtyTitle(),
                                    TitleWidget.emtyTitle(),
                                    TitleWidget.emtyTitle(),
                                    TitleWidget.emtyTitle(),
                                    TitleWidget.emtyTitle(),
                                    TitleWidget.emtyTitle(),
                                  ]),
                                ])),
                            SizedBox(
                              height: 15.sp,
                            )
                          ],
                          if (state.analisaData.isNotEmpty) ...[
                            ...state.analisaData.asMap().entries.map(
                                  (e) => SizedBox(
                                      child: Table(
                                          border: TableBorder.all(),
                                          columnWidths: const {
                                        0: FlexColumnWidth(0.5),
                                        1: FlexColumnWidth(1),
                                      },
                                          children: [
                                        TableRow(children: [
                                          TitleWidget.headerLeftTitle(
                                              title: (e.key + 1).toString(),
                                              color: Colors.white),
                                          TitleWidget.headerLeftTitle(
                                              title:
                                                  "${e.value.insertDttm.substring(0, 10)}\n/${e.value.insertDttm.substring(11, 19)}",
                                              color: Colors.white),
                                          TitleWidget.headerLeftTitle(
                                              title: e.value.data,
                                              color: Colors.white),
                                          Container(
                                            padding: EdgeInsets.all(2.sp),
                                            child: Wrap(
                                                children: e.value.analisaData
                                                    .map((e) => Text(
                                                          "${e.idDiagnosa}-${e.namaDiagnosa} ,",
                                                          style: blackTextStyle
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      5.sp),
                                                        ))
                                                    .toList()),
                                          ),
                                          TitleWidget.headerLeftTitle(
                                              title:
                                                  "Tgl: ${tglIndo(e.value.tgl)}\nJam: ${e.value.jam}",
                                              color: Colors.white),
                                          Column(
                                            children: [
                                              BarcodeGreenWidget(
                                                height: 25.sp,
                                                dataBarcode:
                                                    e.value.pegawai.nama,
                                              ),
                                              Text(
                                                e.value.pegawai.nama,
                                                textAlign: TextAlign.center,
                                                style: blackTextStyle.copyWith(
                                                    fontSize: 5.sp),
                                              )
                                            ],
                                          )
                                        ]),
                                      ])),
                                ),
                            SizedBox(
                              height: 15.sp,
                            )
                          ]
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
