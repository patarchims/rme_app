import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/asuhan_keperawatan/hasil_asuhan_keperawatan/hasil_asuhan_keperawatan_bloc.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/constant/list_constants.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/screens/emty_page.dart';
import 'package:sizer/sizer.dart';

class ResumeContentWidget extends StatefulWidget {
  const ResumeContentWidget({super.key});

  @override
  State<ResumeContentWidget> createState() => _ResumeContentWidgetState();
}

class _ResumeContentWidgetState extends State<ResumeContentWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HasilAsuhanKeperawatanBloc, HasilAsuhanKeperawatanState>(
      builder: (context, state) {
        // ===== //
        if (state.status == HasilAsuhanStatus.loadedStatus) {
          return Material(
            color: ThemeColor.bgColor,
            child: RawScrollbar(
              thumbColor: ThemeColor.darkColor,
              thumbVisibility: true,
              interactive: true,
              thickness: 10.sp,
              controller: _scrollController,
              trackVisibility: false,
              radius: Radius.circular(10.sp),
              child: Container(
                margin: EdgeInsets.only(right: 10.sp),
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: (state.status == HasilAsuhanStatus.loading)
                      ? Loading.expandedLoading()
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
                                  color:
                                      ThemeColor.primaryColor.withOpacity(0.4),
                                  child: EmtyScren(
                                      subTitle: "Data kosong",
                                      textStyle: blackTextStyle),
                                ),
                              ),
                            )
                          : (state.status == HasilAsuhanStatus.loadedStatus)
                              ? Column(
                                  children: (state.resumeKeperawatan.isNotEmpty)
                                      ? state.resumeKeperawatan
                                          .asMap()
                                          .entries
                                          .map((diagnosa) => Column(
                                                children: [
                                                  Container(
                                                    width: Get.width,
                                                    padding:
                                                        EdgeInsets.all(5.sp),
                                                    decoration:
                                                        const BoxDecoration(
                                                            color: ThemeColor
                                                                .primaryColor),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        // HEADER
                                                        SizedBox(
                                                            width:
                                                                Get.width / 2,
                                                            child: Text(
                                                              "${diagnosa.value.diagnosa.judul}\n${diagnosa.value.diagnosa.kode}",
                                                              style: whiteTextStyle
                                                                  .copyWith(
                                                                      fontSize:
                                                                          8.sp),
                                                            )),

                                                        Text(
                                                          "${tglIndo(diagnosa.value.tanggal.substring(0, 10))}-${diagnosa.value.insertDttm.substring(11, 19)} | ${diagnosa.value.perawat.nama} - ${diagnosa.value.bagian.bagian.toUpperCase()}",
                                                          style: whiteTextStyle
                                                              .copyWith(
                                                                  color: Colors
                                                                      .yellow,
                                                                  fontSize:
                                                                      7.sp),
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  // ======================== // TAMPILKAN DEFINISI
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Divider(),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
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
                                                                  horizontal:
                                                                      8),
                                                          child: Text(
                                                            diagnosa
                                                                .value
                                                                .diagnosa
                                                                .defenisi,
                                                            style:
                                                                blackTextStyle,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
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
                                                                  horizontal:
                                                                      8),
                                                          child: Text(
                                                            diagnosa
                                                                .value
                                                                .diagnosa
                                                                .etiologi,
                                                            style:
                                                                blackTextStyle,
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
                                                            children: diagnosa
                                                                .value
                                                                .deskripsiSlki
                                                                .asMap()
                                                                .entries
                                                                .map(
                                                                  (e) => Card(
                                                                      color: ThemeColor
                                                                          .bgColor,
                                                                      elevation:
                                                                          1.sp,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(2.sp),
                                                                        side: BorderSide
                                                                            .none,
                                                                      ),
                                                                      child: ListTile(
                                                                          shape: RoundedRectangleBorder(
                                                                            //<-- SEE HERE
                                                                            side:
                                                                                const BorderSide(width: 2),
                                                                            borderRadius:
                                                                                BorderRadius.circular(2.sp),
                                                                          ),
                                                                          leading: CircleAvatar(
                                                                            backgroundColor:
                                                                                const Color(0xff6ae792),
                                                                            child:
                                                                                Text(
                                                                              "${e.key + 1}",
                                                                              style: blackTextStyle,
                                                                            ),
                                                                          ),
                                                                          title: Row(
                                                                            children: [
                                                                              RichText(
                                                                                  text: TextSpan(children: [
                                                                                TextSpan(
                                                                                  text: "${e.value.namaSllki}, ",
                                                                                  style: blackTextStyle.copyWith(fontWeight: FontWeight.bold),
                                                                                ),
                                                                              ])),
                                                                              if (e.value.hasil == e.value.target) ...[
                                                                                ElevatedButton(
                                                                                    style: ElevatedButton.styleFrom(backgroundColor: ThemeColor.primaryColor),
                                                                                    onPressed: () {},
                                                                                    child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Container(
                                                                                          height: 10,
                                                                                          width: 10,
                                                                                          margin: EdgeInsets.only(right: 5.sp),
                                                                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp), color: Colors.green),
                                                                                        ),
                                                                                        Text(
                                                                                          "Sama Saja",
                                                                                          style: whiteTextStyle.copyWith(fontSize: 5.sp),
                                                                                        ),
                                                                                      ],
                                                                                    ))
                                                                              ],
                                                                              if (e.value.hasil < e.value.target) ...[
                                                                                ElevatedButton(
                                                                                  style: ElevatedButton.styleFrom(backgroundColor: ThemeColor.dangerColor.withOpacity(0.5), elevation: 1),
                                                                                  onPressed: () {},
                                                                                  child: Text(
                                                                                    ListConstants.toTarget(kategori: e.value.kategori, angka: e.value.hasil),
                                                                                    style: whiteTextStyle.copyWith(fontSize: 5.sp),
                                                                                  ),
                                                                                )
                                                                              ],
                                                                              if (e.value.hasil > e.value.target) ...[
                                                                                ElevatedButton(
                                                                                  style: ElevatedButton.styleFrom(backgroundColor: ThemeColor.greenColor.withOpacity(0.5), elevation: 1),
                                                                                  onPressed: () {},
                                                                                  child: Text(
                                                                                    ListConstants.toTarget(kategori: e.value.kategori, angka: e.value.hasil),
                                                                                    style: whiteTextStyle.copyWith(fontSize: 5.sp),
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            ],
                                                                          ),
                                                                          subtitle: Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              RichText(
                                                                                text: TextSpan(text: "Intervensi ", style: blackTextStyle, children: [
                                                                                  TextSpan(text: "${e.value.target} Jam, ", style: blackTextStyle.copyWith(fontWeight: FontWeight.bold)),
                                                                                  const TextSpan(text: " target "),
                                                                                  TextSpan(text: " ${ListConstants.toTarget(kategori: e.value.kategori, angka: e.value.target)}", style: blackTextStyle.copyWith(fontWeight: FontWeight.bold)),
                                                                                  const TextSpan(text: " Hasilnya adalah : "),
                                                                                  TextSpan(text: ListConstants.toTarget(kategori: e.value.kategori, angka: e.value.hasil), style: blackTextStyle.copyWith(fontWeight: FontWeight.bold)),
                                                                                ]),
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
                                                            children: diagnosa
                                                                .value
                                                                .deskripsiSiki
                                                                .asMap()
                                                                .entries
                                                                .map(
                                                                  (e) => Card(
                                                                      color: ThemeColor
                                                                          .bgColor,
                                                                      elevation:
                                                                          1.sp,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(2.sp),
                                                                        side: BorderSide
                                                                            .none,
                                                                      ),
                                                                      child: ListTile(
                                                                          shape: RoundedRectangleBorder(
                                                                            //<-- SEE HERE
                                                                            side:
                                                                                const BorderSide(width: 2),
                                                                            borderRadius:
                                                                                BorderRadius.circular(2.sp),
                                                                          ),
                                                                          leading: CircleAvatar(
                                                                            backgroundColor:
                                                                                const Color(0xff6ae792),
                                                                            child:
                                                                                Text(
                                                                              (e.key + 1).toString(),
                                                                              style: blackTextStyle,
                                                                            ),
                                                                          ),
                                                                          title: Text(
                                                                            e.value.namaSiki,
                                                                            style:
                                                                                blackTextStyle.copyWith(fontWeight: FontWeight.bold),
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
                                                      Column(
                                                        children:
                                                            diagnosa.value
                                                                .tindakanModel
                                                                .asMap()
                                                                .entries
                                                                .map(
                                                                  (e) => Card(
                                                                      color: ThemeColor
                                                                          .bgColor,
                                                                      elevation:
                                                                          1.sp,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(2.sp),
                                                                        side: BorderSide
                                                                            .none,
                                                                      ),
                                                                      child: ListTile(
                                                                          shape: RoundedRectangleBorder(
                                                                            //<-- SEE HERE
                                                                            side:
                                                                                const BorderSide(width: 2),
                                                                            borderRadius:
                                                                                BorderRadius.circular(2.sp),
                                                                          ),
                                                                          leading: CircleAvatar(
                                                                            backgroundColor:
                                                                                const Color(0xff6ae792),
                                                                            child:
                                                                                Text(
                                                                              (e.key + 1).toString(),
                                                                              style: blackTextStyle,
                                                                            ),
                                                                          ),
                                                                          title: Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                "${e.value.insertDttm.substring(0, 10)}, ${e.value.insertDttm.substring(11, 19)} ",
                                                                                style: blackTextStyle.copyWith(
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                e.value.deskripsi,
                                                                                style: blackTextStyle.copyWith(
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                "Nama : ${e.value.perawat.nama}",
                                                                                style: blackTextStyle.copyWith(
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          trailing: const Icon(Icons.more_vert),
                                                                          enabled: true)),
                                                                )
                                                                .toList(),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(height: 5.sp),
                                                  // ======================== // TAMPILKAN DEFINISI // ===================
                                                ],
                                              ))
                                          .toList()
                                      : [])
                              : Container(),
                ),
              ),
            ),
          );
        }

        // ===== //
        if (state.status == HasilAsuhanStatus.emty) {
          return Material(
            color: ThemeColor.bgColor,
            child: Center(
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
                      subTitle: "Data kosong", textStyle: blackTextStyle),
                ),
              ),
            ),
          );
        }

        return Material(
          color: ThemeColor.bgColor,
          child: Text(
            state.status.toString(),
            style: blackTextStyle,
          ),
        );
      },
    );
  }
}
