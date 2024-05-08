import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/kebidanan/bloc/kebidanan/kebidanan_bloc.dart';
import 'package:hms_app/presentation/kebidanan/presentation/asesmen/add_riwayat_kehamilan_widget.dart';
import 'package:hms_app/presentation/kebidanan/presentation/asesmen/on_delete_riwayat_kehamilan_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class RiwayatKehamilanWidgetPage extends StatelessWidget {
  const RiwayatKehamilanWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KebidananBloc, KebidananState>(
      builder: (context, state) {
        if (state.kebidananStatus ==
            KebidananStatus.isLoadingGetRiwayatKebidanan) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // ADD RIWAYAT KEHAMILAN
                CustomDialogWidget.getDialog(
                    widget: const AddRiwayatKehamilanWidget(),
                    color: Colors.transparent);
              },
              child: const Icon(
                FontAwesomeIcons.plus,
                color: Colors.white,
              ),
            ),
            backgroundColor: ThemeColor.bgColor,
            body: Loading.expandedLoading(),
          );
        }

        if (state.kebidanModel.isNotEmpty) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // ADD RIWAYAT KEHAMILAN
                CustomDialogWidget.getDialog(
                    widget: const AddRiwayatKehamilanWidget(),
                    color: Colors.transparent);
              },
              child: const Icon(
                FontAwesomeIcons.plus,
                color: Colors.white,
              ),
            ),
            backgroundColor: ThemeColor.bgColor,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 5.sp,
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.sp,
                    ),
                    child: TableDesk(
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 1),
                      ),
                      child: TableDeskRow(
                        border: const BorderSide(width: 1, color: Colors.black),
                        gaps: [
                          TableGap.width(60),
                          TableGap.width(110),
                          TableGap.width(120),
                          TableGap.width(120),
                          TableGap.width(120),
                          TableGap.width(200),
                          TableGap.width(200),
                          TableGap.width(160),
                          TableGap.weight(),
                          TableGap.width(80),
                        ],
                        children: [
                          Container(
                            color: ThemeColor.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  "No.",
                                  style:
                                      whiteTextStyle.copyWith(fontSize: 4.sp),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: ThemeColor.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  "Tahun Persalinan",
                                  style:
                                      whiteTextStyle.copyWith(fontSize: 4.sp),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: ThemeColor.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  "Tempat bersalin",
                                  style:
                                      whiteTextStyle.copyWith(fontSize: 4.sp),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: ThemeColor.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  "Umur Kehamilan",
                                  style:
                                      whiteTextStyle.copyWith(fontSize: 4.sp),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: ThemeColor.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  "Jenis Persalinan",
                                  style:
                                      whiteTextStyle.copyWith(fontSize: 4.sp),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: ThemeColor.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  "Penolong",
                                  style:
                                      whiteTextStyle.copyWith(fontSize: 4.sp),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: ThemeColor.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  "Penyulit",
                                  style:
                                      whiteTextStyle.copyWith(fontSize: 4.sp),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: ThemeColor.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  "Nifas",
                                  style:
                                      whiteTextStyle.copyWith(fontSize: 4.sp),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          TableDeskColumn(
                            border:
                                const BorderSide(width: 1, color: Colors.black),
                            children: [
                              Container(
                                color: ThemeColor.primaryColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    "Anak",
                                    style:
                                        whiteTextStyle.copyWith(fontSize: 4.sp),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Container(
                                color: ThemeColor.primaryColor,
                                child: TableDeskRow(
                                  border: const BorderSide(
                                      width: 1, color: Colors.black),
                                  gaps: [
                                    TableGap.weight(),
                                    TableGap.weight(),
                                    TableGap.weight(),
                                  ],
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "JK",
                                        style: whiteTextStyle.copyWith(
                                            fontSize: 4.sp),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "BB",
                                        style: whiteTextStyle.copyWith(
                                            fontSize: 4.sp),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Keadaan Sekarang",
                                        style: whiteTextStyle.copyWith(
                                            fontSize: 4.sp),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            color: ThemeColor.primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  "Aksi",
                                  style:
                                      whiteTextStyle.copyWith(fontSize: 4.sp),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ...state.kebidanModel.asMap().entries.map((e) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(1.sp),
                              decoration: const BoxDecoration(
                                  color: ThemeColor.softBlue),
                              child: Table(
                                columnWidths: const {
                                  0: FlexColumnWidth(0.5),
                                  1: FlexColumnWidth(0.5),
                                  2: FlexColumnWidth(0.5),
                                  3: FlexColumnWidth(0.5),
                                  4: FlexColumnWidth(0.5),
                                  5: FlexColumnWidth(0.5),
                                  6: FlexColumnWidth(0.6),
                                  7: FlexColumnWidth(0.5),
                                  8: FlexColumnWidth(0.5),
                                  9: FlexColumnWidth(0.5),
                                  10: FlexColumnWidth(0.5),
                                  11: FlexColumnWidth(0.5),
                                },
                                border:
                                    TableBorder.all(color: Colors.transparent),
                                children: [
                                  TableRow(
                                    children: [
                                      TableCell(
                                        child: Center(
                                          child: Text(
                                            (e.key + 1).toString(),
                                            style: blackTextStyle.copyWith(
                                                fontSize: 5.sp),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        child: Text(
                                          e.value.tahun,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 5.sp),
                                        ),
                                      ),
                                      TableCell(
                                        child: Text(
                                          e.value.tempat,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 5.sp),
                                        ),
                                      ),
                                      TableCell(
                                        child: Text(
                                          e.value.umur,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 5.sp),
                                        ),
                                      ),
                                      TableCell(
                                        child: Text(
                                          e.value.jenisPersalinan,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 5.sp),
                                        ),
                                      ),
                                      TableCell(
                                        child: Text(
                                          e.value.penolong,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 5.sp),
                                        ),
                                      ),
                                      TableCell(
                                        child: Text(
                                          e.value.penyulit,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 5.sp),
                                        ),
                                      ),
                                      TableCell(
                                        child: Text(
                                          e.value.nifas,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 5.sp),
                                        ),
                                      ),
                                      TableCell(
                                        child: Text(
                                          e.value.jk,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 5.sp),
                                        ),
                                      ),
                                      TableCell(
                                        child: Text(
                                          e.value.bb,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 5.sp),
                                        ),
                                      ),
                                      TableCell(
                                        child: Text(
                                          e.value.keadaanSekarang,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 5.sp),
                                        ),
                                      ),
                                      TableCell(
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 15.sp,
                                                width: 15.sp,
                                                child: FloatingActionButton(
                                                  backgroundColor:
                                                      ThemeColor.redColor,
                                                  child: const Icon(
                                                    FontAwesomeIcons.trash,
                                                    color: Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    CustomDialogWidget
                                                        .getDialog(
                                                            widget:
                                                                OnDeleteRiwayatKehamilanWidget(
                                                      kebidanModel: e.value,
                                                    ));
                                                  },
                                                ),
                                              ),
                                              // SizedBox(
                                              //   height: 15.sp,
                                              //   width: 15.sp,
                                              //   child: FloatingActionButton(
                                              //     backgroundColor:
                                              //         ThemeColor.primaryColor,
                                              //     onPressed: () {},
                                              //     child: const Icon(
                                              //       FontAwesomeIcons.pencil,
                                              //       color: Colors.white,
                                              //     ),
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Divider()
                          ],
                        ),
                      ))
                ],
              ),
            ),
          );
        }
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // ADD RIWAYAT KEHAMILAN
              CustomDialogWidget.getDialog(
                  widget: const AddRiwayatKehamilanWidget(),
                  color: Colors.transparent);
            },
            child: const Icon(
              FontAwesomeIcons.plus,
              color: Colors.white,
            ),
          ),
          backgroundColor: ThemeColor.bgColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 5.sp,
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.sp,
                  ),
                  child: TableDesk(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1),
                    ),
                    child: TableDeskRow(
                      border: const BorderSide(width: 1, color: Colors.black),
                      gaps: [
                        TableGap.width(60),
                        TableGap.width(110),
                        TableGap.width(120),
                        TableGap.width(120),
                        TableGap.width(120),
                        TableGap.width(200),
                        TableGap.width(200),
                        TableGap.width(160),
                        TableGap.weight(),
                        TableGap.width(80),
                      ],
                      children: [
                        Container(
                          color: ThemeColor.primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Center(
                              child: Text(
                                "No.",
                                style: whiteTextStyle.copyWith(fontSize: 4.sp),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: ThemeColor.primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Center(
                              child: Text(
                                "Tahun Persalinan",
                                style: whiteTextStyle.copyWith(fontSize: 4.sp),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: ThemeColor.primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Center(
                              child: Text(
                                "Tempat bersalin",
                                style: whiteTextStyle.copyWith(fontSize: 4.sp),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: ThemeColor.primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Center(
                              child: Text(
                                "Umur Kehamilan",
                                style: whiteTextStyle.copyWith(fontSize: 4.sp),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: ThemeColor.primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Center(
                              child: Text(
                                "Jenis Persalinan",
                                style: whiteTextStyle.copyWith(fontSize: 4.sp),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: ThemeColor.primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Center(
                              child: Text(
                                "Penolong",
                                style: whiteTextStyle.copyWith(fontSize: 4.sp),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: ThemeColor.primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Center(
                              child: Text(
                                "Penyulit",
                                style: whiteTextStyle.copyWith(fontSize: 4.sp),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: ThemeColor.primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Center(
                              child: Text(
                                "Nifas",
                                style: whiteTextStyle.copyWith(fontSize: 4.sp),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        TableDeskColumn(
                          border:
                              const BorderSide(width: 1, color: Colors.black),
                          children: [
                            Container(
                              color: ThemeColor.primaryColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  "Anak",
                                  style:
                                      whiteTextStyle.copyWith(fontSize: 4.sp),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Container(
                              color: ThemeColor.primaryColor,
                              child: TableDeskRow(
                                border: const BorderSide(
                                    width: 1, color: Colors.black),
                                gaps: [
                                  TableGap.weight(),
                                  TableGap.weight(),
                                  TableGap.weight(),
                                ],
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "JK",
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 4.sp),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "BB",
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 4.sp),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Keadaan Sekarang",
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 4.sp),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          color: ThemeColor.primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Center(
                              child: Text(
                                "Aksi",
                                style: whiteTextStyle.copyWith(fontSize: 4.sp),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
