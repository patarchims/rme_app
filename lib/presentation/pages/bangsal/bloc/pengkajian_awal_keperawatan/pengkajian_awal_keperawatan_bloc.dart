import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/pages/bangsal/repository/asesmen_anak_repository.dart';
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
    on<OnChangedRiwayatPenyakitDahuluAnak>(_onChangedRiwayatPenyakitDahuluAnak);
    on<OnSaveRiwayatPenyakitKeluarga>(_onSaveRiwayatPenyakitKeluarga);
    on<OnGetAsesmenAnakEvent>(_onGetAsesmenAnak);
    on<OnChangedJenisAnamnesAnak>(_onChangedJenisAnamnesaAnak);
    on<OnChangedDetailJenisAnamnesaAnak>(_onChangeDetailJenisAnamnesaAnak);
    on<OnChangedKeluhanUtamaAnak>(_onChangedKeluhanUtamaAnak);
    on<OnChangedReaksiAlergiAnak>(_onChangeReaksiAlergiAnak);
    on<OnSaveAssesmenAnakEvent>(_onSaveAssesmenAnak);
    on<OnChangedRiwayatPenyakitSekarangAnak>(
        _onChangedRiwayatPenyakitSekarangAnak);
  }

  Future<void> _onGetAsesmenAnak(
    OnGetAsesmenAnakEvent event,
    Emitter<PengkajianAwalKeperawatanState> emit,
  ) async {
    try {
      emit(state.copyWith(
          status: PengkajianAwalKeperawatanStatus.isLoadingGetAsesmenAnak));
      // GET DATA
      final getData = await keperawatanBangsalService.onGetAsesmenAnak(
          noreg: event.noReg,
          noRM: event.noRM,
          person: event.person,
          tanggal: event.tanggal);

      PenkajianAnakRepository data =
          PenkajianAnakRepository.fromMap(getData["response"]);

      emit(state.copyWith(
          status: PengkajianAwalKeperawatanStatus.isLoadedAsesmenAnak,
          pengkajianAnak: data));

      //====//
    } catch (e) {
      emit(state.copyWith(
        status: PengkajianAwalKeperawatanStatus.isLoadedAsesmenAnak,
      ));
    }
  }

  Future<void> _onSaveAssesmenAnak(
    OnSaveAssesmenAnakEvent event,
    Emitter<PengkajianAwalKeperawatanState> emit,
  ) async {
    try {
      emit(state.copyWith(
          status: PengkajianAwalKeperawatanStatus.isLoadingSaveAsesmenAnak));

      // GET DATA
      final getData = await keperawatanBangsalService.saveAssesmenAnakEvent(
          detailJenPel: event.jenpenDetail,
          deviceID: event.devicesID,
          dpjp: event.dpjp,
          jenPel: event.jenpel,
          keluhanUtama: event.keluhanUtama,
          pelayanan: event.pelayanan,
          reaksiAlergi: event.reaksiAlergi,
          rwtPenyakit: event.riwayatPenyakit,
          rwtPenyakitDahulu: event.riwayatPenyakitDahulu,
          noreg: event.noReg,
          noRM: event.noRM,
          person: event.person,
          tanggal: event.tanggal);

      emit(state.copyWith(
          status: PengkajianAwalKeperawatanStatus.isLoadedAsesmenAnak,
          saveResultAsesmenAnakFailure: optionOf(getData)));

      emit(state.copyWith(
          status: PengkajianAwalKeperawatanStatus.isLoadedAsesmenAnak,
          saveResultAsesmenAnakFailure: none()));

      //====//
    } catch (e) {
      emit(state.copyWith(
        status: PengkajianAwalKeperawatanStatus.isLoadedAsesmenAnak,
      ));
    }
  }

  Future<void> _onChangedJenisAnamnesaAnak(
    OnChangedJenisAnamnesAnak event,
    Emitter<PengkajianAwalKeperawatanState> emit,
  ) async {
    emit(state.copyWith(status: PengkajianAwalKeperawatanStatus.onSelected));

    // == //
    emit(state.copyWith(
        status: PengkajianAwalKeperawatanStatus.loaded,
        pengkajianAnak: state.pengkajianAnak.copyWith(
            pengkajianAnak: state.pengkajianAnak.pengkajianAnak
                .copyWith(jenpel: event.value))));
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

  Future<void> _onSelectioJeisAnamesa(
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

  Future<void> _onChangedRiwayatPenyakitDahuluAnak(
    OnChangedRiwayatPenyakitDahuluAnak event,
    Emitter<PengkajianAwalKeperawatanState> emit,
  ) async {
    emit(state.copyWith(status: PengkajianAwalKeperawatanStatus.onSelected));
    emit(state.copyWith(
        status: PengkajianAwalKeperawatanStatus.loaded,
        pengkajianAnak: state.pengkajianAnak.copyWith(
            pengkajianAnak: state.pengkajianAnak.pengkajianAnak
                .copyWith(rwtPenyakitDahulu: event.value))));
  }

  Future<void> _onChangeReaksiAlergiAnak(
    OnChangedReaksiAlergiAnak event,
    Emitter<PengkajianAwalKeperawatanState> emit,
  ) async {
    emit(state.copyWith(status: PengkajianAwalKeperawatanStatus.onSelected));
    emit(state.copyWith(
        status: PengkajianAwalKeperawatanStatus.loaded,
        pengkajianAnak: state.pengkajianAnak.copyWith(
            pengkajianAnak: state.pengkajianAnak.pengkajianAnak
                .copyWith(reaksiAlergi: event.value))));
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

  Future<void> _onChangedRiwayatPenyakitSekarangAnak(
    OnChangedRiwayatPenyakitSekarangAnak event,
    Emitter<PengkajianAwalKeperawatanState> emit,
  ) async {
    emit(state.copyWith(status: PengkajianAwalKeperawatanStatus.onSelected));
    emit(state.copyWith(
        status: PengkajianAwalKeperawatanStatus.loaded,
        pengkajianAnak: state.pengkajianAnak.copyWith(
            pengkajianAnak: state.pengkajianAnak.pengkajianAnak
                .copyWith(rwtPenyakit: event.value))));
  }

  Future<void> _onChangedKeluhanUtamaAnak(
    OnChangedKeluhanUtamaAnak event,
    Emitter<PengkajianAwalKeperawatanState> emit,
  ) async {
    emit(state.copyWith(status: PengkajianAwalKeperawatanStatus.onSelected));
    emit(state.copyWith(
        status: PengkajianAwalKeperawatanStatus.loaded,
        pengkajianAnak: state.pengkajianAnak.copyWith(
            pengkajianAnak: state.pengkajianAnak.pengkajianAnak
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

  Future<void> _onChangeDetailJenisAnamnesaAnak(
    OnChangedDetailJenisAnamnesaAnak event,
    Emitter<PengkajianAwalKeperawatanState> emit,
  ) async {
    emit(state.copyWith(status: PengkajianAwalKeperawatanStatus.onSelected));
    emit(state.copyWith(
        status: PengkajianAwalKeperawatanStatus.loaded,
        pengkajianAnak: state.pengkajianAnak.copyWith(
            pengkajianAnak: state.pengkajianAnak.pengkajianAnak
                .copyWith(jenpelDetail: event.value))));
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
