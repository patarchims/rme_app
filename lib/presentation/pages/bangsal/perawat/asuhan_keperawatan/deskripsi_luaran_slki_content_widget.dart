import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_keperawatan_bidan/asesmen_keperawatan_bidan_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/asuhan_keperawatan/deskripsi_luaran_slki/deskripsi_luaran_slki_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/asuhan_keperawatan/deskripsi_luaran_siki_model.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/constant/list_constants.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/asuhan_keperawatan/intervensi_selection_widget_content.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:hms_app/presentation/widget/error_widget.dart';
import 'package:sizer/sizer.dart';

class DeskripsiLuaranSlkiContentWidget extends StatefulWidget {
  const DeskripsiLuaranSlkiContentWidget({super.key});

  @override
  State<DeskripsiLuaranSlkiContentWidget> createState() =>
      _DeskripsiLuaranSlkiContentWidgetState();
}

class _DeskripsiLuaranSlkiContentWidgetState
    extends State<DeskripsiLuaranSlkiContentWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthBloc>().state;
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<DeskripsiLuaranSlkiBloc, DeskripsiLuaranSlkiState>(
      listener: (context, state) {
        // TAMPILKAN LOADING

        if (state.status == DeskripsiLuaranSlkiStatus.isLoadingSave) {
          EasyLoading.show();
        }

        if (state.status != DeskripsiLuaranSlkiStatus.isLoadingSave) {
          EasyLoading.dismiss();
        }

        state.onSaveData.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    failure: (e) async {
                      // FAILURE
                      log(e.toString());

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
                      context.read<AsesmenKeperawatanBidanBloc>().add(
                          const AsesmenKeperawatanBidanEvent.pilihDiagnosa(
                              pilihDiagnosaKeperawatan:
                                  PilihDiagnosaKeperawatan.diagnosa));
                      MetaModel meta = MetaModel.fromJson(e.value["metadata"]);
                      final shouldPop = await Alert.loaded(context,
                          subTitle: meta.message, title: "Pesan");
                      return shouldPop ?? false;
                    })));
      },
      builder: (context, state) {
        String isSave() {
          int jumlahKriteria = 0;
          int jumllahIntervensi = 0;
          List<int> waktuList = [];
          int waktu = 0;
          int target = 0;

          // CHECK APAKAH SUDAH DI PILIH // List<KriteriaSlki> newKriteria; // FILTER MENURUN

          for (var s in state.deskripsiLuaranSikiModel.slki) {
            for (var buruk in s.memburuk) {
              if (buruk.waktu > 0) {
                waktu = waktu + 1;
                waktuList.add(waktu);
              }
              if (buruk.target > 0) {
                target = target + 1;
              }
              if (buruk.isSelected == true) {
                jumlahKriteria = jumlahKriteria + 1;
              }
            }
            for (var ningkat in s.meningkat) {
              if (ningkat.isSelected == true) {
                jumlahKriteria = jumlahKriteria + 1;
              }
              if (ningkat.target > 0) {
                target = target + 1;
              }
              if (ningkat.waktu > 0) {
                waktu = waktu + 1;
                waktuList.add(waktu);
              }
            }
            for (var menurun in s.menurun) {
              if (menurun.isSelected == true) {
                jumlahKriteria = jumlahKriteria + 1;
              }
              if (menurun.target > 0) {
                target = target + 1;
              }
              if (menurun.waktu > 0) {
                waktu = waktu + 1;
                waktuList.add(waktu);
              }
            }
          }

          for (var i in state.deskripsiLuaranSikiModel.siki) {
            log(i.kode.toString());
            for (var edu in i.edukasi) {
              if (edu.isSelected == true) {
                jumllahIntervensi = jumllahIntervensi + 1;
              }
            }
            for (var edu in i.kolaborasi) {
              if (edu.isSelected == true) {
                jumllahIntervensi = jumllahIntervensi + 1;
              }
            }
            for (var edu in i.observasi) {
              if (edu.isSelected == true) {
                jumllahIntervensi = jumllahIntervensi + 1;
              }
            }
            for (var edu in i.terapetutik) {
              if (edu.isSelected == true) {
                jumllahIntervensi = jumllahIntervensi + 1;
              }
            }
          }

          if (jumlahKriteria == 0 && waktu == 0 && jumllahIntervensi == 0) {
            return "Silahkan pilih data terlebih dahulu";
          }

          if (jumlahKriteria < 1) {
            return "Kriteria hasil belum dipilih";
          }

          if (jumllahIntervensi < 1) {
            return "Intervensi belum dipilih";
          }

          if (waktu == 0) {
            return "Pastikan sudah memilih target waktu";
          }

          if (waktuList.length != jumlahKriteria) {
            return "Pastikan semua target waktu telah dipilih";
          }

          if (target == 0) {
            return "Pastikan sudah memilih target hasil";
          }

          return "";
        }

        return HeaderContentWidget(
            isENableAdd: true,
            onPressed: () async {
              // LAKUKAN SIMPAN
              // LAKUKAN VALIDASI DI SINI

              final message = isSave();

              if (message == "") {
                if (authState is Authenticated) {
                  dynamic data = await deviceInfo.initPlatformState();
                  // _onSaveData
                  // ignore: use_build_context_synchronously
                  context.read<DeskripsiLuaranSlkiBloc>().add(OnSaveDataEvent(
                      deviceID: "ID - ${data['id']} - ${data['device']}}",
                      noReg: singlePasien.first.noreg,
                      person: toPerson(person: authState.user.person),
                      pelayanan:
                          toPelayanan(poliklinik: authState.user.poliklinik)));
                }
              }

              if (message != "") {
                Get.showSnackbar(GetSnackBar(
                    backgroundColor: ThemeColor.dangerColor.withOpacity(0.8),
                    title: "Kesalahan",
                    message: message,
                    icon: const Icon(FontAwesomeIcons.xmark),
                    duration: const Duration(seconds: 2)));
              }
            },
            widget: RawScrollbar(
              thumbColor: ThemeColor.darkColor,
              thumbVisibility: true,
              interactive: true,
              thickness: 5.sp,
              controller: _scrollController,
              trackVisibility: false,
              radius: Radius.circular(5.sp),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: (state.status == DeskripsiLuaranSlkiStatus.loading)
                    ? Loading.expandedLoading()
                    : (state.status == DeskripsiLuaranSlkiStatus.error)
                        ? SizedBox(
                            width: Get.width,
                            height: Get.height,
                            child: ErrorWidgetPage(
                              onPressed: () {
                                // BACK SISTEM
                                context.read<AsesmenKeperawatanBidanBloc>().add(
                                    const AsesmenKeperawatanBidanEvent
                                        .pilihDiagnosa(
                                        pilihDiagnosaKeperawatan:
                                            PilihDiagnosaKeperawatan.diagnosa));
                              },
                            ),
                          )
                        : Column(
                            children: [
                              Container(
                                // height: 25.sp,
                                width: Get.width,
                                padding: EdgeInsets.all(5.sp),
                                decoration: const BoxDecoration(
                                    color: ThemeColor.primaryColor),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        // GO TO DIAGNOSA
                                        context
                                            .read<AsesmenKeperawatanBidanBloc>()
                                            .add(
                                                const AsesmenKeperawatanBidanEvent
                                                    .pilihDiagnosa(
                                                    pilihDiagnosaKeperawatan:
                                                        PilihDiagnosaKeperawatan
                                                            .diagnosa));
                                      },
                                      child: const Icon(
                                        FontAwesomeIcons.arrowLeft,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.sp,
                                    ),
                                    // ignore: unnecessary_null_comparison
                                    (state.deskripsiLuaranSikiModel != null)
                                        ? SizedBox(
                                            width: Get.width / 2,
                                            child: Text(
                                              "${state.deskripsiLuaranSikiModel.diagnosa.judul}\n${state.deskripsiLuaranSikiModel.diagnosa.defenisi}",
                                              style: whiteTextStyle.copyWith(
                                                  fontSize: 8.sp),
                                            ),
                                          )
                                        : Container(),
                                    const Spacer(),
                                    // ignore: unnecessary_null_comparison
                                    (state.deskripsiLuaranSikiModel != null)
                                        ? Text(
                                            state.deskripsiLuaranSikiModel
                                                .diagnosa.kode,
                                            style: whiteTextStyle.copyWith(
                                                fontSize: 10.sp),
                                          )
                                        : Container()
                                  ],
                                ),
                              ),

                              // TAMPILKAN DESKRIPSI LUARAN
                              Container(
                                width: Get.width,
                                height: 30.sp,
                                margin: EdgeInsets.all(5.sp),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: ThemeColor.blackColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(2.sp))),
                                    onPressed: () {
                                      // TAMPILKAN INTERVENSI
                                      CustomDialogWidget.getDialog(
                                          widget:
                                              const IntervensiSelectioinContentWidget(),
                                          color: Colors.transparent);
                                    },
                                    child: Text(
                                      "Intervensi",
                                      style: whiteTextStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.sp),
                                    )),
                              ),

                              ...[
                                SizedBox(
                                  width: Get.width,
                                  child: Column(
                                    children: state
                                        .deskripsiLuaranSikiModel.slki
                                        .asMap()
                                        .entries
                                        .map((e) {
                                      return Column(
                                        children: [
                                          TitleWidget
                                              .titleContainerAsuhanKeperawatan(
                                                  title: e.value.judul,
                                                  title2: e.value.kodeSlki),

                                          SizedBox(
                                            height: 5.sp,
                                          ),

                                          // ======================== // TAMPILKAN DEFINISI
                                          TitleWidget.deskripsiContainer(
                                            title2: e.value.defenisi,
                                            title: "Defenisi",
                                          ),

                                          // ======================== // TAMPILKAN DEFINISI
                                          TitleWidget.deskripsiContainer(
                                              title2: e.value.ekspetasi,
                                              title: "Ekspetasi"),

                                          // ======================== // TAMPILKAN DEFINISI
                                          TitleWidget.deskripsiContainer(
                                              title2: "",
                                              title: "Kriteria Hasil "),

                                          SizedBox(
                                            height: 4.sp,
                                          ),

                                          if (e.value.menurun.isNotEmpty) ...[
                                            deskripsiCardWidget(e, context,
                                                listKriteria: e.value.menurun,
                                                kategori: Kategori.menurun)
                                          ],

                                          SizedBox(height: 10.sp),

                                          if (e.value.meningkat.isNotEmpty) ...[
                                            deskripsiCardWidget(e, context,
                                                listKriteria: e.value.meningkat,
                                                kategori: Kategori.meningkat)
                                          ],

                                          SizedBox(
                                            height: 10.sp,
                                          ),
                                          if (e.value.memburuk.isNotEmpty) ...[
                                            deskripsiCardWidget(e, context,
                                                listKriteria: e.value.memburuk,
                                                kategori: Kategori.memburuk)
                                          ],
                                        ],
                                      );
                                    }).toList(),
                                  ),
                                )
                              ]
                            ],
                          ),
              ),
            ));
      },
    );
  }

  SizedBox deskripsiCardWidget(
      MapEntry<int, Slki> indexSlki, BuildContext context,
      {required List<KriteriaSlki> listKriteria, required Kategori kategori}) {
    return SizedBox(
      width: Get.width,
      child: Column(
          children: listKriteria
              .asMap()
              .entries
              .map((list) => Card(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(2.sp)),
                    elevation: 1,
                    color: (list.value.isSelected)
                        ? ThemeColor.primaryColor
                        : ThemeColor.bgColor,
                    child: Container(
                      padding: EdgeInsets.all(5.sp),
                      child: ExpansionTile(
                        leading: SizedBox(
                          height: 15.sp,
                          width: 20.sp,
                          child: ElevatedButton(
                            onPressed: () {
                              log("Index Elemen ${indexSlki.key}");
                              log("Index Menurun ${list.key}");
                              context.read<DeskripsiLuaranSlkiBloc>().add(
                                  OnSelectedSLKIEvent(
                                      indexSLKI: indexSlki.key,
                                      kategori: kategori,
                                      kriteriaSlki: list.value.copyWith(
                                          isSelected: !list.value.isSelected),
                                      indexKriteriaSlki: list.key));

                              // ========= //
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: (list.value.isSelected)
                                  ? Colors.green
                                  : ThemeColor.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.sp),
                              ),
                            ),
                            child: (list.value.isSelected)
                                ? Icon(
                                    FontAwesomeIcons.check,
                                    color: Colors.white,
                                    size: 5.sp,
                                  )
                                : Icon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white,
                                    size: 5.sp,
                                  ),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Text(
                              list.value.nama,
                              style: (list.value.tanda == true &&
                                      list.value.isSelected == true)
                                  ? blackTextStyle.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)
                                  : (list.value.tanda == true)
                                      ? blackTextStyle.copyWith(
                                          fontWeight: FontWeight.bold)
                                      : (list.value.isSelected == true)
                                          ? whiteTextStyle
                                          : blackTextStyle,
                            )),
                            SizedBox(
                              // height: 25.sp,
                              width: 65.sp,
                              child: Row(
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 2.sp),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                        color: ThemeColor.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),

                                    // dropdown below..
                                    child: DropdownButton<String>(
                                      value: list.value.waktu.toString(),
                                      onChanged: (e) {
                                        // TODO : ON SELECTION WAKTU
                                        context
                                            .read<DeskripsiLuaranSlkiBloc>()
                                            .add(OnSelectionWaktuEvent(
                                                jam: e!,
                                                indexSLKI: indexSlki.key,
                                                kategori: kategori,
                                                kriteriaSlki: list.value
                                                    .copyWith(
                                                        waktu: int.parse(e)),
                                                indexKriteriaSlki: list.key));
                                      },
                                      items: ListConstants.waktu
                                          .map<DropdownMenuItem<String>>(
                                              (String value) =>
                                                  DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Text(value),
                                                  ))
                                          .toList(),

                                      // add extra sugar..
                                      icon: const Icon(Icons.arrow_drop_down),
                                      iconSize: 42,
                                      underline: const SizedBox(),
                                    ),
                                  ),
                                  Text(
                                    "JAM",
                                    style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5.sp,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        children: [
                          SizedBox(
                            child: Table(
                              border: TableBorder.all(color: Colors.black),
                              children: [
                                if (kategori == Kategori.menurun) ...[
                                  TableRow(children: [
                                    TitleWidget.headerTitle(title: "Menurun"),
                                    TitleWidget.headerTitle(
                                        title: "Cukup Menurun"),
                                    TitleWidget.headerTitle(title: "Sedang"),
                                    TitleWidget.headerTitle(
                                        title: "Cukup Meningkat"),
                                    TitleWidget.headerTitle(title: "Meningkat"),
                                  ]),
                                ],
                                if (kategori == Kategori.meningkat) ...[
                                  TableRow(children: [
                                    TitleWidget.headerTitle(title: "Meningkat"),
                                    TitleWidget.headerTitle(
                                        title: "Cukup Meningkat"),
                                    TitleWidget.headerTitle(title: "Sedang"),
                                    TitleWidget.headerTitle(
                                        title: "Cukup Menurun"),
                                    TitleWidget.headerTitle(title: "Menurun"),
                                  ]),
                                ],
                                if (kategori == Kategori.memburuk) ...[
                                  TableRow(children: [
                                    TitleWidget.headerTitle(title: "Memburuk"),
                                    TitleWidget.headerTitle(
                                        title: "Cukup Memburuk"),
                                    TitleWidget.headerTitle(title: "Sedang"),
                                    TitleWidget.headerTitle(
                                        title: "Cukup Membaik"),
                                    TitleWidget.headerTitle(title: "Membaik"),
                                  ]),
                                ],
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: list.value.skor
                                    .map(
                                      (waktu) => Container(
                                        padding: EdgeInsets.all(2.sp),
                                        height: 15.sp,
                                        width: 25.sp,
                                        child: ElevatedButton(
                                          onPressed: (list.value.isSelected)
                                              ? () {
                                                  // LAKUKAN PILIHAN TARGET
                                                  context
                                                      .read<
                                                          DeskripsiLuaranSlkiBloc>()
                                                      .add(OnSelectionTargetEvent(
                                                          target: waktu,
                                                          indexSLKI:
                                                              indexSlki.key,
                                                          kategori: kategori,
                                                          kriteriaSlki: list
                                                              .value
                                                              .copyWith(
                                                                  target:
                                                                      waktu),
                                                          indexKriteriaSlki:
                                                              list.key));
                                                }
                                              : null,
                                          style: ElevatedButton.styleFrom(
                                            side: const BorderSide(
                                                color: Colors.black),
                                            elevation: 1,
                                            backgroundColor: (waktu ==
                                                        list.value.target &&
                                                    list.value.isSelected)
                                                ? Colors.green
                                                : (list.value.isSelected)
                                                    ? Colors.white
                                                    : ThemeColor.primaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2.sp),
                                            ),
                                          ),
                                          child: Text(
                                            waktu.toString(),
                                            style: (list.value.isSelected)
                                                ? blackTextStyle
                                                : whiteTextStyle,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList()),
                          ),
                        ],
                      ),
                    ),
                  ))
              .toList()),
    );
  }
}
