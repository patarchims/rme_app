import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/perina/repository/dvital_sign_perina_respone_model.dart';
import 'package:hms_app/presentation/perina/repository/pemeriksaan_fisik_perina_reponse_model.dart';
import 'package:hms_app/presentation/perina/services/perina_services.dart';

part 'pemeriksaan_fisik_perina_event.dart';
part 'pemeriksaan_fisik_perina_state.dart';

class PemeriksaanFisikPerinaBloc
    extends Bloc<PemeriksaanFisikPerinaEvent, PemeriksaanFisikPerinaState> {
  PemeriksaanFisikPerinaBloc() : super(PemeriksaanFisikPerinaState.initial()) {
    on<PemeriksaanFisikPerinaEvent>((event, emit) {});
    on<OnGetPemeriksaanFisikPerina>(_onGetPemeriksaanFisikPerina);
    on<OnSavePemeriksaanFisikPerina>(_onSavePemeriksaanFisikPerina);
    on<OnGetDVitalSingPerina>(_onGetDVitalSignPerina);
    on<OnSaveDVitalSignFisikPerina>(_onSaveDVitalSign);
  }

  Future<void> _onGetPemeriksaanFisikPerina(
    OnGetPemeriksaanFisikPerina event,
    Emitter<PemeriksaanFisikPerinaState> emit,
  ) async {
    emit(state.copyWith(
        status: PemeriksaanFisikPerinaStatus.isLoadingGet, saveResult: none()));

    try {
      final getData = await perinaServices.onGetPemeriksaanFisikPerina(
          noreg: event.noReg, person: event.person);

      FisikPerinaModel data = FisikPerinaModel.fromJson(getData["response"]);

      emit(state.copyWith(
          status: PemeriksaanFisikPerinaStatus.loaded,
          fisikPerinaModel: data,
          saveResult: none()));
    } catch (e) {
      emit(state.copyWith(
          status: PemeriksaanFisikPerinaStatus.loaded, saveResult: none()));
    }
  }

  Future<void> _onGetDVitalSignPerina(
    OnGetDVitalSingPerina event,
    Emitter<PemeriksaanFisikPerinaState> emit,
  ) async {
    emit(state.copyWith(
        status: PemeriksaanFisikPerinaStatus.isLoadingGet, saveResult: none()));

    try {
      final getData = await perinaServices.onGetDVitalSignPerina(
          pelayanan: event.pelayanan, noreg: event.noReg, person: event.person);

      VItalSignPerina data = VItalSignPerina.fromJson(getData["response"]);

      emit(state.copyWith(
          status: PemeriksaanFisikPerinaStatus.loaded,
          vitalSignPerina: data,
          saveResult: none()));
    } catch (e) {
      emit(state.copyWith(
          status: PemeriksaanFisikPerinaStatus.loaded, saveResult: none()));
    }
  }

  Future<void> _onSavePemeriksaanFisikPerina(
    OnSavePemeriksaanFisikPerina event,
    Emitter<PemeriksaanFisikPerinaState> emit,
  ) async {
    emit(state.copyWith(status: PemeriksaanFisikPerinaStatus.isLoadingSave));
    try {
      final save = await perinaServices.onSavePemeriksaanFisikPerina(
          fisik: event.fisik,
          deviceID: event.devicesID,
          pelayanan: event.pelayanan,
          noReg: event.noReg,
          person: event.person);

      emit(state.copyWith(
          status: PemeriksaanFisikPerinaStatus.loaded,
          saveResult: optionOf(save)));

      // SIMPAN DATA
      emit(state.copyWith(
          status: PemeriksaanFisikPerinaStatus.loaded, saveResult: none()));

      final getData = await perinaServices.onGetPemeriksaanFisikPerina(
          noreg: event.noReg, person: event.person);

      FisikPerinaModel data = FisikPerinaModel.fromJson(getData["response"]);

      emit(state.copyWith(
          status: PemeriksaanFisikPerinaStatus.loaded,
          fisikPerinaModel: data,
          saveResult: none()));
    } catch (e) {
      emit(state.copyWith(status: PemeriksaanFisikPerinaStatus.loaded));
    }
  }

  Future<void> _onSaveDVitalSign(
    OnSaveDVitalSignFisikPerina event,
    Emitter<PemeriksaanFisikPerinaState> emit,
  ) async {
    emit(state.copyWith(status: PemeriksaanFisikPerinaStatus.isLoadingSave));
    try {
      final save = await perinaServices.onSaveDVitalSignPerina(
          kategori: event.kategori,
          vitalSign: event.vitalSign,
          deviceID: event.devicesID,
          pelayanan: event.pelayanan,
          noReg: event.noReg,
          person: event.person);

      emit(state.copyWith(
          status: PemeriksaanFisikPerinaStatus.loaded,
          saveResultVitalSign: optionOf(save),
          saveResult: optionOf(save)));

      // SIMPAN DATA
      emit(state.copyWith(
          status: PemeriksaanFisikPerinaStatus.loaded,
          saveResult: none(),
          saveResultVitalSign: none()));

      final getData = await perinaServices.onGetDVitalSignPerina(
          pelayanan: event.pelayanan, noreg: event.noReg, person: event.person);

      VItalSignPerina data = VItalSignPerina.fromJson(getData["response"]);

      emit(state.copyWith(
          status: PemeriksaanFisikPerinaStatus.loaded,
          vitalSignPerina: data,
          saveResultVitalSign: none(),
          saveResult: none()));
    } catch (e) {
      emit(state.copyWith(status: PemeriksaanFisikPerinaStatus.loaded));
    }
  }
}
