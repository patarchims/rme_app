import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/models/diagnosa/diagnosa_icd_model.dart';
import 'package:hms_app/domain/models/lib_model/bank_data_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/repository/librari/librari_repository.dart';
import 'package:hms_app/domain/services/anamnesa_services.dart';
import 'package:injectable/injectable.dart';
part 'rincian_informasi_event.dart';
part 'rincian_informasi_state.dart';
part 'rincian_informasi_bloc.freezed.dart';

@injectable
class RincianInformasiBloc
    extends Bloc<RincianInformasiEvent, RincianInformasiState> {
  LibrariRepositori librariRepositori;
  RincianInformasiBloc(this.librariRepositori)
      : super(const RincianInformasiState()) {
    on<RincianInformasiEvent>((event, emit) => _onEventChanged(event, emit));
  }

  Future<void> _onEventChanged(
      RincianInformasiEvent event, Emitter<RincianInformasiState> emit) async {
    await event.maybeMap(
      orElse: () {},
      addAlternatif: (e) {
        emit(state.copyWith(alternatifValue: e.value));
      },
      addPrognosis: (e) {
        emit(state.copyWith(pronosisValue: e.value));
      },
      addRisikoDanKompilasi: (e) {
        emit(state.copyWith(risikoValue: e.value));
      },
      lainLain: (e) {
        emit(state.copyWith(lainLainValue: e.value));
      },
      tidakDilakukanTindakan: (e) {
        emit(state.copyWith(tidakDilakukanTindakanValue: e.value));
      },
      addTataCara: (e) {
        emit(state.copyWith(tataCaraValue: e.value));
      },
      addTujuanTindakan: (e) {
        emit(state.copyWith(tujuanValue: e.value));
      },
      addDasarDiagnosis: (e) {
        emit(state.copyWith(dasarDiagnosisValue: e.value));
      },
      addIndikasiTindakan: (e) {
        emit(state.copyWith(indikasiTindakanValue: e.value));
      },
      getBankData: (e) async {
        var data = await anamnesaService.getBankData(e.kategori);

        final meta = MetaModel.fromJson(data["metadata"]);

        if (meta.code == 200) {}

        List<BankDataModel> value = (data["response"] as Iterable)
            .map((e) => BankDataModel.fromMap(e))
            .toList();

        emit(state.copyWith(bankData: value));
        if (meta.code != 200) {
          emit(state.copyWith(bankData: []));
        }
      },
      addBandingValue: (e) {
        emit(state.copyWith(aBandingValue: e.value));
      },
      addAKerjaValue: (e) {
        emit(state.copyWith(aKerjaValue: e.value));
      },
      addDiagnosis: (e) {
        emit(state.copyWith(diagnosa: e.diagsnosis));
      },
      getModelDiagnosa: (e) async {
        emit(state.copyWith(isLoading: true, getfailOrSuccessResult: none()));

        final data = await librariRepositori.getAllDiagnosaICD10();

        log("Data Dianosa $data");
        emit(state.copyWith(
            isLoading: false, getfailOrSuccessResult: optionOf(data)));

        emit(state.copyWith(isLoading: false, getfailOrSuccessResult: none()));
      },
      getDiagnosis: (e) {},
      saveDiagnosis: (e) {},
    );
  }
}
