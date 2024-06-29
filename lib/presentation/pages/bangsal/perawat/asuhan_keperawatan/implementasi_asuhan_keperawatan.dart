import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/asuhan_keperawatan/hasil_asuhan_keperawatan/hasil_asuhan_keperawatan_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/constant/list_constants.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/component/title/title_component.dart';
import 'package:hms_app/presentation/screens/emty_page.dart';
import 'package:sizer/sizer.dart';

class ImplementasiAsuhanKeperawatanWidget extends StatefulWidget {
  const ImplementasiAsuhanKeperawatanWidget({super.key});

  @override
  State<ImplementasiAsuhanKeperawatanWidget> createState() =>
      _ImplementasiAsuhanKeperawatanWidgetState();
}

class _ImplementasiAsuhanKeperawatanWidgetState
    extends State<ImplementasiAsuhanKeperawatanWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<HasilAsuhanKeperawatanBloc,
        HasilAsuhanKeperawatanState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Material(
          color: ThemeColor.bgColor,
          child: RawScrollbar(
            thumbColor: ThemeColor.darkColor,
            thumbVisibility: true,
            interactive: true,
            thickness: 10.sp,
            controller: _scrollController,
            trackVisibility: false,
            radius: Radius.circular(5.sp),
            child: Container(
              margin: EdgeInsets.only(right: 15.sp),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: (state.status == HasilAsuhanStatus.loading)
                    ? Loading.circleLoading()
                    : (state.status == HasilAsuhanStatus.emty)
                        ? Center(
                            child: Container(
                              margin: EdgeInsets.all(10.sp),
                              width: Get.width,
                              height: 200.sp,
                              child: Card(
                                elevation: 1.sp,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(2.sp),
                                ),
                                margin: EdgeInsets.only(top: 5.sp),
                                color: ThemeColor.primaryColor.withOpacity(0.4),
                                child: EmtyScren(
                                    subTitle: "Data kosong",
                                    textStyle: blackTextStyle),
                              ),
                            ),
                          )
                        : Column(
                            children:
                                (state.hasilAsuhanKeperawatanModel.isNotEmpty)
                                    ? state.hasilAsuhanKeperawatanModel
                                        .asMap()
                                        .entries
                                        .map((diagnosa) => Column(
                                              children: [
                                                Container(
                                                  width: Get.width,
                                                  padding: EdgeInsets.all(5.sp),
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: ThemeColor
                                                              .primaryColor),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      // HEADER
                                                      SizedBox(
                                                          width: Get.width / 2,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "${diagnosa.value.diagnosa.judul}\n${diagnosa.value.diagnosa.kode}",
                                                                style: whiteTextStyle
                                                                    .copyWith(
                                                                        fontSize:
                                                                            8.sp),
                                                              ),
                                                              Text(
                                                                "${tglIndo(diagnosa.value.tanggal.substring(0, 10))}-${diagnosa.value.insertDttm.substring(11, 19)} | ${diagnosa.value.perawat.nama} - ${diagnosa.value.bagian.bagian.toUpperCase()}",
                                                                style: whiteTextStyle.copyWith(
                                                                    color: Colors
                                                                        .yellow,
                                                                    fontSize:
                                                                        7.sp),
                                                              ),
                                                            ],
                                                          )),
                                                      const Spacer(),
                                                    ],
                                                  ),
                                                ),

                                                // ======================== // TAMPILKAN DEFINISI
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Divider(),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 8),
                                                      child: Text("Defenisi",
                                                          style: blackTextStyle
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                    ),
                                                    SizedBox(
                                                      width: Get.width / 2,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 8),
                                                        child: Text(
                                                          diagnosa
                                                              .value
                                                              .diagnosa
                                                              .defenisi,
                                                          style: blackTextStyle,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 8),
                                                      child: Text(
                                                        "Etiologi",
                                                        style: blackTextStyle
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: Get.width / 2,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 8),
                                                        child: Text(
                                                          diagnosa
                                                              .value
                                                              .diagnosa
                                                              .etiologi,
                                                          style: blackTextStyle,
                                                        ),
                                                      ),
                                                    ),
                                                    const Divider(),
                                                    TitleWidget
                                                        .titleContainerAsuhanKeperawatan(
                                                            title:
                                                                "Hasil Luaran",
                                                            title2: ""),
                                                    Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                color: ThemeColor
                                                                    .bgColor),
                                                        child: Column(
                                                          children:
                                                              diagnosa.value
                                                                  .deskripsiSlki
                                                                  .asMap()
                                                                  .entries
                                                                  .map(
                                                                    (e) => Card(
                                                                        color: ThemeColor
                                                                            .bgColor,
                                                                        elevation: 1
                                                                            .sp,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(2.sp),
                                                                          side:
                                                                              BorderSide.none,
                                                                        ),
                                                                        child: ListTile(
                                                                            shape: RoundedRectangleBorder(
                                                                              //<-- SEE HERE
                                                                              side: const BorderSide(width: 2),
                                                                              borderRadius: BorderRadius.circular(2.sp),
                                                                            ),
                                                                            leading: CircleAvatar(
                                                                              backgroundColor: const Color(0xff6ae792),
                                                                              child: Text(
                                                                                (e.key + 1).toString(),
                                                                                style: blackTextStyle,
                                                                              ),
                                                                            ),
                                                                            title: Text(
                                                                              e.value.namaSllki,
                                                                              style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
                                                                            ),
                                                                            subtitle: Column(
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                RichText(
                                                                                  text: TextSpan(text: "Setelah dilakukan intervensi selama ", style: blackTextStyle, children: [
                                                                                    TextSpan(text: "${e.value.waktu} Jam", style: blackTextStyle.copyWith(fontWeight: FontWeight.bold)),
                                                                                    const TextSpan(text: " dengan target "),
                                                                                    TextSpan(text: " ${ListConstants.toTarget(kategori: e.value.kategori, angka: e.value.target)}", style: blackTextStyle.copyWith(fontWeight: FontWeight.bold)),
                                                                                    const TextSpan(text: " , maka hasilnya sebagai berikut :"),
                                                                                  ]),
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 5.sp,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            trailing: const Icon(Icons.more_vert),
                                                                            enabled: true)),
                                                                  )
                                                                  .toList(),
                                                        )),
                                                    const Divider(),
                                                    TitleWidget
                                                        .titleContainerAsuhanKeperawatan(
                                                            title:
                                                                "Rencana Tindakan",
                                                            title2: ""),
                                                    Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                color: ThemeColor
                                                                    .bgColor),
                                                        child: Column(
                                                          children:
                                                              diagnosa.value
                                                                  .deskripsiSiki
                                                                  .asMap()
                                                                  .entries
                                                                  .map(
                                                                    (e) => Card(
                                                                        color: ThemeColor
                                                                            .bgColor,
                                                                        elevation: 1
                                                                            .sp,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(2.sp),
                                                                          side:
                                                                              BorderSide.none,
                                                                        ),
                                                                        child: ListTile(
                                                                            shape: RoundedRectangleBorder(
                                                                              //<-- SEE HERE
                                                                              side: const BorderSide(width: 2),
                                                                              borderRadius: BorderRadius.circular(2.sp),
                                                                            ),
                                                                            leading: CircleAvatar(
                                                                              backgroundColor: const Color(0xff6ae792),
                                                                              child: Text(
                                                                                (e.key + 1).toString(),
                                                                                style: blackTextStyle,
                                                                              ),
                                                                            ),
                                                                            title: Text(
                                                                              e.value.namaSiki,
                                                                              style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
                                                                            ),
                                                                            trailing: const Icon(Icons.more_vert),
                                                                            enabled: true)),
                                                                  )
                                                                  .toList(),
                                                        )),
                                                    TitleWidget
                                                        .titleContainerAsuhanKeperawatan(
                                                            title:
                                                                "Implementasi Tindakan",
                                                            title2: ""),
                                                  ],
                                                ),
                                                SizedBox(height: 5.sp),
                                              ],
                                            ))
                                        .toList()
                                    : []),
              ),
            ),
          ),
        );
      },
    );
  }
}
