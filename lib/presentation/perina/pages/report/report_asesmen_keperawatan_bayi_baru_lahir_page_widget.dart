import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/component/qr_code/custom_qr_widget.dart';
import 'package:hms_app/presentation/perina/bloc/asesmen_bayi/asesmen_bayi_bloc.dart';
import 'package:hms_app/presentation/report/component/header_report_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:table_desk/table_desk.dart';

class ReportAsesmenKeperawatanBayiBaruLahirPage extends StatefulWidget {
  const ReportAsesmenKeperawatanBayiBaruLahirPage({super.key});

  @override
  State<ReportAsesmenKeperawatanBayiBaruLahirPage> createState() =>
      _ReportAsesmenKeperawatanBayiBaruLahirPageState();
}

class _ReportAsesmenKeperawatanBayiBaruLahirPageState
    extends State<ReportAsesmenKeperawatanBayiBaruLahirPage> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;

    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);
    AuthState authState = context.watch<AuthBloc>().state;

    return BlocBuilder<AsesmenBayiBloc, AsesmenBayiState>(
      builder: (context, state) {
        if (state.status == AsesmenBayiStatus.loading) {
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
                  // Text(state.asmenBayiResponse.toMap().toString()),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 5.sp),
                      child: Text("RM. RI 38",
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
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
                                  width: Get.width / 2.5,
                                  height: 40.sp,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Asesmen Awal\nKeperawatan Bayi Baru Lahir",
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
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      titleText(
                                          title: "RM",
                                          subTitle: singlePasien.first.mrn),
                                      titleText(
                                          title: "Nama",
                                          subTitle:
                                              singlePasien.first.namaPasien),
                                      titleText(
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
                                )
                              ],
                            ),
                          ),
                        ),

                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "RIWAYAT KEPERAWATAN",
                            textAlign: TextAlign.center,
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 8.sp),
                          ),
                        ),

                        if (authState is Authenticated) ...[],
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
                                TableGap.width(200),
                                TableGap.width(10),
                                TableGap.weight(),
                                TableGap.width(200),
                                TableGap.weight()
                              ],
                              children: [
                                Container(
                                    color: Colors.white,
                                    child: Text(
                                      "Nama Ayah",
                                      style: blackTextStyle.copyWith(
                                          fontSize: 5.sp),
                                    )),
                                Container(
                                    color: Colors.white,
                                    child: Text(
                                      ": ",
                                      style: blackTextStyle.copyWith(
                                          fontSize: 5.sp),
                                    )),
                                Container(
                                    color: Colors.white,
                                    child: Text(
                                      state.asmenBayiResponse.asesmenBayiModel
                                          .namaAyah,
                                      style: blackTextStyle,
                                    )),
                                Container(
                                    color: Colors.white,
                                    child: Text(
                                      "Dr. Obgyn",
                                      style: blackTextStyle.copyWith(
                                          fontSize: 5.sp),
                                    )),
                                Container(
                                    color: Colors.white,
                                    child: Text(
                                      ": ${state.asmenBayiResponse.asesmenBayiModel.dokterObgyn}",
                                      style: blackTextStyle,
                                    )),
                              ],
                            ),
                          ),
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
                                TableGap.width(200),
                                TableGap.width(10),
                                TableGap.weight(),
                                TableGap.width(200),
                                TableGap.weight()
                              ],
                              children: [
                                Container(
                                    color: Colors.white,
                                    child: Text(
                                      "Pekerjaan",
                                      style: blackTextStyle.copyWith(
                                          fontSize: 5.sp),
                                    )),
                                Container(
                                    color: Colors.white,
                                    child: Text(
                                      ":",
                                      style: blackTextStyle.copyWith(
                                          fontSize: 5.sp),
                                    )),
                                Container(
                                    color: Colors.white,
                                    child: Text(
                                      " ${state.asmenBayiResponse.asesmenBayiModel.pekerjaanAyah}",
                                      style: blackTextStyle,
                                    )),
                                Container(
                                    color: Colors.white,
                                    child: Text(
                                      "Dr. Anak",
                                      style: blackTextStyle.copyWith(
                                          fontSize: 5.sp),
                                    )),
                                Container(
                                    color: Colors.white,
                                    child: Text(
                                      ": ${state.asmenBayiResponse.asesmenBayiModel.dokterAnak}",
                                      style: blackTextStyle,
                                    )),
                              ],
                            ),
                          ),
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
                                TableGap.width(200),
                                TableGap.width(10),
                                TableGap.weight(),
                              ],
                              children: [
                                Container(
                                    color: Colors.white,
                                    child: Text(
                                      "Perkawinan Ke",
                                      style: blackTextStyle.copyWith(
                                          fontSize: 5.sp),
                                    )),
                                Container(
                                    color: Colors.white,
                                    child: Text(
                                      ": ",
                                      style: blackTextStyle.copyWith(
                                          fontSize: 5.sp),
                                    )),
                                Container(
                                    color: Colors.white,
                                    child: Text(
                                      state.asmenBayiResponse.asesmenBayiModel
                                          .perkawinanAyah,
                                      style: blackTextStyle,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        textWidget(
                            title: "Riwayat Penyakit",
                            subtile: state.asmenBayiResponse.asesmenBayiModel
                                .riwayatPenyakitAyah),
                        textWidget(
                            title: "Nama Ibu",
                            subtile: state
                                .asmenBayiResponse.asesmenBayiModel.namaIbu),
                        textWidget(
                            title: "Pekerjaan",
                            subtile: state.asmenBayiResponse.asesmenBayiModel
                                .pekerjaanIbu),
                        textWidget(
                            title: "Perkawinan Ke",
                            subtile: state.asmenBayiResponse.asesmenBayiModel
                                .perkawinanIbu),
                        textWidget(
                            title: "Riwayat Penyakit",
                            subtile: state.asmenBayiResponse.asesmenBayiModel
                                .penyakitIbu),
                        textWidget(
                            title: "Pengkajian",
                            subtile: state
                                .asmenBayiResponse.asesmenBayiModel.tanggal),
                        textWidget(
                            title: "Penangung Jawab",
                            subtile: state
                                .asmenBayiResponse.asesmenBayiModel.namaPjawab),
                        textWidget(
                            title: "Taksiran usia persalinan",
                            subtile: state.asmenBayiResponse.asesmenBayiModel
                                .usiaPersalinan),
                        textWidget(
                            title: "Bayi lahir dengan",
                            subtile: state.asmenBayiResponse.asesmenBayiModel
                                .lahirDengan),
                        textWidget(title: "Iktisar Persalinan", subtile: ""),
                        textWidget(title: "Tgl Persalinan", subtile: ""),
                        textWidget(
                            title: "Menangis",
                            subtile: state
                                .asmenBayiResponse.asesmenBayiModel.menangis),
                        textWidget(title: "Riwayat Kelahiran yang lalu"),
                        Padding(
                          padding: EdgeInsets.all(2.sp),
                          child: Container(
                            width: Get.width,
                            decoration: const BoxDecoration(),
                            margin: EdgeInsets.only(right: 10.sp),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  child: Table(
                                    columnWidths: const {
                                      0: FlexColumnWidth(0.5),
                                    },
                                    border:
                                        TableBorder.all(color: Colors.black),
                                    children: [
                                      TableRow(children: [
                                        headerLeftTitle(title: "NO."),
                                        headerLeftTitle(
                                            title: "TAHUN KELAHIRAN"),
                                        headerLeftTitle(title: "JENIS KELAMIN"),
                                        headerLeftTitle(title: "BB Lahir"),
                                        headerLeftTitle(title: "Keadaan Bayi"),
                                        headerLeftTitle(
                                            title: "Komplikasi Persalinan"),
                                        headerLeftTitle(
                                            title: "Jenis Persalinan"),
                                      ]),
                                    ],
                                  ),
                                ),
                                if (state.asmenBayiResponse
                                    .riwayatKelahiranModel.isEmpty) ...[
                                  SizedBox(
                                    child: Table(
                                      border:
                                          TableBorder.all(color: Colors.black),
                                      children: [
                                        TableRow(children: [
                                          textBox(title: ""),
                                          textBox(title: ""),
                                          textBox(title: ""),
                                          textBox(title: ""),
                                          textBox(title: ""),
                                          textBox(title: ""),
                                          textBox(title: ""),
                                        ]),
                                      ],
                                    ),
                                  ),
                                ],
                                if (state.asmenBayiResponse
                                    .riwayatKelahiranModel.isNotEmpty) ...[
                                  SizedBox(
                                    child: Table(
                                      columnWidths: const {
                                        0: FlexColumnWidth(0.5),
                                      },
                                      border:
                                          TableBorder.all(color: Colors.black),
                                      children: state.asmenBayiResponse
                                          .riwayatKelahiranModel
                                          .asMap()
                                          .entries
                                          .map((e) {
                                        return TableRow(children: [
                                          textBox(
                                              title: (e.key + 1).toString()),
                                          textBox(
                                              title: e.value.tahunPersalinan),
                                          textBox(title: e.value.jk),
                                          textBox(title: e.value.bb),
                                          textBox(
                                              title: e.value.keadaanSekarang),
                                          textBox(
                                              title:
                                                  e.value.komplikasiPersalinan),
                                          textBox(
                                              title: e.value.jenisPersalinan),
                                        ]);
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.sp,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "RIWAYAT PRENATAL",
                            textAlign: TextAlign.center,
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 8.sp),
                          ),
                        ),
                        textWidget(
                            title: "Usia Kehamilan",
                            subtile: state.asmenBayiResponse.asesmenBayiModel
                                .usiaKehamilan),
                        textWidget(
                            title: "HIS mulai sejak tanggal",
                            subtile: state.asmenBayiResponse.asesmenBayiModel
                                .prenatalHis),
                        textWidget(
                            title: "Ketuban",
                            subtile: state.asmenBayiResponse.asesmenBayiModel
                                .natalKetuban),
                        textWidget(
                            title: "Pendarahan Antepartum sejak tanggal",
                            subtile: state.asmenBayiResponse.asesmenBayiModel
                                .pendarahanPrenatal),
                        textWidget(title: "Gangguan Kesadaran", subtile: ""),
                        textWidget(title: "Rasa Mengejam Sejak", subtile: ""),
                        textWidget(
                            title:
                                "Tindakan Pengobatan/Pengobatan telah diberikan",
                            subtile: state.asmenBayiResponse.asesmenBayiModel
                                .natalTindakanDiberikan),
                        textWidget(
                            title:
                                "Obat-obatan yang dikomsumsi selama kehamilan",
                            subtile: state.asmenBayiResponse.asesmenBayiModel
                                .obatObatanYangDikomsumsi),
                        textWidget(
                            title: "Kebiasaan Ibu",
                            subtile: state.asmenBayiResponse.asesmenBayiModel
                                .prenatalKebiasaanIbu),
                        textWidget(
                            title: "Riwayat Persalinan Sebelumnya",
                            subtile: state.asmenBayiResponse.asesmenBayiModel
                                .prenatalRiwayatPersalinan),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "RIWAYAT NATAL",
                            textAlign: TextAlign.center,
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 8.sp),
                          ),
                        ),
                        textWidget(
                            title: "Lahir umur kehamilan",
                            subtile: state.asmenBayiResponse.asesmenBayiModel
                                .natalLahirUmur),
                        textWidget(
                            title: "Persalinan",
                            subtile: state.asmenBayiResponse.asesmenBayiModel
                                .natalPersalinan),
                        textWidget(
                            title: "KPD",
                            subtile: state
                                .asmenBayiResponse.asesmenBayiModel.natalKpd),
                        textWidget(
                            title: "Letak",
                            subtile: state
                                .asmenBayiResponse.asesmenBayiModel.natalLetak),
                        textWidget(
                            title: "Volume",
                            subtile: state.asmenBayiResponse.asesmenBayiModel
                                .natalVolume),
                        textWidget(
                            title: "Komplikasi selama kehamilan/persalinan",
                            subtile: state.asmenBayiResponse.asesmenBayiModel
                                .natalKomplikasi),
                        textWidget(
                            title: "Ditolong oleh",
                            subtile: state.asmenBayiResponse.asesmenBayiModel
                                .natalDitolongOleh),
                        textWidget(
                            title: "Presentasi Bayi",
                            subtile: state.asmenBayiResponse.asesmenBayiModel
                                .natalPrestasi),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "PENILAIAN APGAR SCORE",
                            textAlign: TextAlign.center,
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 8.sp),
                          ),
                        ),
                        SizedBox(
                            child: Table(border: TableBorder.all(), children: [
                          TableRow(children: [
                            TitleWidget.headerLeftTitle(title: "TANDA"),
                            TitleWidget.headerLeftTitle(title: "NILAI 0"),
                            TitleWidget.headerLeftTitle(title: "NILAI 1"),
                            TitleWidget.headerLeftTitle(title: "NILAI 2"),
                            TitleWidget.headerLeftTitle(title: "1 MENIT"),
                            TitleWidget.headerLeftTitle(title: "5 MENIT"),
                            TitleWidget.headerLeftTitle(title: "KET"),
                          ]),
                        ])),
                        if (state.asmenBayiResponse.apgarScore.isEmpty) ...[
                          SizedBox(
                            child: Table(
                              border: TableBorder.all(color: Colors.black),
                              children: [
                                TableRow(children: [
                                  TitleWidget.boldText(title: "Denyut Jantung"),
                                  TitleWidget.textBox(title: "Tidak ada"),
                                  TitleWidget.textBox(title: "Lambat < 100"),
                                  TitleWidget.textBox(title: "> 100"),
                                  TitleWidget.textBox(title: ""),
                                  TitleWidget.textBox(title: ""),
                                  TitleWidget.textBox(title: ""),
                                ]),
                                TableRow(children: [
                                  TitleWidget.boldText(title: "Usaha Nafas"),
                                  TitleWidget.textBox(title: "Tidak ada"),
                                  TitleWidget.textBox(
                                      title: "Lmbat, tidak teratur"),
                                  TitleWidget.textBox(
                                      title: "Menangis dengan keras"),
                                  TitleWidget.textBox(title: ""),
                                  TitleWidget.textBox(title: ""),
                                  TitleWidget.textBox(title: ""),
                                ]),
                                TableRow(children: [
                                  TitleWidget.boldText(title: "Tonus Otot"),
                                  TitleWidget.textBox(title: "Lemah"),
                                  TitleWidget.textBox(
                                      title: "Fleksi pada ektermitas"),
                                  TitleWidget.textBox(title: "Gerakan Aktif"),
                                  TitleWidget.textBox(title: ""),
                                  TitleWidget.textBox(title: ""),
                                  TitleWidget.textBox(title: ""),
                                ]),
                                TableRow(children: [
                                  TitleWidget.boldText(
                                      title:
                                          "Kepekaan Refleksi (gremace)/peka rangsang"),
                                  TitleWidget.textBox(title: "Tidak ada"),
                                  TitleWidget.textBox(title: "Meringis"),
                                  TitleWidget.textBox(title: "Menangis Kuat"),
                                  TitleWidget.textBox(title: ""),
                                  TitleWidget.textBox(title: ""),
                                  TitleWidget.textBox(title: ""),
                                ]),
                                TableRow(children: [
                                  TitleWidget.boldText(
                                      title: "Warna kulit (apperence)"),
                                  TitleWidget.textBox(title: "Biru/Pucat"),
                                  TitleWidget.textBox(
                                      title:
                                          "Tubuh Merah Muda, ektremitas biru"),
                                  TitleWidget.textBox(
                                      title: "Seluruhnya Merah Muda"),
                                  TitleWidget.textBox(title: ""),
                                  TitleWidget.textBox(title: ""),
                                  TitleWidget.textBox(title: ""),
                                ]),
                                TableRow(children: [
                                  TitleWidget.centerTextBoxBold(title: "Total"),
                                  TitleWidget.textBox(title: ""),
                                  TitleWidget.textBox(title: ""),
                                  TitleWidget.textBox(title: ""),
                                  TitleWidget.textBox(title: ""),
                                  TitleWidget.textBox(title: ""),
                                  TitleWidget.textBox(title: ""),
                                ]),
                              ],
                            ),
                          ),
                        ],
                        if (state.asmenBayiResponse.apgarScore.isNotEmpty) ...[
                          if (state.asmenBayiResponse.apgarScore.length ==
                              1) ...[
                            SizedBox(
                              child: Table(
                                border: TableBorder.all(color: Colors.black),
                                children: [
                                  TableRow(children: [
                                    TitleWidget.boldText(
                                        title: "Denyut Jantung"),
                                    TitleWidget.textBox(title: "Tidak ada"),
                                    TitleWidget.textBox(title: "Lambat < 100"),
                                    TitleWidget.textBox(title: "> 100"),
                                    TitleWidget.centerTextBoxBold(
                                        title: (state.asmenBayiResponse
                                                    .apgarScore[0].waktu) ==
                                                "1 Menit"
                                            ? state.asmenBayiResponse
                                                .apgarScore[0].jantung
                                                .toString()
                                            : state.asmenBayiResponse
                                                .apgarScore[1].jantung
                                                .toString()),
                                    TitleWidget.textBox(title: ""),
                                    TitleWidget.textBox(title: ""),
                                  ]),
                                  TableRow(children: [
                                    TitleWidget.boldText(title: "Usaha Nafas"),
                                    TitleWidget.textBox(title: "Tidak ada"),
                                    TitleWidget.textBox(
                                        title: "Lmbat, tidak teratur"),
                                    TitleWidget.textBox(
                                        title: "Menangis dengan keras"),
                                    TitleWidget.centerTextBoxBold(
                                        title: (state.asmenBayiResponse
                                                    .apgarScore[0].waktu) ==
                                                "1 Menit"
                                            ? state.asmenBayiResponse
                                                .apgarScore[0].nafas
                                                .toString()
                                            : state.asmenBayiResponse
                                                .apgarScore[1].nafas
                                                .toString()),
                                    TitleWidget.textBox(title: ""),
                                    TitleWidget.textBox(title: ""),
                                  ]),
                                  TableRow(children: [
                                    TitleWidget.boldText(title: "Tonus Otot"),
                                    TitleWidget.textBox(title: "Lemah"),
                                    TitleWidget.textBox(
                                        title: "Fleksi pada ektermitas"),
                                    TitleWidget.textBox(title: "Gerakan Aktif"),
                                    TitleWidget.centerTextBoxBold(
                                        title: (state.asmenBayiResponse
                                                    .apgarScore[0].waktu) ==
                                                "1 Menit"
                                            ? state.asmenBayiResponse
                                                .apgarScore[0].otot
                                                .toString()
                                            : state.asmenBayiResponse
                                                .apgarScore[1].otot
                                                .toString()),
                                    TitleWidget.textBox(title: ""),
                                    TitleWidget.textBox(title: ""),
                                  ]),
                                  TableRow(children: [
                                    TitleWidget.boldText(
                                        title:
                                            "Kepekaan Refleksi (gremace)/peka rangsang"),
                                    TitleWidget.textBox(title: "Tidak ada"),
                                    TitleWidget.textBox(title: "Meringis"),
                                    TitleWidget.textBox(title: "Menangis Kuat"),
                                    TitleWidget.centerTextBoxBold(
                                        title: (state.asmenBayiResponse
                                                    .apgarScore[0].waktu) ==
                                                "1 Menit"
                                            ? state.asmenBayiResponse
                                                .apgarScore[0].refleksi
                                                .toString()
                                            : state.asmenBayiResponse
                                                .apgarScore[1].refleksi
                                                .toString()),
                                    TitleWidget.textBox(title: ""),
                                    TitleWidget.textBox(title: ""),
                                  ]),
                                  TableRow(children: [
                                    TitleWidget.boldText(
                                        title: "Warna kulit (apperence)"),
                                    TitleWidget.textBox(title: "Biru/Pucat"),
                                    TitleWidget.textBox(
                                        title:
                                            "Tubuh Merah Muda, ektremitas biru"),
                                    TitleWidget.textBox(
                                        title: "Seluruhnya Merah Muda"),
                                    TitleWidget.centerTextBoxBold(
                                        title: (state.asmenBayiResponse
                                                    .apgarScore[0].waktu) ==
                                                "1 Menit"
                                            ? state.asmenBayiResponse
                                                .apgarScore[0].warnaKulit
                                                .toString()
                                            : state.asmenBayiResponse
                                                .apgarScore[1].warnaKulit
                                                .toString()),
                                    TitleWidget.textBox(title: ""),
                                    TitleWidget.textBox(title: ""),
                                  ]),
                                  TableRow(children: [
                                    TitleWidget.centerTextBoxBold(
                                        title: "Total"),
                                    TitleWidget.textBox(title: ""),
                                    TitleWidget.textBox(title: ""),
                                    TitleWidget.textBox(title: ""),
                                    TitleWidget.centerTextBoxBold(
                                        title: (state.asmenBayiResponse
                                                    .apgarScore[0].waktu) ==
                                                "1 Menit"
                                            ? state.asmenBayiResponse
                                                .apgarScore[0].total
                                                .toString()
                                            : state.asmenBayiResponse
                                                .apgarScore[1].total
                                                .toString()),
                                    TitleWidget.textBox(title: ""),
                                    TitleWidget.textBox(title: ""),
                                  ]),
                                ],
                              ),
                            ),
                          ],
                          if (state.asmenBayiResponse.apgarScore.length ==
                              2) ...[
                            SizedBox(
                              child: Table(
                                border: TableBorder.all(color: Colors.black),
                                children: [
                                  TableRow(children: [
                                    TitleWidget.boldText(
                                        title: "Denyut Jantung"),
                                    TitleWidget.textBox(title: "Tidak ada"),
                                    TitleWidget.textBox(title: "Lambat < 100"),
                                    TitleWidget.textBox(title: "> 100"),
                                    TitleWidget.centerTextBoxBold(
                                        title: (state.asmenBayiResponse
                                                    .apgarScore[0].waktu) ==
                                                "1 Menit"
                                            ? state.asmenBayiResponse
                                                .apgarScore[0].jantung
                                                .toString()
                                            : state.asmenBayiResponse
                                                .apgarScore[1].jantung
                                                .toString()),
                                    TitleWidget.centerTextBoxBold(
                                        title: (state.asmenBayiResponse
                                                    .apgarScore[1].waktu) ==
                                                "5 Menit"
                                            ? state.asmenBayiResponse
                                                .apgarScore[1].jantung
                                                .toString()
                                            : state.asmenBayiResponse
                                                .apgarScore[0].jantung
                                                .toString()),
                                    TitleWidget.textBox(title: ""),
                                  ]),
                                  TableRow(children: [
                                    TitleWidget.boldText(title: "Usaha Nafas"),
                                    TitleWidget.textBox(title: "Tidak ada"),
                                    TitleWidget.textBox(
                                        title: "Lmbat, tidak teratur"),
                                    TitleWidget.textBox(
                                        title: "Menangis dengan keras"),
                                    TitleWidget.centerTextBoxBold(
                                        title: (state.asmenBayiResponse
                                                    .apgarScore[0].waktu) ==
                                                "1 Menit"
                                            ? state.asmenBayiResponse
                                                .apgarScore[0].nafas
                                                .toString()
                                            : state.asmenBayiResponse
                                                .apgarScore[1].nafas
                                                .toString()),
                                    TitleWidget.centerTextBoxBold(
                                        title: (state.asmenBayiResponse
                                                    .apgarScore[1].waktu) ==
                                                "5 Menit"
                                            ? state.asmenBayiResponse
                                                .apgarScore[1].nafas
                                                .toString()
                                            : state.asmenBayiResponse
                                                .apgarScore[0].nafas
                                                .toString()),
                                    TitleWidget.textBox(title: ""),
                                  ]),
                                  TableRow(children: [
                                    TitleWidget.boldText(title: "Tonus Otot"),
                                    TitleWidget.textBox(title: "Lemah"),
                                    TitleWidget.textBox(
                                        title: "Fleksi pada ektermitas"),
                                    TitleWidget.textBox(title: "Gerakan Aktif"),
                                    TitleWidget.centerTextBoxBold(
                                        title: (state.asmenBayiResponse
                                                    .apgarScore[0].waktu) ==
                                                "1 Menit"
                                            ? state.asmenBayiResponse
                                                .apgarScore[0].otot
                                                .toString()
                                            : state.asmenBayiResponse
                                                .apgarScore[1].otot
                                                .toString()),
                                    TitleWidget.centerTextBoxBold(
                                        title: (state.asmenBayiResponse
                                                    .apgarScore[1].waktu) ==
                                                "5 Menit"
                                            ? state.asmenBayiResponse
                                                .apgarScore[1].otot
                                                .toString()
                                            : state.asmenBayiResponse
                                                .apgarScore[0].otot
                                                .toString()),
                                    TitleWidget.textBox(title: ""),
                                  ]),
                                  TableRow(children: [
                                    TitleWidget.boldText(
                                        title:
                                            "Kepekaan Refleksi (gremace)/peka rangsang"),
                                    TitleWidget.textBox(title: "Tidak ada"),
                                    TitleWidget.textBox(title: "Meringis"),
                                    TitleWidget.textBox(title: "Menangis Kuat"),
                                    TitleWidget.centerTextBoxBold(
                                        title: (state.asmenBayiResponse
                                                    .apgarScore[0].waktu) ==
                                                "1 Menit"
                                            ? state.asmenBayiResponse
                                                .apgarScore[0].refleksi
                                                .toString()
                                            : state.asmenBayiResponse
                                                .apgarScore[1].refleksi
                                                .toString()),
                                    TitleWidget.centerTextBoxBold(
                                        title: (state.asmenBayiResponse
                                                    .apgarScore[1].waktu) ==
                                                "5 Menit"
                                            ? state.asmenBayiResponse
                                                .apgarScore[1].refleksi
                                                .toString()
                                            : state.asmenBayiResponse
                                                .apgarScore[0].refleksi
                                                .toString()),
                                    TitleWidget.textBox(title: ""),
                                  ]),
                                  TableRow(children: [
                                    TitleWidget.boldText(
                                        title: "Warna kulit (apperence)"),
                                    TitleWidget.textBox(title: "Biru/Pucat"),
                                    TitleWidget.textBox(
                                        title:
                                            "Tubuh Merah Muda, ektremitas biru"),
                                    TitleWidget.textBox(
                                        title: "Seluruhnya Merah Muda"),
                                    TitleWidget.centerTextBoxBold(
                                        title: (state.asmenBayiResponse
                                                    .apgarScore[0].waktu) ==
                                                "1 Menit"
                                            ? state.asmenBayiResponse
                                                .apgarScore[0].warnaKulit
                                                .toString()
                                            : state.asmenBayiResponse
                                                .apgarScore[1].warnaKulit
                                                .toString()),
                                    TitleWidget.centerTextBoxBold(
                                        title: (state.asmenBayiResponse
                                                    .apgarScore[1].waktu) ==
                                                "5 Menit"
                                            ? state.asmenBayiResponse
                                                .apgarScore[1].warnaKulit
                                                .toString()
                                            : state.asmenBayiResponse
                                                .apgarScore[0].warnaKulit
                                                .toString()),
                                    TitleWidget.textBox(title: ""),
                                  ]),
                                  TableRow(children: [
                                    TitleWidget.centerTextBoxBold(
                                        title: "Total"),
                                    TitleWidget.textBox(title: ""),
                                    TitleWidget.textBox(title: ""),
                                    TitleWidget.textBox(title: ""),
                                    TitleWidget.centerTextBoxBold(
                                        title: (state.asmenBayiResponse
                                                    .apgarScore[0].waktu) ==
                                                "1 Menit"
                                            ? state.asmenBayiResponse
                                                .apgarScore[0].total
                                                .toString()
                                            : state.asmenBayiResponse
                                                .apgarScore[1].total
                                                .toString()),
                                    TitleWidget.centerTextBoxBold(
                                        title: (state.asmenBayiResponse
                                                    .apgarScore[1].waktu) ==
                                                "5 Menit"
                                            ? state.asmenBayiResponse
                                                .apgarScore[1].total
                                                .toString()
                                            : state.asmenBayiResponse
                                                .apgarScore[0].total
                                                .toString()),
                                    TitleWidget.textBox(title: ""),
                                  ]),
                                ],
                              ),
                            ),
                          ],
                        ],

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Klasifikasi :\na. Asfiksia ringan (apgar skor 7 - 10)\nb. Asfiksia sedang (apgar skor 4 - 6 )",
                            style: blackTextStyle.copyWith(fontSize: 6.sp),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "DOWN SCORE PADA NEONATUS",
                            textAlign: TextAlign.center,
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 8.sp),
                          ),
                        ),
                        SizedBox(
                            child: Table(border: TableBorder.all(), children: [
                          TableRow(children: [
                            TitleWidget.headerLeftTitle(title: "TANDA"),
                            TitleWidget.headerLeftTitle(title: "NILAI 0"),
                            TitleWidget.headerLeftTitle(title: "NILAI 1"),
                            TitleWidget.headerLeftTitle(title: "NILAI 2"),
                            TitleWidget.headerLeftTitle(title: "SCORE"),
                          ]),
                        ])),
                        SizedBox(
                          child: Table(
                            border: TableBorder.all(color: Colors.black),
                            children: [
                              TableRow(children: [
                                TitleWidget.boldText(title: "Frekwensi Nafas"),
                                TitleWidget.textBox(title: "<60/Menit"),
                                TitleWidget.textBox(title: "60-80/Menit"),
                                TitleWidget.textBox(title: ">80/Menit"),
                                TitleWidget.centerTextBoxBold(
                                    title: state
                                        .asmenBayiResponse.downScoreModel.nifas
                                        .toString()),
                              ]),
                              TableRow(children: [
                                TitleWidget.boldText(title: "Sianosis"),
                                TitleWidget.textBox(title: "Tidak Sianosis"),
                                TitleWidget.textBox(
                                    title: "Sianosis hilang dengan O2"),
                                TitleWidget.textBox(
                                    title:
                                        "Sianosis menetap walaupun diberi O2"),
                                TitleWidget.centerTextBoxBold(
                                    title: state.asmenBayiResponse
                                        .downScoreModel.sianosis
                                        .toString()),
                              ]),
                              TableRow(children: [
                                TitleWidget.boldText(title: "Retraksi"),
                                TitleWidget.textBox(
                                    title: "Tidak Ada Retraksi"),
                                TitleWidget.textBox(title: "Retraksi Ringan"),
                                TitleWidget.textBox(title: "Retaksi Berat"),
                                TitleWidget.centerTextBoxBold(
                                    title: state.asmenBayiResponse
                                        .downScoreModel.retraksi
                                        .toString()),
                              ]),
                              TableRow(children: [
                                TitleWidget.boldText(title: "Air Entry"),
                                TitleWidget.textBox(
                                    title: "Udara Masuk bilateral baik"),
                                TitleWidget.textBox(
                                    title: "Penurunan ringan udara masuk"),
                                TitleWidget.textBox(
                                    title: "Tidak ada udara masuk"),
                                TitleWidget.centerTextBoxBold(
                                    title: state.asmenBayiResponse
                                        .downScoreModel.airEntry
                                        .toString()),
                              ]),
                              TableRow(children: [
                                TitleWidget.boldText(title: "Merintih"),
                                TitleWidget.textBox(title: "Tidak merintih"),
                                TitleWidget.textBox(
                                    title: "Dapat didengar dengan stetoskope"),
                                TitleWidget.textBox(
                                    title: "Dapat didengar tanpa bantuan"),
                                TitleWidget.centerTextBoxBold(
                                    title: state.asmenBayiResponse
                                        .downScoreModel.merintih
                                        .toString()),
                              ]),
                              TableRow(children: [
                                TitleWidget.boldText(title: "TOTAL"),
                                TitleWidget.textBox(title: ""),
                                TitleWidget.textBox(title: ""),
                                TitleWidget.textBox(title: ""),
                                TitleWidget.centerTextBoxBold(
                                    title: state
                                        .asmenBayiResponse.downScoreModel.total
                                        .toString()),
                              ]),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Keterangan :\n 0-4     : Distres Nafas Ringan : Membutuhkan O2 nasal atau headbox\n0-7      : Distres Nafas Sedang   : Membutuhkan nasal CP AP\n>7          : Distres Nafas Berat        : Ancaman Gagal Nafas, membutuhkan intubasi (perlu diperiksa Analisis Gas Darah/AGD)",
                            style: blackTextStyle.copyWith(fontSize: 5.sp),
                          ),
                        ),
                        textWidget(title: "Riwayat Post Natal"),
                        textWidget(title: "Tindakan yang diberikan"),
                        textWidget(title: "Keadaan Bayi"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "TANDA TANDA VITAL",
                            textAlign: TextAlign.center,
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 8.sp),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width / 3,
                              child: Column(
                                children: [
                                  textWidget(
                                      title: "Tekanan Darah",
                                      subtile:
                                          "${state.asmenBayiResponse.vitalSignModel.td} mmHg"),
                                  textWidget(
                                      title: "Berat Badan",
                                      subtile:
                                          "${state.asmenBayiResponse.vitalSignModel.bb} Kg"),
                                  textWidget(
                                      title: "Lingkar Dada",
                                      subtile: state.asmenBayiResponse
                                          .vitalSignModel.lingkarDada),
                                  textWidget(
                                      title: "HR",
                                      subtile:
                                          "${state.asmenBayiResponse.vitalSignModel.lingkarDada} x/menit"),
                                  textWidget(
                                      title: "Tinggi Badan",
                                      subtile:
                                          "${state.asmenBayiResponse.vitalSignModel.tb} CM"),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: Get.width / 3,
                              child: Column(
                                children: [
                                  textWidget(
                                      title: "Lingkar Perut",
                                      subtile:
                                          "${state.asmenBayiResponse.vitalSignModel.lingkarPerut} "),
                                  textWidget(
                                      title: "Lingkar Kepala",
                                      subtile:
                                          "${state.asmenBayiResponse.vitalSignModel.lingkarKepala} Cm"),
                                  textWidget(
                                      title: "RR",
                                      subtile:
                                          "${state.asmenBayiResponse.vitalSignModel.rr} x/menit"),
                                  textWidget(
                                      title: "SPO2",
                                      subtile:
                                          "${state.asmenBayiResponse.vitalSignModel.rr} "),
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "PEMERIKSAAN FISIK",
                            textAlign: TextAlign.center,
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 8.sp),
                          ),
                        ),
                        TitleWidget.pemeriksaanFisik(
                            title: "KESADARAN",
                            value:
                                state.asmenBayiResponse.fisikPerina.kesadaran),

                        TitleWidget.pemeriksaanFisik(
                            title: "GCS",
                            value:
                                "E: ${state.asmenBayiResponse.fisikPerina.gcsE} V: ${state.asmenBayiResponse.fisikPerina.gcsV} M: ${state.asmenBayiResponse.fisikPerina.gcsM}"),
                        TitleWidget.pemeriksaanFisik(
                            title: "REFLEKS",
                            value: state.asmenBayiResponse.fisikPerina.refleks),
                        TitleWidget.pemeriksaanFisik(
                            title: "TONICK NECK",
                            value:
                                state.asmenBayiResponse.fisikPerina.tonickNeck),
                        TitleWidget.pemeriksaanFisik(
                            title: "KEPALA",
                            value: state.asmenBayiResponse.fisikPerina.kepala),
                        TitleWidget.pemeriksaanFisik(
                            title: "WAJAH",
                            value: state.asmenBayiResponse.fisikPerina.wajah),
                        TitleWidget.pemeriksaanFisik(
                            title: "TELINGA",
                            value: state.asmenBayiResponse.fisikPerina.telinga),
                        TitleWidget.pemeriksaanFisik(
                            title: "MULUT",
                            value: state.asmenBayiResponse.fisikPerina.mulut),
                        TitleWidget.pemeriksaanFisik(
                            title: "LEHER DAN BAHU",
                            value: state
                                .asmenBayiResponse.fisikPerina.leherDahBahu),
                        TitleWidget.pemeriksaanFisik(
                            title: "DADA",
                            value: state.asmenBayiResponse.fisikPerina.dada),
                        TitleWidget.pemeriksaanFisik(
                            title: "ABDOMEN",
                            value: state.asmenBayiResponse.fisikPerina.abdomen),
                        TitleWidget.pemeriksaanFisik(
                            title: "PUNGGUNG",
                            value: state.asmenBayiResponse.fisikPerina.punggung
                                .toUpperCase()),
                        TitleWidget.pemeriksaanFisik(
                            title: "INTEGUMEN",
                            value: state.asmenBayiResponse.fisikPerina.integumen
                                .toUpperCase()),
                        TitleWidget.pemeriksaanFisik(
                            title: "EKSTREMITAS",
                            value: state
                                .asmenBayiResponse.fisikPerina.ekstremitas
                                .toUpperCase()),
                        TitleWidget.pemeriksaanFisik(
                            title: "GENITALIA",
                            value: state.asmenBayiResponse.fisikPerina.genetalia
                                .toUpperCase()),
                        TitleWidget.pemeriksaanFisik(
                            title: "ANUS",
                            value: state.asmenBayiResponse.fisikPerina.anus
                                .toUpperCase()),

                        SizedBox(
                          height: 5.sp,
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
                                  TableGap.weight(),
                                ],
                                children: [
                                  Container(
                                    color: Colors.white,
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Bidan Penangungjawab",
                                          style: blackTextStyle.copyWith(
                                              fontSize: 4.sp),
                                          textAlign: TextAlign.center,
                                        ),
                                        // CustomQrWidget(
                                        //   dimension: 30.sp,
                                        //   dataBarcode: "state.report.karu.nama",
                                        // ),
                                        SizedBox(
                                          height: 50.sp,
                                        ),
                                        Text(
                                          "( ....................................... )",
                                          style: blackTextStyle.copyWith(
                                              fontSize: 4.sp),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      color: Colors.white,
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Bidan yang Bertugas",
                                            style: blackTextStyle.copyWith(
                                                fontSize: 4.sp),
                                            textAlign: TextAlign.center,
                                          ),
                                          if (state.asmenBayiResponse.karyawan
                                                  .nama !=
                                              "") ...[
                                            CustomQrWidget(
                                              dataBarcode: state
                                                  .asmenBayiResponse
                                                  .karyawan
                                                  .nama,
                                            ),
                                          ],
                                          if (state.asmenBayiResponse.karyawan
                                                  .nama ==
                                              "") ...[
                                            SizedBox(
                                              height: 50.sp,
                                            ),
                                          ],
                                          Text(
                                            "( ${state.asmenBayiResponse.karyawan.nama} )",
                                            style: blackTextStyle.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 4.sp),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Container headerTitle({required String title}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.sp),
      height: 20.sp,
      decoration: const BoxDecoration(color: ThemeColor.darkGreyColor),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: blackTextStyle.copyWith(
              fontWeight: FontWeight.bold, fontSize: 5.sp),
        ),
      ),
    );
  }

  Container headerLeftTitle({required String title}) {
    return Container(
      height: 15.sp,
      padding: EdgeInsets.symmetric(vertical: 2.sp, horizontal: 2.sp),
      decoration: const BoxDecoration(color: ThemeColor.darkGreyColor),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: blackTextStyle.copyWith(
              fontWeight: FontWeight.bold, fontSize: 4.sp),
        ),
      ),
    );
  }

  Padding textBox({required String title}) {
    return Padding(
      padding: EdgeInsets.all(2.sp),
      child: Text(
        title,
        style: blackTextStyle.copyWith(fontSize: 5.sp),
      ),
    );
  }

  Container textWidget({required String title, String? subtile}) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 5.sp),
      child: TableDesk(
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.white, width: 1),
        ),
        child: TableDeskRow(
          border: const BorderSide(width: 1, color: Colors.white),
          gaps: [
            TableGap.width(200),
            TableGap.width(10),
            TableGap.weight(),
          ],
          children: [
            Container(
                color: Colors.white,
                child: Text(
                  title,
                  style: blackTextStyle.copyWith(fontSize: 5.sp),
                )),
            Container(
                color: Colors.white,
                child: Text(
                  ":",
                  style: blackTextStyle.copyWith(fontSize: 5.sp),
                )),
            Container(
                color: Colors.white,
                child: Text(
                  subtile ?? "",
                  style: blackTextStyle,
                )),
          ],
        ),
      ),
    );
  }

  Container titleText({required String title, required String subTitle}) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 5.sp),
      child: TableDesk(
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.white, width: 1),
        ),
        child: TableDeskRow(
          border: const BorderSide(width: 1, color: Colors.white),
          gaps: [
            TableGap.width(150),
            TableGap.width(10),
            TableGap.weight(),
          ],
          children: [
            Container(
                color: Colors.white,
                child: Text(
                  title,
                  style: blackTextStyle.copyWith(fontSize: 5.sp),
                )),
            Container(
              color: Colors.white,
              child: Text(
                ":",
                style: blackTextStyle.copyWith(fontSize: 5.sp),
              ),
            ),
            Container(
              color: Colors.white,
              child: Text(
                subTitle,
                style: blackTextStyle.copyWith(fontSize: 5.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
