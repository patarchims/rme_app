import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:hms_app/presentation/component/qr_code/qr_code_widget.dart';
import 'package:hms_app/presentation/kebidanan/bloc/eary_warning_system/early_warning_system_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class KontrolPasienIstimewaPageWidget extends StatefulWidget {
  const KontrolPasienIstimewaPageWidget({super.key});

  @override
  State<KontrolPasienIstimewaPageWidget> createState() =>
      _KontrolPasienIstimewaPageWidgetState();
}

class _KontrolPasienIstimewaPageWidgetState
    extends State<KontrolPasienIstimewaPageWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EarlyWarningSystemBloc, EarlyWarningSystemState>(
      builder: (context, state) {
        return Scaffold(
          body: RawScrollbar(
            thumbColor: ThemeColor.darkColor,
            thumbVisibility: true,
            interactive: true,
            thickness: 10.sp,
            controller: _scrollController,
            trackVisibility: false,
            radius: Radius.circular(5.sp),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 5.sp),
                    child: TableDesk(
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 1),
                      ),
                      child: TableDeskRow(
                        border: const BorderSide(width: 1, color: Colors.black),
                        gaps: [
                          TableGap.width(150),
                          TableGap.weight(),
                          TableGap.weight(),
                          TableGap.weight(),
                          TableGap.weight(),
                          TableGap.weight(),
                        ],
                        children: [
                          Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  "Tgl/Jam",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
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
                                  "Suhu",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
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
                                  "Nadi",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
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
                                  "TD",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
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
                                  "Keterangan",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
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
                                  "Perawat",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ...state.earlyWarningSystem.map((e) {
                    return Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 5.sp),
                      child: TableDesk(
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                        child: TableDeskRow(
                          border:
                              const BorderSide(width: 1, color: Colors.black),
                          gaps: [
                            TableGap.width(150),
                            TableGap.weight(),
                            TableGap.weight(),
                            TableGap.weight(),
                            TableGap.weight(),
                            TableGap.weight(),
                          ],
                          children: [
                            Container(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Center(
                                  child: Text(
                                    "${tglIndo(e.waktu.substring(0, 10))} - ${e.waktu.substring(11, 19)}",
                                    style: blackTextStyle.copyWith(),
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
                                    "${e.suhu} °C",
                                    style: blackTextStyle.copyWith(),
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
                                    "${e.nadi} kali per meni",
                                    style: blackTextStyle.copyWith(),
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
                                    "${e.td}/${e.td2} mmHg",
                                    style: blackTextStyle.copyWith(),
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
                                    "${e.keterangan} ",
                                    style: blackTextStyle.copyWith(),
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
                                  child: Column(
                                    children: [
                                      BarcodeGreenWidget(
                                          height: 35.sp,
                                          dataBarcode: e.karyawan.nama),
                                      SizedBox(
                                        height: 2.sp,
                                      ),
                                      Text(
                                        e.karyawan.nama,
                                        style: blackTextStyle.copyWith(),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  SizedBox(
                    height: 25.sp,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
