import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/kebidanan/presentation/asesmen/fungsional_content_widget.dart';
import 'package:hms_app/presentation/kebidanan/repository/pengkajian_fungsional_reponse_model.dart';
import 'package:hms_app/presentation/kebidanan/repository/response_pemeriksaan_fisik_response_model.dart';
import 'package:hms_app/presentation/kebidanan/repository/riwayat_kehamilan_kebidanan_response_model.dart';
import 'package:hms_app/presentation/kebidanan/repository/riwayat_pengobatan_response_model.dart';
import 'package:hms_app/presentation/kebidanan/repository/tanda_vital_sign_response_model.dart';
import 'package:hms_app/presentation/kebidanan/services/kebidanan_service.dart';

part 'kebidanan_event.dart';
part 'kebidanan_state.dart';

class KebidananBloc extends Bloc<KebidananEvent, KebidananState> {
  KebidananBloc() : super(KebidananState.initial()) {
    on<KebidananEvent>((event, emit) {});
    on<OnSaveRiwayatPengobatanDirumah>(_onSaveRiwayatPengobatanDirumah);
    on<OnGetRiwayatPengobatanDirumah>(_onGetRiwayatPengobatanDirumah);
    on<OnDeleteRiwayatPengobatanDirumahKebidanan>(_onDeletePengobatanDirumah);
    on<OnDeleteRiwayatKehamilanEvent>(_onDeleteRiwayatKehamilan);
    on<OnGetPemeriksasanFisikKebidanan>(_onGetPemeriksaanFisikEvent);

    //  =========  //
    on<OnGetVitalSignKebidanan>(_onGetVitalSignKebidanan);
    on<OnSaveTandaTandaVitalSignKebidanan>(_onSaveTandaVitalSignKebidanan);
    on<OnChangedTekananDarah>(_onChangedTekananDarah);
    on<OnChangedPernapasan>(_onChangedPernapasan);
    on<OnChangedSuhu>(_onChangedSuhu);
    on<OnChangedNadi>(_onChangedNadi);
    on<OnChangedDDJ>(_onChangedDDJ);
    on<OnChangedBeratBadan>(_onChangedBeratBadan);
    on<OnChangedTinggiBadan>(_onChangedTinggiBadan);
    on<OnChangedGcsE>(_onChangedGCSE);
    on<OnChangedGcsM>(_onChangedGCSM);
    on<OnChangedGcsV>(_onChangedGCSV);
    on<OnSaveRiwayatKehamilanBidan>(_onSaveRiwayatKehamilan);
    on<OnGetRiwayatKebidanan>(_onGetRiwayatKebidanan);

    // ===== SELECTION PEMERIKSAAN FISIK ====== //
    on<OnSelectionKepala>(_onSelectionKepala);
    on<OnSelectionMucosaMulut>(_onSelectionMucosMulut);
    on<OnSelectionGigi>(_onSelectionGigi);
    on<OnSelectionAbdomen>(_onSelectionAbdomen);

    on<OnSelectionMata>(_onSelectionMata);
    on<OnSelectionTelinga>(_onSelectionTelinga);
    on<OnSelecteionMulut>(_onSelectionMulut);
    on<OnSelectionHidung>(_onSelectionHidung);
    on<OnSelectionTenggorakan>(_onSelectionTenggorokan);
    on<OnSelectionPayudara>(_onSelectionPayudara);
    on<OnSelectionNutrisiDanHidrasi>(_onSelectionNutrisiDanHidrasi);
    on<OnSavePemeriksaanFisikKebidahan>(_onSavePemeriksaanFisikKebidanan);

    on<OnSelectionLeherDanBahu>(_onSelectionLeherDanBahu);
    on<OnGetPengkajianFungsionalKebidanan>(_onGetPengkajianFungsional);
    on<OnChangedFungsionalF1>(_onChangedFungsionalF1);
    on<OnChangedFungsionalF2>(_onChangeFungsionalF2);
    on<OnChangedFungsionalF3>(_onChangeFungsionalF3);
    on<OnChangedFungsionalF4>(_onChangeFungsionalF4);
    on<OnChangedFungsionalF5>(_onChangeFungsionalF5);
    on<OnChangedFungsionalF6>(_onChangeFungsionalF6);
    on<OnChangedFungsionalF7>(_onChangeFungsionalF7);
    on<OnChangedFungsionalF8>(_onChangeFungsionalF8);
    on<OnChangedFungsionalF9>(_onChangeFungsionalF9);
    on<OnChangedFungsionalF10>(_onChangeFungsionalF10);
    on<OnSavePengkajianFungsionalEvent>(_onSavePengkajianFungsional);
    on<OnChangedKepalaLainnya>(_onChangeKepalaLainnya);
    on<OnChangedTelingaLainnya>(_onChangedTelingaLainya);
    on<OnChangedLeherDanBahuLainnya>(_onChangedLeherdanBahuLainnya);
    on<OnchangedMulutLainnya>(_onChangedMulutLainnya);
    on<OnChangedMataLainnya>(_onChangedMataLainnya);
    on<OnChangedMucosaMulutLainnya>(_onChangedMucosaLainnya);
    on<OnChangedGigiLainnya>(_onChangedGigiLainnya);
    on<OnChangeTFU>(_onChangedTFU);
    on<OnChangeTandaKebidananPupil>(_onChangedKebidananPupil);
    on<OnChangedTandaKebidananKesadaran>(_onChangedKesadaran);
    on<OnChangedTandaKebidananAkral>(_onChangedAkral);
  }

  void updateTotal({required Emitter<KebidananState> emit}) {
    emit(state.copyWith(
        pengkajianFungsional: state.pengkajianFungsional.copyWith(
            nilai: state.pengkajianFungsional.nilaiF1 +
                state.pengkajianFungsional.nilaiF2 +
                state.pengkajianFungsional.nilaiF3 +
                state.pengkajianFungsional.nilaiF4 +
                state.pengkajianFungsional.nilaiF5 +
                state.pengkajianFungsional.nilaiF6 +
                state.pengkajianFungsional.nilaiF7 +
                state.pengkajianFungsional.nilaiF8 +
                state.pengkajianFungsional.nilaiF9 +
                state.pengkajianFungsional.nilaiF10)));
  }

  void updateKeterangan({required Emitter<KebidananState> emit}) {
    emit(state.copyWith(
        pengkajianFungsional: state.pengkajianFungsional.copyWith(
            keterangan: (state.pengkajianFungsional.nilai <= 20)
                ? "Ketergantungan Total"
                : (state.pengkajianFungsional.nilai <= 60)
                    ? "Ketergantungan Parah"
                    : (state.pengkajianFungsional.nilai <= 90)
                        ? "Ketergantungan Sedang"
                        : "Ketergantungan Rendah")));
  }

  Future<void> _onSaveRiwayatPengobatanDirumah(
    OnSaveRiwayatPengobatanDirumah event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loading, saveResult: none()));

    try {
      final saveData = await kebidananService.saveRiwayatPengobatan(
          noReg: event.noReg,
          deviceID: event.deviceID,
          userID: event.userID,
          namaObat: event.namaObat,
          dosis: event.dosis,
          caraPemberian: event.caraPemberian,
          frekuensi: event.frekuensi,
          waktuPemberian: event.waktuPemberian);
      emit(state.copyWith(
          kebidananStatus: KebidananStatus.loaded,
          saveResult: optionOf(saveData)));
      emit(state.copyWith(
          kebidananStatus: KebidananStatus.loaded, saveResult: none()));
    } catch (e) {
      emit(state.copyWith(
          kebidananStatus: KebidananStatus.error, saveResult: none()));
    }
  }

  Future<void> _onSavePemeriksaanFisikKebidanan(
    OnSavePemeriksaanFisikKebidahan event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.isLoadingPemeriksaanFisikKebidanan,
        saveResult: none()));

    try {
      final saveData = await kebidananService.onSavePemeriksaanFisikKebidanan(
        kepala: event.kepala,
        leherDanBahu: event.leherDanBahu,
        mata: event.mata,
        mucosaMulut: event.mucosaMulut,
        mulut: event.mulut,
        nutrisiDanHidrasi: event.nutrisiDanHidrasi,
        payudara: event.payudara,
        pelayanan: event.pelayanan,
        person: event.person,
        telinga: event.telinga,
        tenggorokan: event.tenggorokan,
        noReg: event.noReg,
        deviceID: event.deviceID,
        abdomen: event.abdomen,
        gigi: event.gigi,
        hidung: event.hidung,
      );

      emit(state.copyWith(
          kebidananStatus: KebidananStatus.loadedPemeriksaanFisikKebidanan,
          savePemeriksaanFisikResult: optionOf(saveData)));
      emit(state.copyWith(
          kebidananStatus: KebidananStatus.loadedPemeriksaanFisikKebidanan,
          savePemeriksaanFisikResult: none()));
    } catch (e) {
      emit(state.copyWith(
          kebidananStatus: KebidananStatus.error,
          savePemeriksaanFisikResult: none()));
    }
  }

  Future<void> _onChangedFungsionalF1(
    OnChangedFungsionalF1 event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST

    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loadedPengkajianFungsional,
        pengkajianFungsional: state.pengkajianFungsional.copyWith(
            f1: event.value,
            nilaiF1: (event.value == mandiri)
                ? 10
                : (event.value == denganBantuan)
                    ? 5
                    : 0)));
    updateTotal(emit: emit);
    updateKeterangan(emit: emit);
  }

  Future<void> _onGetPemeriksaanFisikEvent(
    OnGetPemeriksasanFisikKebidanan event,
    Emitter<KebidananState> emit,
  ) async {
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.isLoadingGetPemeriksaanFisik));

    // final getData =
  }

  Future<void> _onSavePengkajianFungsional(
    OnSavePengkajianFungsionalEvent event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.isLoadingSavePengkajianFungsional,
        saveResultPengkajianFungsionalResult: none()));

    final saveData = await kebidananService.onSavePengkajianFungsional(
        deviceID: event.devicesID,
        noReg: event.noReg,
        f1: event.f1,
        f2: event.f2,
        f3: event.f3,
        f4: event.f4,
        f5: event.f5,
        f6: event.f6,
        f7: event.f7,
        f8: event.f8,
        f9: event.f9,
        f10: event.f10,
        nilai: event.nilai);

    emit(state.copyWith(
        kebidananStatus: KebidananStatus.isLoadedSavePengkajianFungsional,
        saveResultPengkajianFungsionalResult: optionOf(saveData)));
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.isLoadedSavePengkajianFungsional,
        saveResultPengkajianFungsionalResult: none()));
  }

  Future<void> _onChangeFungsionalF2(
    OnChangedFungsionalF2 event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    updateTotal(emit: emit);
    updateKeterangan(emit: emit);
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loadedPengkajianFungsional,
        pengkajianFungsional: state.pengkajianFungsional.copyWith(
            f2: event.value,
            nilaiF2: (event.value == mandiri)
                ? 10
                : (event.value == denganBantuan)
                    ? 5
                    : 0)));
  }

  Future<void> _onChangeFungsionalF3(
    OnChangedFungsionalF3 event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST

    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loadedPengkajianFungsional,
        pengkajianFungsional: state.pengkajianFungsional.copyWith(
            f3: event.value,
            nilaiF3: (event.value == mandiri)
                ? 15
                : (event.value == denganBantuan)
                    ? 10
                    : 0)));
    updateTotal(emit: emit);
    updateKeterangan(emit: emit);
  }

  Future<void> _onChangeFungsionalF4(
    OnChangedFungsionalF4 event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST

    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loadedPengkajianFungsional,
        pengkajianFungsional: state.pengkajianFungsional.copyWith(
            f4: event.value,
            nilaiF4: (event.value == mandiri)
                ? 5
                : (event.value == denganBantuan)
                    ? 0
                    : 0)));
    updateTotal(emit: emit);
    updateKeterangan(emit: emit);
  }

  Future<void> _onChangeFungsionalF5(
    OnChangedFungsionalF5 event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST

    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loadedPengkajianFungsional,
        pengkajianFungsional: state.pengkajianFungsional.copyWith(
            f5: event.value,
            nilaiF5: (event.value == mandiri)
                ? 5
                : (event.value == denganBantuan)
                    ? 0
                    : 0)));
    updateTotal(emit: emit);
    updateKeterangan(emit: emit);
  }

  Future<void> _onChangeFungsionalF6(
    OnChangedFungsionalF6 event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST

    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loadedPengkajianFungsional,
        pengkajianFungsional: state.pengkajianFungsional.copyWith(
            f6: event.value,
            nilaiF6: (event.value == mandiri)
                ? 15
                : (event.value == denganBantuan)
                    ? 10
                    : 0)));
    updateTotal(emit: emit);
    updateKeterangan(emit: emit);
  }

  Future<void> _onChangeFungsionalF7(
    OnChangedFungsionalF7 event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST

    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loadedPengkajianFungsional,
        pengkajianFungsional: state.pengkajianFungsional.copyWith(
            f7: event.value,
            nilaiF7: (event.value == mandiri)
                ? 10
                : (event.value == denganBantuan)
                    ? 5
                    : 0)));
    updateTotal(emit: emit);
    updateKeterangan(emit: emit);
  }

  Future<void> _onChangeFungsionalF8(
    OnChangedFungsionalF8 event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST

    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loadedPengkajianFungsional,
        pengkajianFungsional: state.pengkajianFungsional.copyWith(
            f8: event.value,
            nilaiF8: (event.value == mandiri)
                ? 10
                : (event.value == denganBantuan)
                    ? 5
                    : 0)));
    updateTotal(emit: emit);
    updateKeterangan(emit: emit);
  }

  Future<void> _onChangeFungsionalF9(
    OnChangedFungsionalF9 event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST

    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loadedPengkajianFungsional,
        pengkajianFungsional: state.pengkajianFungsional.copyWith(
            f9: event.value,
            nilaiF9: (event.value == mandiri)
                ? 10
                : (event.value == denganBantuan)
                    ? 5
                    : 0)));
    updateTotal(emit: emit);
    updateKeterangan(emit: emit);
  }

  Future<void> _onChangeFungsionalF10(
    OnChangedFungsionalF10 event,
    Emitter<KebidananState> emit,
  ) async {
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loadedPengkajianFungsional,
        pengkajianFungsional: state.pengkajianFungsional.copyWith(
            f10: event.value,
            nilaiF10: (event.value == mandiri)
                ? 10
                : (event.value == denganBantuan)
                    ? 5
                    : 0)));
    updateTotal(emit: emit);
    updateKeterangan(emit: emit);
  }

  Future<void> _onGetPengkajianFungsional(
    OnGetPengkajianFungsionalKebidanan event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.isLoadingPengkajianFungsional,
        saveResult: none()));

    try {
      final saveData =
          await kebidananService.onGetPengkajianFungsional(noReg: event.noReg);

      PengkajianFungsional newData =
          PengkajianFungsional.fromJson(saveData["response"]);

      emit(state.copyWith(
          kebidananStatus: KebidananStatus.loadedPengkajianFungsional,
          pengkajianFungsional: newData));

      emit(state.copyWith(
        kebidananStatus: KebidananStatus.loadedPengkajianFungsional,
      ));

      updateKeterangan(emit: emit);
    } catch (e) {
      emit(state.copyWith(
          kebidananStatus: KebidananStatus.error, saveResult: none()));
    }
  }

  Future<void> _onGetVitalSignKebidanan(
    OnGetVitalSignKebidanan event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.isLoadingGetVitalSignBidan,
        saveResult: none()));

    try {
      final getData = await kebidananService.getTandaVitalKebidanan(
          noReg: event.noReg, person: event.person);

      VitalSignBidanModel newData =
          VitalSignBidanModel.fromJson(getData["response"]);

      emit(state.copyWith(
          vitalSignBidanModel: newData,
          kebidananStatus: KebidananStatus.loaded,
          saveResult: none()));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(
          vitalSignBidanModel: VitalSignBidanModel(
              pupil: "",
              kesadaran: "",
              akral: "",
              tfu: "",
              ddj: "",
              tekananDarah: "",
              nadi: "",
              pernapasan: "",
              suhu: "",
              tinggiBadan: "",
              beratBadan: "",
              gcsE: "",
              gcsV: "",
              gcsM: ""),
          kebidananStatus: KebidananStatus.error,
          saveResult: none()));
    }
  }

  Future<void> _onGetRiwayatPengobatanDirumah(
    OnGetRiwayatPengobatanDirumah event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loading, riwayaPengobatan: []));

    // GET DATA
    try {
      final data = await kebidananService.getRiwayatPengobatanDirumah(
          noReg: event.noReg);

      List<RiwayatPengobatanDirumahModel> value = (data["response"] as Iterable)
          .map((e) => RiwayatPengobatanDirumahModel.fromJson(e))
          .toList();

      log("RIWAYAT KEBIDANAN $value");

      emit(state.copyWith(
          kebidananStatus: KebidananStatus.isLoadedKebidanan,
          riwayaPengobatan: value));
    } catch (e) {
      emit(state.copyWith(
          kebidananStatus: KebidananStatus.error, riwayaPengobatan: []));
    }
  }

  Future<void> _onDeletePengobatanDirumah(
    OnDeleteRiwayatPengobatanDirumahKebidanan event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(kebidananStatus: KebidananStatus.loading));

    // GET DATA
    try {
      final data = await kebidananService.onDeletePengobatanDirumah(
        noReg: event.noReg,
        noRiwayat: event.noRiwayat,
      );

      List<RiwayatPengobatanDirumahModel> value = (data["response"] as Iterable)
          .map((e) => RiwayatPengobatanDirumahModel.fromJson(e))
          .toList();

      log("RIWAYAT KEBIDANAN");
      log(value.toString());

      emit(state.copyWith(
          kebidananStatus: KebidananStatus.isLoadedKebidanan,
          riwayaPengobatan: value));
    } catch (e) {
      emit(state.copyWith(
        kebidananStatus: KebidananStatus.error,
      ));
    }
  }

  Future<void> _onDeleteRiwayatKehamilan(
    OnDeleteRiwayatKehamilanEvent event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(kebidananStatus: KebidananStatus.loading));

    // GET DATA

    emit(state.copyWith(
        kebidananStatus: KebidananStatus.isLoadingGetRiwayatKebidanan,
        riwayaPengobatan: state.riwayaPengobatan));

    try {
      final data = await kebidananService.onDeleteRiwayatKehamilan(
          noReg: event.noReg, no: event.no);

      log("RIWAYAT KEBIDANAN $data");

      List<KehamilanKebidanModel> value = (data["response"] as Iterable)
          .map((e) => KehamilanKebidanModel.fromJson(e))
          .toList();

      log("RIWAYAT KEBIDANAN $value");

      emit(state.copyWith(
          getResult: none(),
          kebidananStatus: KebidananStatus.isLoadedKebidanan,
          kebidanModel: value,
          riwayaPengobatan: state.riwayaPengobatan));
    } catch (e) {
      emit(state.copyWith(
        kebidanModel: [],
        kebidananStatus: KebidananStatus.error,
      ));
    }
  }

  Future<void> _onSaveTandaVitalSignKebidanan(
    OnSaveTandaTandaVitalSignKebidanan event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.isLoadingSaveVitalSignBidan,
        riwayaPengobatan: []));

    // GET DATA
    try {
      final data = await kebidananService.onSaveTandaVitalKebidanan(
          akral: event.akral,
          kesadaran: event.kesadaran,
          pupil: event.pupil,
          beratBadan: event.beratBadan,
          tfu: event.tfu,
          deviceID: event.deviceID,
          gcsE: event.gcsE,
          ddj: event.ddj,
          gcsM: event.gcsM,
          gcsV: event.gcsV,
          nadi: event.nadi,
          pelayanan: event.pelayanan,
          pernapasan: event.pernapasan,
          person: event.person,
          suhu: event.suhu,
          tekananDarah: event.tekananDarah,
          tinggiBadan: event.tinggiBadan,
          noReg: event.noReg);

      emit(state.copyWith(
        kebidananStatus: KebidananStatus.isLoadedVitalSignBidan,
        saveResult: none(),
        saveVitalSignResult: optionOf(data),
      ));
      emit(state.copyWith(
          kebidananStatus: KebidananStatus.isLoadedVitalSignBidan,
          saveVitalSignResult: none(),
          saveResult: none(),
          riwayaPengobatan: state.riwayaPengobatan));
    } catch (e) {
      emit(state.copyWith(
          saveVitalSignResult: none(),
          kebidananStatus: KebidananStatus.error,
          saveResult: none(),
          riwayaPengobatan: state.riwayaPengobatan));
    }
  }

  Future<void> _onChangedTekananDarah(
    OnChangedTekananDarah event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded, riwayaPengobatan: []));

    // GET DATA
    emit(state.copyWith(
        vitalSignBidanModel:
            state.vitalSignBidanModel.copyWith(tekananDarah: event.value)));
  }

  Future<void> _onChangedKebidananPupil(
    OnChangeTandaKebidananPupil event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded, riwayaPengobatan: []));

    // GET DATA
    emit(state.copyWith(
        vitalSignBidanModel:
            state.vitalSignBidanModel.copyWith(pupil: event.value)));
  }

  Future<void> _onChangedKesadaran(
    OnChangedTandaKebidananKesadaran event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded, riwayaPengobatan: []));

    // GET DATA
    emit(state.copyWith(
        vitalSignBidanModel:
            state.vitalSignBidanModel.copyWith(kesadaran: event.value)));
  }

  Future<void> _onChangedAkral(
    OnChangedTandaKebidananAkral event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded, riwayaPengobatan: []));

    // GET DATA
    emit(state.copyWith(
        vitalSignBidanModel:
            state.vitalSignBidanModel.copyWith(akral: event.value)));
  }

  Future<void> _onSelectionKepala(
    OnSelectionKepala event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded,
        riwayaPengobatan: state.riwayaPengobatan,
        pemeriksaanFisikLainnya: state.pemeriksaanFisikLainnya.copyWith(
            kepala: (event.value != "Lainnya")
                ? ""
                : state.pemeriksaanFisikLainnya.kepala),
        pemeriksaanFisik:
            state.pemeriksaanFisik.copyWith(kepala: event.value)));
  }

  Future<void> _onSelectionMata(
    OnSelectionMata event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        pemeriksaanFisikLainnya: state.pemeriksaanFisikLainnya.copyWith(
            mata: (event.value != "Lainnya")
                ? ""
                : state.pemeriksaanFisikLainnya.mata),
        kebidananStatus: KebidananStatus.loaded,
        riwayaPengobatan: state.riwayaPengobatan,
        pemeriksaanFisik: state.pemeriksaanFisik.copyWith(mata: event.value)));
  }

  Future<void> _onSelectionTelinga(
    OnSelectionTelinga event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded,
        riwayaPengobatan: state.riwayaPengobatan,
        pemeriksaanFisikLainnya: state.pemeriksaanFisikLainnya.copyWith(
            mata: (event.value != "Lainnya")
                ? ""
                : state.pemeriksaanFisikLainnya.mata),
        pemeriksaanFisik:
            state.pemeriksaanFisik.copyWith(telinga: event.value)));
  }

  Future<void> _onSelectionMulut(
    OnSelecteionMulut event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        pemeriksaanFisikLainnya: state.pemeriksaanFisikLainnya.copyWith(
            mulut: (event.value != "Lainnya")
                ? ""
                : state.pemeriksaanFisikLainnya.mulut),
        kebidananStatus: KebidananStatus.loaded,
        riwayaPengobatan: state.riwayaPengobatan,
        pemeriksaanFisik: state.pemeriksaanFisik.copyWith(mulut: event.value)));
  }

  Future<void> _onSelectionHidung(
    OnSelectionHidung event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        pemeriksaanFisikLainnya: state.pemeriksaanFisikLainnya.copyWith(
            hidung: (event.value != "Lainnya")
                ? ""
                : state.pemeriksaanFisikLainnya.hidung),
        kebidananStatus: KebidananStatus.loaded,
        riwayaPengobatan: state.riwayaPengobatan,
        pemeriksaanFisik:
            state.pemeriksaanFisik.copyWith(hidung: event.value)));
  }

  Future<void> _onSelectionTenggorokan(
    OnSelectionTenggorakan event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded,
        pemeriksaanFisikLainnya: state.pemeriksaanFisikLainnya.copyWith(
            tenggorokan: (event.value != "Lainnya")
                ? ""
                : state.pemeriksaanFisikLainnya.tenggorokan),
        riwayaPengobatan: state.riwayaPengobatan,
        pemeriksaanFisik:
            state.pemeriksaanFisik.copyWith(tenggorokan: event.value)));
  }

  Future<void> _onSelectionPayudara(
    OnSelectionPayudara event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded,
        pemeriksaanFisikLainnya: state.pemeriksaanFisikLainnya.copyWith(
            payudara: (event.value != "Lainnya")
                ? ""
                : state.pemeriksaanFisikLainnya.payudara),
        riwayaPengobatan: state.riwayaPengobatan,
        pemeriksaanFisik:
            state.pemeriksaanFisik.copyWith(payudara: event.value)));
  }

  Future<void> _onSelectionLeherDanBahu(
    OnSelectionLeherDanBahu event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded,
        riwayaPengobatan: state.riwayaPengobatan,
        pemeriksaanFisikLainnya: state.pemeriksaanFisikLainnya.copyWith(
            abdomen: (event.value != "Lainnya")
                ? ""
                : state.pemeriksaanFisikLainnya.abdomen),
        pemeriksaanFisik:
            state.pemeriksaanFisik.copyWith(leherDanBahu: event.value)));
  }

  Future<void> _onSelectionAbdomen(
    OnSelectionAbdomen event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded,
        riwayaPengobatan: state.riwayaPengobatan,
        pemeriksaanFisikLainnya: state.pemeriksaanFisikLainnya.copyWith(
            abdomen: (event.value != "Lainnya")
                ? ""
                : state.pemeriksaanFisikLainnya.abdomen),
        pemeriksaanFisik:
            state.pemeriksaanFisik.copyWith(abdomen: event.value)));
  }

  Future<void> _onSelectionNutrisiDanHidrasi(
    OnSelectionNutrisiDanHidrasi event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded,
        pemeriksaanFisikLainnya: state.pemeriksaanFisikLainnya.copyWith(
            nutrisiDanHidrasi: (event.value != "Lainnya")
                ? ""
                : state.pemeriksaanFisikLainnya.nutrisiDanHidrasi),
        riwayaPengobatan: state.riwayaPengobatan,
        pemeriksaanFisik:
            state.pemeriksaanFisik.copyWith(nutrisiDanHidrasi: event.value)));
  }

  Future<void> _onChangedPernapasan(
    OnChangedPernapasan event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded, riwayaPengobatan: []));

    // GET DATA
    emit(state.copyWith(
        vitalSignBidanModel:
            state.vitalSignBidanModel.copyWith(pernapasan: event.value)));
  }

  Future<void> _onChangedSuhu(
    OnChangedSuhu event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded, riwayaPengobatan: []));

    // GET DATA
    emit(state.copyWith(
        vitalSignBidanModel:
            state.vitalSignBidanModel.copyWith(suhu: event.value)));
  }

  Future<void> _onChangedNadi(
    OnChangedNadi event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded, riwayaPengobatan: []));

    // GET DATA
    emit(state.copyWith(
        vitalSignBidanModel:
            state.vitalSignBidanModel.copyWith(nadi: event.value)));
  }

  Future<void> _onChangedDDJ(
    OnChangedDDJ event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded, riwayaPengobatan: []));

    // GET DATA
    emit(state.copyWith(
        vitalSignBidanModel:
            state.vitalSignBidanModel.copyWith(ddj: event.value)));
  }

  Future<void> _onChangedTFU(
    OnChangeTFU event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded, riwayaPengobatan: []));

    // GET DATA
    emit(state.copyWith(
        vitalSignBidanModel:
            state.vitalSignBidanModel.copyWith(tfu: event.value)));
  }

  Future<void> _onChangedBeratBadan(
    OnChangedBeratBadan event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded, riwayaPengobatan: []));

    // GET DATA
    emit(state.copyWith(
        vitalSignBidanModel:
            state.vitalSignBidanModel.copyWith(beratBadan: event.value)));
  }

  Future<void> _onChangeKepalaLainnya(
    OnChangedKepalaLainnya event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded, riwayaPengobatan: []));

    // GET DATA
    emit(state.copyWith(
        pemeriksaanFisikLainnya:
            state.pemeriksaanFisikLainnya.copyWith(kepala: event.value)));
  }

  Future<void> _onChangedTelingaLainya(
    OnChangedTelingaLainnya event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded, riwayaPengobatan: []));

    // GET DATA
    emit(state.copyWith(
        pemeriksaanFisikLainnya:
            state.pemeriksaanFisikLainnya.copyWith(telinga: event.value)));
  }

  Future<void> _onChangedLeherdanBahuLainnya(
    OnChangedLeherDanBahuLainnya event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded, riwayaPengobatan: []));

    // GET DATA
    emit(state.copyWith(
        pemeriksaanFisikLainnya:
            state.pemeriksaanFisikLainnya.copyWith(leherDanBahu: event.value)));
  }

  Future<void> _onChangedMulutLainnya(
    OnchangedMulutLainnya event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded, riwayaPengobatan: []));

    // GET DATA
    emit(state.copyWith(
        pemeriksaanFisikLainnya:
            state.pemeriksaanFisikLainnya.copyWith(mulut: event.value)));
  }

  Future<void> _onChangedMucosaLainnya(
    OnChangedMucosaMulutLainnya event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded, riwayaPengobatan: []));

    // GET DATA
    emit(state.copyWith(
        pemeriksaanFisikLainnya:
            state.pemeriksaanFisikLainnya.copyWith(mucosaMulut: event.value)));
  }

  Future<void> _onChangedGigiLainnya(
    OnChangedGigiLainnya event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded, riwayaPengobatan: []));

    // GET DATA
    emit(state.copyWith(
        pemeriksaanFisikLainnya:
            state.pemeriksaanFisikLainnya.copyWith(gigi: event.value)));
  }

  Future<void> _onChangedMataLainnya(
    OnChangedMataLainnya event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded, riwayaPengobatan: []));

    // GET DATA
    emit(state.copyWith(
        pemeriksaanFisikLainnya:
            state.pemeriksaanFisikLainnya.copyWith(mata: event.value)));
  }

  Future<void> _onSelectionMucosMulut(
    OnSelectionMucosaMulut event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded,
        riwayaPengobatan: state.riwayaPengobatan));

    // GET DATA
    emit(state.copyWith(
        pemeriksaanFisik:
            state.pemeriksaanFisik.copyWith(mucosaMulut: event.value)));
  }

  Future<void> _onSelectionGigi(
    OnSelectionGigi event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded,
        riwayaPengobatan: state.riwayaPengobatan));

    // GET DATA
    emit(state.copyWith(
        pemeriksaanFisik: state.pemeriksaanFisik.copyWith(gigi: event.value)));
  }

  Future<void> _onChangedTinggiBadan(
    OnChangedTinggiBadan event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded, riwayaPengobatan: []));

    // GET DATA
    emit(state.copyWith(
        vitalSignBidanModel:
            state.vitalSignBidanModel.copyWith(tinggiBadan: event.value)));
  }

  Future<void> _onGetRiwayatKebidanan(
    OnGetRiwayatKebidanan event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
      kebidananStatus: KebidananStatus.isLoadingGetRiwayatKebidanan,
      riwayaPengobatan: state.riwayaPengobatan,
    ));

    // GET DATA RIWAYAT KEBIDANAN
    try {
      final data = await kebidananService.onGetRiwayatKehamilanKebidanan(
          noReg: event.noReg);

      // KehamilanKebidanModel

      List<KehamilanKebidanModel> value = (data["response"] as Iterable)
          .map((e) => KehamilanKebidanModel.fromJson(e))
          .toList();

      emit(state.copyWith(
          kebidananStatus: KebidananStatus.isLoadedGetRiwayatKebidanan,
          riwayaPengobatan: state.riwayaPengobatan,
          kebidanModel: value));
    } catch (e) {
      emit(state.copyWith(
          kebidananStatus: KebidananStatus.error,
          riwayaPengobatan: state.riwayaPengobatan));
    }
  }

  Future<void> _onSaveRiwayatKehamilan(
    OnSaveRiwayatKehamilanBidan event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
      kebidananStatus: KebidananStatus.isLoadingRiwayatKebidanan,
      saveRiwayatKebidananResult: none(),
    ));

    try {
      final data = await kebidananService.onSaveRiwayatKehamilan(
          deviceID: event.deviceID,
          tahun: event.tahun,
          tempat: event.tempat,
          noReg: event.noReg,
          umur: event.umur,
          jenisPersalinan: event.jenisPersalinan,
          penolong: event.penolong,
          penyulit: event.penyulit,
          nifas: event.nifas,
          jKelamin: event.jenisKelamin,
          beratBadan: event.beratBadan,
          keadaanSekarang: event.keadaanSekarang);

      final datas = await kebidananService.onGetRiwayatKehamilanKebidanan(
          noReg: event.noReg);

      // KehamilanKebidanModel

      List<KehamilanKebidanModel> value = (datas["response"] as Iterable)
          .map((e) => KehamilanKebidanModel.fromJson(e))
          .toList();

      emit(state.copyWith(
        kebidanModel: value,
        kebidananStatus: KebidananStatus.isLoadedRiwayatKebidanan,
        saveRiwayatKebidananResult: optionOf(data),
      ));

      emit(state.copyWith(
        kebidanModel: value,
        kebidananStatus: KebidananStatus.isLoadedRiwayatKebidanan,
        saveRiwayatKebidananResult: none(),
      ));
    } catch (e) {
      emit(state.copyWith(
          kebidananStatus: KebidananStatus.isLoadedGetRiwayatKebidanan,
          riwayaPengobatan: state.riwayaPengobatan,
          kebidanModel: []));
    }
  }

  Future<void> _onChangedGCSE(
    OnChangedGcsE event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded, riwayaPengobatan: []));

    // GET DATA
    emit(state.copyWith(
        vitalSignBidanModel:
            state.vitalSignBidanModel.copyWith(gcsE: event.value)));
  }

  Future<void> _onChangedGCSM(
    OnChangedGcsM event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded, riwayaPengobatan: []));

    // GET DATA
    emit(state.copyWith(
        vitalSignBidanModel:
            state.vitalSignBidanModel.copyWith(gcsM: event.value)));
  }

  Future<void> _onChangedGCSV(
    OnChangedGcsV event,
    Emitter<KebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        kebidananStatus: KebidananStatus.loaded, riwayaPengobatan: []));

    // GET DATA
    emit(state.copyWith(
        vitalSignBidanModel:
            state.vitalSignBidanModel.copyWith(gcsV: event.value)));
  }
}
