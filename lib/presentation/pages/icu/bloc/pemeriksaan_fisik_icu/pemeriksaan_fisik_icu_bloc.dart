import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/pages/icu/repository/pemeriksaan_fisik_icu_repository.dart';
import 'package:hms_app/presentation/pages/icu/repository/pengkajian_persistem_icu_repository.dart';
import 'package:hms_app/presentation/pages/icu/services/icu_services.dart';

part 'pemeriksaan_fisik_icu_event.dart';
part 'pemeriksaan_fisik_icu_state.dart';

class PemeriksaanFisikIcuBloc
    extends Bloc<PemeriksaanFisikIcuEvent, PemeriksaanFisikIcuState> {
  PemeriksaanFisikIcuBloc() : super(PemeriksaanFisikIcuState.initial()) {
    on<PemeriksaanFisikIcuEvent>((event, emit) {});
    on<OnGetPemeriksaanFisikICU>(_onGetPemeriksaanFisik);
    on<OnSavePemeriksaanFisikICU>(_onSavePemeriksaanFisikICU);
    on<OnGetPengkajianPersistemICU>(_onGetPengkajianPersistemICU);
    on<OnSavePengkajianPersistemICU>(_onSavePengkajianPersistem);
  }

  Future<void> _onGetPemeriksaanFisik(
    OnGetPemeriksaanFisikICU event,
    Emitter<PemeriksaanFisikIcuState> emit,
  ) async {
    emit(state.copyWith(status: PemeriksaanFisikIcuStatus.isLoadingGet));

    // GET DATA PEMERIKSAAN FISIK ICU
    try {
      final data = await icuServices.getPemeriksaanFisikICU(
          noReg: event.noReg, person: event.person);

      PemeriksaanFisikIcuModel datas =
          PemeriksaanFisikIcuModel.fromJson(data["response"]);

      emit(state.copyWith(
          status: PemeriksaanFisikIcuStatus.loaded, fisikModel: datas));
    } catch (e) {
      emit(state.copyWith(
          status: PemeriksaanFisikIcuStatus.loaded,
          fisikModel: PemeriksaanFisikIcuModel(
            dada: "",
            ekstremitas: "",
            gcsE: "",
            gcsM: "",
            gcsV: "",
            gigi: "",
            hidung: "",
            integumen: "",
            jantung: "",
            kepala: "",
            leher: "",
            lidah: "",
            mata: "",
            mulut: "",
            rambut: "",
            respirasi: "",
            telinga: "",
            tenggorokan: "",
            wajah: "",
            kesadaran: "",
          )));
    }
  }

  Future<void> _onGetPengkajianPersistemICU(
    OnGetPengkajianPersistemICU event,
    Emitter<PemeriksaanFisikIcuState> emit,
  ) async {
    emit(state.copyWith(status: PemeriksaanFisikIcuStatus.isLoadingGet));

    // GET DATA PEMERIKSAAN FISIK ICU
    try {
      final data = await icuServices.onGetPengkajianPersistemICU(
          noReg: event.noReg,
          person: event.person,
          norM: event.noRM,
          tanggal: event.tanggal);

      PengkajianPersistemIcuModel datas =
          PengkajianPersistemIcuModel.fromJson(data["response"]);

      emit(state.copyWith(
          status: PemeriksaanFisikIcuStatus.loaded,
          pengkajianPersistemICU: datas));

      //===//
    } catch (e) {
      emit(state.copyWith(
          status: PemeriksaanFisikIcuStatus.loaded,
          pengkajianPersistemICU: PengkajianPersistemIcuModel(
            berpakaian: "",
            mandi: "",
            sistemEliminasi: "",
            sistemMakan: "",
            sistemMasalahDenganNutrisi: "",
            sistemMobilisasi: "",
            airway: "",
            breathing: "",
            circulation: "",
            nutrisi: "",
            makan: "",
            padaBayi: "",
            minum: "",
            eliminasiBak: "",
            eliminasiBab: "",
            aktivitasIstirahat: "",
            aktivitas: "",
            berjalan: "",
            penggunaanAlatBantu: "",
            perfusiSerebral: "",
            pupil: "",
            refleksCahaya: "",
            perfusiRenal: "",
            pefusiGastroinestinal: "",
            abdomen: "",
            thermoregulasi: "",
            kenyamanan: "",
            kualitas: "",
            pola: "",
            nyeriMempengaruhi: "",
            statusMental: "",
            kejang: "",
            pasangPengamanTempatTidur: "",
            belMudaDijangkau: "",
            penglihatan: "",
            pendengaran: "",
            hamil: "",
            pemeriksaanCervixTerakhir: "",
            pemeriksaanPayudaraSendiri: "",
            mamografiTerakhirTanggal: "",
            penggunaanAlatKontrasepsi: "",
            bicara: "",
            bahasaSehariHari: "",
            perluPenerjemah: "",
            bahasaIsyarat: "",
            hambatanBelajar: "",
            caraBelajarDisukai: "",
            tingkatPendidikan: "",
            potensialKebutuhanPembelajaran: "",
            responseEmosi: "",
            sistemSosial: "",
            tingkatBersama: "",
            kondisiLingkunganDirumah: "",
            nilaiKepercayaan: "",
            menjalankanIbadah: "",
            presepsiTerhadapSakit: "",
            kunjunganPemimpin: "",
            nilaiAturanKhusus: "",
          )));
    }
  }

  Future<void> _onSavePemeriksaanFisikICU(
    OnSavePemeriksaanFisikICU event,
    Emitter<PemeriksaanFisikIcuState> emit,
  ) async {
    emit(state.copyWith(
        status: PemeriksaanFisikIcuStatus.isLoadingSave, saveResult: none()));

    // GET DATA PEMERIKSAAN FISIK ICU
    try {
      final data = await icuServices.onSavePemeriksaanFisikICU(
          deviceID: event.devicesID,
          noreg: event.noReg,
          pelayanan: event.pelayanan,
          pemeriksaanFisikICU: event.pemeriksaanFisikModel,
          person: event.person);

      // final data1 = await icuServices.getPemeriksaanFisikICU(
      //     noReg: event.noReg, person: event.person);

      // PemeriksaanFisikIcuModel datas =
      //     PemeriksaanFisikIcuModel.fromJson(data1["response"]);

      emit(state.copyWith(
          status: PemeriksaanFisikIcuStatus.loaded,
          saveResult: optionOf(data)));

      emit(state.copyWith(
        status: PemeriksaanFisikIcuStatus.loaded,
        saveResult: none(),
      ));
    } catch (e) {
      emit(state.copyWith(
          status: PemeriksaanFisikIcuStatus.loaded, saveResult: none()));
    }
  }

  Future<void> _onSavePengkajianPersistem(
    OnSavePengkajianPersistemICU event,
    Emitter<PemeriksaanFisikIcuState> emit,
  ) async {
    emit(state.copyWith(
        status: PemeriksaanFisikIcuStatus.isLoadingSave, saveResult: none()));

    try {
      final data = await icuServices.onSavePengkajianPersistemICU(
          kodeDokter: event.kodeDokter,
          noReg: event.noReg,
          person: event.person,
          deviceID: event.deviceID,
          pelayanan: event.pelayanan,
          pengkajianPersistemIcuModel: event.pengkajianPersistemIcuModel);

      emit(state.copyWith(
          status: PemeriksaanFisikIcuStatus.loaded,
          saveResult: optionOf(data)));

      emit(state.copyWith(
          status: PemeriksaanFisikIcuStatus.loaded, saveResult: none()));
    } catch (e) {
      emit(state.copyWith(
          status: PemeriksaanFisikIcuStatus.loaded, saveResult: none()));
    }
  }
}
