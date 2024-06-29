import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/kebidanan/bloc/resiko_jatuh_kebidanan/resiko_jatuh_kebidanan_bloc.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class ResikoJatuKeperawatanWidget extends StatefulWidget {
  const ResikoJatuKeperawatanWidget({super.key});

  @override
  State<ResikoJatuKeperawatanWidget> createState() =>
      _ResikoJatuKeperawatanWidgetState();
}

class _ResikoJatuKeperawatanWidgetState
    extends State<ResikoJatuKeperawatanWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    AuthState authState = context.watch<AuthBloc>().state;

    return BlocConsumer<ResikoJatuhKebidananBloc, ResikoJatuhKebidananState>(
      listener: (context, state) {
        if (state.status == ResikoStatus.isLoadingGet) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        if (state.status != ResikoStatus.isLoadingGet) {
          EasyLoading.dismiss();
        }

        state.saveResult.fold(
            () => null,
            (a) => a.fold(
                (l) => null,
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (value) async {
                      MetaModel meta =
                          MetaModel.fromJson(value.value["metadata"]);
                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");
                      return shouldPop ?? false;
                    })));
      },
      builder: (context, state) {
        if (state.status == ResikoStatus.isLoadingGetResikoJatuh) {
          return HeaderContentWidget(widget: Loading.expandedLoading());
        }
        return HeaderContentWidget(
            isENableAdd: true,
            onPressed: () async {
              // ON SAVE DATA
              if (authState is Authenticated) {
                dynamic data = await deviceInfo.initPlatformState();
                // ignore: use_build_context_synchronously
                context.read<ResikoJatuhKebidananBloc>().add(
                    OnSaveResikoJatuhKebidanan(
                        kategori: "Perawat",
                        device: "ID-${data['id']}-${data['device']}",
                        noReg: singlePasien.first.noreg,
                        pelayanan:
                            toPelayanan(poliklinik: authState.user.poliklinik),
                        resikoJatuhKebidananModel:
                            state.resikoJatuhKebidananModel));
              }
            },
            title: "SIMPAN",
            widget: RawScrollbar(
              thumbColor: ThemeColor.darkColor,
              radius: Radius.circular(5.sp),
              thumbVisibility: true,
              interactive: true,
              thickness: 15.sp,
              trackVisibility: true,
              scrollbarOrientation: ScrollbarOrientation.right,
              controller: _scrollController,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Container(
                  margin: EdgeInsets.only(right: 10.sp),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.sp,
                      ),
                      Container(
                        color: Colors.white,
                        margin: EdgeInsets.only(right: 10.sp),
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.sp,
                        ),
                        child: TableDesk(
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 1),
                          ),
                          child: TableDeskRow(
                            border:
                                const BorderSide(width: 1, color: Colors.black),
                            gaps: [
                              TableGap.width(60),
                              TableGap.weight(),
                              TableGap.width(420),
                              TableGap.width(220),
                            ],
                            children: [
                              Container(
                                color: ThemeColor.primaryColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Center(
                                    child: Text(
                                      "NO.",
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 4.sp),
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
                                      "PENGKAJIAN",
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 4.sp),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              TableDeskColumn(
                                border: const BorderSide(
                                    width: 1, color: Colors.black),
                                children: [
                                  Container(
                                    color: ThemeColor.primaryColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        "SKALA",
                                        style: whiteTextStyle.copyWith(
                                            fontSize: 4.sp),
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
                                      ],
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "YA",
                                            style: whiteTextStyle.copyWith(
                                                fontSize: 4.sp),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "TIDAK",
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
                                      "NILAI",
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 4.sp),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.sp,
                        ),
                        child: Table(
                          border: TableBorder.all(color: ThemeColor.bgColor),
                          columnWidths: const {
                            0: FlexColumnWidth(0.1),
                            1: FlexColumnWidth(2),
                            2: FlexColumnWidth(0.6),
                            3: FlexColumnWidth(0.6),
                            4: FlexColumnWidth(0.6),
                          },
                          children: [
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "1.",
                                  textAlign: TextAlign.center,
                                  style:
                                      blackTextStyle.copyWith(fontSize: 5.sp),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Riwayat jatuh yang baru atau dalam 3 bulan terakhir",
                                  textAlign: TextAlign.left,
                                  style:
                                      blackTextStyle.copyWith(fontSize: 5.sp),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5.sp),
                                height: 15.sp,
                                width: 25.sp,
                                child: IconButton(
                                    onPressed: () {
                                      context
                                          .read<ResikoJatuhKebidananBloc>()
                                          .add(OnChangedRiwayatJatuh(
                                              value: "Ya"));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: (state
                                                .resikoJatuhKebidananModel
                                                .rJatuh
                                                .contains("Ya"))
                                            ? ThemeColor.greenColor
                                            : ThemeColor.primaryColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(2.sp))),
                                    color: ThemeColor.whiteColor,
                                    icon: Text(
                                      "Ya",
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 7.sp),
                                    )),
                              ),
                              Container(
                                margin: EdgeInsets.all(5.sp),
                                height: 15.sp,
                                width: 25.sp,
                                child: IconButton(
                                    onPressed: () {
                                      context
                                          .read<ResikoJatuhKebidananBloc>()
                                          .add(OnChangedRiwayatJatuh(
                                              value: "Tidak"));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: (state
                                                .resikoJatuhKebidananModel
                                                .rJatuh
                                                .contains("Tidak"))
                                            ? ThemeColor.greenColor
                                            : ThemeColor.primaryColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(2.sp))),
                                    color: ThemeColor.whiteColor,
                                    icon: Text(
                                      "Tidak",
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 7.sp),
                                    )),
                              ),
                              Center(
                                child: Text(
                                  toNilai(
                                      resikoJatuhKebidananState: state,
                                      jatuh: Jatuh.rJatuh),
                                  textAlign: TextAlign.center,
                                  style: blackTextStyle.copyWith(
                                      fontSize: 7.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ]),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.sp,
                        ),
                        child: const Divider(),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.sp,
                        ),
                        child: Table(
                          border: TableBorder.all(color: ThemeColor.bgColor),
                          columnWidths: const {
                            0: FlexColumnWidth(0.1),
                            1: FlexColumnWidth(2),
                            2: FlexColumnWidth(0.6),
                            3: FlexColumnWidth(0.6),
                            4: FlexColumnWidth(0.6),
                          },
                          children: [
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "2.",
                                  textAlign: TextAlign.center,
                                  style:
                                      blackTextStyle.copyWith(fontSize: 5.sp),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Diagnosa medis sekunder > 1",
                                  textAlign: TextAlign.left,
                                  style:
                                      blackTextStyle.copyWith(fontSize: 5.sp),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5.sp),
                                height: 15.sp,
                                width: 25.sp,
                                child: IconButton(
                                    onPressed: () {
                                      context
                                          .read<ResikoJatuhKebidananBloc>()
                                          .add(OnChangedDiagnosa(value: "Ya"));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: (state
                                                .resikoJatuhKebidananModel
                                                .diagnosis
                                                .contains("Ya"))
                                            ? ThemeColor.greenColor
                                            : ThemeColor.primaryColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(2.sp))),
                                    color: ThemeColor.whiteColor,
                                    icon: Text(
                                      "Ya",
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 7.sp),
                                    )),
                              ),
                              Container(
                                margin: EdgeInsets.all(5.sp),
                                height: 15.sp,
                                width: 25.sp,
                                child: IconButton(
                                    onPressed: () {
                                      context
                                          .read<ResikoJatuhKebidananBloc>()
                                          .add(OnChangedDiagnosa(
                                              value: "Tidak"));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: (state
                                                .resikoJatuhKebidananModel
                                                .diagnosis
                                                .contains("Tidak"))
                                            ? ThemeColor.greenColor
                                            : ThemeColor.primaryColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(2.sp))),
                                    color: ThemeColor.whiteColor,
                                    icon: Text(
                                      "Tidak",
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 7.sp),
                                    )),
                              ),
                              Center(
                                child: Text(
                                  toNilai(
                                      resikoJatuhKebidananState: state,
                                      jatuh: Jatuh.diagnosis),
                                  textAlign: TextAlign.center,
                                  style: blackTextStyle.copyWith(
                                      fontSize: 7.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ]),
                          ],
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.sp,
                          ),
                          child: const Divider()),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.sp),
                          child: Text(
                            "3. Alat bantu jalan",
                            textAlign: TextAlign.left,
                            style: blackTextStyle.copyWith(fontSize: 5.sp),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.sp,
                        ),
                        child: Column(
                          children: [
                            // =============== ALAT BANTU 1
                            tableChanged(
                                nilai: toNilai(
                                    resikoJatuhKebidananState: state,
                                    jatuh: Jatuh.alatBantu1),
                                icon2: Text(
                                  "Tidak",
                                  style:
                                      whiteTextStyle.copyWith(fontSize: 7.sp),
                                ),
                                icon1: Text(
                                  "Ya",
                                  style:
                                      whiteTextStyle.copyWith(fontSize: 7.sp),
                                ),
                                onPressed1: () {
                                  context
                                      .read<ResikoJatuhKebidananBloc>()
                                      .add(OnChangedAlatBantu1(value: "Ya"));
                                },
                                title: "Bed rest/ dibantu perawat",
                                style2: ElevatedButton.styleFrom(
                                    backgroundColor: (state
                                            .resikoJatuhKebidananModel
                                            .alatBantu1
                                            .contains("Tidak"))
                                        ? ThemeColor.greenColor
                                        : ThemeColor.primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2.sp))),
                                style1: ElevatedButton.styleFrom(
                                    backgroundColor: (state
                                            .resikoJatuhKebidananModel
                                            .alatBantu1
                                            .contains("Ya"))
                                        ? ThemeColor.greenColor
                                        : ThemeColor.primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2.sp))),
                                context,
                                onPressed2: () {
                                  context
                                      .read<ResikoJatuhKebidananBloc>()
                                      .add(OnChangedAlatBantu1(value: "Tidak"));
                                },
                                state),

                            // =============== ALAT BANTU 2
                            tableChanged(
                                nilai: toNilai(
                                    resikoJatuhKebidananState: state,
                                    jatuh: Jatuh.alatBantu2),
                                icon2: Text(
                                  "Tidak",
                                  style:
                                      whiteTextStyle.copyWith(fontSize: 7.sp),
                                ),
                                icon1: Text(
                                  "Ya",
                                  style:
                                      whiteTextStyle.copyWith(fontSize: 7.sp),
                                ),
                                onPressed1: () {
                                  context
                                      .read<ResikoJatuhKebidananBloc>()
                                      .add(OnChangedAlatBantu2(value: "Ya"));
                                },
                                title: "Penopang / Tongkat / Walker",
                                style2: ElevatedButton.styleFrom(
                                    backgroundColor: (state
                                            .resikoJatuhKebidananModel
                                            .alatBantu2
                                            .contains("Tidak"))
                                        ? ThemeColor.greenColor
                                        : ThemeColor.primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2.sp))),
                                style1: ElevatedButton.styleFrom(
                                    backgroundColor: (state
                                            .resikoJatuhKebidananModel
                                            .alatBantu2
                                            .contains("Ya"))
                                        ? ThemeColor.greenColor
                                        : ThemeColor.primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2.sp))),
                                context,
                                onPressed2: () {
                                  context
                                      .read<ResikoJatuhKebidananBloc>()
                                      .add(OnChangedAlatBantu2(value: "Tidak"));
                                },
                                state),

                            // ========= ON PRESSS 3
                            tableChanged(
                                nilai: toNilai(
                                    resikoJatuhKebidananState: state,
                                    jatuh: Jatuh.alatBantu3),
                                style1: ElevatedButton.styleFrom(
                                    backgroundColor: (state
                                            .resikoJatuhKebidananModel
                                            .alatBantu3
                                            .contains("Ya"))
                                        ? ThemeColor.greenColor
                                        : ThemeColor.primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2.sp))),
                                style2: ElevatedButton.styleFrom(
                                    backgroundColor: (state
                                            .resikoJatuhKebidananModel
                                            .alatBantu3
                                            .contains("Tidak"))
                                        ? ThemeColor.greenColor
                                        : ThemeColor.primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2.sp))),
                                icon2: Text(
                                  "Tidak",
                                  style:
                                      whiteTextStyle.copyWith(fontSize: 7.sp),
                                ),
                                icon1: Text(
                                  "Ya",
                                  style:
                                      whiteTextStyle.copyWith(fontSize: 7.sp),
                                ), onPressed1: () {
                              context
                                  .read<ResikoJatuhKebidananBloc>()
                                  .add(OnChangedAlatBantu3(value: "Ya"));
                            }, onPressed2: () {
                              context
                                  .read<ResikoJatuhKebidananBloc>()
                                  .add(OnChangedAlatBantu3(value: "Tidak"));
                            }, title: "Berpegangan pada benda - benda di\n        sekitar(Meja, Kursi, Lemari)", context, state),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.sp,
                        ),
                        child: const Divider(),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.sp,
                        ),
                        child: Table(
                          border: TableBorder.all(color: ThemeColor.bgColor),
                          columnWidths: const {
                            0: FlexColumnWidth(0.1),
                            1: FlexColumnWidth(2),
                            2: FlexColumnWidth(0.6),
                            3: FlexColumnWidth(0.6),
                            4: FlexColumnWidth(0.6),
                          },
                          children: [
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "4.",
                                  textAlign: TextAlign.center,
                                  style:
                                      blackTextStyle.copyWith(fontSize: 5.sp),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Menggunakan infus",
                                  textAlign: TextAlign.left,
                                  style:
                                      blackTextStyle.copyWith(fontSize: 5.sp),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5.sp),
                                height: 15.sp,
                                width: 25.sp,
                                child: IconButton(
                                    onPressed: () {
                                      context
                                          .read<ResikoJatuhKebidananBloc>()
                                          .add(OnChangedInfuse(value: "Ya"));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: (state
                                                .resikoJatuhKebidananModel
                                                .terpasangInfuse
                                                .contains("Ya"))
                                            ? ThemeColor.greenColor
                                            : ThemeColor.primaryColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(2.sp))),
                                    color: ThemeColor.whiteColor,
                                    icon: Text(
                                      "Ya",
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 7.sp),
                                    )),
                              ),
                              Container(
                                margin: EdgeInsets.all(5.sp),
                                height: 15.sp,
                                width: 25.sp,
                                child: IconButton(
                                    onPressed: () {
                                      context
                                          .read<ResikoJatuhKebidananBloc>()
                                          .add(OnChangedInfuse(value: "Tidak"));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: (state
                                                .resikoJatuhKebidananModel
                                                .terpasangInfuse
                                                .contains("Tidak"))
                                            ? ThemeColor.greenColor
                                            : ThemeColor.primaryColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(2.sp))),
                                    color: ThemeColor.whiteColor,
                                    icon: Text(
                                      "Tidak",
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 7.sp),
                                    )),
                              ),
                              Center(
                                child: Text(
                                  toNilai(
                                      resikoJatuhKebidananState: state,
                                      jatuh: Jatuh.terpasangInfus),
                                  textAlign: TextAlign.center,
                                  style: blackTextStyle.copyWith(
                                      fontSize: 7.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ]),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.sp,
                        ),
                        child: const Divider(),
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
                            border:
                                const BorderSide(width: 1, color: Colors.black),
                            gaps: [
                              TableGap.weight(),
                              TableGap.width(220),
                            ],
                            children: [
                              Container(
                                color: ThemeColor.primaryColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Center(
                                    child: Text(
                                      "TOTAL",
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 4.sp),
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
                                      state.resikoJatuhKebidananModel.total
                                          .toString(),
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 12.sp,
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
                            border:
                                const BorderSide(width: 1, color: Colors.black),
                            gaps: [
                              TableGap.weight(),
                            ],
                            children: [
                              Container(
                                color: ThemeColor.orangeColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Center(
                                    child: Text(
                                      state.resikoJatuhKebidananModel.keterangan
                                          .toString(),
                                      style: blackCalibriTextStyle.copyWith(
                                          fontSize: 12.sp,
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
                      SizedBox(
                        height: 5.sp,
                      ),
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: TableDesk(
                          shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 1)),
                          child: TableDeskRow(
                            border:
                                const BorderSide(width: 1, color: Colors.black),
                            gaps: [
                              TableGap.weight(),
                            ],
                            children: [
                              Container(
                                color: ThemeColor.greyColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Center(
                                    child: Text(
                                      "Keterangan  :\n0-24 : Tidak beresiko/resiko rendah\n25-44 : Resiko Sedang -> dipasang gelang kuning\n>=45   : Resiko tinggi -> dipasang gelang kuning",
                                      style: blackTextStyle.copyWith(
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }

  Table tableChanged(BuildContext context, ResikoJatuhKebidananState state,
      {required String title,
      required String nilai,
      String? no,
      ButtonStyle? style1,
      required Widget icon1,
      required Widget icon2,
      ButtonStyle? style2,
      required void Function()? onPressed1,
      required void Function()? onPressed2}) {
    return Table(
      border: TableBorder.all(color: ThemeColor.bgColor),
      columnWidths: const {
        0: FlexColumnWidth(0.1),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(0.6),
        3: FlexColumnWidth(0.6),
        4: FlexColumnWidth(0.6),
      },
      children: [
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              no ?? "",
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(fontSize: 5.sp),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "	⚫	 $title",
              textAlign: TextAlign.left,
              style: blackTextStyle.copyWith(fontSize: 5.sp),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5.sp),
            height: 15.sp,
            width: 25.sp,
            child: IconButton(
                onPressed: onPressed1,
                style: style1,
                color: ThemeColor.whiteColor,
                icon: icon1),
          ),
          Container(
            margin: EdgeInsets.all(5.sp),
            height: 15.sp,
            width: 25.sp,
            child: IconButton(
                onPressed: onPressed2,
                style: style2,
                color: ThemeColor.whiteColor,
                icon: icon2),
          ),
          Center(
            child: Text(
              nilai,
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(
                  fontSize: 7.sp, fontWeight: FontWeight.bold),
            ),
          )
        ]),
      ],
    );
  }

  Container boxCheckBox(
      {required String no,
      required String pengkajian,
      required String skala,
      required ResikoJatuhKebidananState state,
      required int nilai}) {
    return Container(
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
            TableGap.weight(),
            TableGap.width(420),
            TableGap.width(220),
          ],
          children: [
            Container(
              color: ThemeColor.bgColor,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    no,
                    style: blackTextStyle.copyWith(fontSize: 4.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Container(
              color: ThemeColor.bgColor,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  pengkajian,
                  style: blackTextStyle.copyWith(fontSize: 4.sp),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            TableDeskColumn(
              border: const BorderSide(width: 1, color: Colors.black),
              children: [
                Container(
                  color: ThemeColor.bgColor,
                  child: TableDeskRow(
                    border: const BorderSide(width: 1, color: Colors.black),
                    gaps: [
                      TableGap.weight(),
                      TableGap.weight(),
                    ],
                    children: [
                      SizedBox(
                        height: 15.sp,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                (state.resikoJatuhKebidananModel.rJatuh == "")
                                    ? ThemeColor.greenColor
                                    : ThemeColor.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.sp),
                            ),
                          ),
                          child: Text(
                            "Ya",
                            style: whiteTextStyle,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "YA",
                          style: blackTextStyle.copyWith(fontSize: 4.sp),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "TIDAK",
                          style: blackTextStyle.copyWith(fontSize: 4.sp),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              color: ThemeColor.bgColor,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    nilai.toString(),
                    style: blackTextStyle.copyWith(
                        fontSize: 8.sp, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Container(
              color: ThemeColor.bgColor,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    nilai.toString(),
                    style: blackTextStyle.copyWith(
                        fontSize: 8.sp, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum Jatuh {
  rJatuh,
  diagnosis,
  alatBantu1,
  alatBantu2,
  alatBantu3,
  terpasangInfus
}

String toNilai(
    {required ResikoJatuhKebidananState resikoJatuhKebidananState,
    required Jatuh jatuh}) {
  if (resikoJatuhKebidananState.resikoJatuhKebidananModel.rJatuh == "Ya" &&
      jatuh == Jatuh.rJatuh) {
    return "25";
  }
  if (resikoJatuhKebidananState.resikoJatuhKebidananModel.diagnosis == "Ya" &&
      jatuh == Jatuh.diagnosis) {
    return "15";
  }
  if (resikoJatuhKebidananState.resikoJatuhKebidananModel.alatBantu1 == "Ya" &&
      jatuh == Jatuh.alatBantu1) {
    return "0";
  }
  if (resikoJatuhKebidananState.resikoJatuhKebidananModel.alatBantu2 == "Ya" &&
      jatuh == Jatuh.alatBantu2) {
    return "15";
  }
  if (resikoJatuhKebidananState.resikoJatuhKebidananModel.alatBantu3 == "Ya" &&
      jatuh == Jatuh.alatBantu3) {
    return "30";
  }
  if (resikoJatuhKebidananState.resikoJatuhKebidananModel.terpasangInfuse ==
          "Ya" &&
      jatuh == Jatuh.terpasangInfus) {
    return "20";
  }
  return "0";
}
