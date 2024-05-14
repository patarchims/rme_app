import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/kebidanan/presentation/asesmen/kebidanan_widget_content.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:sizer/sizer.dart';

class KeluhanUtamaAnakPageWidget extends StatefulWidget {
  const KeluhanUtamaAnakPageWidget({super.key});

  @override
  State<KeluhanUtamaAnakPageWidget> createState() =>
      _KeluhanUtamaAnakPageWidgetState();
}

class _KeluhanUtamaAnakPageWidgetState
    extends State<KeluhanUtamaAnakPageWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
        widget: RawScrollbar(
            thumbColor: ThemeColor.darkColor,
            thumbVisibility: true,
            interactive: true,
            thickness: 10.sp,
            controller: _scrollController,
            trackVisibility: false,
            radius: Radius.circular(5.sp),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                margin: EdgeInsets.only(right: 10.sp),
                child: Column(
                  children: [
                    TitleWidget.titleContainer(title: "Jenis Anamnesa"),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.sp),
                      child: Table(
                        border: TableBorder.all(color: ThemeColor.bgColor),
                        columnWidths: const {
                          1: FlexColumnWidth(6),
                          2: FlexColumnWidth(1.2),
                        },
                        children: [
                          TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Anamnesa",
                                textAlign: TextAlign.left,
                                style: blackTextStyle.copyWith(fontSize: 6.sp),
                              ),
                            ),
                            Container(
                              width: Get.width,
                              decoration:
                                  BoxDecoration(color: ThemeColor.bgColor),
                              child: Column(
                                children: [
                                  Wrap(
                                    children: jenisPengkajian
                                        .asMap()
                                        .entries
                                        .map((e) {
                                      return TitleWidget.boxChoose(
                                        backgroundColor:
                                            ThemeColor.primaryColor,
                                        onPressed: () {},
                                        icon: const Icon(FontAwesomeIcons.check,
                                            color: Colors.white),
                                        title: e.value,
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ],
                      ),
                    ),
                    TitleWidget.titleContainer(title: "Keluhan Utama"),
                    Padding(
                      padding: EdgeInsets.all(5.sp),
                      child: FormWidget.textArea(
                          enabled: true,
                          maxLines: 3,
                          // value: state
                          //     .pengkajianKeperawatanResponseModel.pengkajian.keluhanUtama,
                          onChanged: (value) {
                            // context
                            //     .read<PengkajianAwalKeperawatanBloc>()
                            //     .add(OnChangedKeluhanUtama(value: value));
                          }),
                    ),
                    TitleWidget.titleContainer(
                        title: "Riwayat Penyakit Sekarang"),

                    Padding(
                      padding: EdgeInsets.all(5.sp),
                      child: FormWidget.textArea(
                          enabled: true,
                          maxLines: 3,
                          // value: state
                          //     .pengkajianKeperawatanResponseModel.pengkajian.rwytPenyakit,
                          onChanged: (value) {
                            // context
                            //     .read<PengkajianAwalKeperawatanBloc>()
                            //     .add(OnChangedRiwayatPenyakitSekarang(value: value));
                          }),
                    ),
                    TitleWidget.titleContainer(
                        title: "Riwayat Penyakit Dahulu"),

                    // ===================== //
                    Padding(
                      padding: EdgeInsets.all(5.sp),
                      child: FormWidget.textArea(
                          // value: state.pengkajianKeperawatanResponseModel.pengkajian
                          //     .riwayatPenyakitDahulu,
                          enabled: true,
                          maxLines: 3,
                          onChanged: (value) {
                            // context
                            //     .read<PengkajianAwalKeperawatanBloc>()
                            //     .add(OnChangedRiwayatPenyakitDahulu(value: value));
                          }),
                    ),

                    TitleWidget.titleContainer(
                        title: "Riwayat Pengobatan Sebelumnya"),

                    Padding(
                      padding: EdgeInsets.all(3.sp),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        // children: (state.pengkajianKeperawatanResponseModel
                        //         .riwayatTerdahulu.isNotEmpty)
                        //     ? state.pengkajianKeperawatanResponseModel.riwayatTerdahulu
                        //         .map((e) => Padding(
                        //               padding: EdgeInsets.all(1.sp),
                        //               child: Card(
                        //                 margin: EdgeInsets.all(5.sp),
                        //                 color: ThemeColor.bgColor,
                        //                 elevation: 0,
                        //                 child: Text(
                        //                   "${tglIndo(e.tglMasuk.toString().substring(0, 10))} - ${e.riwayatSekarang.toString()},",
                        //                   style: blackTextStyle,
                        //                 ),
                        //               ),
                        //             ))
                        //         .toList()
                        //     : [
                        //         Container(
                        //           height: 35.sp,
                        //         )
                        //       ],
                      ),
                    ),

                    TitleWidget.titleContainer(
                        title: "Riwayat Penyakit Keluarga"),

                    const SizedBox(height: 10),
                    Container(
                      width: Get.width,
                      height: 20.sp,
                      padding: EdgeInsets.symmetric(horizontal: 5.sp),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ThemeColor.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.sp))),
                        child: const Icon(FontAwesomeIcons.plus,
                            color: Colors.white),
                        onPressed: () {
                          CustomDialogWidget.getDialog(
                              widget: Container(
                                width: Get.width / 1.5,
                                height: 65.sp,
                                decoration:
                                    const BoxDecoration(color: Colors.white),
                                child: Column(
                                  children: [
                                    TitleWidget.titleContentWidget(
                                        title:
                                            "TAMBAH DATA RIWAYAT PENYAKIT KELUARGA"),
                                    Row(
                                      children: [
                                        Container(
                                            height: 35.sp,
                                            width: Get.width / 2,
                                            padding: EdgeInsets.all(5.sp),
                                            child: FormWidget.textForm(
                                              // controller:
                                              //     _riwayatPenyakitKeluargaController,
                                              validator: (value) {
                                                if (value!.contains("\n")) {
                                                  Get.back();
                                                }
                                                return null;
                                              },
                                              enable: true,
                                            )),
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.all(5.sp),
                                            height: 22.sp,
                                            width: Get.width,
                                            child: IconButton(
                                                onPressed: () {
                                                  // if (authState is Authenticated) {
                                                  //   // ==== //
                                                  //   context
                                                  //       .read<
                                                  //           PengkajianAwalKeperawatanBloc>()
                                                  //       .add(OnSaveRiwayatPenyakitKeluarga(
                                                  //           tanggal: DateTime.now()
                                                  //               .toString()
                                                  //               .substring(0, 10),
                                                  //           noRM: singlePasien.first.mrn,
                                                  //           noReg: singlePasien
                                                  //               .first.noAntrean,
                                                  //           person: toPerson(
                                                  //               person: authState
                                                  //                   .user.person),
                                                  //           penyakitKeluarga:
                                                  //               _riwayatPenyakitKeluargaController
                                                  //                   .text,
                                                  //           userID:
                                                  //               authState.user.userId));
                                                  // }
                                                  // Get.back();
                                                  // _riwayatPenyakitKeluargaController
                                                  //     .clear();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        ThemeColor.primaryColor,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2.sp))),
                                                color: ThemeColor.whiteColor,
                                                icon: const Icon(
                                                    FontAwesomeIcons
                                                        .circlePlus)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              color: Colors.transparent);
                        },
                      ),
                    ),
                    Container(
                      height: 150.sp,
                      padding: EdgeInsets.all(5.sp),
                      margin: EdgeInsets.all(5.sp),
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: ThemeColor.bgColor,
                        borderRadius: BorderRadius.all(Radius.circular(5.sp)),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Card(
                        elevation: 1,
                        color: ThemeColor.bgColor,
                        child: SizedBox(
                          width: Get.width,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.sp),
                    // const RiwayatAlergiKeperawatanContentWidget(),
                    TitleWidget.titleContainer(title: "Reaksi Alergi"),
                    Padding(
                      padding: EdgeInsets.all(5.sp),
                      child: FormWidget.textArea(
                          // value: state
                          //     .pengkajianKeperawatanResponseModel.pengkajian.reaksiAlergi,
                          enabled: true,
                          maxLines: 3,
                          onChanged: (value) {
                            // context
                            //     .read<PengkajianAwalKeperawatanBloc>()
                            //     .add(OnChangedReaksiAlergi(value: value));
                          }),
                    ),
                    SizedBox(height: 10.sp),
                  ],
                ),
              ),
            )));
  }
}
