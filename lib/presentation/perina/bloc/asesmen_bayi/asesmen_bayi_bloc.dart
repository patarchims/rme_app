import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/perina/repository/asesmen_awal_bayi_perina_model.dart';
import 'package:hms_app/presentation/perina/repository/asesmen_perina_response_model.dart';
import 'package:hms_app/presentation/perina/repository/tindak_lajut_perin_dokter_response_model.dart';
import 'package:hms_app/presentation/perina/services/perina_services.dart';

part 'asesmen_bayi_event.dart';
part 'asesmen_bayi_state.dart';

class AsesmenBayiBloc extends Bloc<AsesmenBayiEvent, AsesmenBayiState> {
  AsesmenBayiBloc() : super(AsesmenBayiState.initial()) {
    on<AsesmenBayiEvent>((event, emit) {});
    on<OnGetAsesmenKeperawatanBayi>(_onGetAsesmenKeperawatanBayiEvent);
    on<OnGetTindakLanjutEvent>(_onGetTindakLanjutDokter);
    on<OnSaveTindakLanjutEvent>(_onSaveTindakLanjutPerinaDokter);
    on<OnSaveAsesmenKeperawatanBayiEvent>(_onSaveAsesmenKeperawatanBayi);
    on<OnSaveDataAsesmenKeperawatanBayiEvent>(_onSaveAsesemenBayi);
    on<OnGetReportAsesmenAwalKeperawatanBayi>(
        _onGetReportAsesmenAwalKeperawtanBayi);
    on<OnDeleteRiwayatKelahiranLaluEvent>(
        _onDeleteRiwayatRiwayatKelahiranLaluEvent);
  }

  Future<void> _onGetAsesmenKeperawatanBayiEvent(
    OnGetAsesmenKeperawatanBayi event,
    Emitter<AsesmenBayiState> emit,
  ) async {
    emit(state.copyWith(status: AsesmenBayiStatus.isLoadingAsesmen));

    try {
      final getData = await perinaServices.getAsesmenBayi(
          noRM: event.noRM, noreg: event.noReg, person: event.person);

      log("DATA PERINA");
      log(getData.toString());

      ResponseAsesmenPerinaModel data =
          ResponseAsesmenPerinaModel.fromMap(getData["response"]);

      log("DATA ASESMENT");
      log(data.toString());

      emit(state.copyWith(
          status: AsesmenBayiStatus.isLoadedAsesmen, asesmen: data));
    } catch (e) {
      emit(state.copyWith(
        status: AsesmenBayiStatus.isLoadedAsesmen,
      ));
    }
  }

  Future<void> _onGetTindakLanjutDokter(
    OnGetTindakLanjutEvent event,
    Emitter<AsesmenBayiState> emit,
  ) async {
    emit(state.copyWith(status: AsesmenBayiStatus.loading));

    try {
      final getData = await perinaServices.getTindakLanjut(
          noRM: event.noRM, noreg: event.noReg);

      TindakLajutModel data = TindakLajutModel.fromJson(getData["response"]);

      emit(state.copyWith(status: AsesmenBayiStatus.loaded, tindakLajut: data));
    } catch (e) {
      emit(state.copyWith(
        status: AsesmenBayiStatus.loaded,
      ));
    }
  }

  Future<void> _onDeleteRiwayatRiwayatKelahiranLaluEvent(
    OnDeleteRiwayatKelahiranLaluEvent event,
    Emitter<AsesmenBayiState> emit,
  ) async {
    emit(state.copyWith(status: AsesmenBayiStatus.isLoadingAsesmen));

    try {
      final getData = await perinaServices.onDeleteRiwayatKelahiranYangLalu(
          noRM: event.noRM, noReg: event.noReg, nomor: event.nomor);

      ResponseAsesmenPerinaModel data =
          ResponseAsesmenPerinaModel.fromMap(getData["response"]);

      emit(state.copyWith(
          status: AsesmenBayiStatus.isLoadedAsesmen, asesmen: data));
    } catch (e) {
      emit(state.copyWith(
          status: AsesmenBayiStatus.isLoadedAsesmen,
          asesmen: ResponseAsesmenPerinaModel(
              asesmenBayi: AsesmenBayiModel(
                  pendarahanPrenatal: "",
                  obatObatanYangdikomsumsi: "",
                  natalKomplikasi: "",
                  pekerjaanIbu: "",
                  rwtPrenatalPersalinan: "",
                  rwtPersalinan: "",
                  riwayatPenyakitAyah: "",
                  namaAyah: "",
                  dokterObgyn: "",
                  dokterAnak: "",
                  pekerjaanAyah: "",
                  perkawinanAyah: "",
                  usiaKehamilan: "",
                  namaIbu: "",
                  perkawinanIbu: "",
                  penyakitIbu: "",
                  namaPjawab: "",
                  usiaPjawab: "",
                  pekerjaanPjawab: "",
                  usiaPersalinan: "",
                  rwtTglLahir: "",
                  prenatalJam: "",
                  menangis: "",
                  jenisKelamin: "",
                  keterangan: "",
                  prenatalUsiaKehamilan: "",
                  prenatalKomplikasi: "",
                  prenatalHis: "",
                  natalVolume: "",
                  prenatalTtp: "",
                  prenatalJumlahHari: "",
                  prenatalKebiasaanIbu: "",
                  prenatalKetuban: "",
                  prenatalPersalinan: "",
                  rwtUsiaPersalinan: "",
                  rwtLahirDengan: "",
                  rwtJenisKelamin: "",
                  rwtKelahiranBayi: "",
                  rwtMenangis: "",
                  rwtKeterangan: "",
                  prenatalUsiaPersalinan: "",
                  natalPersalinan: "",
                  natalKpd: "",
                  natalKeadaan: "",
                  natalTindakanDiberikan: "",
                  natalPost: "",
                  natalPrestasi: "",
                  natalDitolongOleh: "",
                  natalKetuban: "",
                  natalLetak: "",
                  natalLahirUmur: ""),
              dokter: state.asesmen.dokter,
              riwayatKehamilan: [])));
    }
  }

  Future<void> _onGetReportAsesmenAwalKeperawtanBayi(
    OnGetReportAsesmenAwalKeperawatanBayi event,
    Emitter<AsesmenBayiState> emit,
  ) async {
    emit(state.copyWith(status: AsesmenBayiStatus.loading));

    try {
      // GET DATA
      final data = await perinaServices.getReportAsesmenAwalBayi(
          noreg: event.noReg, noRM: event.noRM);

      log("DATA BAYI");
      log(data.toString());

      AsesmenBayiResponseModel datas =
          AsesmenBayiResponseModel.fromMap(data["response"]);

      emit(state.copyWith(
          status: AsesmenBayiStatus.loaded, asmenBayiResponse: datas));
    } catch (e) {
      emit(state.copyWith(status: AsesmenBayiStatus.loaded));
    }
  }

  //=====//
  Future<void> _onSaveAsesmenKeperawatanBayi(
    OnSaveAsesmenKeperawatanBayiEvent event,
    Emitter<AsesmenBayiState> emit,
  ) async {
    emit(state.copyWith(status: AsesmenBayiStatus.isLoadingSave));

    try {
      final saveData = await perinaServices.onSaveAsesmenKeperawatanBayi(
          noRM: event.noRM,
          person: event.person,
          devicesID: event.devicesID,
          kehamilanPerinal: event.kehamilanPerinal,
          noReg: event.noReg,
          pelayanan: event.pelayanan);

      emit(state.copyWith(
          status: AsesmenBayiStatus.loaded, saveResult: optionOf(saveData)));

      final getData = await perinaServices.getAsesmenBayi(
          noRM: event.noRM, noreg: event.noReg, person: event.person);

      ResponseAsesmenPerinaModel data =
          ResponseAsesmenPerinaModel.fromMap(getData["response"]);

      emit(state.copyWith(
          status: AsesmenBayiStatus.loaded, saveResult: none(), asesmen: data));
    } catch (e) {
      emit(state.copyWith(
        status: AsesmenBayiStatus.loaded,
      ));
    }
  }

  Future<void> _onSaveTindakLanjutPerinaDokter(
    OnSaveTindakLanjutEvent event,
    Emitter<AsesmenBayiState> emit,
  ) async {
    emit(state.copyWith(status: AsesmenBayiStatus.isLoadingSave));

    try {
      final saveData = await perinaServices.onSaveTindakLajutPerina(
          tindakLajut: event.tindakLajut,
          person: event.person,
          devicesID: event.devicesID,
          noReg: event.noReg,
          pelayanan: event.pelayanan);

      emit(state.copyWith(
          status: AsesmenBayiStatus.loaded,
          saveResult: none(),
          saveTindakLajutResult: optionOf(saveData)));

      emit(state.copyWith(
          status: AsesmenBayiStatus.loaded,
          saveResult: none(),
          saveTindakLajutResult: none()));

      final getData = await perinaServices.getTindakLanjut(
          noRM: event.noRM, noreg: event.noReg);

      TindakLajutModel data = TindakLajutModel.fromJson(getData["response"]);

      emit(state.copyWith(status: AsesmenBayiStatus.loaded, tindakLajut: data));
    } catch (e) {
      emit(state.copyWith(
        status: AsesmenBayiStatus.loaded,
      ));
    }
  }

  Future<void> _onSaveAsesemenBayi(
    OnSaveDataAsesmenKeperawatanBayiEvent event,
    Emitter<AsesmenBayiState> emit,
  ) async {
    emit(state.copyWith(status: AsesmenBayiStatus.isLoadingSave));

    try {
      final saveData = await perinaServices.onSaveAsesmenBayi(
          dpjp: event.kdDPJP,
          noRM: event.noRM,
          person: event.person,
          devicesID: event.devicesID,
          asesmen: event.asesmen,
          noReg: event.noReg,
          pelayanan: event.pelayanan);

      emit(state.copyWith(
          status: AsesmenBayiStatus.loaded, saveResult: optionOf(saveData)));

      final getData = await perinaServices.getAsesmenBayi(
          noRM: event.noRM, noreg: event.noReg, person: event.person);

      ResponseAsesmenPerinaModel data =
          ResponseAsesmenPerinaModel.fromMap(getData["response"]);

      emit(state.copyWith(
          status: AsesmenBayiStatus.loaded, saveResult: none(), asesmen: data));
    } catch (e) {
      emit(state.copyWith(
        status: AsesmenBayiStatus.loaded,
      ));
    }
  }
}
