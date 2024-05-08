import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hms_app/presentation/component/alert/custom_dialog.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/kebidanan/bloc/kebidanan/kebidanan_bloc.dart';
import 'package:hms_app/presentation/kebidanan/presentation/asesmen/on_delete_pengobatan_dirumah_widget.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/riwayat_pengobatan_dirumah/add_riwayat_pengobatan_keperawatan_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class RiwayatPengobatanDirumahKeperawatanWidget extends StatelessWidget {
  const RiwayatPengobatanDirumahKeperawatanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeColor.primaryColor,
        onPressed: () {
          // ADD RIWAYAT KEHAMILAN
          CustomDialogWidget.getDialog(
              widget: const AddRiwayatPengobatanKeperawatanWidget(),
              color: Colors.transparent);
        },
        child: const Icon(
          FontAwesomeIcons.plus,
          color: Colors.white,
        ),
      ),
      backgroundColor: ThemeColor.bgColor,
      body: BlocBuilder<KebidananBloc, KebidananState>(
        builder: (context, state) {
          if (state.riwayaPengobatan.isEmpty) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.sp, vertical: 5.sp),
                    child: TableDesk(
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 1),
                      ),
                      child: TableDeskRow(
                        border: const BorderSide(width: 1, color: Colors.black),
                        gaps: [
                          TableGap.width(80),
                          TableGap.weight(),
                          TableGap.weight(),
                          TableGap.weight(),
                          TableGap.weight(),
                          TableGap.width(200),
                          TableGap.width(100),
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
                                  "Nama Obat",
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
                                  "Dosis",
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
                                  "Cara Pemberian",
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
                                  "Frekuensi",
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
                                  "Waktu terakhir pemberian",
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
                                  "No.",
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
                ],
              ),
            );
          }

          // ====== //
          if (state.riwayaPengobatan.isNotEmpty) {
            return SingleChildScrollView(
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
                        TableGap.width(80),
                        TableGap.weight(),
                        TableGap.weight(),
                        TableGap.weight(),
                        TableGap.weight(),
                        TableGap.width(200),
                        TableGap.width(150),
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
                                "Nama Obat",
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
                                "Dosis",
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
                                "Cara Pemberian",
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
                                "Frekuensi",
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
                                "Waktu terakhir pemberian",
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
                                "Action",
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
                ...state.riwayaPengobatan.asMap().entries.map(
                  (e) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.sp),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(1.sp),
                            decoration:
                                const BoxDecoration(color: ThemeColor.softBlue),
                            child: Table(
                              columnWidths: const {
                                0: FlexColumnWidth(0.5),
                                6: FlexColumnWidth(0.6),
                                // 1: FlexColumnWidth(0.5),
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
                                        e.value.namaObat,
                                        style: blackTextStyle.copyWith(
                                            fontSize: 5.sp),
                                      ),
                                    ),
                                    TableCell(
                                      child: Text(
                                        e.value.dosis,
                                        style: blackTextStyle.copyWith(
                                            fontSize: 5.sp),
                                      ),
                                    ),
                                    TableCell(
                                      child: Text(
                                        e.value.caraPemberian,
                                        style: blackTextStyle.copyWith(
                                            fontSize: 5.sp),
                                      ),
                                    ),
                                    TableCell(
                                      child: Text(
                                        e.value.frekuensi,
                                        style: blackTextStyle.copyWith(
                                            fontSize: 5.sp),
                                      ),
                                    ),
                                    TableCell(
                                      child: Text(
                                        (e.value.waktu.length > 9)
                                            ? tglIndo(
                                                e.value.waktu.substring(0, 10))
                                            : "",
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
                                                backgroundColor: ThemeColor
                                                    .primaryColor
                                                    .withOpacity(0.5),
                                                child: const Icon(
                                                  FontAwesomeIcons.trash,
                                                  color: Colors.red,
                                                ),
                                                onPressed: () {
                                                  CustomDialogWidget.getDialog(
                                                      widget:
                                                          OnDeletePengobatanDirumahWidget(
                                                    riwayatPengobatanDirumahModel:
                                                        e.value,
                                                  ));
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15.sp,
                                              width: 15.sp,
                                              child: FloatingActionButton(
                                                backgroundColor: ThemeColor
                                                    .primaryColor
                                                    .withOpacity(0.5),
                                                onPressed: () {},
                                                child: const Icon(
                                                  FontAwesomeIcons.pencil,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
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
                    );
                  },
                ),
              ],
            ));
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.sp, vertical: 5.sp),
                  child: TableDesk(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1),
                    ),
                    child: TableDeskRow(
                      border: const BorderSide(width: 1, color: Colors.black),
                      gaps: [
                        TableGap.width(80),
                        TableGap.weight(),
                        TableGap.weight(),
                        TableGap.weight(),
                        TableGap.weight(),
                        TableGap.width(200),
                      ],
                      children: [
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Center(
                              child: Text(
                                "No.",
                                style: blackTextStyle.copyWith(fontSize: 4.sp),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Center(
                              child: Text(
                                "Nama Obat",
                                style: blackTextStyle.copyWith(fontSize: 4.sp),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Center(
                              child: Text(
                                "Dosis",
                                style: blackTextStyle.copyWith(fontSize: 4.sp),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Center(
                              child: Text(
                                "Cara Pemberian",
                                style: blackTextStyle.copyWith(fontSize: 4.sp),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Center(
                              child: Text(
                                "Frekuensi",
                                style: blackTextStyle.copyWith(fontSize: 4.sp),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Center(
                              child: Text(
                                "Waktu terakhir pemberian",
                                style: blackTextStyle.copyWith(fontSize: 4.sp),
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
          );
        },
      ),
    );
  }
}
