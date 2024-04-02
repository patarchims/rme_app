import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/component/resources/app_constant.dart';
import 'package:hms_app/presentation/kebidanan/bloc/identitas_bayi/indentias_bayi_bloc.dart';
import 'package:hms_app/presentation/report/component/header_report_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class ReportIdentitasBayiPageWidget extends StatefulWidget {
  const ReportIdentitasBayiPageWidget({super.key});

  @override
  State<ReportIdentitasBayiPageWidget> createState() =>
      _ReportIdentitasBayiPageWidgetState();
}

class _ReportIdentitasBayiPageWidgetState
    extends State<ReportIdentitasBayiPageWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndentiasBayiBloc, IndentiasBayiState>(
      builder: (context, state) {
        if (state.status == IndentiasBayiStatus.loading) {
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
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 5.sp),
                        child: Text("RM. 18 B",
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
                            margin: EdgeInsets.all(2.sp),
                            child: Center(
                              child: Text(
                                "SURAT IDENTITAS BAYI",
                                textAlign: TextAlign.center,
                                style: blackTextStyle.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: TableDesk(
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black, width: 1),
                              ),
                              child: TableDeskRow(
                                border: const BorderSide(
                                    width: 1, color: Colors.black),
                                gaps: [
                                  TableGap.weight(),
                                  TableGap.weight(),
                                ],
                                children: [
                                  Container(
                                    color: Colors.white,
                                    padding: const EdgeInsets.all(8),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          right: 5.sp, left: 5.sp),
                                      child: FB5Row(
                                        classNames: 'px-xs-0 px-lg-0 gx-0',
                                        children: [
                                          FB5Col(
                                              classNames: 'col-12',
                                              child: Column(
                                                children: [
                                                  TitleWidget
                                                      .boxPemeriksaanFisikSugestion(
                                                    padding: 0.0,
                                                    width: 55.sp,
                                                    widget: Text(
                                                      ": ${state.identitasBayi.identitasBayi.namaIbu}",
                                                      style: blackTextStyle,
                                                    ),
                                                    title: "Nama Ibu",
                                                  ),
                                                  TitleWidget
                                                      .boxPemeriksaanFisikSugestion(
                                                    padding: 0.0,
                                                    width: 55.sp,
                                                    widget: Text(
                                                      ": ${state.identitasBayi.identitasBayi.id}",
                                                      style: blackTextStyle,
                                                    ),
                                                    title: "No. Rekam Medis",
                                                  ),
                                                  TitleWidget
                                                      .boxPemeriksaanFisikSugestion(
                                                    padding: 0.0,
                                                    width: 55.sp,
                                                    widget: Text(
                                                      ": ${state.identitasBayi.identitasBayi.namaAyah}",
                                                      style: blackTextStyle,
                                                    ),
                                                    title: "Nama Ayah",
                                                  ),
                                                  TitleWidget
                                                      .boxPemeriksaanFisikSugestion(
                                                    padding: 0.0,
                                                    width: 55.sp,
                                                    widget: Text(
                                                      ": ${state.identitasBayi.identitasBayi.alamat}",
                                                      style: blackTextStyle,
                                                    ),
                                                    title: "Alamat",
                                                  ),
                                                  TitleWidget
                                                      .boxPemeriksaanFisikSugestion(
                                                    padding: 0.0,
                                                    width: 55.sp,
                                                    widget: Text(
                                                      ": ${state.identitasBayi.identitasBayi.telp}",
                                                      style: blackTextStyle,
                                                    ),
                                                    title: "Telp.",
                                                  ),
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    padding: const EdgeInsets.all(8),
                                    child: FB5Row(
                                      classNames: 'px-xs-0 px-lg-0 gx-0',
                                      children: [
                                        FB5Col(
                                            classNames: 'col-12',
                                            child: Column(
                                              children: [
                                                TitleWidget
                                                    .boxPemeriksaanFisikSugestion(
                                                  padding: 0.0,
                                                  width: 55.sp,
                                                  widget: Text(
                                                    ": ${state.identitasBayi.identitasBayi.firstname}",
                                                    style: blackTextStyle,
                                                  ),
                                                  title: "Nama Bayi",
                                                ),
                                                TitleWidget
                                                    .boxPemeriksaanFisikSugestion(
                                                  padding: 0.0,
                                                  width: 55.sp,
                                                  widget: Text(
                                                    ": ${tglIndo(state.identitasBayi.identitasBayi.tglLahir.substring(0, 10))}",
                                                    style: blackTextStyle,
                                                  ),
                                                  title: "Tanggal Lahir",
                                                ),
                                                TitleWidget
                                                    .boxPemeriksaanFisikSugestion(
                                                  padding: 0.0,
                                                  width: 55.sp,
                                                  widget: Text(
                                                    ": ${state.identitasBayi.identitasBayi.id}",
                                                    style: blackTextStyle,
                                                  ),
                                                  title: "No. Rekam Medis",
                                                ),
                                                TitleWidget
                                                    .boxPemeriksaanFisikSugestion(
                                                  padding: 0.0,
                                                  width: 55.sp,
                                                  widget: Text(
                                                    ": ",
                                                    style: blackTextStyle,
                                                  ),
                                                  title: "Ruangan/Kelas",
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FB5Row(
                                classNames: 'px-xs-0 px-lg-0 gx-0',
                                children: [
                                  FB5Col(
                                      classNames: 'col-6',
                                      child: TitleWidget
                                          .boxPemeriksaanFisikSugestion(
                                        padding: 0.0,
                                        width: 55.sp,
                                        widget: Text(
                                          ": ${tglIndo(state.identitasBayi.identitasBayi.tglLahir.substring(0, 10))}",
                                          style: blackTextStyle,
                                        ),
                                        title: "Tanggal Lahir Bayi",
                                      )),
                                  FB5Col(
                                      classNames: 'col-6',
                                      child: TitleWidget
                                          .boxPemeriksaanFisikSugestion(
                                        padding: 0.0,
                                        width: 55.sp,
                                        widget: Text(
                                          ": ",
                                          style: blackTextStyle,
                                        ),
                                        title: "Jam",
                                      )),
                                  FB5Col(
                                      classNames: 'col-6',
                                      child: TitleWidget
                                          .boxPemeriksaanFisikSugestion(
                                        padding: 0.0,
                                        width: 55.sp,
                                        widget: Text(
                                          ": ${state.identitasBayi.identitasBayi.jenisKelamin}",
                                          style: blackTextStyle,
                                        ),
                                        title: "Jenis Kelamin",
                                      )),
                                  FB5Col(
                                      classNames: 'col-6',
                                      child: TitleWidget
                                          .boxPemeriksaanFisikSugestion(
                                        padding: 0.0,
                                        width: 55.sp,
                                        widget: Text(
                                          ": ${state.identitasBayi.vitalSignPerina.warnaKulit}",
                                          style: blackTextStyle,
                                        ),
                                        title: "Warna Kulit",
                                      )),
                                  FB5Col(
                                      classNames: 'col-6',
                                      child: TitleWidget
                                          .boxPemeriksaanFisikSugestion(
                                        padding: 0.0,
                                        width: 55.sp,
                                        widget: Text(
                                          ": ${state.identitasBayi.vitalSignPerina.beratLahir}",
                                          style: blackTextStyle,
                                        ),
                                        title: "Berat Lahir",
                                      )),
                                  FB5Col(
                                      classNames: 'col-6',
                                      child: TitleWidget
                                          .boxPemeriksaanFisikSugestion(
                                        padding: 0.0,
                                        width: 55.sp,
                                        widget: Text(
                                          ": ${state.identitasBayi.vitalSignPerina.panjangBadan}",
                                          style: blackTextStyle,
                                        ),
                                        title: "Panjang Badan",
                                      )),
                                ],
                              )),
                          Container(
                            color: Colors.white,
                            child: TableDesk(
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black, width: 1),
                              ),
                              child: TableDeskRow(
                                border: const BorderSide(
                                    width: 1, color: Colors.black),
                                gaps: [
                                  TableGap.weight(),
                                  TableGap.weight(),
                                ],
                                children: [
                                  Container(
                                    color: Colors.white,
                                    padding: const EdgeInsets.all(8),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          right: 5.sp, left: 5.sp),
                                      child: FB5Row(
                                        classNames: 'px-xs-0 px-lg-0 gx-0',
                                        children: [
                                          FB5Col(
                                            classNames: 'col-12',
                                            child: Center(
                                              child: Text(
                                                "Pemberian Gelang Pada Bayi Oleh :\n${state.identitasBayi.imageFiles.namaPemberiGelangBayi}",
                                                style: blackTextStyle,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    padding: const EdgeInsets.all(8),
                                    child: FB5Row(
                                      classNames: 'px-xs-0 px-lg-0 gx-0',
                                      children: [
                                        FB5Col(
                                            classNames: 'col-12',
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Nama Dokter / Bidan Penolong",
                                                  style: blackTextStyle,
                                                ),
                                                SizedBox(
                                                  height: 35.sp,
                                                ),
                                                Text(
                                                  "( ..................................... )",
                                                  style: blackTextStyle,
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            child: Table(
                              border: TableBorder.all(color: Colors.black),
                              children: [
                                TableRow(children: [
                                  SizedBox(
                                    height: 150.sp,
                                    child: Scaffold(
                                      backgroundColor: ThemeColor.bgColor,
                                      appBar: AppBar(
                                        automaticallyImplyLeading: false,
                                        backgroundColor: ThemeColor.whiteColor,
                                        title: Text(
                                          "Cap Ibu Jari Tangan Kiri Ibu :",
                                          style: blackTextStyle,
                                        ),
                                      ),
                                      body: (state.identitasBayi.imageFiles
                                                  .tanganKiriIbu ==
                                              "")
                                          ? Container(
                                              height: Get.height,
                                              width: Get.width,
                                              margin: EdgeInsets.all(5.sp),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.sp),
                                                  color: ThemeColor.darkColor),
                                              child: Icon(
                                                FontAwesomeIcons.solidImage,
                                                size: 55.sp,
                                              ),
                                            )
                                          : Container(
                                              height: Get.height,
                                              width: Get.width,
                                              margin: EdgeInsets.all(5.sp),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.sp),
                                                  color: ThemeColor.darkColor,
                                                  image: DecorationImage(
                                                      image: NetworkImage(AppConstant
                                                              .identitasBayiImage +
                                                          state
                                                              .identitasBayi
                                                              .imageFiles
                                                              .tanganKiriIbu),
                                                      fit: BoxFit.cover)),
                                            ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 150.sp,
                                    child: Scaffold(
                                      backgroundColor: ThemeColor.bgColor,
                                      appBar: AppBar(
                                        backgroundColor: ThemeColor.whiteColor,
                                        automaticallyImplyLeading: false,
                                        title: Text(
                                          "Cap Sidik Kaki Kiri Bayi :",
                                          style: blackTextStyle,
                                        ),
                                      ),
                                      body: (state.identitasBayi.imageFiles
                                                  .kakiKiriBayi ==
                                              "")
                                          ? Container(
                                              height: Get.height,
                                              width: Get.width,
                                              margin: EdgeInsets.all(5.sp),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.sp),
                                                  color: ThemeColor.darkColor),
                                              child: Icon(
                                                FontAwesomeIcons.solidImage,
                                                size: 55.sp,
                                              ),
                                            )
                                          : Container(
                                              height: Get.height,
                                              width: Get.width,
                                              margin: EdgeInsets.all(5.sp),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.sp),
                                                  color: ThemeColor.darkColor,
                                                  image: DecorationImage(
                                                      image: NetworkImage(AppConstant
                                                              .identitasBayiImage +
                                                          state
                                                              .identitasBayi
                                                              .imageFiles
                                                              .kakiKiriBayi),
                                                      fit: BoxFit.cover)),
                                            ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 150.sp,
                                    child: Scaffold(
                                      backgroundColor: ThemeColor.bgColor,
                                      appBar: AppBar(
                                        backgroundColor: ThemeColor.whiteColor,
                                        automaticallyImplyLeading: false,
                                        title: Text(
                                          "Cap Sidik Kaki Kanan Bayi :",
                                          style: blackTextStyle,
                                        ),
                                      ),
                                      body: (state.identitasBayi.imageFiles
                                                  .kakiKananBayi ==
                                              "")
                                          ? Container(
                                              height: Get.height,
                                              width: Get.width,
                                              margin: EdgeInsets.all(5.sp),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.sp),
                                                  color: ThemeColor.darkColor),
                                              child: Icon(
                                                FontAwesomeIcons.solidImage,
                                                size: 55.sp,
                                              ),
                                            )
                                          : Container(
                                              height: Get.height,
                                              width: Get.width,
                                              margin: EdgeInsets.all(5.sp),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.sp),
                                                  color: ThemeColor.darkColor,
                                                  image: DecorationImage(
                                                      image: NetworkImage(AppConstant
                                                              .identitasBayiImage +
                                                          state
                                                              .identitasBayi
                                                              .imageFiles
                                                              .kakiKananBayi),
                                                      fit: BoxFit.cover)),
                                            ),
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: TableDesk(
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Colors.white, width: 1),
                              ),
                              child: TableDeskRow(
                                border: const BorderSide(
                                    width: 1, color: Colors.white),
                                gaps: [
                                  TableGap.weight(),
                                  TableGap.weight(),
                                ],
                                children: [
                                  Container(
                                    color: Colors.white,
                                    padding: const EdgeInsets.all(8),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          right: 5.sp, left: 5.sp),
                                      child: FB5Row(
                                        classNames: 'px-xs-0 px-lg-0 gx-0',
                                        children: [
                                          FB5Col(
                                            classNames: 'col-12',
                                            child: Column(
                                              children: [
                                                Center(
                                                  child: Text(
                                                    "Tanda tangan yang menentukan\n jenis kelamin:",
                                                    style: blackTextStyle,
                                                  ),
                                                ),
                                                (state.identitasBayi.imageFiles
                                                            .ttdJk !=
                                                        "")
                                                    ? Container(
                                                        height: 55.sp,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: NetworkImage(AppConstant
                                                                        .identitasBayiImage +
                                                                    state
                                                                        .identitasBayi
                                                                        .imageFiles
                                                                        .ttdJk))),
                                                      )
                                                    : Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.sp),
                                                            color: ThemeColor
                                                                .darkColor
                                                                .withOpacity(
                                                                    0.2)),
                                                        height: 55.sp,
                                                        width: 55.sp,
                                                        child: const Icon(
                                                            FontAwesomeIcons
                                                                .fileImage),
                                                      ),
                                                Text(
                                                  " ( ${state.identitasBayi.imageFiles.namaPenentuJK} ) ",
                                                  style: blackTextStyle,
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    padding: const EdgeInsets.all(8),
                                    child: FB5Row(
                                      classNames: 'px-xs-0 px-lg-0 gx-0',
                                      children: [
                                        FB5Col(
                                            classNames: 'col-12',
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Dokter / Bidan Penangungjawab",
                                                  style: blackTextStyle,
                                                ),
                                                SizedBox(
                                                  height: 35.sp,
                                                ),
                                                Text(
                                                  " ( ........................... ) ",
                                                  style: blackTextStyle,
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35.sp,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sewaktu pulang",
                                  style: blackTextStyle.copyWith(
                                      fontSize: 7.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Saya menyatakan bahwa saya sewaktu pulang telah menerima bayi saya, saya memeriksanya dan yakin bahwa bayi tersebut adalah betul-betul anak saya. Saya mengecek Nomor Rekam Medik Bayi adalah ${state.identitasBayi.identitasBayi.id} \ndan berisi keterangan pengenal yang sesuai",
                                  style:
                                      blackTextStyle.copyWith(fontSize: 6.sp),
                                )
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: TableDesk(
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Colors.white, width: 1),
                              ),
                              child: TableDeskRow(
                                border: const BorderSide(
                                    width: 1, color: Colors.white),
                                gaps: [
                                  TableGap.weight(),
                                  TableGap.weight(),
                                ],
                                children: [
                                  Container(
                                    color: Colors.white,
                                    padding: const EdgeInsets.all(8),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          right: 5.sp, left: 5.sp),
                                      child: FB5Row(
                                        classNames: 'px-xs-0 px-lg-0 gx-0',
                                        children: [
                                          FB5Col(
                                            classNames: 'col-12',
                                            child: Column(
                                              children: [
                                                Center(
                                                  child: Text(
                                                    "Tanda tangan Perawat / Bidan",
                                                    style: blackTextStyle,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 35.sp,
                                                ),
                                                Text(
                                                  " ( ........................... ) ",
                                                  style: blackTextStyle,
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    padding: const EdgeInsets.all(8),
                                    child: FB5Row(
                                      classNames: 'px-xs-0 px-lg-0 gx-0',
                                      children: [
                                        FB5Col(
                                            classNames: 'col-12',
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Tanggal, ...............................\nTanda tangan Ibu/Bapak/Wali",
                                                  style: blackTextStyle,
                                                ),
                                                (state.identitasBayi.imageFiles
                                                            .ttdWali !=
                                                        "")
                                                    ? Container(
                                                        height: 55.sp,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: NetworkImage(AppConstant
                                                                        .identitasBayiImage +
                                                                    state
                                                                        .identitasBayi
                                                                        .imageFiles
                                                                        .ttdWali))),
                                                      )
                                                    : Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.sp),
                                                            color: ThemeColor
                                                                .darkColor
                                                                .withOpacity(
                                                                    0.2)),
                                                        height: 55.sp,
                                                        width: 55.sp,
                                                        child: const Icon(
                                                            FontAwesomeIcons
                                                                .fileImage),
                                                      ),
                                                Text(
                                                  " ( ${state.identitasBayi.imageFiles.namaWali} ) ",
                                                  style: blackTextStyle,
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.sp,
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
