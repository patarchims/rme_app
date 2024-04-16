import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/dashboard/asesmen_keperawatan_bidan/asesmen_keperawatan_bidan_bloc.dart';
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart';
import 'package:hms_app/domain/models/response/asesmen_keperawatan_bidan_model.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:hms_app/presentation/pages/igd/dokter/anamnesa_igd_widget.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class AsesmenKeperawatanBidanWidget extends StatefulWidget {
  const AsesmenKeperawatanBidanWidget({super.key});

  @override
  State<AsesmenKeperawatanBidanWidget> createState() =>
      _AsesmenKeperawatanBidanState();
}

class _AsesmenKeperawatanBidanState
    extends State<AsesmenKeperawatanBidanWidget> {
  // =======||

  late TextEditingController _caraMasukDetailController;
  final ScrollController _scrollController = ScrollController();

  late TextEditingController _keteranganAsalMasukController;
  late TextEditingController _asalMasukController;
  late TextEditingController _beratBadanController;
  late TextEditingController _tinggiBadanController;
  late TextEditingController _riwayatPenyakitSekarangController;
  late TextEditingController _riwayatPengobatanController;
  late TextEditingController _pendidikanDetailController;
  late TextEditingController _masalahKeperawatanController;

  // LEOPOID
  late TextEditingController _leopoid1Controller;
  late TextEditingController _leopoid2Controller;
  late TextEditingController _leopoid3Controller;
  late TextEditingController _leopoid4Controller;
  late TextEditingController _ddjController;
  late TextEditingController _vtController;

  late TextEditingController _lamaNyeriController;
  late TextEditingController _menjalaController;

  // FAKTOR PEMICU
  late TextEditingController _faktorPemicuController;
  late TextEditingController _faktorMengurangiController;

  // RIWAYAT KEHAMILAN
  late TextEditingController _gravidaController;
  late TextEditingController _paraController;
  late TextEditingController _abortusController;
  late TextEditingController _hphtController;
  late TextEditingController _ttpController;

  late String prolehanSelected;
  late String caraMasukSelected;
  late String asalMasukSelected;

  // ====================
  late String skriningFungsiSelected;
  late String kehamilan;

  double _currentNyeri = 0;

  late String skriningSelected;
  late String frekuensiSelected;

  late String frekuensiNyeriSelected;
  late String kualitasNyeriSelected;
  late String pulangKondisiSelected;

  late String transportasiPulangSelected;
  late String pendidikanSaatPulangSelected;
  late String kursiRodaSelected;
  late String menjalarSelected;
  late String caraBerjalanValue1;
  late String caraBerjalanValue2;
  late String skriningResiko1;
  late String skriningResiko2;
  late String skriningResiko3;
  late String skriningResiko4;
  late String skriningResiko5;
  late String hasilResikoEdukasi;
  late bool isHamil;

  // FAKTOR PEMICU

  // SKRINING RESIKO
  late String pasienMenggunakanKursi;
  late String uriAtauAlvi;
  late String riwayatDekubitus;
  late String diAtas65Tahun;
  late String khususAnak;

  @override
  void initState() {
    // ======================== //
    prolehanSelected = "";
    isHamil = false;
    caraMasukSelected = "";
    asalMasukSelected = "";
    skriningSelected = "";
    frekuensiSelected = "";
    kualitasNyeriSelected = "";
    transportasiPulangSelected = "";
    pendidikanSaatPulangSelected = "";
    menjalarSelected = "";
    kursiRodaSelected = "";
    caraBerjalanValue1 = "";
    caraBerjalanValue2 = "";

    skriningResiko1 = "";
    skriningResiko2 = "";
    skriningResiko3 = "";
    skriningResiko4 = "";
    skriningResiko5 = "";

    skriningFungsiSelected = "";
    frekuensiNyeriSelected = "";

    pulangKondisiSelected = "";
    kehamilan = "";

    // =================
    pasienMenggunakanKursi = "";
    uriAtauAlvi = "";
    riwayatDekubitus = "";
    diAtas65Tahun = "";
    khususAnak = "";

    // =================

    hasilResikoEdukasi = "";
    _caraMasukDetailController = TextEditingController();
    _keteranganAsalMasukController = TextEditingController();
    _asalMasukController = TextEditingController();
    _beratBadanController = TextEditingController();
    _tinggiBadanController = TextEditingController();
    _riwayatPenyakitSekarangController = TextEditingController();
    _riwayatPengobatanController = TextEditingController();
    _pendidikanDetailController = TextEditingController();
    _masalahKeperawatanController = TextEditingController();
    _leopoid1Controller = TextEditingController();
    _leopoid2Controller = TextEditingController();
    _leopoid3Controller = TextEditingController();
    _leopoid4Controller = TextEditingController();
    _ddjController = TextEditingController();
    _vtController = TextEditingController();

    _gravidaController = TextEditingController();
    _paraController = TextEditingController();
    _abortusController = TextEditingController();
    _hphtController = TextEditingController();
    _ttpController = TextEditingController();
    _lamaNyeriController = TextEditingController();

    _faktorPemicuController = TextEditingController();
    _faktorMengurangiController = TextEditingController();

    // =================== ||
    _menjalaController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _faktorPemicuController.clear();
    _faktorMengurangiController.clear();

    _caraMasukDetailController.clear();
    _keteranganAsalMasukController.clear();
    _asalMasukController.clear();
    _beratBadanController.clear();
    _tinggiBadanController.clear();

    _riwayatPenyakitSekarangController.clear();
    _riwayatPengobatanController.clear();
    _pendidikanDetailController.clear();
    _masalahKeperawatanController.clear();
    _leopoid1Controller.clear();
    _leopoid2Controller.clear();
    _leopoid3Controller.clear();
    _leopoid4Controller.clear();
    _ddjController.clear();
    _vtController.clear();

    _gravidaController.clear();
    _paraController.clear();
    _abortusController.clear();
    _hphtController.clear();
    _ttpController.clear();

    _asalMasukController.dispose();
    _pendidikanDetailController.dispose();
    _riwayatPenyakitSekarangController.dispose();
    _riwayatPengobatanController.dispose();
    _keteranganAsalMasukController.dispose();
    _beratBadanController.dispose();
    _tinggiBadanController.dispose();
    _masalahKeperawatanController.dispose();
    _leopoid1Controller.dispose();
    _leopoid2Controller.dispose();
    _leopoid3Controller.dispose();
    _leopoid4Controller.dispose();
    _ddjController.dispose();
    _vtController.dispose();

    _gravidaController.dispose();
    _paraController.dispose();
    _abortusController.dispose();
    _hphtController.dispose();
    _ttpController.dispose();

    _tinggiBadanController.clear();
    _beratBadanController.clear();
    _caraMasukDetailController.dispose();

    _faktorPemicuController.dispose();
    _faktorMengurangiController.dispose();

    super.dispose();
  }

  void setKehamilan() {
    if (isHamil) {
      setState(() {
        kehamilan = "Hamil";
      });
    }

    if (!isHamil) {
      setState(() {
        kehamilan = " ";
      });
    }
  }

  void setHasilResiko() {
    if (caraBerjalanValue1 == "Ya" && caraBerjalanValue2 == "Ya") {
      setState(() {
        hasilResikoEdukasi = "RISIKO TINGGI - Pasang Stiker";
      });
    }

    if (caraBerjalanValue1 == "Ya" && caraBerjalanValue2 == "Tidak") {
      setState(() {
        hasilResikoEdukasi = "RISIKO RENDAH - Edukasi";
      });
    }

    if (caraBerjalanValue1 == "Tidak" && caraBerjalanValue2 == "Ya") {
      setState(() {
        hasilResikoEdukasi = "RISIKO RENDAH - Edukasi";
      });
    }
    if (caraBerjalanValue1 == "Tidak" && caraBerjalanValue2 == "Tidak") {
      setState(() {
        hasilResikoEdukasi = "TIDAK BERISIKO - Tidak Ada Tindakan";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // ===== >
    PasienState pasienState = context.watch<PasienBloc>().state;
    final singlePasien = pasienState.listPasienModel
        .where((element) => element.mrn == pasienState.normSelected);

    return BlocConsumer<AsesmenKeperawatanBidanBloc,
        AsesmenKeperawatanBidanState>(
      listener: (context, state) {
        log(" SAVE RESULT ${state.saveOrSuccessResult}");

        // TAMPILKAN LOADING
        if (state.isLoadingSaveAsesmenKeperawatan) {
          EasyLoading.show();
        }

        if (!state.isLoadingSaveAsesmenKeperawatan) {
          EasyLoading.dismiss();
        }

        // STATE GET ASESEMEN KEPERAWATAN BIDAN
        state.getResultAsesmenKeperawatan.fold(
            () => null,
            (a) => a.fold(
                (l) => null,
                (r) => r.maybeMap(
                    orElse: () {},
                    loaded: (e) {
                      // LOADED

                      try {
                        AsesmenKeperawatanBidanModel
                            asesmenKeperawatanBidanModel =
                            AsesmenKeperawatanBidanModel.fromJson(
                                e.value["response"]);

                        setState(() {
                          prolehanSelected = asesmenKeperawatanBidanModel.info;

                          // CARA MASUK SELECTED
                          caraMasukSelected =
                              asesmenKeperawatanBidanModel.caraMasuk;
                          _caraMasukDetailController.text =
                              asesmenKeperawatanBidanModel.caraMasukDetail;

                          // ASAL MASUK
                          _asalMasukController.text =
                              asesmenKeperawatanBidanModel.asalMasukDetail;
                          asalMasukSelected =
                              asesmenKeperawatanBidanModel.asalMasuk;

                          // BERAT BADAN
                          // TINGGI BADA
                          _beratBadanController.text =
                              asesmenKeperawatanBidanModel.bb;
                          _tinggiBadanController.text =
                              asesmenKeperawatanBidanModel.tb;

                          // RIWAYAT PENYAKIT SEKARANG
                          _beratBadanController.text =
                              asesmenKeperawatanBidanModel.bb;
                          _tinggiBadanController.text =
                              asesmenKeperawatanBidanModel.tb;

                          // RIWAYAT PENGOBATAN
                          _riwayatPenyakitSekarangController.text =
                              asesmenKeperawatanBidanModel.rwtPenyakit;

                          _riwayatPengobatanController.text =
                              asesmenKeperawatanBidanModel.obatDetail;
                          frekuensiSelected =
                              asesmenKeperawatanBidanModel.fungsional;

                          // ASESMEN RISIKO  JATUH
                          caraBerjalanValue1 = asesmenKeperawatanBidanModel.rj1;
                          caraBerjalanValue2 = asesmenKeperawatanBidanModel.rj2;

                          // ===
                          _currentNyeri = asesmenKeperawatanBidanModel
                              .skalaNyeri
                              .toDouble();
                          frekuensiSelected =
                              asesmenKeperawatanBidanModel.frekuensiNyeri;

                          // ==========
                          _gravidaController.text =
                              asesmenKeperawatanBidanModel.kehamilanGravida;
                          _paraController.text =
                              asesmenKeperawatanBidanModel.kehamilanPara;
                          _abortusController.text =
                              asesmenKeperawatanBidanModel.kehamilanAbortus;

                          // =============
                          kursiRodaSelected =
                              asesmenKeperawatanBidanModel.dekubitus1;
                          uriAtauAlvi = asesmenKeperawatanBidanModel.dekubitus2;
                          riwayatDekubitus =
                              asesmenKeperawatanBidanModel.dekubitus3;
                          diAtas65Tahun =
                              asesmenKeperawatanBidanModel.dekubitus4;
                          khususAnak =
                              asesmenKeperawatanBidanModel.dekubitusAnak;

                          //  KEHAMILAN CONTROLLER
                          _ddjController.text =
                              asesmenKeperawatanBidanModel.kehamilanDjj;
                          _vtController.text =
                              asesmenKeperawatanBidanModel.kehamilanVt;

                          // ====================
                          _leopoid1Controller.text =
                              asesmenKeperawatanBidanModel.kehamilanLeopol1;
                          _leopoid2Controller.text =
                              asesmenKeperawatanBidanModel.kehamilanLeopol2;
                          _leopoid3Controller.text =
                              asesmenKeperawatanBidanModel.kehamilanLeopol3;
                          _leopoid4Controller.text =
                              asesmenKeperawatanBidanModel.kehamilanLeopol4;

                          pendidikanSaatPulangSelected =
                              asesmenKeperawatanBidanModel.pendidikan;
                          transportasiPulangSelected =
                              asesmenKeperawatanBidanModel.pulangTransportasi;
                          pulangKondisiSelected =
                              asesmenKeperawatanBidanModel.pulangKondisi;

                          skriningFungsiSelected =
                              asesmenKeperawatanBidanModel.fungsional;

                          _lamaNyeriController.text =
                              asesmenKeperawatanBidanModel.lamaNyeri;

                          setHasilResiko();
                        });

                        if (asesmenKeperawatanBidanModel.kehamilan == "Hamil") {
                          setState(() {
                            isHamil = true;
                          });
                        } else {
                          setState(() {
                            isHamil = false;
                          });
                        }
                      } catch (e) {
                        log(e.toString());
                      }
                    })));

        state.saveResultAsesmenKeperawatan.fold(
            () => null,
            (a) => a.fold(
                (l) => l.maybeMap(
                    orElse: () {},
                    connectionTimeOut: (e) async {
                      final shouldPop = await Alert.warningMessage(context,
                          subTitle: "Koneksi Time Out");
                      return shouldPop ?? false;
                    },
                    disconectToServer: (e) async {
                      final shouldPop = await Alert.warningMessage(context,
                          subTitle: "Disconnect to server");
                      return shouldPop ?? false;
                    },
                    noConnection: (e) async {
                      final shouldPop = await Alert.warningMessage(context,
                          subTitle: "No connection");
                      return shouldPop ?? false;
                    },
                    badResponse: (e) async {
                      log(e.toString());
                      final shouldPop = await Alert.warningMessage(context,
                          subTitle: "Response gagal");
                      return shouldPop ?? false;
                    },
                    unProccessable: (e) async {
                      final shouldPop = await Alert.warningMessage(context,
                          subTitle: "Tidak dapat diproses");
                      return shouldPop ?? false;
                    },
                    failure: (e) async {
                      // TAMPILKAN PESAN KESALAHAN
                      final shouldPop = await Alert.warningMessage(context,
                          subTitle: e.meta.message.toString());
                      return shouldPop ?? false;
                    }),
                (r) => r.maybeMap(
                    orElse: () {},
                    emty: (e) async {
                      final shouldPop = await Alert.warningMessage(context,
                          subTitle: "Data gagal diproses");
                      return shouldPop ?? false;
                    },
                    loaded: (e) async {
                      // TAMPILKAN PESAN KESALAHAN
                      final shouldPop = await Alert.warningMessage(context,
                          subTitle: e.value["metadata"]["message"].toString());
                      return shouldPop ?? false;
                    })));

        // ===========
      },
      builder: (context, state) {
        return HeaderContentWidget(
            onPressed: () {
              // TODO : SAVE
              // JIKA DATA DI SIMPAN
              final data = AsesmenKeperawatanBidanModel(
                  kdBagian: "",
                  noreg: singlePasien.first.noreg,
                  info: prolehanSelected,
                  // CARA MASUK
                  caraMasuk: caraMasukSelected,
                  caraMasukDetail: _caraMasukDetailController.text,

                  // ASAL MASUK
                  asalMasuk: asalMasukSelected,
                  asalMasukDetail: _asalMasukController.text,

                  // ==== BERAT BADAN
                  bb: _beratBadanController.text,
                  tb: _tinggiBadanController.text,

                  // ====
                  rwtPenyakit: _riwayatPenyakitSekarangController.text,
                  obatDetail: _riwayatPengobatanController.text,
                  fungsional: skriningFungsiSelected,

                  // ====
                  rj1: caraBerjalanValue1,
                  rj2: caraBerjalanValue2,

                  //=====
                  kajiRj: "",
                  kajiRjTindakan: "",
                  skalaNyeri: _currentNyeri.toInt(),

                  //====
                  frekuensiNyeri: frekuensiSelected,
                  lamaNyeri: _lamaNyeriController.text,
                  nyeriMenjalar: menjalarSelected,
                  menjalarDetail: _menjalaController.text,

                  // ===== MENJALAR
                  kualitasNyeri: kualitasNyeriSelected,
                  nyeriPemicu: "",
                  nyeriPengurang: "",
                  kehamilan: kehamilan,

                  // ===
                  kehamilanGravida: _gravidaController.text,
                  kehamilanPara: _paraController.text,
                  kehamilanAbortus: _abortusController.text,
                  kehamilanHpht: _hphtController.text,
                  kehamilanTtp: _ttpController.text,
                  kehamilanLeopol1: _leopoid1Controller.text,
                  kehamilanLeopol2: _leopoid2Controller.text,
                  kehamilanLeopol3: _leopoid3Controller.text,
                  kehamilanLeopol4: _leopoid4Controller.text,
                  kehamilanDjj: _ddjController.text,
                  kehamilanVt: _vtController.text,

                  // dEKUBITUR
                  dekubitus1: kursiRodaSelected,
                  dekubitus2: uriAtauAlvi,
                  dekubitus3: riwayatDekubitus,
                  dekubitus4: diAtas65Tahun,

                  //==
                  dekubitusAnak: khususAnak,
                  pulangKondisi: pulangKondisiSelected,
                  pulangTransportasi: transportasiPulangSelected,
                  pendidikan: pendidikanSaatPulangSelected,
                  pendidikanDetail: _pendidikanDetailController.text);

              context.read<AsesmenKeperawatanBidanBloc>().add(
                  AsesmenKeperawatanBidanEvent.saveAsesmenKeperawatan(
                      asesmenKeperawatanBidanModel: data));
            },
            widget: RawScrollbar(
              thumbColor: ThemeColor.darkColor,
              radius: Radius.circular(5.sp),
              thumbVisibility: true,
              interactive: true,
              thickness: 10.sp,
              trackVisibility: true,
              scrollbarOrientation: ScrollbarOrientation.right,
              controller: _scrollController, // <
              child: SingleChildScrollView(
                  controller: _scrollController, // <
                  child: SizedBox(
                    width: Get.width,
                    child: Card(
                      color: ThemeColor.bgColor,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1.sp,
                            color: ThemeColor.blackColor,
                          ),
                          borderRadius: BorderRadius.circular(2.sp)),
                      child: (state.isLoadingGetAsesmenKeperawatan)
                          ? Shimmer.fromColors(
                              baseColor: const Color(0xFFE1E1E1),
                              highlightColor: const Color(0xFFF8F8F8),
                              child: Container(
                                  height: 250.sp,
                                  width: Get.width,
                                  color: ThemeColor.bgColor,
                                  child: const Placeholder()),
                            )
                          : Column(
                              children: [
                                //
                                titleContainer(title: "Informasi & Keluhan"),

                                //  =======
                                Container(
                                  width: Get.width,
                                  color: Colors.white,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          // ================================== PROLEHAN INFORMASI
                                          Container(
                                              padding: EdgeInsets.all(2.sp),
                                              width: Get.width / 3.sp,
                                              child: Text(
                                                "Prolehan Informasi",
                                                style: blackTextStyle,
                                              )),

                                          /// ================================= ASESMEN KEPERAWATAN BIDAN
                                          Expanded(
                                            child: SizedBox(
                                              width: Get.width / 3,
                                              child: Wrap(
                                                children: perolehan
                                                    .map((e) => SizedBox(
                                                          width: 120.sp,
                                                          height: 25.sp,
                                                          child: Card(
                                                            color: ThemeColor
                                                                .lightGrey,
                                                            elevation: 1.sp,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2.sp)),
                                                            child: Center(
                                                              child:
                                                                  RadioListTile(
                                                                      selected: (e == prolehanSelected)
                                                                          ? true
                                                                          : false,
                                                                      activeColor:
                                                                          const Color(
                                                                              0xFF293074),
                                                                      selectedTileColor:
                                                                          ThemeColor
                                                                              .bgColor,
                                                                      title:
                                                                          Text(
                                                                        e,
                                                                        style: blackCalibriTextStyle.copyWith(
                                                                            fontSize:
                                                                                10.sp),
                                                                        maxLines:
                                                                            3,
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        softWrap:
                                                                            true,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                      ),
                                                                      value: e,
                                                                      groupValue:
                                                                          prolehanSelected,
                                                                      onChanged:
                                                                          (value) {
                                                                        setState(
                                                                            () {
                                                                          prolehanSelected =
                                                                              value.toString();
                                                                        });
                                                                      }),
                                                            ),
                                                          ),
                                                        ))
                                                    .toList(),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const Divider(),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(2.sp),
                                            width: Get.width / 3.sp,
                                            child: Text(
                                              "Cara Masuk",
                                              style: blackTextStyle,
                                            ),
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              width: Get.width / 3,
                                              child: Wrap(
                                                children: caraMasuk
                                                    .map((e) => SizedBox(
                                                          width: 150.sp,
                                                          height: 25.sp,
                                                          child: Card(
                                                            color: ThemeColor
                                                                .lightGrey,
                                                            elevation: 1.sp,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2.sp)),
                                                            child: Center(
                                                              child:
                                                                  RadioListTile(
                                                                      selected: (e == caraMasukSelected)
                                                                          ? true
                                                                          : false,
                                                                      activeColor:
                                                                          const Color(
                                                                              0xFF293074),
                                                                      selectedTileColor:
                                                                          ThemeColor
                                                                              .bgColor,
                                                                      title:
                                                                          Text(
                                                                        e,
                                                                        style: blackCalibriTextStyle.copyWith(
                                                                            fontSize:
                                                                                10.sp),
                                                                        maxLines:
                                                                            3,
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        softWrap:
                                                                            true,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                      ),
                                                                      value: e,
                                                                      groupValue:
                                                                          caraMasukSelected,
                                                                      onChanged:
                                                                          (value) {
                                                                        setState(
                                                                            () {
                                                                          caraMasukSelected =
                                                                              value.toString();
                                                                        });
                                                                      }),
                                                            ),
                                                          ),
                                                        ))
                                                    .toList(),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      if (caraMasukSelected ==
                                          caraMasuk.last) ...[
                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(2.sp),
                                              width: Get.width / 3.sp,
                                            ),
                                            Expanded(
                                              child: SizedBox(
                                                width: Get.width / 3,
                                                child: FormWidget.textArea(
                                                    // TODO CARA MASUK
                                                    controller:
                                                        _caraMasukDetailController,
                                                    maxLines: 1,
                                                    hinText:
                                                        "Keterangan Cara Masuk"),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                      const Divider(),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(2.sp),
                                            width: Get.width / 3.sp,
                                            child: Text(
                                              "Asal Masuk",
                                              style: blackTextStyle,
                                            ),
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              width: Get.width / 3,
                                              child: Wrap(
                                                children: asalMasuk
                                                    .map((e) => SizedBox(
                                                          width: 120.sp,
                                                          height: 25.sp,
                                                          child: Card(
                                                            color: ThemeColor
                                                                .lightGrey,
                                                            elevation: 1.sp,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2.sp)),
                                                            child: Center(
                                                              child:
                                                                  RadioListTile(
                                                                      selected: (e == asalMasukSelected)
                                                                          ? true
                                                                          : false,
                                                                      activeColor:
                                                                          const Color(
                                                                              0xFF293074),
                                                                      selectedTileColor:
                                                                          ThemeColor
                                                                              .bgColor,
                                                                      title:
                                                                          Text(
                                                                        e,
                                                                        style: blackCalibriTextStyle.copyWith(
                                                                            fontSize:
                                                                                10.sp),
                                                                        maxLines:
                                                                            3,
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        softWrap:
                                                                            true,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                      ),
                                                                      value: e,
                                                                      groupValue:
                                                                          asalMasukSelected,
                                                                      onChanged:
                                                                          (value) {
                                                                        setState(
                                                                            () {
                                                                          asalMasukSelected =
                                                                              value.toString();
                                                                        });
                                                                      }),
                                                            ),
                                                          ),
                                                        ))
                                                    .toList(),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      if (asalMasukSelected ==
                                          asalMasuk.last) ...[
                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(2.sp),
                                              width: Get.width / 3.sp,
                                            ),
                                            Expanded(
                                              child: SizedBox(
                                                width: Get.width / 3,
                                                child: FormWidget.textArea(
                                                    maxLines: 1,
                                                    controller:
                                                        _asalMasukController,
                                                    hinText:
                                                        "Keterangan Asal Masuk"),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                      const Divider(),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(2.sp),
                                            width: Get.width / 3.sp,
                                            child: Text(
                                              "BB / TB",
                                              style: blackTextStyle,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 150.sp,
                                            child: FormWidget.textForm(
                                                controller:
                                                    _beratBadanController,
                                                enable: true,
                                                labelText: "Berat Badan /Kg"),
                                          ),
                                          SizedBox(
                                            width: 150.sp,
                                            child: FormWidget.textForm(
                                                enable: true,
                                                controller:
                                                    _tinggiBadanController,
                                                labelText: "Tinggi Badan /cm"),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      textForm(
                                          title: "Riwayat Penyakit Sekarang",
                                          controller:
                                              _riwayatPenyakitSekarangController),
                                      const Divider(),
                                      textForm(
                                          title: "Riwayat Pengobatan",
                                          controller:
                                              _riwayatPengobatanController),
                                      const Divider(),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(2.sp),
                                            width: Get.width / 3.sp,
                                            child: Text(
                                              "Skrining Fungsi Aktifitas Sehari-hari",
                                              style: blackTextStyle,
                                            ),
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              width: Get.width / 3,
                                              child: Wrap(
                                                children: skrining
                                                    .map((e) => SizedBox(
                                                          width: 120.sp,
                                                          height: 25.sp,
                                                          child: Card(
                                                            color: ThemeColor
                                                                .lightGrey,
                                                            elevation: 1.sp,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2.sp)),
                                                            child: Center(
                                                              child:
                                                                  RadioListTile(
                                                                      selected: (e == skriningFungsiSelected)
                                                                          ? true
                                                                          : false,
                                                                      activeColor:
                                                                          const Color(
                                                                              0xFF293074),
                                                                      selectedTileColor:
                                                                          ThemeColor
                                                                              .bgColor,
                                                                      title:
                                                                          Text(
                                                                        e,
                                                                        style: blackCalibriTextStyle.copyWith(
                                                                            fontSize:
                                                                                10.sp),
                                                                        maxLines:
                                                                            3,
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        softWrap:
                                                                            true,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                      ),
                                                                      value: e,
                                                                      groupValue:
                                                                          skriningFungsiSelected,
                                                                      onChanged:
                                                                          (value) {
                                                                        setState(
                                                                            () {
                                                                          skriningFungsiSelected =
                                                                              value.toString();
                                                                        });
                                                                      }),
                                                            ),
                                                          ),
                                                        ))
                                                    .toList(),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),

                                      const Divider(),

                                      // =====
                                    ],
                                  ),
                                ),

                                titleContainer(
                                    title:
                                        "Asesmen Risiko Jatuh (Get Up & Go Test)"),

                                Text(
                                    "Cara Berjalan Pasien (Salah Satu Atau Lebih)",
                                    style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.bold)),

                                yaAtauTidakBox(
                                    title:
                                        "1. Tidak Seimbang/Sempoyongan/Limbung\n2. Jalan Dengan Menggunakan Alat bantu (Tongkat & Tripot, Kursi Roda, Orang Lain)",
                                    selected: caraBerjalanValue1,
                                    onChanged: (value) {
                                      setState(() {
                                        caraBerjalanValue1 = value.toString();
                                      });

                                      // SET HASIL  RISIKO JATUH
                                      log(caraBerjalanValue1.toString());
                                      setHasilResiko();
                                    }),

                                const Divider(),

                                yaAtauTidakBox(
                                    title:
                                        "Menopang Saat Akan Duduk : Tampak Memegang Pinggang Kursi Atau Meja/Benda Lain Sebagai Penopang Saat Akan Duduk",
                                    onChanged: (value) {
                                      setState(() {
                                        caraBerjalanValue2 = value.toString();
                                      });
                                      log(caraBerjalanValue2.toString());
                                      setHasilResiko();
                                    },
                                    selected: caraBerjalanValue2),

                                const Divider(),

                                // TODO Hasil Resiko
                                Text(hasilResikoEdukasi,
                                    textAlign: TextAlign.left,
                                    style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.bold)),

                                titleContainer(title: "Krining Nyeri"),

                                // =================================
                                // =================================
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(2.sp),
                                      width: Get.width / 3.sp,
                                      child: Text(
                                        "Skala Nyeri",
                                        style: blackTextStyle,
                                      ),
                                    ),
                                    Expanded(
                                      child: Slider(
                                        value: _currentNyeri,
                                        max: 10,
                                        divisions: 10,
                                        label: _currentNyeri.round().toString(),
                                        onChanged: (double value) {
                                          setState(() {
                                            _currentNyeri = value;
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 80.sp,
                                      child: Text(
                                        "Skala Nyeri \n${_currentNyeri.toString()}",
                                        textAlign: TextAlign.center,
                                        style: blackTextStyle.copyWith(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),

                                const Divider(),

                                // ======= //
                                chooseBox(
                                    title: "Frekuensi Nyeri",
                                    list: frekuensi,
                                    selected: frekuensiNyeriSelected,
                                    onChanged: (value) {
                                      setState(() {
                                        frekuensiNyeriSelected =
                                            value.toString();
                                      });
                                    }),

                                const Divider(),

                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(2.sp),
                                      width: Get.width / 3.sp,
                                      child: Text(
                                        "Lama Nyeri",
                                        style: blackTextStyle,
                                      ),
                                    ),
                                    Expanded(
                                        child: SizedBox(
                                      width: Get.width / 2.5,
                                      child: FormWidget.numberForm(
                                        // LAMA
                                        controller: _lamaNyeriController,
                                        enable: true,
                                      ),
                                    )),
                                    SizedBox(
                                      width: 55.sp,
                                      child: Text(
                                        "  Hari",
                                        style: blackTextStyle,
                                      ),
                                    )
                                  ],
                                ),
                                const Divider(),
                                chooseBox(
                                    title: "Menjalar",
                                    list: menjalar,
                                    selected: menjalarSelected,
                                    onChanged: (value) {
                                      setState(() {
                                        menjalarSelected = value.toString();
                                      });
                                    }),

                                if (menjalarSelected == menjalar.last) ...[
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(2.sp),
                                        width: Get.width / 3.sp,
                                        child: Text(
                                          "",
                                          style: blackTextStyle,
                                        ),
                                      ),
                                      Expanded(
                                          child: SizedBox(
                                        width: Get.width / 2.5,
                                        child: FormWidget.textArea(
                                            // CONTROLLER MENJALAN
                                            controller: _menjalaController,
                                            hinText: "Menjalar",
                                            maxLines: 2),
                                      )),
                                    ],
                                  ),
                                ],

                                const Divider(),

                                // ======= //
                                chooseBox(
                                    title: "Kualitas Nyeri",
                                    list: kualitasNyeri,
                                    selected: kualitasNyeriSelected,
                                    onChanged: (value) {
                                      setState(() {
                                        kualitasNyeriSelected =
                                            value.toString();
                                      });
                                    }),

                                const Divider(),
                                textForm(
                                  title: "Faktor Pemicu",
                                  controller: _faktorPemicuController,
                                ),
                                const Divider(),
                                textForm(
                                    title: "Faktor Mengurangi",
                                    controller: _faktorMengurangiController),
                                const Divider(),

                                titleContainer(title: "Riwayat Kehamilan"),

                                Row(
                                  children: [
                                    SizedBox(
                                      width: Get.width / 2.5,
                                      child: Column(
                                        children: [
                                          formBox(
                                            title: "Gravida",
                                            controller: _gravidaController,
                                            subTitle: "",
                                          ),
                                          formBox(
                                            title: "Para",
                                            controller: _paraController,
                                            subTitle: "",
                                          ),
                                          formBox(
                                            title: "Abortus ",
                                            controller: _abortusController,
                                            subTitle: "mm/mm",
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        child: Column(
                                          children: [
                                            formBox(
                                              title: "HPHT",
                                              controller: _hphtController,
                                              subTitle: "",
                                            ),
                                            formBox(
                                              title: "TTP",
                                              controller: _ttpController,
                                              subTitle: "",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                titleContainer(title: "Pemeriksaan Kebidanan"),

                                Row(
                                  children: [
                                    SizedBox(
                                      width: Get.width / 2.5,
                                      child: Column(
                                        children: [
                                          formBox(
                                            title: "Leopoid I",
                                            controller: _leopoid1Controller,
                                            subTitle: "",
                                          ),
                                          formBox(
                                            title: "Leopoid II",
                                            controller: _leopoid2Controller,
                                            subTitle: "",
                                          ),
                                          formBox(
                                            title: "Leopoid III ",
                                            controller: _leopoid3Controller,
                                            subTitle: "",
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        child: Column(
                                          children: [
                                            formBox(
                                              title: "Leopoid IV",
                                              controller: _leopoid4Controller,
                                              subTitle: "",
                                            ),
                                            formBox(
                                              title: "Djj",
                                              controller: _ddjController,
                                              subTitle: "",
                                            ),
                                            formBox(
                                              title: "VT",
                                              controller: _vtController,
                                              subTitle: "",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                titleContainer(title: "Skrining Resiko"),

                                Padding(
                                  padding: EdgeInsets.all(8.sp),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 10.sp,
                                        child: Checkbox(
                                          activeColor: ThemeColor.primaryColor,
                                          checkColor: Colors.white,
                                          value: isHamil,
                                          onChanged: (value) {
                                            setState(() {
                                              isHamil = !isHamil;
                                            });

                                            setKehamilan();
                                          },
                                        ),
                                      ),
                                      Text(
                                        "Hamil",
                                        style: blackTextStyle,
                                      )
                                    ],
                                  ),
                                ),

                                yaAtauTidakBox(
                                    title:
                                        "Apakah Pasien Menggunakan Kursi Roda Atau Membutuhkan Bantuan ?",
                                    onChanged: (value) {
                                      // APAKAH PASIEN MENGGUNAKAN KUSRSI

                                      setState(() {
                                        pasienMenggunakanKursi =
                                            value.toString();
                                      });
                                    },
                                    selected: pasienMenggunakanKursi),
                                const Divider(),
                                yaAtauTidakBox(
                                    title:
                                        "Apakah Anda Inkontinensia Uri Atau Alvi?",
                                    onChanged: (value) {
                                      setState(() {
                                        uriAtauAlvi = value.toString();
                                      });
                                    },
                                    selected: uriAtauAlvi),

                                const Divider(),
                                yaAtauTidakBox(
                                    title:
                                        "Apakah Ada Riwayat Dekubitus Atau Luka Dekubitus?",
                                    onChanged: (value) {
                                      setState(() {
                                        riwayatDekubitus = value.toString();
                                      });
                                    },
                                    selected: riwayatDekubitus),
                                const Divider(),

                                yaAtauTidakBox(
                                    title: "Apakah Pasien Di atas 65 Tahun?",
                                    onChanged: (value) {
                                      setState(() {
                                        diAtas65Tahun = value.toString();
                                      });
                                    },
                                    selected: diAtas65Tahun),
                                const Divider(),
                                Text(
                                  "Khusus Anak",
                                  textAlign: TextAlign.left,
                                  style: blackTextStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                                yaAtauTidakBox(
                                    title:
                                        "Apakah Ekstremitas Dan Badan Tidak Sesuai Dengan Usia Perkembangan?",
                                    onChanged: (value) {
                                      setState(() {
                                        khususAnak = value.toString();
                                      });
                                    },
                                    selected: khususAnak),
                                const Divider(),

                                titleContainer(title: "Rencana Keperawatan"),
                                // TODO : Rencana Keperawatan
                                // FormWidget.textForm(
                                //     labelText: "Rencana Keperawatan", enable: true),
                                // titleContainer(title: "Tindak Lanjut"),
                                // Ganti Dengan
                                // Rencana Keperawatan

                                const Divider(),
                                // ======= //
                                chooseBox(
                                    title:
                                        "Kondisi Pasien Pada Saat Pindah/Pulang Dari IGD",
                                    list: tindakLanjut,
                                    selected: pulangKondisiSelected,
                                    onChanged: (value) {
                                      setState(() {
                                        pulangKondisiSelected =
                                            value.toString();
                                      });
                                    }),
                                const Divider(),
                                // ======= //
                                chooseBox(
                                    title: "Transportasi Pulang",
                                    list: transportasiPulang,
                                    selected: transportasiPulangSelected,
                                    onChanged: (value) {
                                      setState(() {
                                        transportasiPulangSelected =
                                            value.toString();
                                      });
                                    }),
                                const Divider(),
                                // ======= // ==
                                chooseBox(
                                    title: "Pendidikan Pasien Saat Pulang",
                                    list: pendidikanSaatPulang,
                                    selected: pendidikanSaatPulangSelected,
                                    onChanged: (value) {
                                      setState(() {
                                        pendidikanSaatPulangSelected =
                                            value.toString();
                                      });

                                      if (pendidikanSaatPulangSelected ==
                                          pendidikanSaatPulang.last) {
                                        _pendidikanDetailController.clear();
                                      }
                                    }),

                                if (pendidikanSaatPulangSelected ==
                                    pendidikanSaatPulang.last) ...[
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(2.sp),
                                        width: Get.width / 3.sp,
                                        child: Text(
                                          "",
                                          style: blackTextStyle,
                                        ),
                                      ),
                                      Expanded(
                                          child: SizedBox(
                                        width: Get.width / 2.5,
                                        child: FormWidget.textArea(
                                            controller:
                                                _pendidikanDetailController,
                                            hinText: "",
                                            maxLines: 1),
                                      )),
                                    ],
                                  ),
                                ],
                              ],
                            ),
                    ),
                  )),
            ));
      },
    );
  }

  Container yaAtauTidakBox(
      {required String title,
      required String selected,
      required void Function(String?)? onChanged}) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.sp),
      child: Row(
        children: [
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  children: yaAtauTidak
                      .map((e) => SizedBox(
                            width: 60.sp,
                            height: 25.sp,
                            child: RadioListTile(
                                selected: (e == selected) ? true : false,
                                activeColor: const Color(0xFF293074),
                                selectedTileColor: Colors.cyan,
                                title: Text(
                                  e,
                                  style: blackCalibriTextStyle.copyWith(
                                      fontSize: 8.sp),
                                  maxLines: 3,
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                value: e,
                                groupValue: selected,
                                onChanged: onChanged),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              title,
              style: blackTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  Row chooseBox(
      {required String title,
      required String selected,
      required void Function(String?)? onChanged,
      required List<String> list}) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(2.sp),
          width: Get.width / 2.sp,
          child: Text(
            title,
            style: blackTextStyle,
          ),
        ),
        Expanded(
            child: SizedBox(
          width: Get.width / 2.sp,
          child: Wrap(
            children: list
                .map((e) => SizedBox(
                      width: 90.sp,
                      height: 35.sp,
                      child: Card(
                        color: ThemeColor.lightGrey,
                        elevation: 1.sp,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.sp)),
                        child: Center(
                          child: RadioListTile(
                              selected: (e == selected) ? true : false,
                              activeColor: const Color(0xFF293074),
                              selectedTileColor: ThemeColor.bgColor,
                              title: Text(
                                e,
                                style: blackCalibriTextStyle.copyWith(
                                    fontSize: 8.sp),
                                maxLines: 3,
                                textAlign: TextAlign.start,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                              value: e,
                              groupValue: selected,
                              onChanged: onChanged),
                        ),
                      ),
                    ))
                .toList(),
          ),
        )),
      ],
    );
  }

  Row textForm({required String title, TextEditingController? controller}) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(2.sp),
          width: Get.width / 3.sp,
          child: Text(
            title,
            style: blackTextStyle,
          ),
        ),
        Expanded(
          child: Container(
            width: Get.width / 3,
            padding: EdgeInsets.only(right: 5.sp),
            child: FormWidget.textArea(maxLines: 2, controller: controller),
          ),
        )
      ],
    );
  }
}

Container formBox(
    {required String title,
    required String subTitle,
    String? labelText,
    TextEditingController? controller}) {
  return Container(
    width: Get.width,
    padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 4.sp),
    child: Row(
      children: [
        SizedBox(
          width: 70.sp,
          child: Text(
            title,
            style: (labelText != null)
                ? blackTextStyle.copyWith(fontWeight: FontWeight.bold)
                : blackTextStyle,
          ),
        ),
        Expanded(
            child: FormWidget.textForm(
          labelText: labelText,
          controller: controller,
          enable: true,
        )),
        SizedBox(
          width: 5.sp,
        ),
        SizedBox(
          width: 25.sp,
          child: Text(
            subTitle,
            style: blackTextStyle,
          ),
        ),
      ],
    ),
  );
}

List<String> frekuensi = ["Jarang", "Hilang Timbul", "Terus Menerus"];
List<String> kualitasNyeri = ["Nyeri Tumpul", "Nyeri Tajam", "Panas/Terbakar"];

List<String> transportasiPulang = [
  "Kendaraan Pribadi",
  "Ambulan",
  "Kendaraan Jenazah"
];
List<String> tindakLanjut = [
  "Membaik",
  "Memburuk",
  "Stabil",
  "Meninggal",
  "Tidak Ada Perubahan",
  "DOA"
];

List<String> menu = [
  "Informasi & Keluhan",
  "Asesmen Risiko",
  "Skrining Nyeri",
  "Riwayat Kehamilan",
  "Skrining Risiko Dekubitus",
  "Masalah Keperawatan",
  "Rencana Keperawatan",
  "Tindak Lanjut"
];

List<String> perolehan = [
  "Auto Anamnesa",
  "Hetero Anamnesa",
];

List<String> caraMasuk = [
  "Jalan Tanpa Bantuan",
  "Kursi Roda",
  "Tempat Tidur Dorong",
  "Jalan Dengan Bantuan"
];
List<String> asalMasuk = ["Non Rujukan", "Rujukan"];
List<String> skrining = ["Mandiri", "Dengan Bantuan"];
List<String> menjalar = ["Tidak", "Ya"];
List<String> yaAtauTidak = ["Tidak", "Ya"];
List<String> pendidikanSaatPulang = [
  "Makan/Minum Obat Teratur",
  "Diet",
  "Jaga Kebersihan Luka",
  "Lain-Lain"
];
