import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/component/qr_code/custom_qr_widget.dart';
import 'package:hms_app/presentation/report/bloc/report_igd/report_igd_bloc.dart';
import 'package:hms_app/presentation/report/component/ceklist_widget.dart';
import 'package:hms_app/presentation/report/component/header_report_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class ReportRingkasanMasukDanKeluarContentWidget extends StatefulWidget {
  const ReportRingkasanMasukDanKeluarContentWidget({super.key});

  @override
  State<ReportRingkasanMasukDanKeluarContentWidget> createState() =>
      _ReportRingkasanMasukDanKeluarContentWidgetState();
}

class _ReportRingkasanMasukDanKeluarContentWidgetState
    extends State<ReportRingkasanMasukDanKeluarContentWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocBuilder<ReportIgdBloc, ReportIgdState>(
      builder: (context, state) {
        if (state.status == ReportIgdStatus.loading) {
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
                  color: Colors.white,
                  width: 1,
                  style: BorderStyle.solid,
                )),
            child: RawScrollbar(
              thumbColor: ThemeColor.darkColor,
              thumbVisibility: true,
              interactive: true,
              thickness: 10.sp,
              controller: _scrollController,
              trackVisibility: false,
              radius: Radius.circular(5.sp),
              child: ListView(
                controller: _scrollController,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.sp),
                    child: const HeaderAllWidget(),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 5.sp, vertical: 5.sp),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          // color: Colors.white,
                          width: 1,
                          style: BorderStyle.solid,
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // TAMPILKAN DATA
                        // =================== NAMA PASIEN
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white, width: 1),
                            ),
                            child: Container(
                              color: Colors.white,
                              child: TableDeskRow(
                                border: const BorderSide(
                                    width: 1, color: Colors.white),
                                gaps: [
                                  TableGap.width(300),
                                  TableGap.weight(),
                                ],
                                children: [
                                  Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        "Nama Pasien",
                                        style: blackTextStyle.copyWith(),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  TableDeskColumn(
                                    border: const BorderSide(
                                        width: 1, color: Colors.black),
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: TableDeskColumn(
                                          border: const BorderSide(
                                              width: 1, color: Colors.black),
                                          children: [
                                            Container(
                                              color: Colors.white,
                                              child: TableDeskRow(
                                                border: const BorderSide(
                                                    width: 1,
                                                    color: Colors.white),
                                                gaps: [
                                                  TableGap.width(30),
                                                  TableGap.weight(),
                                                ],
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      ":",
                                                      style: blackTextStyle
                                                          .copyWith(),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Wrap(
                                                      children: singlePasien
                                                          .first.namaPasien
                                                          .split("")
                                                          .map((e) => Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        right: 2
                                                                            .sp,
                                                                        bottom: 2
                                                                            .sp,
                                                                        left: 2
                                                                            .sp),
                                                                height: 15.sp,
                                                                width: 15.sp,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .black),
                                                                    color: Colors
                                                                        .transparent),
                                                                child: Center(
                                                                  child: Text(
                                                                    e,
                                                                    style:
                                                                        blackTextStyle,
                                                                  ),
                                                                ),
                                                              ))
                                                          .toList(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white, width: 1),
                            ),
                            child: Container(
                              color: Colors.white,
                              child: TableDeskRow(
                                border: const BorderSide(
                                    width: 1, color: Colors.white),
                                gaps: [
                                  TableGap.width(300),
                                  TableGap.weight(),
                                ],
                                children: [
                                  Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        "Tanggal Lahir",
                                        style: blackTextStyle.copyWith(),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  TableDeskColumn(
                                    border: const BorderSide(
                                        width: 1, color: Colors.black),
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: TableDeskColumn(
                                          border: const BorderSide(
                                              width: 1, color: Colors.black),
                                          children: [
                                            Container(
                                              color: Colors.white,
                                              child: TableDeskRow(
                                                border: const BorderSide(
                                                    width: 1,
                                                    color: Colors.white),
                                                gaps: [
                                                  TableGap.width(30),
                                                  TableGap.weight(),
                                                ],
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      ":",
                                                      style: blackTextStyle
                                                          .copyWith(),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Row(
                                                      children: [
                                                        ...singlePasien
                                                            .first.tglLahir
                                                            .substring(0, 10)
                                                            .split("")
                                                            .map((e) =>
                                                                Container(
                                                                  margin: EdgeInsets.only(
                                                                      right:
                                                                          2.sp,
                                                                      bottom:
                                                                          2.sp,
                                                                      left:
                                                                          2.sp),
                                                                  height: 15.sp,
                                                                  width: 15.sp,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: Colors
                                                                              .black),
                                                                      color: Colors
                                                                          .transparent),
                                                                  child: Center(
                                                                    child: Text(
                                                                      e,
                                                                      style:
                                                                          blackTextStyle,
                                                                    ),
                                                                  ),
                                                                )),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white, width: 1),
                            ),
                            child: Container(
                              color: Colors.white,
                              child: TableDeskRow(
                                border: const BorderSide(
                                    width: 1, color: Colors.white),
                                gaps: [
                                  TableGap.width(300),
                                  TableGap.weight(),
                                ],
                                children: [
                                  Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        "Nomor Rekam Medis",
                                        style: blackTextStyle.copyWith(),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  TableDeskColumn(
                                    border: const BorderSide(
                                        width: 1, color: Colors.black),
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: TableDeskColumn(
                                          border: const BorderSide(
                                              width: 1, color: Colors.black),
                                          children: [
                                            Container(
                                              color: Colors.white,
                                              child: TableDeskRow(
                                                border: const BorderSide(
                                                    width: 1,
                                                    color: Colors.white),
                                                gaps: [
                                                  TableGap.width(30),
                                                  TableGap.weight(),
                                                ],
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      ":",
                                                      style: blackTextStyle
                                                          .copyWith(),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Wrap(
                                                      children: [
                                                        ...singlePasien
                                                            .first.mrn
                                                            .split("")
                                                            .map((e) =>
                                                                Container(
                                                                  margin: EdgeInsets.only(
                                                                      right:
                                                                          2.sp,
                                                                      bottom:
                                                                          2.sp,
                                                                      left:
                                                                          2.sp),
                                                                  height: 15.sp,
                                                                  width: 15.sp,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: Colors
                                                                              .black),
                                                                      color: Colors
                                                                          .transparent),
                                                                  child: Center(
                                                                    child: Text(
                                                                      e,
                                                                      style:
                                                                          blackTextStyle,
                                                                    ),
                                                                  ),
                                                                )),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // ================= NOMOR REGISTER
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white, width: 1),
                            ),
                            child: Container(
                              color: Colors.white,
                              child: TableDeskRow(
                                border: const BorderSide(
                                    width: 1, color: Colors.white),
                                gaps: [
                                  TableGap.width(300),
                                  TableGap.weight(),
                                ],
                                children: [
                                  Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        "Nomor Register",
                                        style: blackTextStyle.copyWith(),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  TableDeskColumn(
                                    border: const BorderSide(
                                        width: 1, color: Colors.black),
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: TableDeskColumn(
                                          border: const BorderSide(
                                              width: 1, color: Colors.black),
                                          children: [
                                            Container(
                                              color: Colors.white,
                                              child: TableDeskRow(
                                                border: const BorderSide(
                                                    width: 1,
                                                    color: Colors.white),
                                                gaps: [
                                                  TableGap.width(30),
                                                  TableGap.weight(),
                                                ],
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      ":",
                                                      style: blackTextStyle
                                                          .copyWith(),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Wrap(
                                                      children: [
                                                        ...singlePasien
                                                            .first.noreg
                                                            .split("")
                                                            .map((e) =>
                                                                Container(
                                                                  margin: EdgeInsets.only(
                                                                      right:
                                                                          2.sp,
                                                                      bottom:
                                                                          2.sp,
                                                                      left:
                                                                          2.sp),
                                                                  height: 15.sp,
                                                                  width: 15.sp,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: Colors
                                                                              .black),
                                                                      color: Colors
                                                                          .transparent),
                                                                  child: Center(
                                                                    child: Text(
                                                                      e,
                                                                      style:
                                                                          blackTextStyle,
                                                                    ),
                                                                  ),
                                                                )),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // ================= STATUS
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white, width: 1),
                            ),
                            child: Container(
                              color: Colors.white,
                              child: TableDeskRow(
                                border: const BorderSide(
                                    width: 1, color: Colors.white),
                                gaps: [
                                  TableGap.width(300),
                                  TableGap.weight(),
                                ],
                                children: [
                                  Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        "Status",
                                        style: blackTextStyle.copyWith(),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  TableDeskColumn(
                                    border: const BorderSide(
                                        width: 1, color: Colors.black),
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: TableDeskColumn(
                                          border: const BorderSide(
                                              width: 1, color: Colors.black),
                                          children: [
                                            Container(
                                              color: Colors.white,
                                              child: TableDeskRow(
                                                border: const BorderSide(
                                                    width: 1,
                                                    color: Colors.white),
                                                gaps: [
                                                  TableGap.width(30),
                                                  TableGap.weight(),
                                                ],
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      ":",
                                                      style: blackTextStyle
                                                          .copyWith(),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Wrap(
                                                      children: status
                                                          .asMap()
                                                          .entries
                                                          .map((e) {
                                                        if (state
                                                            .ringkasanMasukDanKeluar
                                                            .pasienResonse
                                                            .status
                                                            .contains(
                                                                e.value)) {
                                                          return SizedBox(
                                                            width: 100.sp,
                                                            child:
                                                                ChecklistWidget(
                                                                    isEnable:
                                                                        true,
                                                                    title: e
                                                                        .value),
                                                          );
                                                        } else {
                                                          return SizedBox(
                                                            width: 100.sp,
                                                            child:
                                                                ChecklistWidget(
                                                                    isEnable:
                                                                        false,
                                                                    title: e
                                                                        .value),
                                                          );
                                                        }
                                                      }).toList(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // ======================= PENDIDIKAN
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white, width: 1),
                            ),
                            child: Container(
                              color: Colors.white,
                              child: TableDeskRow(
                                border: const BorderSide(
                                    width: 1, color: Colors.white),
                                gaps: [
                                  TableGap.width(300),
                                  TableGap.weight(),
                                ],
                                children: [
                                  Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        "Pendidikan",
                                        style: blackTextStyle.copyWith(),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  TableDeskColumn(
                                    border: const BorderSide(
                                        width: 1, color: Colors.black),
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: TableDeskColumn(
                                          border: const BorderSide(
                                              width: 1, color: Colors.black),
                                          children: [
                                            Container(
                                              color: Colors.white,
                                              child: TableDeskRow(
                                                border: const BorderSide(
                                                    width: 1,
                                                    color: Colors.white),
                                                gaps: [
                                                  TableGap.width(30),
                                                  TableGap.weight(),
                                                ],
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      ":",
                                                      style: blackTextStyle
                                                          .copyWith(),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Wrap(
                                                      children: pendidikan
                                                          .asMap()
                                                          .entries
                                                          .map((e) {
                                                        if (state
                                                            .ringkasanMasukDanKeluar
                                                            .pasienResonse
                                                            .pendidikan
                                                            .contains(
                                                                e.value)) {
                                                          return SizedBox(
                                                            width: 100.sp,
                                                            child:
                                                                ChecklistWidget(
                                                                    isEnable:
                                                                        true,
                                                                    title: e
                                                                        .value),
                                                          );
                                                        } else {
                                                          return SizedBox(
                                                            width: 100.sp,
                                                            child:
                                                                ChecklistWidget(
                                                                    isEnable:
                                                                        false,
                                                                    title: e
                                                                        .value),
                                                          );
                                                        }
                                                      }).toList(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white, width: 1),
                            ),
                            child: Container(
                              color: Colors.white,
                              child: TableDeskRow(
                                border: const BorderSide(
                                    width: 1, color: Colors.white),
                                gaps: [
                                  TableGap.width(300),
                                  TableGap.weight(),
                                ],
                                children: [
                                  Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        "Alamat",
                                        style: blackTextStyle.copyWith(),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  TableDeskColumn(
                                    border: const BorderSide(
                                        width: 1, color: Colors.black),
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: TableDeskColumn(
                                          border: const BorderSide(
                                              width: 1, color: Colors.black),
                                          children: [
                                            Container(
                                              color: Colors.white,
                                              child: TableDeskRow(
                                                border: const BorderSide(
                                                    width: 1,
                                                    color: Colors.white),
                                                gaps: [
                                                  TableGap.width(30),
                                                  TableGap.weight(),
                                                ],
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      ":",
                                                      style: blackTextStyle
                                                          .copyWith(),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Wrap(
                                                      children: state
                                                          .ringkasanMasukDanKeluar
                                                          .pasienResonse
                                                          .alamat
                                                          .split("")
                                                          .map((e) => Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        right: 2
                                                                            .sp,
                                                                        bottom: 2
                                                                            .sp,
                                                                        left: 2
                                                                            .sp),
                                                                height: 15.sp,
                                                                width: 15.sp,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .black),
                                                                    color: Colors
                                                                        .transparent),
                                                                child: Center(
                                                                  child: Text(
                                                                    e,
                                                                    style:
                                                                        blackTextStyle,
                                                                  ),
                                                                ),
                                                              ))
                                                          .toList(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white, width: 1),
                            ),
                            child: Container(
                              color: Colors.white,
                              child: TableDeskRow(
                                border: const BorderSide(
                                    width: 1, color: Colors.white),
                                gaps: [
                                  TableGap.width(300),
                                  TableGap.weight(),
                                ],
                                children: [
                                  Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        "Kelas Permintaan",
                                        style: blackTextStyle.copyWith(),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  TableDeskColumn(
                                    border: const BorderSide(
                                        width: 1, color: Colors.black),
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: TableDeskColumn(
                                          border: const BorderSide(
                                              width: 1, color: Colors.black),
                                          children: [
                                            Container(
                                              color: Colors.white,
                                              child: TableDeskRow(
                                                border: const BorderSide(
                                                    width: 1,
                                                    color: Colors.white),
                                                gaps: [
                                                  TableGap.width(30),
                                                  TableGap.weight(),
                                                ],
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      ":",
                                                      style: blackTextStyle
                                                          .copyWith(),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Wrap(
                                                        children:
                                                            kelasPermintaan
                                                                .asMap()
                                                                .entries
                                                                .map((e) =>
                                                                    SizedBox(
                                                                      width: 100
                                                                          .sp,
                                                                      child: ChecklistWidget(
                                                                          isEnable:
                                                                              false,
                                                                          title:
                                                                              e.value),
                                                                    ))
                                                                .toList()),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white, width: 1),
                            ),
                            child: Container(
                              color: Colors.white,
                              child: TableDeskRow(
                                border: const BorderSide(
                                    width: 1, color: Colors.white),
                                gaps: [
                                  TableGap.width(300),
                                  TableGap.weight(),
                                ],
                                children: [
                                  Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        "Biaya Perawatan",
                                        style: blackTextStyle.copyWith(),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  TableDeskColumn(
                                    border: const BorderSide(
                                        width: 1, color: Colors.black),
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: TableDeskColumn(
                                          border: const BorderSide(
                                              width: 1, color: Colors.black),
                                          children: [
                                            Container(
                                              color: Colors.white,
                                              child: TableDeskRow(
                                                border: const BorderSide(
                                                    width: 1,
                                                    color: Colors.white),
                                                gaps: [
                                                  TableGap.width(30),
                                                  TableGap.weight(),
                                                ],
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      ":",
                                                      style: blackTextStyle
                                                          .copyWith(),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Wrap(
                                                        children: biayaPerawatan
                                                            .asMap()
                                                            .entries
                                                            .map((e) =>
                                                                SizedBox(
                                                                  width: 100.sp,
                                                                  child: ChecklistWidget(
                                                                      isEnable:
                                                                          false,
                                                                      title: e
                                                                          .value),
                                                                ))
                                                            .toList()),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white, width: 1),
                            ),
                            child: Container(
                              color: Colors.white,
                              child: TableDeskRow(
                                border: const BorderSide(
                                    width: 1, color: Colors.white),
                                gaps: [
                                  TableGap.width(300),
                                  TableGap.weight(),
                                ],
                                children: [
                                  Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        "Sumber Pasien",
                                        style: blackTextStyle.copyWith(),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  TableDeskColumn(
                                    border: const BorderSide(
                                        width: 1, color: Colors.black),
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: TableDeskColumn(
                                          border: const BorderSide(
                                              width: 1, color: Colors.black),
                                          children: [
                                            Container(
                                              color: Colors.white,
                                              child: TableDeskRow(
                                                border: const BorderSide(
                                                    width: 1,
                                                    color: Colors.white),
                                                gaps: [
                                                  TableGap.width(30),
                                                  TableGap.weight(),
                                                ],
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      ":",
                                                      style: blackTextStyle
                                                          .copyWith(),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Wrap(
                                                        children: sumberPasien
                                                            .asMap()
                                                            .entries
                                                            .map((e) =>
                                                                SizedBox(
                                                                  width: 100.sp,
                                                                  child: ChecklistWidget(
                                                                      isEnable:
                                                                          false,
                                                                      title: e
                                                                          .value),
                                                                ))
                                                            .toList()),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white, width: 1),
                            ),
                            child: Container(
                              color: Colors.white,
                              child: TableDeskRow(
                                border: const BorderSide(
                                    width: 1, color: Colors.white),
                                gaps: [
                                  TableGap.width(300),
                                  TableGap.weight(),
                                ],
                                children: [
                                  Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        "Keadaan Pasien Pada Waktu Keluar",
                                        style: blackTextStyle.copyWith(),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  TableDeskColumn(
                                    border: const BorderSide(
                                        width: 1, color: Colors.black),
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: TableDeskColumn(
                                          border: const BorderSide(
                                              width: 1, color: Colors.black),
                                          children: [
                                            Container(
                                              color: Colors.white,
                                              child: TableDeskRow(
                                                border: const BorderSide(
                                                    width: 1,
                                                    color: Colors.white),
                                                gaps: [
                                                  TableGap.width(30),
                                                  TableGap.weight(),
                                                ],
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      ":",
                                                      style: blackTextStyle
                                                          .copyWith(),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Wrap(
                                                        alignment:
                                                            WrapAlignment.start,
                                                        crossAxisAlignment:
                                                            WrapCrossAlignment
                                                                .start,
                                                        children:
                                                            keadaanPasienPadaWaktuKeluar
                                                                .asMap()
                                                                .entries
                                                                .map((e) =>
                                                                    SizedBox(
                                                                      width: 150
                                                                          .sp,
                                                                      child: ChecklistWidget(
                                                                          isEnable:
                                                                              false,
                                                                          title:
                                                                              e.value),
                                                                    ))
                                                                .toList()),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // ======== CARA KELUAR
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white, width: 1),
                            ),
                            child: Container(
                              color: Colors.white,
                              child: TableDeskRow(
                                border: const BorderSide(
                                    width: 1, color: Colors.white),
                                gaps: [
                                  TableGap.width(300),
                                  TableGap.weight(),
                                ],
                                children: [
                                  Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        "Cara Keluar",
                                        style: blackTextStyle.copyWith(),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  TableDeskColumn(
                                    border: const BorderSide(
                                        width: 1, color: Colors.black),
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: TableDeskColumn(
                                          border: const BorderSide(
                                              width: 1, color: Colors.black),
                                          children: [
                                            Container(
                                              color: Colors.white,
                                              child: TableDeskRow(
                                                border: const BorderSide(
                                                    width: 1,
                                                    color: Colors.white),
                                                gaps: [
                                                  TableGap.width(30),
                                                  TableGap.weight(),
                                                ],
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      ":",
                                                      style: blackTextStyle
                                                          .copyWith(),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Wrap(
                                                        alignment:
                                                            WrapAlignment.start,
                                                        crossAxisAlignment:
                                                            WrapCrossAlignment
                                                                .start,
                                                        children: caraKeluar
                                                            .asMap()
                                                            .entries
                                                            .map((e) =>
                                                                SizedBox(
                                                                  width: 170.sp,
                                                                  child: ChecklistWidget(
                                                                      isEnable:
                                                                          false,
                                                                      title: e
                                                                          .value),
                                                                ))
                                                            .toList()),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 15.sp,
                        ),

                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white, width: 1),
                            ),
                            child: Container(
                              color: Colors.white,
                              child: TableDeskRow(
                                border: const BorderSide(
                                    width: 1, color: Colors.white),
                                gaps: [
                                  TableGap.width(300),
                                  TableGap.weight(),
                                ],
                                children: [
                                  Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        "",
                                        style: blackTextStyle.copyWith(),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 55.sp),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Pematangsiantar, .....................................   ..... Pukul : ..................                              ",
                                          textAlign: TextAlign.right,
                                          style: blackTextStyle,
                                        ),
                                        SizedBox(
                                          height: 5.sp,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(right: 60.sp),
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: SizedBox(
                                                width: 80.sp,
                                                child: CustomQrWidget(
                                                  dimension: 30.sp,
                                                  dataBarcode: "",
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.sp,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(right: 60.sp),
                                          child: Text(
                                            "( .............................................. )",
                                            textAlign: TextAlign.right,
                                            style: blackTextStyle,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 25.sp,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.sp)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

List<String> status = ["Belum Menikah", "Menikah", "Janda", "Duda", "Cerai"];

List<String> pendidikan = [
  "SD",
  "SMP",
  "SMA",
  "Akademi",
  "Sarjana",
  "Lainnya",
  "SLTA",
  "D2",
  "D3"
];
List<String> caraKeluar = [
  "1. Atas Persetujuan Dokter",
  "2. Pindah Ke Rumah Sakit Lain (Dirujuk)",
  "3. Pindah Ke Rumah Sakit Lain (Permintaan Sendiri)",
  "4. Lari",
  "5. Atas Permintaan Sendiri (APS)",
  "6. Meninggal Dunia"
];
List<String> keadaanPasienPadaWaktuKeluar = [
  "1. Sembuh",
  "2. Belum Sembuh/Perbaikan",
  "3. Meninggal Sebelum 48 Jam",
  "4. Meninggal Sesudah 48 Jam",
  "5. Dan Lain-Lain"
];
List<String> sumberPasien = ["IGD", "Poli", "Pindahan"];

List<String> kelasPermintaan = [
  "VIP A",
  "VIP B",
  "Kelas I",
  "Kelas II",
  "Kelas III",
  "ICU"
];
List<String> biayaPerawatan = [
  "Pribadi",
  "Perusahaan",
  "Askes",
  "Jamsostek",
  "Asuransi",
  "DLL"
];
