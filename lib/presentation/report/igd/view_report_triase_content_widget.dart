import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/core/api/api_db.dart';
import 'package:hms_app/domain/bloc/report/report_bloc.dart';
import 'package:hms_app/domain/models/response/report/report_triase_response_model.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/component/resources/app_config.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:hms_app/presentation/component/title/title_component.dart';
import 'package:hms_app/presentation/report/component/header_with_nomor_rm_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class ViewReportTriaseContentView extends StatelessWidget {
  const ViewReportTriaseContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportBloc, ReportState>(
      builder: (context, state) {
        if (state.status == ReportStatus.loadingReportTriase) {
          return Scaffold(
            backgroundColor: ThemeColor.transparentColor,
            body: Loading.expandedLoading(),
          );
        }

        if (state.status == ReportStatus.loadedReportTriase &&
            state.reportTriase != null) {
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
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 5.sp),
                      child: Text("RM.IGD O1",
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
                        // TAMPILKAN DATA // TAMPILKAN HEADER
                        const HeaderWithNomorRMWidget(),
                        const Divider(),
                        Center(
                          child: Text(
                            "TRIASE",
                            textAlign: TextAlign.center,
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Pentunjuk beri tanda (✓) pada kolom yang anda anggap sesuai dengan kondisi pasien",
                            style: blackTextStyle,
                          ),
                        ),
                        const Divider(),
                        SizedBox(
                          width: Get.width,
                          height: 25.sp,
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 4,
                                height: 25.sp,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  child: Text(
                                    "Keluhan Utama ",
                                    style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                  child: Container(
                                height: 25.sp,
                                color: Colors.white,
                              ))
                            ],
                          ),
                        ),
                        const Divider(),
                        SizedBox(
                          width: Get.width,
                          height: 25.sp,
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 4,
                                height: 25.sp,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  child: Text(
                                    "Tanda-tanda Vital ",
                                    style: blackTextStyle.copyWith(),
                                  ),
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                  child: Container(
                                height: 25.sp,
                                color: Colors.white,
                              ))
                            ],
                          ),
                        ),
                        const Divider(),
                        SizedBox(
                          width: Get.width,
                          height: 25.sp,
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 4,
                                height: 25.sp,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  child: Text(
                                    "Status Alergi ",
                                    style: blackTextStyle.copyWith(),
                                  ),
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                  child: Container(
                                height: 25.sp,
                                color: Colors.white,
                              ))
                            ],
                          ),
                        ),
                        const Divider(),
                        SizedBox(
                          width: Get.width,
                          height: 15.sp,
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 4,
                                height: 25.sp,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  child: Text(
                                    "Gangguan Perilaku ",
                                    style: blackTextStyle.copyWith(),
                                  ),
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                  child: Container(
                                height: 25.sp,
                                color: Colors.white,
                              ))
                            ],
                          ),
                        ),
                        const Divider(),
                        SizedBox(
                          width: Get.width,
                          child: Row(
                            children: [
                              SizedBox(
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4.sp),
                                      child: Column(
                                        children: [
                                          Text(" Skala Nyeri",
                                              style: blackTextStyle.copyWith()),
                                          Container(
                                            decoration: const BoxDecoration(),
                                            child: Row(
                                              children: [
                                                boxNyeri(state,
                                                    colors: const [
                                                      Color(0xFF2F8D05),
                                                      Color(0xFF2F8D05),
                                                    ],
                                                    width: (state.reportTriase!
                                                                .nyeri.nyeri ==
                                                            0)
                                                        ? 4
                                                        : 0,
                                                    text: "0"),
                                                boxNyeri(state,
                                                    colors: const [
                                                      Color(0xFF2F8D05),
                                                      Color(0xFF499703),
                                                    ],
                                                    width: (state.reportTriase!
                                                                .nyeri.nyeri ==
                                                            1)
                                                        ? 4
                                                        : 0,
                                                    text: "1"),
                                                boxNyeri(state,
                                                    colors: const [
                                                      Color(0xFF499705),
                                                      Color(0xFF619A0E),
                                                    ],
                                                    width: (state.reportTriase!
                                                                .nyeri.nyeri ==
                                                            2)
                                                        ? 4
                                                        : 0,
                                                    text: "2"),
                                                boxNyeri(state,
                                                    colors: const [
                                                      Color(0xFF499705),
                                                      Color(0xFF619A0E),
                                                    ],
                                                    width: (state.reportTriase!
                                                                .nyeri.nyeri ==
                                                            3)
                                                        ? 4
                                                        : 0,
                                                    text: "3"),
                                                boxNyeri(state,
                                                    colors: const [
                                                      Color(0xFF669B0D),
                                                      Color(0xFF7D9F0D),
                                                    ],
                                                    width: (state.reportTriase!
                                                                .nyeri.nyeri ==
                                                            4)
                                                        ? 4
                                                        : 0,
                                                    text: "4"),
                                                boxNyeri(state,
                                                    colors: const [
                                                      Color(0xFF84A403),
                                                      Color(0xFF97A615),
                                                    ],
                                                    width: (state.reportTriase!
                                                                .nyeri.nyeri ==
                                                            5)
                                                        ? 4
                                                        : 0,
                                                    text: "5"),
                                                boxNyeri(state,
                                                    colors: const [
                                                      Color(0xFFA7AC07),
                                                      Color(0xFFB4AF17),
                                                    ],
                                                    width: (state.reportTriase!
                                                                .nyeri.nyeri ==
                                                            6)
                                                        ? 4
                                                        : 0,
                                                    text: "6"),
                                                boxNyeri(state,
                                                    colors: const [
                                                      Color(0xFFE3BB04),
                                                      Color(0xFFF3BA09),
                                                    ],
                                                    width: (state.reportTriase!
                                                                .nyeri.nyeri ==
                                                            7)
                                                        ? 4
                                                        : 0,
                                                    text: "7"),
                                                boxNyeri(state,
                                                    colors: const [
                                                      Color(0xFFD46810),
                                                      Color(0xFFC9610C),
                                                    ],
                                                    width: (state.reportTriase!
                                                                .nyeri.nyeri ==
                                                            8)
                                                        ? 4
                                                        : 0,
                                                    text: "8"),
                                                boxNyeri(state,
                                                    colors: const [
                                                      Color(0xFFCA5107),
                                                      Color(0xFFB54611),
                                                    ],
                                                    width: (state.reportTriase!
                                                                .nyeri.nyeri ==
                                                            9)
                                                        ? 4
                                                        : 0,
                                                    text: "9"),
                                                boxNyeri(state,
                                                    colors: const [
                                                      Color(0xFFC93B00),
                                                      Color(0xFFBD2405),
                                                    ],
                                                    width: (state.reportTriase!
                                                                .nyeri.nyeri ==
                                                            10)
                                                        ? 4
                                                        : 0,
                                                    text: "10"),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.sp,
                                          ),
                                          Text(
                                            toNyeriText(
                                              nyeri: state
                                                  .reportTriase!.nyeri.nyeri
                                                  .toDouble(),
                                            ),
                                            style: blackTextStyle,
                                          ),
                                          SizedBox(
                                              height: 50.sp,
                                              child: Image.asset(toNyeri(
                                                  nyeri: state
                                                      .reportTriase!.nyeri.nyeri
                                                      .toDouble()))),
                                        ],
                                      ))),

                              // ==================
                              const VerticalDivider(),
                              Expanded(
                                  child: Container(
                                color: Colors.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // ADD DATA
                                    Text(
                                      "P   : ${state.reportTriase!.nyeri.nyeriP}",
                                      style: blackTextStyle,
                                    ),
                                    Text(
                                      "Q   : ${state.reportTriase!.nyeri.nyeriQ}",
                                      style: blackTextStyle,
                                    ),
                                    Text(
                                      "R   : ${state.reportTriase!.nyeri.nyeriR}",
                                      style: blackTextStyle,
                                    ),
                                    Text(
                                      "S   : ${state.reportTriase!.nyeri.nyeriS}",
                                      style: blackTextStyle,
                                    ),
                                    Text(
                                      "T   : ${state.reportTriase!.nyeri.nyeriT}",
                                      style: blackTextStyle,
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Ket :  Profokatif : Penyebab timbulnya rasa nyeri (aktifitas,spontan, stress, dll). Quality: Seberapa berat keluhan nyeri (tumpu;, tajam, dalam permukaan, dll). Radiation Apakah menyebar (rahang, punggung, tangan, dll). Severity: Skala nyeri. Apakah disertai dengan gejala (mual, muntah, pusing, diaphoresis, pucat, nafas pendek, sesak, tanda vital yang abnormal dll). Time : Kapan mulai nyeri, konstan/kadang-kadang, lamanya, tiba-tiba/bertahap, Frekuensi.",
                            textAlign: TextAlign.justify,
                            style: blackTextStyle,
                          ),
                        ),
                        const Divider(),
                        Text(
                          "  Skala FLACC Untuk Anak < 6 Tahun",
                          style: blackTextStyle.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: Table(
                            border: TableBorder.all(color: Colors.black),
                            children: [
                              TableRow(children: [
                                TitleWidget.headerTitle(
                                    title: "Asessmen", color: Colors.white),
                                TitleWidget.headerTitle(
                                    title: "0", color: Colors.white),
                                TitleWidget.headerTitle(
                                    title: "1", color: Colors.white),
                                TitleWidget.headerTitle(
                                    title: "2", color: Colors.white),
                                TitleWidget.headerTitle(
                                    title: "Nilai", color: Colors.white),
                              ]),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: Table(
                            border: TableBorder.all(color: Colors.black),
                            children: [
                              TableRow(children: [
                                TitleWidget.headerTitleLeft(
                                    title: "Wajah",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title:
                                        "Tersenyum / tidak ada ekspresi khusus",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: "Terkadang menangis /menarik diri",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title:
                                        " Sering menggetarkan dagu dan mengatupkan rahang",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: state.reportTriase!.skalaFlacc.wajah
                                        .toString(),
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                              ]),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: Table(
                            border: TableBorder.all(color: Colors.black),
                            children: [
                              TableRow(children: [
                                TitleWidget.headerTitleLeft(
                                    title: "Kaki",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: "Gerakan Normal /Relaksasi",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: "Tidak tenang / tegang",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title:
                                        "Kaki dibuat menendang /menarik diri",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: state.reportTriase!.skalaFlacc.kaki
                                        .toString(),
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                              ]),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: Table(
                            border: TableBorder.all(color: Colors.black),
                            children: [
                              TableRow(children: [
                                TitleWidget.headerTitleLeft(
                                    title: "Aktivitas",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title:
                                        "Tidur, posisi normal, mudah bergerak",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: "Gerakan menggeliat berguling, kaku",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title:
                                        "Melengkungkan punggung /kaku/ menghentak",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: state
                                        .reportTriase!.skalaFlacc.aktivitas
                                        .toString(),
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                              ]),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: Table(
                            border: TableBorder.all(color: Colors.black),
                            children: [
                              TableRow(children: [
                                TitleWidget.headerTitleLeft(
                                    title: "Menangis",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: "Tidak Menangis (bangun/tidur)",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: "Mengerang, merengek-rengek",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title:
                                        "Menangis terus-menerus,terhisak, menjerit",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: state
                                        .reportTriase!.skalaFlacc.menangis
                                        .toString(),
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                              ]),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: Table(
                            border: TableBorder.all(color: Colors.black),
                            children: [
                              TableRow(children: [
                                TitleWidget.headerTitleLeft(
                                    title: "Bersuara",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: "Bersuara Normal,Tenang",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title:
                                        "Tenang bila dipeluk,digendong atu diajak bicara",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: "Sulit menenangkan",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: state
                                        .reportTriase!.skalaFlacc.bersuara
                                        .toString(),
                                    color: Colors.white),
                              ]),
                            ],
                          ),
                        ),

                        const Divider(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: Table(
                            border: TableBorder.all(color: Colors.black),
                            children: [
                              TableRow(children: [
                                TitleWidget.headerTitleLeft(
                                    title: "",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: "SKALA TRIASE",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: "",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: "RESPONSE TIME",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                              ]),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: Table(
                            border: TableBorder.all(color: Colors.black),
                            children: [
                              TableRow(children: [
                                TitleWidget.headerTitleLeft(
                                    title: "",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: "SKALA 1",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: "",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: "Segara",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                              ]),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: Table(
                            border: TableBorder.all(color: Colors.black),
                            children: [
                              TableRow(children: [
                                TitleWidget.headerTitleLeft(
                                    title: "",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: "SKALA 2",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: "",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: "10 Menit",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                              ]),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: Table(
                            border: TableBorder.all(color: Colors.black),
                            children: [
                              TableRow(children: [
                                TitleWidget.headerTitleLeft(
                                    title: "",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: "SKALA 3",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: "",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: "30 Menit",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                              ]),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: Table(
                            border: TableBorder.all(color: Colors.black),
                            children: [
                              TableRow(children: [
                                TitleWidget.headerTitleLeft(
                                    title: "",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: "SKALA 4",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: "",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: "60 Menit",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                              ]),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: Table(
                            border: TableBorder.all(color: Colors.black),
                            children: [
                              TableRow(children: [
                                TitleWidget.headerTitleLeft(
                                    title: "",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: "SKALA 5",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: "",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                                TitleWidget.headerTitleLeft(
                                    title: "120 Menit",
                                    color: Colors.white,
                                    blackTextStyle: blackTextStyle),
                              ]),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 25.sp,
                        )
                      ],
                    ),
                  ),

                  // =================================== NEW PAGE ============================ //
                  SizedBox(
                    height: 15.sp,
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
                        // TAMPILKAN DATA
                        // TAMPILKAN HEADER
                        SizedBox(
                          width: Get.width,
                          height: 50.sp,
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 2.5,
                                height: 50.sp,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(SetApp.logoApp(
                                          appSetup: AppConstant.appSetup)),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          SetApp.nameApp(
                                              appSetup: AppConstant.appSetup),
                                          style: blackTextStyle.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10.sp),
                                        ),
                                        Text(
                                          SetApp.alamatApp(
                                              appSetup: AppConstant.appSetup),
                                          style: blackTextStyle,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                  child: SizedBox(
                                height: 50.sp,
                                child: Container(),
                              ))
                            ],
                          ),
                        ),
                        const Divider(),
                        Center(
                          child: Text(
                            "ASESMEN AWAL MEDIS PASIEN DI RUANG GAWAT DARURAT",
                            textAlign: TextAlign.center,
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 9.sp),
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Diisi oleh Dokter IGD",
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Divider(),
                        SizedBox(
                          width: Get.width,
                          height: 25.sp,
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 4,
                                height: 25.sp,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  child: Text(
                                    "Keluhan Utama ",
                                    style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                  child: Container(
                                height: 25.sp,
                                color: Colors.white,
                              ))
                            ],
                          ),
                        ),
                        const Divider(),

                        SizedBox(
                          width: Get.width,
                          height: 15.sp,
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 4,
                                height: 15.sp,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  child: Text(
                                    "Kesadaran ",
                                    style: blackTextStyle.copyWith(),
                                  ),
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.sp),
                                  child: Table(
                                    border:
                                        TableBorder.all(color: Colors.black),
                                    children: [
                                      TableRow(children: [
                                        TitleWidget.headerTitleNoPadding(
                                            title: "CM", color: Colors.white),
                                        TitleWidget.headerTitleNoPadding(
                                            title: "Somnolen",
                                            color: Colors.white),
                                        TitleWidget.headerTitleNoPadding(
                                            title: "Apatis",
                                            color: Colors.white),
                                        TitleWidget.headerTitleNoPadding(
                                            title: "Sopor",
                                            color: Colors.white),
                                        TitleWidget.headerTitleNoPadding(
                                            title: "Koma", color: Colors.white),
                                      ]),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const Divider(),
                        SizedBox(
                          width: Get.width,
                          height: 25.sp,
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 4,
                                height: 25.sp,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  child: Text(
                                    "Telaah ",
                                    style: blackTextStyle.copyWith(),
                                  ),
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                  child: Container(
                                height: 25.sp,
                                color: Colors.white,
                              ))
                            ],
                          ),
                        ),
                        const Divider(),
                        SizedBox(
                          width: Get.width,
                          height: 15.sp,
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 4,
                                height: 25.sp,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  child: Text(
                                    "RPT ",
                                    style: blackTextStyle.copyWith(),
                                  ),
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                  child: Container(
                                height: 25.sp,
                                color: Colors.white,
                              ))
                            ],
                          ),
                        ),
                        const Divider(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          width: Get.width,
                          child: Text(" Riwayat Penyakit Keluarga",
                              style: blackTextStyle.copyWith()),
                        ),
                        const Divider(),

                        SizedBox(
                          height: 15.sp,
                        ),
                        Text(
                          "  Pemeriksaan Fisik",
                          style: blackTextStyle.copyWith(
                              fontWeight: FontWeight.bold),
                        ),

                        Column(
                          children: pemeriksaanFisik(
                                  pemeriksaanFisik:
                                      state.reportTriase!.pemeriksaanFisik)
                              .map(
                                (e) => Container(
                                  color: Colors.white,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.sp),
                                  child: TableDesk(
                                    shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.black, width: 1),
                                    ),
                                    child: TableDeskRow(
                                      border: const BorderSide(
                                          width: 1, color: Colors.black),
                                      gaps: [
                                        TableGap.width(150),
                                        TableGap.weight(),
                                      ],
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Text(
                                              e.title,
                                              style: blackTextStyle,
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ),
                                        TableDeskColumn(
                                          border: const BorderSide(
                                              width: 1, color: Colors.black),
                                          children: e.subTitle
                                              .map(
                                                (sub) => Container(
                                                  color: Colors.white,
                                                  child: TableDeskRow(
                                                    border: const BorderSide(
                                                        width: 1,
                                                        color: Colors.black),
                                                    gaps: [
                                                      TableGap.width(200),
                                                      TableGap.weight(),
                                                    ],
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          sub.name,
                                                          style: blackTextStyle,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        child: Text(
                                                          sub.deskripsi,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: blackTextStyle,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),

                        if (state.reportTriase!.imageLokais.image == "") ...[
                          Container(
                            width: Get.width,
                            height: 300.sp,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "${ApiDb.baseUrl}images/public/lokalis_default.png"))),
                          ),
                        ],
                        if (state.reportTriase!.imageLokais.image != "") ...[
                          Container(
                            width: Get.width,
                            height: 300.sp,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "${ApiDb.baseUrl}images/lokalis/${state.reportTriase!.imageLokais.image}"))),
                          ),
                        ],

                        SizedBox(height: 15.sp),

                        Padding(
                          padding: EdgeInsets.all(5.sp),
                          child: Text(
                            "Kode Gambar",
                            style: blackTextStyle,
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.all(5.sp),
                          color: Colors.white,
                          child: Wrap(
                            children: lokalis
                                .map((e) => SizedBox(
                                      width: 150.sp,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${e.title} :",
                                            style: blackTextStyle,
                                          ),
                                          SizedBox(
                                            width: 10.sp,
                                          ),
                                          Image.asset(
                                            e.images,
                                            height: 15.sp,
                                          )
                                        ],
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),

                        const Divider(),
                        SizedBox(
                          width: Get.width,
                          height: 45.sp,
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 4,
                                height: 25.sp,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  child: Text(
                                    "Rencana Penunjang ",
                                    style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const VerticalDivider(),
                              SizedBox(
                                width: 150.sp,
                              ),
                              const VerticalDivider(),
                              Expanded(
                                  child: Container(
                                height: 25.sp,
                                color: Colors.white,
                              )),
                            ],
                          ),
                        ),
                        const Divider(),
                        SizedBox(
                          width: Get.width,
                          height: 45.sp,
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 4,
                                height: 25.sp,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  child: Text(
                                    "Diagnosis ",
                                    style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                  child: Container(
                                height: 25.sp,
                                color: Colors.white,
                                child: Wrap(
                                  children: [
                                    Text(
                                      state.reportTriase!.diagnosaModel
                                          .diagnosaPrimer,
                                      style: blackTextStyle,
                                    ),
                                    Text(
                                      state.reportTriase!.diagnosaModel
                                          .diagnosaSekunder1,
                                      style: blackTextStyle,
                                    ),
                                    Text(
                                      state.reportTriase!.diagnosaModel
                                          .diagnosaSekunder2,
                                      style: blackTextStyle,
                                    ),
                                    Text(
                                      state.reportTriase!.diagnosaModel
                                          .diagnosaSekunder3,
                                      style: blackTextStyle,
                                    ),
                                    Text(
                                      state.reportTriase!.diagnosaModel
                                          .diagnosaSekunder4,
                                      style: blackTextStyle,
                                    ),
                                    Text(
                                      state.reportTriase!.diagnosaModel
                                          .diagnosaSekunder5,
                                      style: blackTextStyle,
                                    ),
                                    Text(
                                      state.reportTriase!.diagnosaModel
                                          .diagnosaSekunder6,
                                      style: blackTextStyle,
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                        const Divider(),
                        SizedBox(
                          width: Get.width,
                          height: 45.sp,
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 4,
                                height: 25.sp,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  child: Text(
                                    "Alasan Opname ",
                                    style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                  child: Container(
                                height: 25.sp,
                                color: Colors.white,
                              )),
                            ],
                          ),
                        ),
                        const Divider(),
                        SizedBox(
                          width: Get.width,
                          height: 45.sp,
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 4,
                                height: 25.sp,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  child: Text(
                                    "Rencana Asuhan / Terapi ",
                                    style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const VerticalDivider(),
                              SizedBox(
                                width: 150.sp,
                              ),
                              const VerticalDivider(),
                              Expanded(
                                  child: Container(
                                height: 25.sp,
                                color: Colors.white,
                              )),
                            ],
                          ),
                        ),
                        const Divider(),
                        SizedBox(
                          width: Get.width,
                          height: 45.sp,
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width / 4,
                                height: 25.sp,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.sp),
                                  child: Text(
                                    "Konsul Ke ",
                                    style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const VerticalDivider(),
                              Expanded(
                                  child: Container(
                                height: 25.sp,
                                color: Colors.white,
                              )),
                            ],
                          ),
                        ),
                        const Divider(),
                        SizedBox(
                          height: 25.sp,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 5.sp),
                    child: Text("RM.IGD O1",
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
                      // TAMPILKAN DATA // TAMPILKAN HEADER
                      const HeaderWithNomorRMWidget(),
                      const Divider(),
                      Center(
                        child: Text(
                          "TRIASE",
                          textAlign: TextAlign.center,
                          style: blackTextStyle.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Pentunjuk beri tanda (✓) pada kolom yang anda anggap sesuai dengan kondisi pasien",
                          style: blackTextStyle,
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        width: Get.width,
                        height: 25.sp,
                        child: Row(
                          children: [
                            SizedBox(
                              width: Get.width / 4,
                              height: 25.sp,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.sp),
                                child: Text(
                                  "Keluhan Utama ",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const VerticalDivider(),
                            Expanded(
                                child: Container(
                              height: 25.sp,
                              color: Colors.white,
                            ))
                          ],
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        width: Get.width,
                        height: 25.sp,
                        child: Row(
                          children: [
                            SizedBox(
                              width: Get.width / 4,
                              height: 25.sp,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.sp),
                                child: Text(
                                  "Tanda-tanda Vital ",
                                  style: blackTextStyle.copyWith(),
                                ),
                              ),
                            ),
                            const VerticalDivider(),
                            Expanded(
                                child: Container(
                              height: 25.sp,
                              color: Colors.white,
                            ))
                          ],
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        width: Get.width,
                        height: 25.sp,
                        child: Row(
                          children: [
                            SizedBox(
                              width: Get.width / 4,
                              height: 25.sp,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.sp),
                                child: Text(
                                  "Status Alergi ",
                                  style: blackTextStyle.copyWith(),
                                ),
                              ),
                            ),
                            const VerticalDivider(),
                            Expanded(
                                child: Container(
                              height: 25.sp,
                              color: Colors.white,
                            ))
                          ],
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        width: Get.width,
                        height: 15.sp,
                        child: Row(
                          children: [
                            SizedBox(
                              width: Get.width / 3,
                              height: 25.sp,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.sp),
                                child: Text(
                                  "Gangguan Perilaku ",
                                  style: blackTextStyle.copyWith(),
                                ),
                              ),
                            ),
                            const VerticalDivider(),
                            Expanded(
                                child: Container(
                              height: 25.sp,
                              color: Colors.white,
                            ))
                          ],
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        width: Get.width,
                        child: Row(
                          children: [
                            SizedBox(
                                child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.sp),
                                    child: Column(
                                      children: [
                                        Text(" Skala Nyeri",
                                            style: blackTextStyle.copyWith()),
                                        Container(
                                          width: Get.width / 2,
                                          decoration: const BoxDecoration(),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 15.sp,
                                                height: 15.sp,
                                                decoration: const BoxDecoration(
                                                    gradient: LinearGradient(
                                                  colors: [
                                                    Color(0xFF2F8D05),
                                                    Color(0xFF499703),
                                                  ],
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                )),
                                                child: Center(
                                                  child: Text("1",
                                                      style: whiteTextStyle
                                                          .copyWith(
                                                              fontSize: 12.sp)),
                                                ),
                                              ),
                                              Container(
                                                width: 15.sp,
                                                height: 15.sp,
                                                decoration: const BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFF499705),
                                                      Color(0xFF619A0E),
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text("2",
                                                      style: whiteTextStyle
                                                          .copyWith(
                                                              fontSize: 12.sp)),
                                                ),
                                              ),
                                              Container(
                                                width: 15.sp,
                                                height: 15.sp,
                                                decoration: const BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFF669B0D),
                                                      Color(0xFF7D9F0D),
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text("3",
                                                      style: whiteTextStyle
                                                          .copyWith(
                                                              fontSize: 12.sp)),
                                                ),
                                              ),
                                              Container(
                                                width: 15.sp,
                                                height: 15.sp,
                                                decoration: const BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFF84A403),
                                                      Color(0xFF97A615),
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text("4",
                                                      style: whiteTextStyle
                                                          .copyWith(
                                                              fontSize: 12.sp)),
                                                ),
                                              ),
                                              Container(
                                                width: 15.sp,
                                                height: 15.sp,
                                                decoration: const BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFA7AC07),
                                                      Color(0xFFB4AF17),
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text("5",
                                                      style: whiteTextStyle
                                                          .copyWith(
                                                              fontSize: 12.sp)),
                                                ),
                                              ),
                                              Container(
                                                width: 15.sp,
                                                height: 15.sp,
                                                decoration: const BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFA7AC07),
                                                      Color(0xFFB4AF17),
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text("6",
                                                      style: whiteTextStyle
                                                          .copyWith(
                                                              fontSize: 12.sp)),
                                                ),
                                              ),
                                              Container(
                                                width: 15.sp,
                                                height: 15.sp,
                                                decoration: const BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFE3BB04),
                                                      Color(0xFFF3BA09),
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text("7",
                                                      style: whiteTextStyle
                                                          .copyWith(
                                                              fontSize: 12.sp)),
                                                ),
                                              ),
                                              Container(
                                                width: 15.sp,
                                                height: 15.sp,
                                                decoration: const BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFD46810),
                                                      Color(0xFFC9610C),
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text("8",
                                                      style: whiteTextStyle
                                                          .copyWith(
                                                              fontSize: 12.sp)),
                                                ),
                                              ),
                                              Container(
                                                width: 15.sp,
                                                height: 15.sp,
                                                decoration: const BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFCA5107),
                                                      Color(0xFFB54611),
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text("9",
                                                      style: whiteTextStyle
                                                          .copyWith(
                                                              fontSize: 12.sp)),
                                                ),
                                              ),
                                              Container(
                                                width: 15.sp,
                                                height: 15.sp,
                                                decoration: const BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFC93B00),
                                                      Color(0xFFBD2405),
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text("10",
                                                      style: whiteTextStyle
                                                          .copyWith(
                                                              fontSize: 12.sp)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ))),

                            // ==================
                            const VerticalDivider(),

                            Expanded(
                                child: Container(
                              height: 25.sp,
                              color: Colors.white,
                              child: Text(
                                "Skala Nyeri Test",
                                style: blackTextStyle,
                              ),
                            )),
                          ],
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Ket :  Profokatif : Penyebab timbulnya rasa nyeri (aktifitas,spontan, stress, dll). Quality: Seberapa berat keluhan nyeri (tumpu;, tajam, dalam permukaan, dll). Radiation Apakah menyebar (rahang, punggung, tangan, dll). Severity: Skala nyeri. Apakah disertai dengan gejala (mual, muntah, pusing, diaphoresis, pucat, nafas pendek, sesak, tanda vital yang abnormal dll). Time : Kapan mulai nyeri, konstan/kadang-kadang, lamanya, tiba-tiba/bertahap, Frekuensi.",
                          textAlign: TextAlign.justify,
                          style: blackTextStyle,
                        ),
                      ),
                      const Divider(),
                      Text(
                        "  Skala FLACC Untuk Anak < 6 Tahun",
                        style: blackTextStyle.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: Table(
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              TitleWidget.headerTitle(
                                title: "Asessmen",
                                color: Colors.white,
                              ),
                              TitleWidget.headerTitle(
                                  title: "0", color: Colors.white),
                              TitleWidget.headerTitle(
                                  title: "1", color: Colors.white),
                              TitleWidget.headerTitle(
                                  title: "2", color: Colors.white),
                              TitleWidget.headerTitle(
                                  title: "Nilai", color: Colors.white),
                            ]),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: Table(
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              TitleWidget.headerTitleLeft(
                                  title: "Wajah",
                                  color: Colors.white,
                                  blackTextStyle: blackTextStyle),
                              TitleWidget.headerTitleLeft(
                                  title:
                                      "Tersenyum / tidak ada ekspresi khusus",
                                  blackTextStyle: blackTextStyle,
                                  color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "Terkadang menangis /menarik diri",
                                  blackTextStyle: blackTextStyle,
                                  color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title:
                                      " Sering menggetarkan dagu dan mengatupkan rahang",
                                  blackTextStyle: blackTextStyle,
                                  color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "0", color: Colors.white),
                            ]),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: Table(
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              TitleWidget.headerTitleLeft(
                                  title: "Kaki", color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "Gerakan Normal /Relaksasi",
                                  blackTextStyle: blackTextStyle,
                                  color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "Tidak tenang / tegang",
                                  blackTextStyle: blackTextStyle,
                                  color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "Kaki dibuat menendang /menarik diri",
                                  blackTextStyle: blackTextStyle,
                                  color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                title: "0",
                                color: Colors.white,
                                blackTextStyle: blackTextStyle,
                              ),
                            ]),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: Table(
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              TitleWidget.headerTitleLeft(
                                  title: "Aktivitas", color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "Tidur, posisi normal, mudah bergerak",
                                  blackTextStyle: blackTextStyle,
                                  color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "Gerakan menggeliat berguling, kaku",
                                  blackTextStyle: blackTextStyle,
                                  color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title:
                                      "Melengkungkan punggung /kaku/ menghentak",
                                  blackTextStyle: blackTextStyle,
                                  color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                title: "0",
                                color: Colors.white,
                                blackTextStyle: blackTextStyle,
                              ),
                            ]),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: Table(
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              TitleWidget.headerTitleLeft(
                                  title: "Menangis", color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "Tidak Menangis (bangun/tidur)",
                                  blackTextStyle: blackTextStyle,
                                  color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "Mengerang, merengek-rengek",
                                  blackTextStyle: blackTextStyle,
                                  color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title:
                                      "Menangis terus-menerus,terhisak, menjerit",
                                  blackTextStyle: blackTextStyle,
                                  color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                title: "0",
                                color: Colors.white,
                                blackTextStyle: blackTextStyle,
                              ),
                            ]),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: Table(
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              TitleWidget.headerTitleLeft(
                                  title: "Bersuara", color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "Bersuara Normal,Tenang",
                                  blackTextStyle: blackTextStyle,
                                  color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title:
                                      "Tenang bila dipeluk,digendong atu diajak bicara",
                                  blackTextStyle: blackTextStyle,
                                  color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "Sulit menenangkan",
                                  blackTextStyle: blackTextStyle,
                                  color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                title: "0",
                                color: Colors.white,
                                blackTextStyle: blackTextStyle,
                              ),
                            ]),
                          ],
                        ),
                      ),

                      const Divider(),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: Table(
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              TitleWidget.headerTitleLeft(
                                title: "",
                                color: Colors.white,
                                blackTextStyle: blackTextStyle,
                              ),
                              TitleWidget.headerTitleLeft(
                                title: "SKALA TRIASE",
                                color: Colors.white,
                                blackTextStyle: blackTextStyle,
                              ),
                              TitleWidget.headerTitleLeft(
                                title: "",
                                color: Colors.white,
                                blackTextStyle: blackTextStyle,
                              ),
                              TitleWidget.headerTitleLeft(
                                title: "RESPONSE TIME",
                                color: Colors.white,
                                blackTextStyle: blackTextStyle,
                              ),
                            ]),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: Table(
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              TitleWidget.headerTitleLeft(
                                title: "",
                                color: Colors.white,
                                blackTextStyle: blackTextStyle,
                              ),
                              TitleWidget.headerTitleLeft(
                                title: "SKALA 1",
                                color: Colors.white,
                                blackTextStyle: blackTextStyle,
                              ),
                              TitleWidget.headerTitleLeft(
                                title: "",
                                color: Colors.white,
                                blackTextStyle: blackTextStyle,
                              ),
                              TitleWidget.headerTitleLeft(
                                title: "Segara",
                                color: Colors.white,
                                blackTextStyle: blackTextStyle,
                              ),
                            ]),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: Table(
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              TitleWidget.headerTitleLeft(
                                title: "",
                                color: Colors.white,
                                blackTextStyle: blackTextStyle,
                              ),
                              TitleWidget.headerTitleLeft(
                                title: "SKALA 2",
                                color: Colors.white,
                                blackTextStyle: blackTextStyle,
                              ),
                              TitleWidget.headerTitleLeft(
                                title: "",
                                color: Colors.white,
                                blackTextStyle: blackTextStyle,
                              ),
                              TitleWidget.headerTitleLeft(
                                title: "10 Menit",
                                color: Colors.white,
                                blackTextStyle: blackTextStyle,
                              ),
                            ]),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: Table(
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              TitleWidget.headerTitleLeft(
                                  title: "", color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "SKALA 3", color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "", color: Colors.white),
                              TitleWidget.headerTitleLeft(
                                  title: "30 Menit", color: Colors.white),
                            ]),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: Table(
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              TitleWidget.headerTitleLeft(
                                title: "",
                                color: Colors.white,
                                blackTextStyle: blackTextStyle,
                              ),
                              TitleWidget.headerTitleLeft(
                                title: "SKALA 4",
                                color: Colors.white,
                                blackTextStyle: blackTextStyle,
                              ),
                              TitleWidget.headerTitleLeft(
                                title: "",
                                color: Colors.white,
                                blackTextStyle: blackTextStyle,
                              ),
                              TitleWidget.headerTitleLeft(
                                title: "60 Menit",
                                color: Colors.white,
                                blackTextStyle: blackTextStyle,
                              ),
                            ]),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        child: Table(
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              TitleWidget.headerTitleLeft(
                                title: "",
                                color: Colors.white,
                                blackTextStyle: blackTextStyle,
                              ),
                              TitleWidget.headerTitleLeft(
                                title: "SKALA 5",
                                color: Colors.white,
                                blackTextStyle: blackTextStyle,
                              ),
                              TitleWidget.headerTitleLeft(
                                title: "",
                                color: Colors.white,
                                blackTextStyle: blackTextStyle,
                              ),
                              TitleWidget.headerTitleLeft(
                                title: "120 Menit",
                                color: Colors.white,
                                blackTextStyle: blackTextStyle,
                              ),
                            ]),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 25.sp,
                      )
                    ],
                  ),
                ),

                // =================================== NEW PAGE ============================ //
                SizedBox(
                  height: 15.sp,
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
                      // TAMPILKAN DATA
                      // TAMPILKAN HEADER
                      SizedBox(
                        width: Get.width,
                        height: 50.sp,
                        child: Row(
                          children: [
                            SizedBox(
                              width: Get.width / 2.5,
                              height: 50.sp,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(SetApp.logoApp(
                                        appSetup: AppConstant.appSetup)),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        SetApp.nameApp(
                                            appSetup: AppConstant.appSetup),
                                        style: blackTextStyle.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp),
                                      ),
                                      Text(
                                        SetApp.alamatApp(
                                            appSetup: AppConstant.appSetup),
                                        style: blackTextStyle,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const VerticalDivider(),
                            Expanded(
                                child: SizedBox(
                              height: 50.sp,
                              child: Container(),
                            ))
                          ],
                        ),
                      ),
                      const Divider(),
                      Center(
                        child: Text(
                          "ASESMEN AWAL MEDIS PASIEN DI RUANG GAWAT DARURAT",
                          textAlign: TextAlign.center,
                          style: blackTextStyle.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 9.sp),
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Diisi oleh Dokter IGD",
                          style: blackTextStyle.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        width: Get.width,
                        height: 25.sp,
                        child: Row(
                          children: [
                            SizedBox(
                              width: Get.width / 4,
                              height: 25.sp,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.sp),
                                child: Text(
                                  "Keluhan Utama ",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const VerticalDivider(),
                            Expanded(
                                child: Container(
                              height: 25.sp,
                              color: Colors.white,
                            ))
                          ],
                        ),
                      ),
                      const Divider(),

                      SizedBox(
                        width: Get.width,
                        height: 15.sp,
                        child: Row(
                          children: [
                            SizedBox(
                              width: Get.width / 4,
                              height: 15.sp,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.sp),
                                child: Text(
                                  "Kesadaran ",
                                  style: blackTextStyle.copyWith(),
                                ),
                              ),
                            ),
                            const VerticalDivider(),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 5.sp),
                                child: Table(
                                  border: TableBorder.all(color: Colors.black),
                                  children: [
                                    TableRow(children: [
                                      TitleWidget.headerTitleNoPadding(
                                          title: "CM", color: Colors.white),
                                      TitleWidget.headerTitleNoPadding(
                                          title: "Somnolen",
                                          color: Colors.white),
                                      TitleWidget.headerTitleNoPadding(
                                          title: "Apatis", color: Colors.white),
                                      TitleWidget.headerTitleNoPadding(
                                          title: "Sopor", color: Colors.white),
                                      TitleWidget.headerTitleNoPadding(
                                          title: "Koma", color: Colors.white),
                                    ]),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        width: Get.width,
                        height: 25.sp,
                        child: Row(
                          children: [
                            SizedBox(
                              width: Get.width / 4,
                              height: 25.sp,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.sp),
                                child: Text(
                                  "Telaah ",
                                  style: blackTextStyle.copyWith(),
                                ),
                              ),
                            ),
                            const VerticalDivider(),
                            Expanded(
                                child: Container(
                              height: 25.sp,
                              color: Colors.white,
                            ))
                          ],
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        width: Get.width,
                        height: 15.sp,
                        child: Row(
                          children: [
                            SizedBox(
                              width: Get.width / 4,
                              height: 25.sp,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.sp),
                                child: Text(
                                  "RPT ",
                                  style: blackTextStyle.copyWith(),
                                ),
                              ),
                            ),
                            const VerticalDivider(),
                            Expanded(
                                child: Container(
                              height: 25.sp,
                              color: Colors.white,
                            ))
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.sp),
                        width: Get.width,
                        child: Text(" Riwayat Penyakit Keluarga",
                            style: blackTextStyle.copyWith()),
                      ),
                      const Divider(),

                      SizedBox(
                        height: 15.sp,
                      ),
                      Text(
                        "  Pemeriksaan Fisik",
                        style: blackTextStyle.copyWith(
                            fontWeight: FontWeight.bold),
                      ),

                      if (state.reportTriase != null) ...[
                        Column(
                          children: pemeriksaanFisik(
                                  pemeriksaanFisik:
                                      state.reportTriase!.pemeriksaanFisik)
                              .map(
                                (e) => Container(
                                  color: Colors.white,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.sp),
                                  child: TableDesk(
                                    shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.black, width: 1),
                                    ),
                                    child: TableDeskRow(
                                      border: const BorderSide(
                                          width: 1, color: Colors.black),
                                      gaps: [
                                        TableGap.width(150),
                                        TableGap.weight(),
                                      ],
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Text(
                                              e.title,
                                              style: blackTextStyle,
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ),
                                        TableDeskColumn(
                                          border: const BorderSide(
                                              width: 1, color: Colors.black),
                                          children: e.subTitle
                                              .map(
                                                (sub) => Container(
                                                  color: Colors.white,
                                                  child: TableDeskRow(
                                                    border: const BorderSide(
                                                        width: 1,
                                                        color: Colors.black),
                                                    gaps: [
                                                      TableGap.width(200),
                                                      TableGap.weight(),
                                                    ],
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          sub.name,
                                                          style: blackTextStyle,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        child: Text(
                                                          sub.deskripsi,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: blackTextStyle,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],

                      Container(
                        width: Get.width,
                        height: 300.sp,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "${ApiDb.baseUrl}images/public/lokalis_default.png"))),
                      ),

                      SizedBox(height: 15.sp),

                      Padding(
                        padding: EdgeInsets.all(5.sp),
                        child: Text(
                          "Kode Gambar",
                          style: blackTextStyle,
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.all(5.sp),
                        color: Colors.white,
                        child: Wrap(
                          children: lokalis
                              .map((e) => SizedBox(
                                    width: 150.sp,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${e.title} :",
                                          style: blackTextStyle,
                                        ),
                                        SizedBox(
                                          width: 10.sp,
                                        ),
                                        Image.asset(
                                          e.images,
                                          height: 15.sp,
                                        )
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),

                      const Divider(),
                      SizedBox(
                        width: Get.width,
                        height: 45.sp,
                        child: Row(
                          children: [
                            SizedBox(
                              width: Get.width / 4,
                              height: 25.sp,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.sp),
                                child: Text(
                                  "Rencana Penunjang ",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const VerticalDivider(),
                            SizedBox(
                              width: 150.sp,
                            ),
                            const VerticalDivider(),
                            Expanded(
                                child: Container(
                              height: 25.sp,
                              color: Colors.white,
                            )),
                          ],
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        width: Get.width,
                        height: 45.sp,
                        child: Row(
                          children: [
                            SizedBox(
                              width: Get.width / 4,
                              height: 25.sp,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.sp),
                                child: Text(
                                  "Diagnosis ",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const VerticalDivider(),
                            Expanded(
                                child: Container(
                              height: 25.sp,
                              color: Colors.white,
                            )),
                          ],
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        width: Get.width,
                        height: 45.sp,
                        child: Row(
                          children: [
                            SizedBox(
                              width: Get.width / 4,
                              height: 25.sp,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.sp),
                                child: Text(
                                  "Alasan Opname ",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const VerticalDivider(),
                            Expanded(
                                child: Container(
                              height: 25.sp,
                              color: Colors.white,
                            )),
                          ],
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        width: Get.width,
                        height: 45.sp,
                        child: Row(
                          children: [
                            SizedBox(
                              width: Get.width / 4,
                              height: 25.sp,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.sp),
                                child: Text(
                                  "Rencana Asuhan / Terapi ",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const VerticalDivider(),
                            SizedBox(
                              width: 150.sp,
                            ),
                            const VerticalDivider(),
                            Expanded(
                                child: Container(
                              height: 25.sp,
                              color: Colors.white,
                            )),
                          ],
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        width: Get.width,
                        height: 45.sp,
                        child: Row(
                          children: [
                            SizedBox(
                              width: Get.width / 4,
                              height: 25.sp,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.sp),
                                child: Text(
                                  "Konsul Ke ",
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const VerticalDivider(),
                            Expanded(
                                child: Container(
                              height: 25.sp,
                              color: Colors.white,
                            )),
                          ],
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        height: 25.sp,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  SizedBox boxDuaWidget({required String title, required String subTitle}) {
    return SizedBox(
      width: Get.width,
      height: 15.sp,
      child: Row(
        children: [
          SizedBox(
            width: Get.width / 4,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.sp),
              child: Text(
                title,
                style: blackTextStyle,
              ),
            ),
          ),
          const VerticalDivider(),
          Expanded(
              child: Container(
            height: 15.sp,
            color: Colors.white,
            child: Text(
              subTitle,
              style: blackTextStyle,
            ),
          )),
        ],
      ),
    );
  }

  Container boxNyeri(ReportState state,
      {required List<Color> colors,
      required double width,
      required String text}) {
    return Container(
      width: 15.sp,
      height: 15.sp,
      decoration: BoxDecoration(
          border: Border.all(width: width, color: Colors.black),
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          )),
      child: Center(
        child: Text(text, style: whiteTextStyle.copyWith(fontSize: 12.sp)),
      ),
    );
  }
}

class PemeriksaanFisikTable {
  final String title;
  final List<Fisik> subTitle;
  PemeriksaanFisikTable({
    required this.title,
    required this.subTitle,
  });
}

class Fisik {
  final String name;
  final String deskripsi;

  Fisik({required this.deskripsi, required this.name});
}

List<PemeriksaanFisikTable> pemeriksaanFisik(
    {required PemeriksaanFisikModel pemeriksaanFisik}) {
  return [
    PemeriksaanFisikTable(title: "Kepala", subTitle: [
      Fisik(
        deskripsi: pemeriksaanFisik.mata,
        name: "Mata",
      ),
      Fisik(
        deskripsi: pemeriksaanFisik.tht,
        name: "THT",
      ),
      Fisik(
        deskripsi: pemeriksaanFisik.mulut,
        name: "Mulut/Gigi",
      )
    ]),
    PemeriksaanFisikTable(title: "Leher", subTitle: [
      Fisik(
        deskripsi: pemeriksaanFisik.mata,
        name: "Thyroid",
      ),
      Fisik(
        deskripsi: pemeriksaanFisik.leherlain,
        name: "Lain-lain",
      ),
    ]),
    PemeriksaanFisikTable(title: "Dinding Dada", subTitle: [
      Fisik(
        deskripsi: pemeriksaanFisik.mata,
        name: "Suara Jantung",
      ),
      Fisik(
        deskripsi: pemeriksaanFisik.suaraParu,
        name: "Suara Paru",
      ),
    ]),
    PemeriksaanFisikTable(title: "Abdomen", subTitle: [
      Fisik(
        deskripsi: pemeriksaanFisik.mata,
        name: "Dinding Perut",
      ),
      Fisik(
        deskripsi: pemeriksaanFisik.suaraParu,
        name: "Hati / Lien",
      ),
      Fisik(
        deskripsi: pemeriksaanFisik.persitaltik,
        name: "Peristaltik Usus",
      ),
      Fisik(
        deskripsi: pemeriksaanFisik.abdomenLain,
        name: "Lain-lain",
      ),
    ]),
    PemeriksaanFisikTable(title: "Extremitas", subTitle: [
      Fisik(
        deskripsi: pemeriksaanFisik.superior,
        name: "Superior",
      ),
      Fisik(
        deskripsi: pemeriksaanFisik.inferior,
        name: "Inferior",
      ),
    ]),
  ];
}

class LokalisModel {
  final String title;
  final String images;
  LokalisModel({
    required this.title,
    required this.images,
  });
}

List<LokalisModel> lokalis = [
  LokalisModel(title: "Abrasi", images: "assets/images/lokalis/am.png"),
  LokalisModel(title: "Combustio", images: "assets/images/lokalis/cm.png"),
  LokalisModel(
      title: "Vulnus\nAppertum", images: "assets/images/lokalis/vam.png"),
  LokalisModel(title: "Deformitas", images: "assets/images/lokalis/do.png"),
  LokalisModel(title: "Ulkus", images: "assets/images/lokalis/um.png"),
  LokalisModel(title: "Hematoma", images: "assets/images/lokalis/hm.png"),
  LokalisModel(title: "Nyeri", images: "assets/images/lokalis/nm.png"),
  LokalisModel(title: "Lain-Lain", images: "assets/images/lokalis/lm.png"),
];

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
