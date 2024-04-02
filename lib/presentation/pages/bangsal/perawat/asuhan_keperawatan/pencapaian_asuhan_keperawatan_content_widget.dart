import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/asuhan_keperawatan/hasil_asuhan_keperawatan/hasil_asuhan_keperawatan_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/presentation/component/alert/mesage_alert.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/constant/list_constants.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/screens/emty_page.dart';
import 'package:sizer/sizer.dart';

class PencapaianAsuhanKeperawatanContentWidget extends StatefulWidget {
  const PencapaianAsuhanKeperawatanContentWidget({super.key});

  @override
  State<PencapaianAsuhanKeperawatanContentWidget> createState() =>
      _PencapaianAsuhanKeperawatanContentWidgetState();
}

class _PencapaianAsuhanKeperawatanContentWidgetState
    extends State<PencapaianAsuhanKeperawatanContentWidget> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<HasilAsuhanKeperawatanBloc,
        HasilAsuhanKeperawatanState>(
      listener: (context, state) {
        // HASIL ASUHAN KEPERAWATAN

        // todo : DETEKSI SIMPAN DATA
        // ====  ==== //
        if (state.status == HasilAsuhanStatus.isLoadingSave) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        if (state.status != HasilAsuhanStatus.isLoadingSave) {
          EasyLoading.dismiss();
        }

        if (state.status != HasilAsuhanStatus.isLoadingUpdate) {
          EasyLoading.dismiss();
        }

        if (state.status == HasilAsuhanStatus.isLoadingUpdate) {
          EasyLoading.show(maskType: EasyLoadingMaskType.black);
        }

        state.saveData.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
                      // FAILURE
                      if (e.meta.code == 201) {
                        final shouldPop = await Alert.warningMessage(context,
                            subTitle: e.meta.message.toString(),
                            title: "Peringatan");
                        return shouldPop ?? false;
                      }
                    }),
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (e) async {
                      MetaModel meta = MetaModel.fromJson(e.value["metadata"]);
                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");
                      return shouldPop ?? false;
                    })));

        state.onUpdate.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
                      // FAILURE
                      if (e.meta.code == 201) {
                        final shouldPop = await Alert.warningMessage(context,
                            subTitle: e.meta.message.toString(),
                            title: "Peringatan");
                        return shouldPop ?? false;
                      }
                    }),
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (e) async {
                      MetaModel meta = MetaModel.fromJson(e.value["metadata"]);
                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");
                      return shouldPop ?? false;
                    })));

        state.deleteData.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
                      // FAILURE
                      if (e.meta.code == 201) {
                        final shouldPop = await Alert.warningMessage(context,
                            subTitle: e.meta.message.toString(),
                            title: "Peringatan");
                        return shouldPop ?? false;
                      }
                    }),
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (e) async {
                      MetaModel meta = MetaModel.fromJson(e.value["metadata"]);

                      context.read<HasilAsuhanKeperawatanBloc>().add(
                          OnGetHasilAsuhanKeperawatanEvent(
                              noReg: singlePasien.first.noreg, status: "Open"));

                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");

                      return shouldPop ?? false;
                    })));
        state.saveAllDaskep.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
                      // FAILURE
                      if (e.meta.code == 201) {
                        final shouldPop = await Alert.warningMessage(context,
                            subTitle: e.meta.message.toString(),
                            title: "Peringatan");
                        return shouldPop ?? false;
                      }
                    }),
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (e) async {
                      MetaModel meta = MetaModel.fromJson(e.value["metadata"]);

                      context.read<HasilAsuhanKeperawatanBloc>().add(
                          OnGetHasilAsuhanKeperawatanEvent(
                              noReg: singlePasien.first.noreg, status: "Open"));

                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");

                      return shouldPop ?? false;
                    })));

        // ============== || ============== //
      },
      builder: (context, state) {
        String isSave(int indexDiagnosa) {
          List<int> hasillist = [];
          int jumlahHasil = 0;

          // CHECK APAKAH SUDAH DI PILIH
          // List<KriteriaSlki> newKriteria;
          // FILTER MENURUN

          for (var s in state.hasilAsuhanKeperawatanModel) {
            for (var buruk in s.deskripsiSlki) {
              if (buruk.hasil != 0) {
                hasillist.add(buruk.hasil);
                jumlahHasil = jumlahHasil + 1;
              }
            }
          }

          log("HASIL LIST $hasillist");
          log("Jumlah HAISL $jumlahHasil");

          if (jumlahHasil == 0) {
            return "Pastikan hasil keluaran sudah dipilih";
          }

          if (hasillist.isEmpty) {
            return "Pastikan hasil keluaran sudah dipilih";
          }

          if (hasillist.length !=
              state.hasilAsuhanKeperawatanModel[indexDiagnosa].deskripsiSlki
                  .length) {
            return "Pastikan semua hasil keluaran sudah dipilih";
          }

          return "";
        }

        return Material(
          color: ThemeColor.bgColor,
          child: RawScrollbar(
            thumbColor: ThemeColor.darkColor,
            thumbVisibility: true,
            interactive: true,
            thickness: 5.sp,
            controller: _scrollController,
            trackVisibility: false,
            radius: Radius.circular(5.sp),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: (state.status == HasilAsuhanStatus.loading)
                  ? Loading.circleLoading()
                  : (state.status == HasilAsuhanStatus.emty)
                      ? EmtyScren(
                          subTitle: "Data kosong", textStyle: blackTextStyle)
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
                                                decoration: const BoxDecoration(
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
                                                              "${tglIndo(diagnosa.value.tanggal.substring(0, 10))} | ${diagnosa.value.perawat.nama} - ${diagnosa.value.bagian.bagian.toUpperCase()}",
                                                              style: whiteTextStyle
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .yellow,
                                                                      fontSize:
                                                                          7.sp),
                                                            ),
                                                          ],
                                                        )),
                                                    const Spacer(),
                                                    Card(
                                                      elevation: 0,
                                                      color: ThemeColor.bgColor
                                                          .withOpacity(0.5),
                                                      child: IconButton(
                                                          iconSize: 20.sp,
                                                          onPressed: () {
                                                            // TODO : LAKUKAN SIMPAN DATA
                                                            CustomDialogWidget.getDialog(
                                                                widget: MessageAlert.deleteAlert(
                                                                    mesage: "Apakah Anda yakin menghapus data ${diagnosa.value.diagnosa.judul} ini ?",
                                                                    onPressed: () {
                                                                      // OnDeleteAsuhanKeperawatanEvent
                                                                      context
                                                                          .read<
                                                                              HasilAsuhanKeperawatanBloc>()
                                                                          .add(OnDeleteAsuhanKeperawatanEvent(
                                                                              noDaskep: diagnosa.value.noDaskep));

                                                                      Get.back();
                                                                    }));
                                                          },
                                                          icon: const Icon(
                                                            FontAwesomeIcons
                                                                .trash,
                                                            color: ThemeColor
                                                                .dangerColor,
                                                          )),
                                                    )
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
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 8),
                                                      child: Text(
                                                        diagnosa.value.diagnosa
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
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 8),
                                                      child: Text(
                                                        diagnosa.value.diagnosa
                                                            .etiologi,
                                                        style: blackTextStyle,
                                                      ),
                                                    ),
                                                  ),
                                                  const Divider(),
                                                  TitleWidget
                                                      .titleContainerAsuhanKeperawatan(
                                                          title: "Hasil Luaran",
                                                          title2: ""),
                                                  Container(
                                                      decoration: BoxDecoration(
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
                                                                            e.value.namaSllki,
                                                                            style:
                                                                                blackTextStyle.copyWith(fontWeight: FontWeight.bold),
                                                                          ),
                                                                          subtitle: Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              RichText(
                                                                                text: TextSpan(text: "Setelah dilakukan intervensi selama ", style: blackTextStyle, children: [
                                                                                  TextSpan(text: "${e.value.target} Jam", style: blackTextStyle.copyWith(fontWeight: FontWeight.bold)),
                                                                                  const TextSpan(text: " dengan target "),
                                                                                  TextSpan(text: " ${ListConstants.toTarget(kategori: e.value.kategori, angka: e.value.target)}", style: blackTextStyle.copyWith(fontWeight: FontWeight.bold)),
                                                                                  const TextSpan(text: " , maka hasilnya sebagai berikut :"),
                                                                                ]),
                                                                              ),
                                                                              SizedBox(
                                                                                child: Table(
                                                                                  border: TableBorder.all(color: Colors.black),
                                                                                  children: [
                                                                                    if (e.value.kategori == "Menurun") ...[
                                                                                      TableRow(children: [
                                                                                        TitleWidget.headerTitle(title: "Menurun"),
                                                                                        TitleWidget.headerTitle(title: "Cukup Menurun"),
                                                                                        TitleWidget.headerTitle(title: "Sedang"),
                                                                                        TitleWidget.headerTitle(title: "Cukup Meningkat"),
                                                                                        TitleWidget.headerTitle(title: "Meningkat"),
                                                                                      ]),
                                                                                    ],
                                                                                    if (e.value.kategori == "Meningkat") ...[
                                                                                      TableRow(children: [
                                                                                        TitleWidget.headerTitle(title: "Meningkat"),
                                                                                        TitleWidget.headerTitle(title: "Cukup Meningkat"),
                                                                                        TitleWidget.headerTitle(title: "Sedang"),
                                                                                        TitleWidget.headerTitle(title: "Cukup Menurun"),
                                                                                        TitleWidget.headerTitle(title: "Menurun"),
                                                                                      ]),
                                                                                    ],
                                                                                    if (e.value.kategori == "Memburuk") ...[
                                                                                      TableRow(children: [
                                                                                        TitleWidget.headerTitle(title: "Memburuk"),
                                                                                        TitleWidget.headerTitle(title: "Cukup Memburuk"),
                                                                                        TitleWidget.headerTitle(title: "Sedang"),
                                                                                        TitleWidget.headerTitle(title: "Cukup Membaik"),
                                                                                        TitleWidget.headerTitle(title: "Membaik"),
                                                                                      ]),
                                                                                    ],
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: ListConstants.hasilAngka
                                                                                        .map(
                                                                                          (waktu) => Container(
                                                                                            padding: EdgeInsets.all(2.sp),
                                                                                            height: 15.sp,
                                                                                            width: 25.sp,
                                                                                            child: ElevatedButton(
                                                                                              onPressed: () {
                                                                                                // fungsi button di tekans
                                                                                                log(waktu.toString());
                                                                                                log(e.value.hasil.toString());

                                                                                                context.read<HasilAsuhanKeperawatanBloc>().add(OnSelectionHasilEvent(angkaSelection: waktu, deskripsiSlki: e.value.copyWith(hasil: waktu), indexDeskripsiSiki: e.key, indexDiagnosa: diagnosa.key));
                                                                                              },
                                                                                              style: ElevatedButton.styleFrom(
                                                                                                  side: const BorderSide(color: Colors.black),
                                                                                                  elevation: 1,
                                                                                                  backgroundColor: (e.value.hasil == waktu) ? Colors.green : ThemeColor.primaryColor,
                                                                                                  shape: RoundedRectangleBorder(
                                                                                                    borderRadius: BorderRadius.circular(2.sp),
                                                                                                  )),
                                                                                              child: Text(
                                                                                                waktu.toString(),
                                                                                                style: whiteTextStyle,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        )
                                                                                        .toList()),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 5.sp,
                                                                              ),
                                                                              // SizedBox(
                                                                              //   width: Get.width,
                                                                              //   height: 15.sp,
                                                                              //   child: ElevatedButton(
                                                                              //       onPressed: (e.value.hasil == 0)
                                                                              //           ? null
                                                                              //           : () {
                                                                              //               context.read<HasilAsuhanKeperawatanBloc>().add(OnSaveIntervensiEvent(noDaskep: e.value.noDaskep, kodeSLKI: e.value.kodeSlki, idKriteria: e.value.idKriteria, hasil: e.value.hasil));
                                                                              //             },
                                                                              //       style: ElevatedButton.styleFrom(
                                                                              //         elevation: 1,
                                                                              //         shape: RoundedRectangleBorder(side: const BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid), borderRadius: BorderRadius.circular(2.sp)),
                                                                              //         backgroundColor: (e.value.hasil == 0) ? ThemeColor.blackColor : ThemeColor.primaryColor,
                                                                              //       ),
                                                                              //       child: Text(
                                                                              //         "SIMPAN",
                                                                              //         style: (e.value.hasil == 0) ? primaryTextStyle.copyWith(fontSize: 8.sp) : whiteTextStyle.copyWith(fontSize: 8.sp),
                                                                              //       )),
                                                                              // )
                                                                            ],
                                                                          ),
                                                                          trailing: const Icon(Icons.more_vert),
                                                                          enabled: true)),
                                                                )
                                                                .toList(),
                                                      )),
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5.sp,
                                                            vertical: 5.sp),
                                                    width: Get.width,
                                                    height: 20.sp,
                                                    child: ElevatedButton(
                                                        onPressed: () {
                                                          // CEK KODE DIAGNOSA KE BERAPA
                                                          // CEK APAKAH SEMUAH SUDAH DIPILIH
                                                          //  SAVE INTERVENSI
                                                          // context.read<HasilAsuhanKeperawatanBloc>().add(OnSaveIntervensiEvent(noDaskep: noDaskep, kodeSLKI: kodeSLKI, idKriteria: idKriteria, hasil: hasil))

                                                          String save = isSave(
                                                              diagnosa.key);
                                                          log(" PRINT HASIL $save");
                                                          if (save != "") {
                                                            // LAKUKKAN SIMPAN DATA
                                                            Get.showSnackbar(GetSnackBar(
                                                                backgroundColor:
                                                                    ThemeColor
                                                                        .dangerColor
                                                                        .withOpacity(
                                                                            0.8),
                                                                title:
                                                                    "Kesalahan",
                                                                message: save,
                                                                icon: const Icon(
                                                                    FontAwesomeIcons
                                                                        .xmark),
                                                                duration:
                                                                    const Duration(
                                                                        seconds:
                                                                            2)));
                                                          }

                                                          if (save == "") {
                                                            // SIMPAN
                                                            // TODO SIMPAN ALL

                                                            context
                                                                .read<
                                                                    HasilAsuhanKeperawatanBloc>()
                                                                .add(OnSaveIntervensiEventV2(
                                                                    noReg: singlePasien
                                                                        .first
                                                                        .noreg,
                                                                    indexDiagnosa:
                                                                        diagnosa
                                                                            .key));
                                                          }
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          elevation: 1,
                                                          shape: RoundedRectangleBorder(
                                                              side: const BorderSide(
                                                                  color: Colors
                                                                      .black,
                                                                  width: 1,
                                                                  style:
                                                                      BorderStyle
                                                                          .solid),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2.sp)),
                                                          backgroundColor:
                                                              ThemeColor
                                                                  .primaryColor,
                                                        ),
                                                        child: Text(
                                                          "SIMPAN",
                                                          style: whiteCalibriTextStyle
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      8.sp),
                                                        )),
                                                  ),
                                                  const Divider(),
                                                  TitleWidget
                                                      .titleContainerAsuhanKeperawatan(
                                                          title:
                                                              "Rencana Tindakan",
                                                          title2: ""),
                                                  Container(
                                                      decoration: BoxDecoration(
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
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5.sp,
                                              ),

                                              // ======================== // TAMPILKAN DEFINISI
                                            ],
                                          ))
                                      .toList()
                                  : []),
            ),
          ),
        );
      },
    );
  }
}
