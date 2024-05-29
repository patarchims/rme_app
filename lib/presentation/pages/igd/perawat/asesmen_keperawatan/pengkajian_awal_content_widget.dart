import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/alergi/alergi_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
import 'package:hms_app/domain/models/devices_info/device_info_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/users/user_model.dart';
import 'package:hms_app/presentation/component/alert/mesage_alert.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/component/extenstion/date_helper.dart';
import 'package:hms_app/presentation/component/loading/loading.dart';
import 'package:hms_app/presentation/pages/bangsal/bloc/pengkajian_awal_keperawatan/pengkajian_awal_keperawatan_bloc.dart';
import 'package:hms_app/presentation/pages/bangsal/perawat/riwayat_alergi_keperawatan/riwayat_alergi_keperawatan_widget_content.dart';
import 'package:hms_app/presentation/pages/igd/bloc/asesmen_igd/asesmen_igd_bloc.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:hms_app/presentation/screens/emty_page.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';

class PengkajianAwalKeperawatanContentWidget extends StatefulWidget {
  const PengkajianAwalKeperawatanContentWidget({super.key});

  @override
  State<PengkajianAwalKeperawatanContentWidget> createState() =>
      _PengkajianAwalKeperawatanContentWidgetState();
}

class _PengkajianAwalKeperawatanContentWidgetState
    extends State<PengkajianAwalKeperawatanContentWidget> {
  final ScrollController _scrollController = ScrollController();
  late TextEditingController _riwayatPenyakitKeluargaController;
  late TextEditingController _caraMasukController;
  late TextEditingController _asalMasukController;
  late TextEditingController _skriningFungsiController;
  late TextEditingController _keluhanUtamaController;
  late TextEditingController _riwayatPenyakitSekarangController;
  late TextEditingController _penyakitDahuluController;
  late TextEditingController _reaksiAlergiController;

  @override
  void initState() {
    _riwayatPenyakitKeluargaController = TextEditingController();
    _caraMasukController = TextEditingController();
    _asalMasukController = TextEditingController();
    _skriningFungsiController = TextEditingController();
    _keluhanUtamaController = TextEditingController();
    _riwayatPenyakitSekarangController = TextEditingController();
    _penyakitDahuluController = TextEditingController();
    _reaksiAlergiController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _riwayatPenyakitKeluargaController.dispose();
    _caraMasukController.dispose();
    _asalMasukController.dispose();
    _skriningFungsiController.dispose();
    _keluhanUtamaController.dispose();
    _riwayatPenyakitSekarangController.dispose();
    _penyakitDahuluController.dispose();
    _reaksiAlergiController.dispose();

    _riwayatPenyakitKeluargaController.clear();
    _caraMasukController.clear();
    _asalMasukController.clear();
    _skriningFungsiController.clear();
    _keluhanUtamaController.clear();
    _riwayatPenyakitSekarangController.clear();
    _penyakitDahuluController.clear();
    _reaksiAlergiController.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);
    AuthState authState = context.watch<AuthBloc>().state;

    return BlocConsumer<AsesmenAwalIgdBloc, AsesmenIgdAwalState>(
      listener: (context, state) {
        if (state.status == AsesmenIgdStatus.isLoadingSave) {
          EasyLoading.show();
        }

        if (state.status != AsesmenIgdStatus.isLoadingSave) {
          EasyLoading.dismiss();
        }

        // ================================= //
        state.saveResultFailure.fold(
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
      },
      builder: (context, state) {
        if (state.status == AsesmenIgdStatus.isLodingGetData) {
          return HeaderContentWidget(
            backgroundColor: ThemeColor.bgColor,
            isENableAdd: true,
            widget: Loading.expandedLoading(),
          );
        }

        return HeaderContentWidget(
            backgroundColor: ThemeColor.bgColor,
            isENableAdd: true,
            onPressed: () async {
              // SIMPAN DATA
              dynamic data = await deviceInfo.initPlatformState();
              if (authState is Authenticated) {
                // ignore: use_build_context_synchronously
                context
                    .read<AsesmenAwalIgdBloc>()
                    .add(OnSaveAsesmenAwalIGDEvent(
                      noReg: singlePasien.first.noreg,
                      noRm: singlePasien.first.mrn,
                      tanggal: DateTime.now().toString().substring(0, 10),
                      person: toPerson(person: authState.user.person),
                      devicesID: "ID-${data['id']} - ${data['device']}",
                      pelayanan:
                          toPelayanan(poliklinik: authState.user.poliklinik),
                      info: state.pengkajianWalIGD.pengkajian.info,
                      infoDetail: state.pengkajianWalIGD.pengkajian.infoDetail,
                      caraMasuk: _caraMasukController.text,
                      asalMasuk: _asalMasukController.text,
                      fungsional: _skriningFungsiController.text,
                      keluhanUtama: _keluhanUtamaController.text,
                      penyakitSekarang: _riwayatPenyakitSekarangController.text,
                      penyakitDahulu: _penyakitDahuluController.text,
                      riwayatDahulu: _penyakitDahuluController.text,
                      reaksiAlergi: _reaksiAlergiController.text,
                    ));
              }
            },
            title: "SIMPAN",
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
                                    child: Text("Anamnesa",
                                        textAlign: TextAlign.left,
                                        style: blackTextStyle.copyWith(
                                            fontSize: 6.sp))),
                                Container(
                                  width: Get.width,
                                  decoration:
                                      BoxDecoration(color: ThemeColor.bgColor),
                                  child: Column(
                                    children: [
                                      Wrap(
                                        children: jenisInformasi
                                            .asMap()
                                            .entries
                                            .map((e) {
                                          if (state.pengkajianWalIGD.pengkajian
                                                  .info ==
                                              e.value) {
                                            return TitleWidget.boxChoose(
                                              backgroundColor:
                                                  ThemeColor.greenColor,
                                              onPressed: () {
                                                if (e.value ==
                                                    jenisInformasi[1]) {
                                                  context
                                                      .read<
                                                          AsesmenAwalIgdBloc>()
                                                      .add(
                                                          OnChangedDetailAnamnesa(
                                                              value: ""));
                                                }

                                                context
                                                    .read<AsesmenAwalIgdBloc>()
                                                    .add(OnSelectionAnamnesa(
                                                        value: e.value));
                                              },
                                              icon: const Icon(
                                                FontAwesomeIcons.check,
                                                color: Colors.white,
                                              ),
                                              title: e.value,
                                            );
                                          }

                                          return TitleWidget.boxChoose(
                                            backgroundColor:
                                                ThemeColor.primaryColor,
                                            onPressed: () {
                                              context
                                                  .read<AsesmenAwalIgdBloc>()
                                                  .add(OnSelectionAnamnesa(
                                                      value: e.value));

                                              if (e.value == jenisAnma[1]) {
                                                context
                                                    .read<AsesmenAwalIgdBloc>()
                                                    .add(
                                                        OnChangedDetailAnamnesa(
                                                            value: ""));
                                              }
                                              context
                                                  .read<
                                                      PengkajianAwalKeperawatanBloc>()
                                                  .add(OnChangedJenisAnamnesa(
                                                      value: e.value));
                                            },
                                            icon: const Icon(
                                                FontAwesomeIcons.check,
                                                color: Colors.white),
                                            title: e.value,
                                          );
                                        }).toList(),
                                      ),

                                      //====//
                                      if (state.pengkajianWalIGD.pengkajian
                                              .info ==
                                          jenisInformasi.last) ...[
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.sp, vertical: 2.sp),
                                          width: Get.width / 2.4,
                                          child: SizedBox(
                                            child: FormWidget.textArea(
                                                maxLines: 2,
                                                enabled: true,
                                                value: state.pengkajianWalIGD
                                                    .pengkajian.infoDetail,
                                                onChanged: (e) {
                                                  context
                                                      .read<
                                                          AsesmenAwalIgdBloc>()
                                                      .add(
                                                          OnChangedDetailAnamnesa(
                                                              value: e));
                                                }),
                                          ),
                                        ),
                                      ]
                                    ],
                                  ),
                                )
                              ]),
                            ],
                          ),
                        ),
                        TitleWidget.titleContainer(title: "Cara Masuk"),

                        Padding(
                          padding: EdgeInsets.all(5.sp),
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            widget: SearchField(
                              searchStyle: blackTextStyle,
                              enabled: true,
                              marginColor: ThemeColor.whiteColor,
                              suggestionStyle: blackTextStyle,
                              suggestionsDecoration: SuggestionDecoration(
                                  selectionColor: ThemeColor.bgColor,
                                  hoverColor:
                                      ThemeColor.darkColor.withOpacity(0.2),
                                  color: ThemeColor.bgColor),
                              suggestions: caraMasuk
                                  .map(
                                    (e) => SearchFieldListItem(
                                      e,
                                      item: e.toUpperCase(),
                                      child: Container(
                                        width: Get.width,
                                        color: ThemeColor.bgColor,
                                        child: Text(
                                          e,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 6.sp),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              controller: _caraMasukController
                                ..text =
                                    state.pengkajianWalIGD.pengkajian.caraMasuk,
                            ),
                            title: "Cara Masuk",
                          ),
                        ),

                        TitleWidget.titleContainer(title: "Asal Masuk"),

                        Padding(
                          padding: EdgeInsets.all(5.sp),
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            widget: SearchField(
                              searchStyle: blackTextStyle,
                              enabled: true,
                              marginColor: ThemeColor.whiteColor,
                              suggestionStyle: blackTextStyle,
                              suggestionsDecoration: SuggestionDecoration(
                                  selectionColor: ThemeColor.bgColor,
                                  hoverColor:
                                      ThemeColor.darkColor.withOpacity(0.2),
                                  color: ThemeColor.bgColor),
                              suggestions: asalMasuk
                                  .map(
                                    (e) => SearchFieldListItem(
                                      e,
                                      item: e.toUpperCase(),
                                      child: Container(
                                        width: Get.width,
                                        color: ThemeColor.bgColor,
                                        child: Text(
                                          e,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 6.sp),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              controller: _asalMasukController
                                ..text =
                                    state.pengkajianWalIGD.pengkajian.asalMasuk,
                            ),
                            title: "Asal Masuk",
                          ),
                        ),

                        TitleWidget.titleContainer(
                            title: "Skrining Fungsi Aktifitas sehari-hari"),

                        Padding(
                          padding: EdgeInsets.all(5.sp),
                          child: TitleWidget.boxPemeriksaanFisikSugestion(
                            widget: SearchField(
                              searchStyle: blackTextStyle,
                              enabled: true,
                              marginColor: ThemeColor.whiteColor,
                              suggestionStyle: blackTextStyle,
                              suggestionsDecoration: SuggestionDecoration(
                                  selectionColor: ThemeColor.bgColor,
                                  hoverColor:
                                      ThemeColor.darkColor.withOpacity(0.2),
                                  color: ThemeColor.bgColor),
                              suggestions: aktivitas
                                  .map(
                                    (e) => SearchFieldListItem(
                                      e,
                                      item: e.toUpperCase(),
                                      child: Container(
                                        width: Get.width,
                                        color: ThemeColor.bgColor,
                                        child: Text(
                                          e,
                                          style: blackTextStyle.copyWith(
                                              fontSize: 6.sp),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              controller: _skriningFungsiController
                                ..text = state.pengkajianWalIGD.pengkajian
                                    .fungsiAktivitas,
                            ),
                            title: "Skrining Fungsi Aktifitas sehari-hari",
                          ),
                        ),

                        TitleWidget.titleContainer(title: "Keluhan Utama"),
                        Padding(
                          padding: EdgeInsets.all(5.sp),
                          child: FormWidget.textArea(
                            enabled: true,
                            maxLines: 3,
                            controller: _keluhanUtamaController
                              ..text = state
                                  .pengkajianWalIGD.pengkajian.keluhanUtama,
                          ),
                        ),
                        TitleWidget.titleContainer(
                            title: "Riwayat Penyakit Sekarang"),

                        Padding(
                          padding: EdgeInsets.all(5.sp),
                          child: FormWidget.textArea(
                            enabled: true,
                            maxLines: 3,
                            controller: _riwayatPenyakitSekarangController
                              ..text = state.pengkajianWalIGD.pengkajian
                                  .riwayatPenyakitSekarang,
                          ),
                        ),

                        TitleWidget.titleContainer(
                            title: "Riwayat Penyakit Dahulu"),

                        // ===================== //
                        Padding(
                          padding: EdgeInsets.all(5.sp),
                          child: FormWidget.textArea(
                              enabled: true,
                              maxLines: 3,
                              controller: _penyakitDahuluController
                                ..text = state.pengkajianWalIGD.pengkajian
                                    .riwayatPenyakitDahulu),
                        ),

                        TitleWidget.titleContainer(
                            title: "Riwayat Pengobatan Sebelumnya"),

                        Padding(
                          padding: EdgeInsets.all(3.sp),
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: (state.pengkajianWalIGD.riwayatTerdahulu
                                    .isNotEmpty)
                                ? state.pengkajianWalIGD.riwayatTerdahulu
                                    .map((e) => Padding(
                                          padding: EdgeInsets.all(1.sp),
                                          child: Card(
                                            margin: EdgeInsets.all(5.sp),
                                            color: ThemeColor.bgColor,
                                            elevation: 0,
                                            child: Text(
                                              "${tglIndo(e.tglMasuk.toString().substring(0, 10))} - ${e.riwayatSekarang.toString()},",
                                              style: blackTextStyle,
                                            ),
                                          ),
                                        ))
                                    .toList()
                                : [
                                    Container(
                                      height: 35.sp,
                                    )
                                  ],
                          ),
                        ),

                        TitleWidget.titleContainer(
                            title: "Riwayat Penyakit Keluarga"),

                        const SizedBox(height: 10),

                        BlocConsumer<AlergiBloc, AlergiState>(
                          listener: (context, state) {
                            state.onSaveRiwayatAlergi.fold(
                                () => null,
                                (a) => a.fold(
                                    (l) => l.maybeMap(
                                        orElse: () {},
                                        failure: (e) async {
                                          // FAILURE

                                          if (e.meta.code == 201) {
                                            final shouldPop =
                                                await Alert.warningMessage(
                                                    context,
                                                    subTitle: e.meta.message
                                                        .toString(),
                                                    title: "Peringatan");
                                            return shouldPop ?? false;
                                          }
                                        }),
                                    (r) => r.maybeMap(
                                        orElse: () {},
                                        loaded: (e) async {
                                          MetaModel meta = MetaModel.fromJson(
                                              e.value["metadata"]);
                                          final shouldPop = await Alert.loaded(
                                              context,
                                              subTitle: meta.message,
                                              title: "Pesan");
                                          // ignore: use_build_context_synchronously
                                          context.read<AlergiBloc>().add(
                                              OnGetAlergiKeluargaEvent(
                                                  noRM: singlePasien.first.mrn,
                                                  noReg: singlePasien
                                                      .first.noreg));
                                          return shouldPop ?? false;
                                        })));
                          },
                          builder: (context, state) {
                            return Container(
                              width: Get.width,
                              height: 20.sp,
                              padding: EdgeInsets.symmetric(horizontal: 5.sp),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: ThemeColor.primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.sp))),
                                child: const Icon(FontAwesomeIcons.plus,
                                    color: Colors.white),
                                onPressed: () {
                                  CustomDialogWidget.getDialog(
                                      widget: Container(
                                        width: Get.width / 1.5,
                                        height: 60.sp,
                                        decoration: const BoxDecoration(
                                            color: Colors.white),
                                        child: Column(
                                          children: [
                                            TitleWidget.titleContentWidget(
                                                title:
                                                    "TAMBAH DATA RIWAYAT PENYAKIT KELUARGA"),
                                            BlocListener<
                                                PengkajianAwalKeperawatanBloc,
                                                PengkajianAwalKeperawatanState>(
                                              listener: (context, state) {
                                                // TODO: implement listener
                                                if (state.status ==
                                                    PengkajianAwalKeperawatanStatus
                                                        .isLoadingSave) {
                                                  EasyLoading.show();
                                                }

                                                if (state.status !=
                                                    PengkajianAwalKeperawatanStatus
                                                        .isLoadingSave) {
                                                  EasyLoading.dismiss();
                                                }

                                                state.saveResultFailure.fold(
                                                    () => null,
                                                    (a) => a.fold(
                                                        (l) => l.maybeMap(
                                                            orElse: () {},
                                                            failure: (e) async {
                                                              // FAILURE
                                                              if (e.meta.code ==
                                                                  201) {
                                                                final shouldPop = await Alert.warningMessage(
                                                                    context,
                                                                    subTitle: e
                                                                        .meta
                                                                        .message
                                                                        .toString(),
                                                                    title:
                                                                        "Peringatan");
                                                                return shouldPop ??
                                                                    false;
                                                              }
                                                            }),
                                                        (r) => r.maybeMap(
                                                            orElse: () {},
                                                            loaded: (e) async {
                                                              MetaModel meta =
                                                                  MetaModel.fromJson(e
                                                                          .value[
                                                                      "metadata"]);
                                                              final shouldPop =
                                                                  await Alert.loaded(
                                                                      context,
                                                                      subTitle: meta
                                                                          .message,
                                                                      title:
                                                                          "Pesan");
                                                              return shouldPop ??
                                                                  false;
                                                            })));
                                              },
                                              child: Row(
                                                children: [
                                                  Container(
                                                      height: 35.sp,
                                                      width: Get.width / 2,
                                                      padding:
                                                          EdgeInsets.all(5.sp),
                                                      child:
                                                          FormWidget.textArea(
                                                        maxLines: 2,
                                                        enabled: true,
                                                        controller:
                                                            _riwayatPenyakitKeluargaController,
                                                        validator: (value) {
                                                          if (value!
                                                              .contains("\n")) {
                                                            Get.back();
                                                          }
                                                          return null;
                                                        },
                                                        // enable: true,
                                                      )),
                                                  Expanded(
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.all(5.sp),
                                                      height: 22.sp,
                                                      width: Get.width,
                                                      child: IconButton(
                                                          onPressed: () {
                                                            if (authState
                                                                is Authenticated) {
                                                              // ==== //
                                                              context.read<AsesmenAwalIgdBloc>().add(OnSavePenyakitKeluargaEvent(
                                                                  noRM:
                                                                      singlePasien
                                                                          .first
                                                                          .mrn,
                                                                  penyakitKeluarga:
                                                                      _riwayatPenyakitKeluargaController
                                                                          .text,
                                                                  userID:
                                                                      authState
                                                                          .user
                                                                          .userId,
                                                                  noReg:
                                                                      singlePasien
                                                                          .first
                                                                          .noreg,
                                                                  person: toPerson(
                                                                      person: authState
                                                                          .user
                                                                          .person),
                                                                  tanggal: DateTime
                                                                          .now()
                                                                      .toString()
                                                                      .substring(
                                                                          0,
                                                                          10)));
                                                            }
                                                            Get.back();
                                                            _riwayatPenyakitKeluargaController
                                                                .clear();
                                                          },
                                                          style: ElevatedButton.styleFrom(
                                                              backgroundColor:
                                                                  ThemeColor
                                                                      .primaryColor,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(2
                                                                              .sp))),
                                                          color: ThemeColor
                                                              .whiteColor,
                                                          icon: const Icon(
                                                              FontAwesomeIcons
                                                                  .circlePlus)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      color: Colors.transparent);
                                },
                              ),
                            );
                          },
                        ),

                        Container(
                          height: 150.sp,
                          padding: EdgeInsets.all(5.sp),
                          margin: EdgeInsets.all(5.sp),
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: ThemeColor.bgColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.sp)),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Card(
                            elevation: 1,
                            color: ThemeColor.bgColor,
                            child: SizedBox(
                              width: Get.width,
                              child:
                                  (state.pengkajianWalIGD
                                          .riwayatPenyakitKeluarga.isNotEmpty)
                                      ? Wrap(
                                          children:
                                              state.pengkajianWalIGD
                                                  .riwayatPenyakitKeluarga
                                                  .map((e) => SizedBox(
                                                        width: 100.sp,
                                                        height: 20.sp,
                                                        child: Card(
                                                          color: ThemeColor
                                                              .darkColor,
                                                          child: ListTile(
                                                              trailing:
                                                                  IconButton(
                                                                onPressed: () {
                                                                  // === //
                                                                  CustomDialogWidget.getDialog(
                                                                      widget: MessageAlert.deleteAlert(
                                                                          mesage: "Apakah Anda yakin menghapus data ${e.alergi} init ?",
                                                                          onPressed: () {
                                                                            //  === DELETE DATA ==== /

                                                                            if (authState
                                                                                is Authenticated) {
                                                                              context.read<AsesmenAwalIgdBloc>().add(OnDeletePenyakitKeluargaEvent(nomor: e.nomor, noRm: singlePasien.first.mrn, kelompok: e.kelompok, noReg: singlePasien.first.noreg, noRM: singlePasien.first.mrn, tanggal: DateTime.now().toString().substring(0, 10), person: toPerson(person: authState.user.person)));
                                                                              context.read<AlergiBloc>().add(OnRemovePenyakitKeluargaEvent(nomor: e.nomor, noRm: e.noRm, kelompok: e.kelompok));
                                                                            }

                                                                            Get.back();
                                                                          }));
                                                                },
                                                                icon:
                                                                    const Icon(
                                                                  FontAwesomeIcons
                                                                      .circleMinus,
                                                                  color: ThemeColor
                                                                      .dangerColor,
                                                                ),
                                                              ),
                                                              title: Text(
                                                                e.alergi,
                                                                style:
                                                                    whiteTextStyle,
                                                              )),
                                                        ),
                                                      ))
                                                  .toList(),
                                        )
                                      : EmtyScren(
                                          subTitle: "Data kosong",
                                          textStyle: blackTextStyle,
                                        ),
                            ),
                          ),
                        ),

                        SizedBox(height: 5.sp),
                        const RiwayatAlergiKeperawatanContentWidget(),
                        TitleWidget.titleContainer(title: "Reaksi Alergi"),
                        Padding(
                            padding: EdgeInsets.all(5.sp),
                            child: FormWidget.textArea(
                                enabled: true,
                                maxLines: 3,
                                controller: _reaksiAlergiController
                                  ..text = state.pengkajianWalIGD.pengkajian
                                      .reaksiAlergi)),
                        SizedBox(height: 10.sp),
                      ],
                    ),
                  ),
                )));
      },
    );
  }
}

List<String> caraMasuk = [
  "Jalan Tanpa Bantuan",
  "Kursi Roda",
  "Tempat Tidur Dorong",
  "Jalan Dengan Bantuan"
];

List<String> asalMasuk = ["Rujukan", "Non Rujukan"];

List<String> aktivitas = ["Mandiri", "Dengan Bantuan"];

List<String> jenisAnma = ["Auto Anamnesa"];

List<String> jenisInformasi = ["Auto Anamnesa", "Alloanamnese"];
