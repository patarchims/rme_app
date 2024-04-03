import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/component/qr_code/custom_qr_widget.dart';
import 'package:hms_app/presentation/pages/igd/bloc/triase_igd_dokter/triase_igd_dokter_bloc.dart';
import 'package:hms_app/presentation/report/component/ceklist_widget.dart';
import 'package:hms_app/presentation/report/component/header_report_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class ReportFormulirTriaseWidget extends StatefulWidget {
  const ReportFormulirTriaseWidget({super.key});

  @override
  State<ReportFormulirTriaseWidget> createState() =>
      _ReportFormulirTriaseWidgetState();
}

class _ReportFormulirTriaseWidgetState
    extends State<ReportFormulirTriaseWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<TriaseIgdDokterBloc, TriaseIgdDokterState>(
      listener: (context, state) {
        // ==== //
      },
      builder: (context, state) {
        if (state.status == TriaseIGDDokterStatus.isLoadingGetReport) {
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
                          width: 1,
                          style: BorderStyle.solid,
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // TAMPILKAN DATA
                        SizedBox(
                          width: Get.width,
                          height: 50.sp,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: Get.width / 3,
                                height: 50.sp,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "I. TRIASE",
                                      textAlign: TextAlign.center,
                                      style: blackTextStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                  child: SizedBox(
                                height: 50.sp,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TitleWidget.judul(
                                        title: "Nama Pasien   ",
                                        subTitle:
                                            singlePasien.first.namaPasien),
                                    TitleWidget.judul(
                                        title: "Tanggal Lahir  ",
                                        subTitle: (singlePasien
                                                    .first.tglLahir.length >
                                                10)
                                            ? singlePasien.first.tglLahir
                                                .substring(0, 10)
                                            : singlePasien.first.tglLahir),
                                    TitleWidget.judul(
                                        title: "Nomor Rekam\nMedis",
                                        subTitle: singlePasien.first.mrn),
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                        const Divider(),

                        // ===== //
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Petunjuk : \nBerikan tanda (✓) pada kolom yang sesuai dengan kondisi pasien\n",
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 6.sp),
                          ),
                        ),

                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 1),
                            ),
                            child: Container(
                              color: Colors.white,
                              child: TableDeskRow(
                                border: const BorderSide(
                                    width: 1, color: Colors.black),
                                gaps: [
                                  TableGap.weight(),
                                  TableGap.weight(),
                                  TableGap.weight(),
                                ],
                                children: [
                                  Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        "Tanggal Masuk      ${(state.triaseResponse.triase.tglMasuk.length > 10) ? tglIndo(state.triaseResponse.triase.tglMasuk) : state.triaseResponse.triase.tglMasuk}",
                                        style: blackTextStyle.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 6.sp),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        "Jam Kedatangan      ${(state.triaseResponse.triase.jam.length > 10) ? state.triaseResponse.triase.jam.substring(11, 19) : state.triaseResponse.triase.jam}",
                                        style: blackTextStyle.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 6.sp),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        "Jam Pemeriksaan  ${(state.triaseResponse.triase.jam.length > 10) ? state.triaseResponse.triase.jam.substring(11, 19) : state.triaseResponse.triase.jam}",
                                        style: blackTextStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 6.sp,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // ===== //
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 1),
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
                                        "Alasan Datang ",
                                        style: blackTextStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 6.sp,
                                        ),
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
                                                  TableGap.width(50),
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
                                                  Wrap(
                                                    children: alasanDatang
                                                        .asMap()
                                                        .entries
                                                        .map((e) {
                                                      if (state
                                                              .triaseResponse
                                                              .triase
                                                              .alasanMasuk ==
                                                          e.value) {
                                                        return SizedBox(
                                                          width: 80.sp,
                                                          child:
                                                              ChecklistWidget(
                                                                  isEnable:
                                                                      true,
                                                                  title:
                                                                      e.value),
                                                        );
                                                      }
                                                      return SizedBox(
                                                        width: 80.sp,
                                                        child: ChecklistWidget(
                                                            isEnable: false,
                                                            title: e.value),
                                                      );
                                                    }).toList(),
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

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Penyebab Cedera  \n${state.triaseResponse.triase.penyebabCedera}",
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 6.sp),
                          ),
                        ),

                        // =============================== KELUHAN UTAMA
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: TableDesk(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 1),
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
                                        "Keluhan Utama",
                                        style: blackTextStyle.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 6.sp),
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
                                                  TableGap.width(50),
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
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      state
                                                          .triaseResponse
                                                          .keluhanUtama
                                                          .asesmen
                                                          .keluhUtama,
                                                      style: blackTextStyle,
                                                    ),
                                                  )
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

                        // ============================== //
                        Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: TableDesk(
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black, width: 1),
                              ),
                              child: Container(
                                color: Colors.white,
                                child: TableDeskRow(
                                  border: const BorderSide(
                                      width: 1, color: Colors.black),
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
                                            "Tanda - Tanda\nVital",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 6.sp),
                                          )),
                                    ),
                                    Column(
                                      children: [
                                        // ===== //
                                        tandaTandaVital(
                                            title1: "GCS",
                                            subtitle1:
                                                "E:${state.triaseResponse.vital.gcsE} M:${state.triaseResponse.vital.gcsM} V:${state.triaseResponse.vital.gcsV}",
                                            title2: "Pupil",
                                            subtitle2: state.triaseResponse
                                                .pemeriksaanFisik.pupil,
                                            title3: "Refleks Cahaya",
                                            subtitle3: state.triaseResponse
                                                .pemeriksaanFisik.refleks),
                                        tandaTandaVital(
                                            title1: "TD",
                                            subtitle1:
                                                state.triaseResponse.vital.td,
                                            title2: "Pernafasan",
                                            subtitle2: state.triaseResponse
                                                .vital.pernafasan,
                                            title3: "SpO2",
                                            subtitle3: state
                                                .triaseResponse.vital.spo2),
                                        tandaTandaVital(
                                            title1: "Nadi",
                                            subtitle1:
                                                state.triaseResponse.vital.nadi,
                                            title2: "Suhu",
                                            subtitle2:
                                                state.triaseResponse.vital.suhu,
                                            title3: "Akral",
                                            subtitle3: state.triaseResponse
                                                .pemeriksaanFisik.akral),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )),

                        // ============================== //
                        Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: TableDesk(
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black, width: 1),
                              ),
                              child: Container(
                                color: Colors.white,
                                child: TableDeskRow(
                                  border: const BorderSide(
                                      width: 1, color: Colors.black),
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
                                            "Status Alergi",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 6.sp),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Wrap(
                                        children: (state
                                                .triaseResponse
                                                .keluhanUtama
                                                .riwayatKeluarga
                                                .isNotEmpty)
                                            ? state.triaseResponse.keluhanUtama
                                                .riwayatKeluarga
                                                .map((e) => Text(
                                                      "${e.alergi} ,",
                                                      style: blackTextStyle,
                                                    ))
                                                .toList()
                                            : [],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),

                        Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: TableDesk(
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black, width: 1),
                              ),
                              child: Container(
                                color: Colors.white,
                                child: TableDeskRow(
                                  border: const BorderSide(
                                      width: 1, color: Colors.black),
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
                                            "Gangguan\nPerilaku",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 6.sp),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        state.triaseResponse.triase
                                            .gangguanPerilaku,
                                        style: blackTextStyle,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),

                        // === //
                        Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: TableDesk(
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black, width: 1),
                              ),
                              child: Container(
                                color: Colors.white,
                                child: TableDeskRow(
                                  border: const BorderSide(
                                      width: 1, color: Colors.black),
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
                                            "Status Kehamilan\n(Khusus Obgyn)",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 6.sp),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "${state.triaseResponse.triase.kehamilan}Gravida :${state.triaseResponse.triase.gravida}  Para :${state.triaseResponse.triase.para}\nDDJ :${state.triaseResponse.triase.ddj}  Abortus :${state.triaseResponse.triase.abortus}  HPHT:${state.triaseResponse.triase.hpht}",
                                        style: blackTextStyle.copyWith(
                                            fontSize: 6.sp),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),

                        Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: TableDesk(
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black, width: 1),
                              ),
                              child: Container(
                                color: Colors.white,
                                child: TableDeskRow(
                                  border: const BorderSide(
                                      width: 1, color: Colors.black),
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
                                            "Pemeriksaan Fisik",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 6.sp),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Jalan Nafas : ${state.triaseResponse.pemeriksaanFisik.jalanNafas}        Pernapasan :  ${state.triaseResponse.vital.pernafasan}\nSirkulasi :${state.triaseResponse.pemeriksaanFisik.sirkulasi}                 Kesadaran : ${state.triaseResponse.vital.kesadaran}\nKepala : ${state.triaseResponse.pemeriksaanFisik.kepala}                  THT : ${state.triaseResponse.pemeriksaanFisik.tht}\nMulut : ${state.triaseResponse.pemeriksaanFisik.mulut}                     Leher : ${state.triaseResponse.pemeriksaanFisik.leher}\nDada : ${state.triaseResponse.pemeriksaanFisik.dada}                    Jantung : ${state.triaseResponse.pemeriksaanFisik.jantung}",
                                        style: blackTextStyle,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),

                        Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: TableDesk(
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black, width: 1),
                              ),
                              child: Container(
                                color: Colors.white,
                                child: TableDeskRow(
                                  border: const BorderSide(
                                      width: 1, color: Colors.black),
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
                                            "Asesmen Nyeri",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 6.sp),
                                          )),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.sp),
                                      child: Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                  height: 50.sp,
                                                  child: Image.asset(toNyeri(
                                                      nyeri: state
                                                          .triaseIgdDokterModel
                                                          .skalaNyeri
                                                          .toDouble()))),
                                              Text(
                                                toNyeriText(
                                                    nyeri: state
                                                        .triaseIgdDokterModel
                                                        .skalaNyeri
                                                        .toDouble()),
                                                style: blackTextStyle,
                                              )
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.sp),
                                                child: Text(
                                                  "P : ${state.triaseResponse.triase.nyeriP}\nQ : ${state.triaseResponse.triase.nyeriQ}\nR : ${state.triaseResponse.triase.nyeriR}\nS : ${state.triaseResponse.triase.nyeriS}\nT : ${state.triaseResponse.triase.nyeriT}",
                                                  style: blackTextStyle,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),

                        Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: TableDesk(
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black, width: 1),
                              ),
                              child: Container(
                                color: Colors.white,
                                child: TableDeskRow(
                                  border: const BorderSide(
                                      width: 1, color: Colors.black),
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
                                            "Skala Triase",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 6.sp),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        padding: EdgeInsets.all(2.sp),
                                        decoration: BoxDecoration(
                                            color: (state.triaseResponse.triase
                                                        .skalaTriase ==
                                                    "Resusitasi")
                                                ? Colors.red
                                                : (state.triaseResponse.triase
                                                            .skalaTriase ==
                                                        "Emergency / Gawat Darurat")
                                                    ? ThemeColor.yellowColor
                                                    : (state
                                                                .triaseResponse
                                                                .triase
                                                                .skalaTriase ==
                                                            "Urgent / Darurat")
                                                        ? ThemeColor.yellowColor
                                                            .withOpacity(0.8)
                                                        : (state
                                                                    .triaseResponse
                                                                    .triase
                                                                    .skalaTriase ==
                                                                "Semi / Darurat")
                                                            ? ThemeColor
                                                                .greenColor
                                                            : (state
                                                                        .triaseResponse
                                                                        .triase
                                                                        .skalaTriase ==
                                                                    "Tidak Darurat")
                                                                ? ThemeColor
                                                                    .greenColor
                                                                    .withOpacity(
                                                                        0.8)
                                                                : Colors.red),
                                        child: Text(
                                          (state.triaseResponse.triase
                                                      .skalaTriase ==
                                                  "Resusitasi")
                                              ? "${state.triaseResponse.triase.skalaTriase}\nResponse TimeSegera"
                                              : (state.triaseResponse.triase
                                                          .skalaTriase ==
                                                      "Emergency / Gawat Darurat")
                                                  ? "${state.triaseResponse.triase.skalaTriase}\nResponse Time 10 Menit"
                                                  : (state.triaseResponse.triase
                                                              .skalaTriase ==
                                                          "Urgent / Darurat")
                                                      ? "${state.triaseResponse.triase.skalaTriase}\nResponse Time 30 Menit"
                                                      : (state
                                                                  .triaseResponse
                                                                  .triase
                                                                  .skalaTriase ==
                                                              "Semi / Darurat")
                                                          ? "${state.triaseResponse.triase.skalaTriase}\nResponse Time 60 Menit"
                                                          : (state
                                                                      .triaseResponse
                                                                      .triase
                                                                      .skalaTriase ==
                                                                  "Tidak Darurat")
                                                              ? "${state.triaseResponse.triase.skalaTriase}\nResponse Time 120 Menit"
                                                              : "",
                                          style: blackTextStyle,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),

                        Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: TableDesk(
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black, width: 1),
                              ),
                              child: Container(
                                color: Colors.white,
                                child: TableDeskRow(
                                  border: const BorderSide(
                                      width: 1, color: Colors.black),
                                  gaps: [
                                    TableGap.weight(),
                                  ],
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          child: Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Text(
                                                "Petugas Triase",
                                                textAlign: TextAlign.center,
                                                style: blackTextStyle.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 6.sp),
                                              )),
                                        ),
                                        if (state.triaseResponse.karyawan.nama
                                                .length >
                                            1) ...[
                                          CustomQrWidget(
                                            dimension: 30.sp,
                                            dataBarcode: state
                                                .triaseResponse.karyawan.nama,
                                          ),
                                        ],
                                        if (state
                                                .triaseResponse.karyawan.nama ==
                                            "") ...[
                                          SizedBox(
                                            height: 25.sp,
                                          )
                                        ],
                                        Container(
                                          color: Colors.white,
                                          child: Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Text(
                                                "( ${(state.triaseResponse.karyawan.nama == "") ? ' ......................................... ' : state.triaseResponse.karyawan.nama} )",
                                                textAlign: TextAlign.center,
                                                style: blackTextStyle.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 6.sp),
                                              )),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )),
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

  TableDeskColumn tandaTandaVital({
    required String title1,
    required String subtitle1,
    required String title2,
    required String subtitle2,
    required String title3,
    required String subtitle3,
  }) {
    return TableDeskColumn(
      border: const BorderSide(width: 1, color: Colors.black),
      children: [
        Container(
          color: Colors.white,
          child: TableDeskColumn(
            border: const BorderSide(width: 1, color: Colors.black),
            children: [
              Container(
                color: Colors.white,
                child: TableDeskRow(
                  border: const BorderSide(width: 1, color: Colors.black),
                  gaps: [
                    TableGap.weight(),
                    TableGap.weight(),
                    TableGap.weight(),
                  ],
                  children: [
                    SizedBox(
                      child: Row(children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(title1,
                                style: blackTextStyle.copyWith(
                                  fontSize: 6.sp,
                                ))),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            ":",
                            style: blackTextStyle.copyWith(),
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            subtitle1,
                            style: blackTextStyle,
                          ),
                        )
                      ]),
                    ),
                    SizedBox(
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            title2,
                            style: blackTextStyle.copyWith(
                              fontSize: 6.sp,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            ":",
                            style: blackTextStyle.copyWith(),
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            subtitle2,
                            style: blackTextStyle,
                          ),
                        )
                      ]),
                    ),
                    SizedBox(
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            title3,
                            style: blackTextStyle.copyWith(
                              fontSize: 6.sp,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            ":",
                            style: blackTextStyle.copyWith(),
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            subtitle3,
                            style: blackTextStyle,
                          ),
                        )
                      ]),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  TableDeskColumn resikoTable(
      {required String title, required String total, required String value}) {
    return TableDeskColumn(
      border: const BorderSide(width: 1, color: Colors.black),
      children: [
        Container(
          color: Colors.white,
          child: TableDeskRow(
            border: const BorderSide(width: 1, color: Colors.black),
            gaps: [
              TableGap.width(330),
              TableGap.width(205),
              TableGap.weight(),
            ],
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: blackTextStyle.copyWith(),
                  )),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  total,
                  textAlign: TextAlign.left,
                  style: blackTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  value,
                  textAlign: TextAlign.left,
                  style: blackTextStyle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

List<String> alasanDatang = ["Penyakit", "Ruda Paksa", "Cedera"];

String toNyeri({required double nyeri}) {
  switch (nyeri) {
    case 1:
      return "assets/images/nyeri/1.png";
    case 2:
      return "assets/images/nyeri/2.png";
    case 3:
      return "assets/images/nyeri/2.png";
    case 4:
      return "assets/images/nyeri/3.png";
    case 5:
      return "assets/images/nyeri/3.png";
    case 6:
      return "assets/images/nyeri/4.png";
    case 7:
      return "assets/images/nyeri/5.png";
    case 8:
      return "assets/images/nyeri/5.png";
    case 9:
      return "assets/images/nyeri/6.png";
    case 10:
      return "assets/images/nyeri/6.png";
    default:
      return "assets/images/nyeri/1.png";
  }
}

String toNyeriText({required double nyeri}) {
  switch (nyeri) {
    case 1:
      return "Tidak Ada Nyeri";
    case 2:
      return "Nyeri Ringan";
    case 3:
      return "Nyeri Ringan";
    case 4:
      return "Nyeri Yang Menganggu";
    case 5:
      return "Nyeri Yang Menganggu";
    case 6:
      return "Nyeri Yang Menyusahkan";
    case 7:
      return "Nyeri Yang Menyusahkan";
    case 8:
      return "Nyeri Hebat";
    case 9:
      return "Nyeri Hebat";
    case 10:
      return "Nyeri Sangat Hebat";
    default:
      return "Tidak Ada Nyeri";
  }
}
