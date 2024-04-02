import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/pages/bangsal/repository/pengkajian_keperawatan_repository.dart';
import 'package:hms_app/presentation/pages/bangsal/services/bangsal_services.dart';

part 'pengkajian_awal_keperawatan_event.dart';
part 'pengkajian_awal_keperawatan_state.dart';

class PengkajianAwalKeperawatanBloc extends Bloc<PengkajianAwalKeperawatanEvent,
    PengkajianAwalKeperawatanState> {
  PengkajianAwalKeperawatanBloc()
      : super(PengkajianAwalKeperawatanState.initial()) {
    on<PengkajianAwalKeperawatanEvent>((event, emit) {});
    on<OnChangedJenisAnamnesa>(_onChangedJenisAnamnesa);
    on<OnChangedDetailJenisAnamnesa>(_onChangedDetailJenisAnamnesa);
    on<OnChangedReaksiAlergi>(_onChangedReaksiAlergi);
    on<OnChangedKeluhanUtama>(_onChangedKeluhanUtama);
    on<OnChangedRiwayatPenyakitSekarang>(_onChangedPenyakitSekarang);
    on<OnSavePengkajianAwalKeperawatan>(_onSavePengkajianAwalKeperawatan);
    on<OnGetPengkajianAwalKeperawatanEvent>(_onGetPengkajianAwalKeperawatan);
    on<OnChangedRiwayatPenyakitDahulu>(_onChangedRiwayatPenyakitDahulu);
    on<OnSaveRiwayatPenyakitKeluarga>(_onSaveRiwayatPenyakitKeluarga);
  }

  Future<void> _onChangedJenisAnamnesa(
    OnChangedJenisAnamnesa event,
    Emitter<PengkajianAwalKeperawatanState> emit,
  ) async {
    emit(state.copyWith(status: PengkajianAwalKeperawatanStatus.onSelected));
    emit(state.copyWith(
        status: PengkajianAwalKeperawatanStatus.loaded,
        pengkajianKeperawatanResponseModel:
            state.pengkajianKeperawatanResponseModel.copyWith(
                pengkajian: state.pengkajianKeperawatanResponseModel.pengkajian
                    .copyWith(jenpel: event.value))));
  }

  Future<void> _onChangedRiwayatPenyakitDahulu(
    OnChangedRiwayatPenyakitDahulu event,
    Emitter<PengkajianAwalKeperawatanState> emit,
  ) async {
    emit(state.copyWith(status: PengkajianAwalKeperawatanStatus.onSelected));
    emit(state.copyWith(
        status: PengkajianAwalKeperawatanStatus.loaded,
        pengkajianKeperawatanResponseModel:
            state.pengkajianKeperawatanResponseModel.copyWith(
                pengkajian: state.pengkajianKeperawatanResponseModel.pengkajian
                    .copyWith(riwayatPenyakitDahulu: event.value))));
  }

  Future<void> _onChangedKeluhanUtama(
    OnChangedKeluhanUtama event,
    Emitter<PengkajianAwalKeperawatanState> emit,
  ) async {
    emit(state.copyWith(status: PengkajianAwalKeperawatanStatus.onSelected));
    emit(state.copyWith(
        status: PengkajianAwalKeperawatanStatus.loaded,
        pengkajianKeperawatanResponseModel:
            state.pengkajianKeperawatanResponseModel.copyWith(
                pengkajian: state.pengkajianKeperawatanResponseModel.pengkajian
                    .copyWith(keluhanUtama: event.value))));
  }

  Future<void> _onSaveRiwayatPenyakitKeluarga(
    OnSaveRiwayatPenyakitKeluarga event,
    Emitter<PengkajianAwalKeperawatanState> emit,
  ) async {
    emit(state.copyWith(status: PengkajianAwalKeperawatanStatus.onSelected));

    try {
      await keperawatanBangsalService.savePenyakitKeluargaEvent(
          noRM: event.noRM, penyakit: event.penyakitKeluarga);

      final getData =
          await keperawatanBangsalService.onGetPengkajianAwalKeperawatan(
              tanggal: event.tanggal,
              noRM: event.noRM,
              noreg: event.noReg,
              person: event.person);

      PengkajianKeperawatanResponseModel data =
          PengkajianKeperawatanResponseModel.fromJson(getData["response"]);

      // ============= RIWAYAT PENYAKIT KELUARGA ================= //

      emit(state.copyWith(
          status: PengkajianAwalKeperawatanStatus.loaded,
          pengkajianKeperawatanResponseModel: data));

      // =================  RIWAYAT PENYAKIT KELUARGA  ===============
    } catch (e) {
      emit(state.copyWith(
          status: PengkajianAwalKeperawatanStatus.loaded,
          saveResultFailure: none(),
          pengkajianKeperawatanResponseModel:
              PengkajianKeperawatanResponseModel(
                  riwayatTerdahulu: [],
                  riwayatPenyakitKeluarga: [],
                  pengkajian: Pengkajian(
                      riwayatPenyakitDahulu: "",
                      noreg: "",
                      detailJenpel: "",
                      person: "",
                      dpjp: "",
                      jenpel: "",
                      keluhanUtama: "",
                      rwytPenyakit: "",
                      reaksiAlergi: ""))));
    }
  }

  Future<void> _onSavePengkajianAwalKeperawatan(
    OnSavePengkajianAwalKeperawatan event,
    Emitter<PengkajianAwalKeperawatanState> emit,
  ) async {
    emit(state.copyWith(
        status: PengkajianAwalKeperawatanStatus.isLoadingSave,
        saveResultFailure: none()));

    final saveData =
        await keperawatanBangsalService.savePengkajianAwalKeperawatan(
            dpjp: event.dpjp,
            rwtPenyakitDahulu: event.pengkajian.riwayatPenyakitDahulu,
            noreg: event.noreg,
            noRM: event.noRM,
            person: event.person,
            pelayanan: event.pelayanan,
            deviceID: event.deviceID,
            jenPel: event.jenPel,
            detailJenPel: event.pengkajian.detailJenpel,
            keluhanUtama: event.pengkajian.keluhanUtama,
            rwtPenyakit: event.pengkajian.rwytPenyakit,
            reaksiAlergi: event.pengkajian.reaksiAlergi);

    emit(state.copyWith(
        status: PengkajianAwalKeperawatanStatus.loaded,
        saveResultFailure: optionOf(saveData)));

    // ===== //
    emit(state.copyWith(
        status: PengkajianAwalKeperawatanStatus.loaded,
        saveResultFailure: none()));
  }

  Future<void> _onGetPengkajianAwalKeperawatan(
    OnGetPengkajianAwalKeperawatanEvent event,
    Emitter<PengkajianAwalKeperawatanState> emit,
  ) async {
    emit(state.copyWith(
        status: PengkajianAwalKeperawatanStatus.isLoadingGet,
        saveResultFailure: none(),
        pengkajianKeperawatanResponseModel:
            state.pengkajianKeperawatanResponseModel));

    try {
      final getData =
          await keperawatanBangsalService.onGetPengkajianAwalKeperawatan(
              tanggal: event.tanggal,
              noRM: event.noRM,
              noreg: event.noReg,
              person: event.person);

      PengkajianKeperawatanResponseModel data =
          PengkajianKeperawatanResponseModel.fromJson(getData["response"]);

      // ============= RIWAYAT PENYAKIT KELUARGA ================= //

      emit(state.copyWith(
          status: PengkajianAwalKeperawatanStatus.loaded,
          pengkajianKeperawatanResponseModel: data));

      // ============= RIWAYAT PENYAKIT KELUARGA ================= //
    } catch (e) {
      emit(state.copyWith(
          status: PengkajianAwalKeperawatanStatus.loaded,
          saveResultFailure: none(),
          pengkajianKeperawatanResponseModel:
              PengkajianKeperawatanResponseModel(
                  riwayatTerdahulu: [],
                  riwayatPenyakitKeluarga: [],
                  pengkajian: Pengkajian(
                      riwayatPenyakitDahulu: "",
                      noreg: "",
                      detailJenpel: "",
                      person: "",
                      dpjp: "",
                      jenpel: "",
                      keluhanUtama: "",
                      rwytPenyakit: "",
                      reaksiAlergi: ""))));
    }
  }

  Future<void> _onChangedPenyakitSekarang(
    OnChangedRiwayatPenyakitSekarang event,
    Emitter<PengkajianAwalKeperawatanState> emit,
  ) async {
    emit(state.copyWith(status: PengkajianAwalKeperawatanStatus.onSelected));
    emit(state.copyWith(
        status: PengkajianAwalKeperawatanStatus.loaded,
        pengkajianKeperawatanResponseModel:
            state.pengkajianKeperawatanResponseModel.copyWith(
                pengkajian: state.pengkajianKeperawatanResponseModel.pengkajian
                    .copyWith(rwytPenyakit: event.value))));
  }

  Future<void> _onChangedDetailJenisAnamnesa(
    OnChangedDetailJenisAnamnesa event,
    Emitter<PengkajianAwalKeperawatanState> emit,
  ) async {
    emit(state.copyWith(status: PengkajianAwalKeperawatanStatus.onSelected));
    emit(state.copyWith(
        status: PengkajianAwalKeperawatanStatus.loaded,
        pengkajianKeperawatanResponseModel:
            state.pengkajianKeperawatanResponseModel.copyWith(
                pengkajian: state.pengkajianKeperawatanResponseModel.pengkajian
                    .copyWith(detailJenpel: event.value))));
  }

  Future<void> _onChangedReaksiAlergi(
    OnChangedReaksiAlergi event,
    Emitter<PengkajianAwalKeperawatanState> emit,
  ) async {
    emit(state.copyWith(status: PengkajianAwalKeperawatanStatus.onSelected));
    emit(state.copyWith(
        status: PengkajianAwalKeperawatanStatus.loaded,
        pengkajianKeperawatanResponseModel:
            state.pengkajianKeperawatanResponseModel.copyWith(
                pengkajian: state.pengkajianKeperawatanResponseModel.pengkajian
                    .copyWith(reaksiAlergi: event.value))));
  }
}
