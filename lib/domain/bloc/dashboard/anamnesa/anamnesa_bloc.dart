import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/models/lib_model/bank_data_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/services/anamnesa_services.dart';

part 'anamnesa_event.dart';
part 'anamnesa_state.dart';
part 'anamnesa_bloc.freezed.dart';

class AnamnesaBloc extends Bloc<AnamnesaEvent, AnamnesaState> {
  AnamnesaBloc() : super(AnamnesaState.initial()) {
    on<AnamnesaEvent>((event, emit) => _onEventChanged(event, emit));
  }

  Future<void> _onEventChanged(
      AnamnesaEvent event, Emitter<AnamnesaState> emit) async {
    await event.maybeMap(
        orElse: () {},
        saveData: (e) async {
          emit(state.copyWith(
              isLoading: true, getResult: none(), saveResult: none()));

          final saveData = await anamnesaService.saveAsemenAnamnesa(
              noReg: e.noReg,
              kelUtama: e.kelUtama,
              penyakitKeluarga: e.penyKeluarga,
              riwayatAlergi: e.riwayatAlergi,
              riwayatSekarang: e.riwayatSekarang,
              riwayatAlergiDetail: e.riwayatAlergiDetail,
              jenisPelayanan: e.jenisPelayanan,
              gigi1: e.gigi1,
              gigi2: e.gigi2,
              gigi3: e.gigi3,
              gigi4: e.gigi4,
              gigi5: e.gigi5,
              gigi5Detail: e.gigi5Detail);

          emit(
              state.copyWith(isLoading: false, saveResult: optionOf(saveData)));

          emit(state.copyWith(isLoading: false, saveResult: none()));
        },
        getAsesmenAnamnesa: (e) async {
          emit(state.copyWith(
              getResult: none(), anamnesaLoading: true, saveResult: none()));
          final data = await anamnesaService.getAnamnesa(e.noReg);
          emit(state.copyWith(
              getResult: optionOf(data),
              saveResult: none(),
              anamnesaLoading: false));
        },
        selectedRiwayatPenyakitKeluarga: (data) {
          emit(state.copyWith(
              selectRiwayatKeluarga: data.value, saveResult: none()));
        },
        getKeluhanUtama: (e) async {
          // TAMPILKAN LOADING
          emit(
            state.copyWith(isLoading: true, getResult: none()),
          );
          final data = await anamnesaService.getBankData("keluhan_utama");
          final meta = MetaModel.fromJson(data["metadata"]);
          if (meta.code == 200) {
            List<BankDataModel> kel = (data["response"] as Iterable)
                .map((e) => BankDataModel.fromMap(e))
                .toList();
            emit(state.copyWith(isLoading: false, keluhanUtama: kel));
          }
        },
        getRiwayatKeluarga: (e) async {
          emit(state.copyWith(
              isLoading: true, getResult: none(), saveResult: none()));
          final data = await anamnesaService.getBankData("riwayat_keluarga");

          final meta = MetaModel.fromJson(data["metadata"]);

          if (meta.code == 200) {
            List<BankDataModel> kel = (data["response"] as Iterable)
                .map((e) => BankDataModel.fromMap(e))
                .toList();
            emit(state.copyWith(isLoading: false, riwayatKeluarga: kel));
          }
        },
        riwayatPenyakitSekarang: (data) async {
          emit(state.copyWith(
              isLoading: true, getResult: none(), saveResult: none()));
          final data = await anamnesaService.getBankData("riwayat_sekarang");

          final meta = MetaModel.fromJson(data["metadata"]);

          if (meta.code == 200) {
            List<BankDataModel> kel = (data["response"] as Iterable)
                .map((e) => BankDataModel.fromMap(e))
                .toList();
            emit(state.copyWith(isLoading: false, riwayatSekarang: kel));
          }
        },
        selectKeluhanUtama: (data) {
          emit(state.copyWith(
              selectKeluhan: data.value,
              getResult: none(),
              saveResult: none()));
        },
        selectedRiwayatPenyakitSekarang: (data) {
          emit(state.copyWith(
              selectRiwayat: data.value,
              getResult: none(),
              saveResult: none()));
        });
  }
}
