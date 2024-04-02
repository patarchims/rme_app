import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/models/diagnosa/diagnosa_model.dart';
import 'package:hms_app/domain/models/lib_model/bank_data_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/response/asesmen_bangsal/asesmen_dokter_model.dart';
import 'package:hms_app/domain/services/anamnesa_services.dart';

part 'asesment_anamnesa_event.dart';
part 'asesment_anamnesa_state.dart';

class AsesmentAnamnesaBloc
    extends Bloc<AsesmentAnamnesaEvent, AsesmentAnamnesaState> {
  AsesmentAnamnesaBloc() : super(AsesmentAnamnesaState()) {
    on<AsesmentAnamnesaEvent>((event, emit) {});
    on<OnGetKeluhanUtama>(_onGetAnamnesa);
    on<OnFilterKeluhanUtama>(_onFilterKeluhanUtama);
    on<OnSelectedKeluhanUtama>(_onSelectedKeluhanUtama);
    on<OnGetRiwayatSekarang>(_onGetRiwayatSekarang);
    on<OnGetAsesmenDokterForPerawat>(_onGetAsesmenDokter);
    on<OnSelectedRiwayatSekarang>(_onSelectedRiwayatSekarang);
    on<OnGetDiagnosa>(_onGetDiagnosa);
  }

  Future<void> _onSelectedKeluhanUtama(
      OnSelectedKeluhanUtama event, Emitter<AsesmentAnamnesaState> emit) async {
    emit(state.copyWith(
        pilihKeluhan: event.value,
        pilihRiwayatSekarang: state.pilihRiwayatSekarang));
  }

  Future<void> _onGetAsesmenDokter(OnGetAsesmenDokterForPerawat event,
      Emitter<AsesmentAnamnesaState> emit) async {
    try {
      // Get diagnosa
      final data = await anamnesaService.getDiagnosaDokter(event.noReg);

      final meta = MetaModel.fromJson(data["metadata"]);

      if (meta.code == 200) {
        List<DiagnosaModel> value = (data["response"] as Iterable)
            .map((e) => DiagnosaModel.fromMap(e))
            .toList();

        emit(state.copyWith(diagnosa: value));
      }
      // ignore: empty_catches
    } catch (e) {}
  }

  Future<void> _onSelectedRiwayatSekarang(OnSelectedRiwayatSekarang event,
      Emitter<AsesmentAnamnesaState> emit) async {
    emit(state.copyWith(
        pilihRiwayatSekarang: event.value, pilihKeluhan: state.pilihKeluhan));
  }

  Future<void> _onFilterKeluhanUtama(
      OnFilterKeluhanUtama event, Emitter<AsesmentAnamnesaState> emit) async {
    state.kelUtama.where((element) => false);
  }

  Future<void> _onGetDiagnosa(
      OnGetDiagnosa event, Emitter<AsesmentAnamnesaState> emit) async {
    try {
      // Get diagnosa
      final data = await anamnesaService.getDiagnosa(event.noreg);

      final meta = MetaModel.fromJson(data["metadata"]);

      if (meta.code == 200) {
        final datas = AsesmenDokterModel.fromJson(data["response"]);

        log(datas.toString());

        emit(state.copyWith(asesmenDokterModel: datas));
      }
    } catch (e) {
      //
    }
  }

  Future<void> _onGetAnamnesa(
      OnGetKeluhanUtama event, Emitter<AsesmentAnamnesaState> emit) async {
    try {
      emit(state.copyWith(
          pilihKeluhan: state.pilihKeluhan,
          pilihRiwayatSekarang: state.pilihRiwayatSekarang));
      emit(LoadingGetKeluhanUtama());
      var data = await anamnesaService.getBankData("keluhan_utama");

      final meta = MetaModel.fromJson(data["metadata"]);

      if (meta.code == 200) {
        List<BankDataModel> kel = (data["response"] as Iterable)
            .map((e) => BankDataModel.fromMap(e))
            .toList();
        emit(state.copyWith(
            kelUtama: kel,
            pilihKeluhan: state.pilihKeluhan,
            pilihRiwayatSekarang: state.pilihRiwayatSekarang));
        emit(SuccessState());
        emit(state.copyWith(
            kelUtama: kel,
            pilihKeluhan: state.pilihKeluhan,
            pilihRiwayatSekarang: state.pilihRiwayatSekarang));
      } else {
        emit(FailureState());
      }
    } catch (e) {
      emit(FailureState());
    }
  }

  Future<void> _onGetRiwayatSekarang(
      OnGetRiwayatSekarang event, Emitter<AsesmentAnamnesaState> emit) async {
    try {
      emit(LoadingGetRiwayatSekarang());
      emit(state.copyWith(
          pilihKeluhan: state.pilihKeluhan,
          pilihRiwayatSekarang: state.pilihRiwayatSekarang));
      var data = await anamnesaService.getBankData("riwayat_sekarang");

      final meta = MetaModel.fromJson(data["metadata"]);

      if (meta.code == 200) {
        List<BankDataModel> kel = (data["response"] as Iterable)
            .map((e) => BankDataModel.fromMap(e))
            .toList();
        emit(state.copyWith(
            riwayatSekarang: kel,
            pilihKeluhan: state.pilihKeluhan,
            pilihRiwayatSekarang: state.pilihRiwayatSekarang));
        emit(SuccessState());
        emit(state.copyWith(
            riwayatSekarang: kel,
            pilihKeluhan: state.pilihKeluhan,
            pilihRiwayatSekarang: state.pilihRiwayatSekarang));
      } else {
        emit(FailureState());
      }
    } catch (e) {
      emit(FailureState());
    }
  }
}
