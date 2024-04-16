import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/pages/igd/repository/pemeriksaan_fisik_repository.dart';
import 'package:hms_app/presentation/pages/igd/repository/pemeriksaan_fisik_repository_dokter_methodist.dart';
import 'package:hms_app/presentation/pages/igd/services/igd_services.dart';

part 'pemeriksaan_fisik_igd_event.dart';
part 'pemeriksaan_fisik_igd_state.dart';

class PemeriksaanFisikIgdBloc
    extends Bloc<PemeriksaanFisikIgdEvent, PemeriksaanFisikIgdState> {
  PemeriksaanFisikIgdBloc() : super(PemeriksaanFisikIgdState.initial()) {
    on<PemeriksaanFisikIgdEvent>((event, emit) {});
    on<OnGetPemeriksaanFisik>(_onGetPemeriksaanFisikIGD);
    on<OnSavePemeriksaanFisikIGDDokter>(_onSavePemeriksaanFisikIGD);

    // ONCHANGED
    on<KepalaOnChanged>(_kepalaOnChanged);
    on<MataOnChanged>(_mataOnChanged);
    on<ThtOnChanged>(_thtOnChanged);
    on<MulutOnChanged>(_mulutOnChanged);
    on<LeherOnchanged>(_leherOnChanged);
    on<DadaOnChanged>(_dadaOnChanged);
    on<JantungOnChanged>(_jantungOnchanged);
    on<ParuOnChanged>(_paruOnChanged);
    on<PerutOnChanged>(_perutOnChanged);
    on<HatiOnChanged>(_hatiOnChanged);
    on<LimpaOnChanged>(_limpaOnChanged);
    on<GinjalOnChanged>(_ginjalOnChanged);
    on<AlatKelaminOnChanged>(_alatKelaminOnChanged);
    on<AnggotaGerakOnChanged>(_anggotaGerakOnChanged);
    on<RefleksOnChanged>(_refleksOnChanged);
    on<KekuatanOtotOnChanged>(_kekuatanOtotOnChanged);
    on<OnGetPemeriksaanFisikPerawatIGD>(_onGetPemeriksaanFisikIGDPerawat);
    on<KulitOnChanged>(_kulitOnChanged);
    on<GetahBeningOnChanged>(_getahBeningOnChanged);
    on<RtRVOnChanged>(_rtVTOnChanged);
    on<OnSavePemeriksaanFisikBangsal>(_onSavePemeriksaanFisikBangsal);
    on<OnGetPemeriksaanFisikBangsalEvent>(_onGetPemeriksaanFisikBangsalEvent);
    on<AbdomenOnchanged>(_abdomenOnchanged);
    on<GigiOnchanged>(_gigiOnchanged);
    on<OnGetPemeriksaanFisikMethodist>(_onGetPemeriksaanFisikIGDMethodist);
    on<OnSavePemeriksaanFisikIGDDokterMethodist>(
        _onSavePemeriksaanFisikIGDMethodist);
  }

  Future<void> _onGetPemeriksaanFisikIGD(
    OnGetPemeriksaanFisik event,
    Emitter<PemeriksaanFisikIgdState> emit,
  ) async {
    emit(state.copyWith(
        pemeriksaanFisikIgdDokter: state.pemeriksaanFisikIgdDokter,
        saveResultFailure: none(),
        status: PemeriksaanFisikIgdStatus.isLoadingGet));

    try {
      final fisik = await igdServices.onGetPemeriksaanFisikIGDokter(
          person: event.person, noReg: event.noReg);

      PemeriksaanFisikIgdDokter pemeriksaanFisikIgdDokter =
          PemeriksaanFisikIgdDokter.fromJson(fisik["response"]);

      emit(state.copyWith(
          pemeriksaanFisikIgdDokter: pemeriksaanFisikIgdDokter,
          saveResultFailure: none(),
          status: PemeriksaanFisikIgdStatus.loaded));
    } catch (e) {
      emit(state.copyWith(
          pemeriksaanFisikIgdDokter: state.pemeriksaanFisikIgdDokter,
          saveResultFailure: none(),
          status: PemeriksaanFisikIgdStatus.error));
    }
  }

  Future<void> _onGetPemeriksaanFisikIGDPerawat(
    OnGetPemeriksaanFisikPerawatIGD event,
    Emitter<PemeriksaanFisikIgdState> emit,
  ) async {
    emit(state.copyWith(
        pemeriksaanFisikIgdDokter: state.pemeriksaanFisikIgdDokter,
        saveResultFailure: none(),
        status: PemeriksaanFisikIgdStatus.isLoadingGet));

    try {
      final fisik = await igdServices.onGetPemeriksaanFisikIGDPerawat(
          person: event.person, noReg: event.noReg);

      PemeriksaanFisikIgdDokter pemeriksaanFisikIgdDokter =
          PemeriksaanFisikIgdDokter.fromJson(fisik["response"]);

      emit(state.copyWith(
          pemeriksaanFisikIgdDokter: pemeriksaanFisikIgdDokter,
          saveResultFailure: none(),
          status: PemeriksaanFisikIgdStatus.loaded));
    } catch (e) {
      emit(state.copyWith(
          pemeriksaanFisikIgdDokter: state.pemeriksaanFisikIgdDokter,
          saveResultFailure: none(),
          status: PemeriksaanFisikIgdStatus.error));
    }
  }

  Future<void> _onGetPemeriksaanFisikIGDMethodist(
    OnGetPemeriksaanFisikMethodist event,
    Emitter<PemeriksaanFisikIgdState> emit,
  ) async {
    emit(state.copyWith(
        pemeriksaanFisikIgdDokter: state.pemeriksaanFisikIgdDokter,
        saveResultFailure: none(),
        status: PemeriksaanFisikIgdStatus.isLoadingGet));

    try {
      final fisik = await igdServices.onGetPemeriksaanFisikIGDokterMethodist(
          person: event.person, noReg: event.noReg);

      PemeriksaanFisikMethodistDokter pemeriksaanFisikIgdDokter =
          PemeriksaanFisikMethodistDokter.fromJson(fisik["response"]);

      emit(state.copyWith(
          pemeriksaanFisikIgdDokterMethodist: pemeriksaanFisikIgdDokter,
          saveResultFailure: none(),
          status: PemeriksaanFisikIgdStatus.loaded));
    } catch (e) {
      emit(state.copyWith(
          pemeriksaanFisikIgdDokterMethodist:
              state.pemeriksaanFisikIgdDokterMethodist,
          pemeriksaanFisikIgdDokter: state.pemeriksaanFisikIgdDokter,
          saveResultFailure: none(),
          status: PemeriksaanFisikIgdStatus.error));
    }
  }

  Future<void> _onGetPemeriksaanFisikBangsalEvent(
    OnGetPemeriksaanFisikBangsalEvent event,
    Emitter<PemeriksaanFisikIgdState> emit,
  ) async {
    emit(state.copyWith(
        pemeriksaanFisikIgdDokter: state.pemeriksaanFisikIgdDokter,
        saveResultFailure: none(),
        status: PemeriksaanFisikIgdStatus.isLoadingGet));

    try {
      final fisik = await igdServices.onGetPemeriksaanFisikBangsal(
          person: event.person, noReg: event.noReg);

      PemeriksaanFisikIgdDokter pemeriksaanFisikIgdDokter =
          PemeriksaanFisikIgdDokter.fromJson(fisik["response"]);

      emit(state.copyWith(
          pemeriksaanFisikIgdDokter: pemeriksaanFisikIgdDokter,
          saveResultFailure: none(),
          status: PemeriksaanFisikIgdStatus.loaded));
    } catch (e) {
      emit(state.copyWith(
          pemeriksaanFisikIgdDokter: state.pemeriksaanFisikIgdDokter,
          saveResultFailure: none(),
          status: PemeriksaanFisikIgdStatus.error));
    }
  }

  Future<void> _onSavePemeriksaanFisikIGD(
    OnSavePemeriksaanFisikIGDDokter event,
    Emitter<PemeriksaanFisikIgdState> emit,
  ) async {
    emit(state.copyWith(
        pemeriksaanFisikIgdDokter: state.pemeriksaanFisikIgdDokter,
        saveResultFailure: none(),
        status: PemeriksaanFisikIgdStatus.isLoadingSave));

    try {
      final fisik = await igdServices.onSavePemeriksaanFisikIGDDokter(
          person: event.person,
          noReg: event.noReg,
          deviceID: event.deviceID,
          pelayanan: event.pelayanan,
          pemeriksaanFisikIgdDokter: event.pemeriksaanFisik);

      final fisiks = await igdServices.onGetPemeriksaanFisikIGDokter(
          person: event.person, noReg: event.noReg);

      PemeriksaanFisikIgdDokter pemeriksaanFisikIgdDokter =
          PemeriksaanFisikIgdDokter.fromJson(fisiks["response"]);

      emit(state.copyWith(
          pemeriksaanFisikIgdDokter: pemeriksaanFisikIgdDokter,
          saveResultFailure: optionOf(fisik),
          status: PemeriksaanFisikIgdStatus.isLoadedSave));

      emit(state.copyWith(
          saveResultFailure: none(),
          status: PemeriksaanFisikIgdStatus.isLoadedSave));
    } catch (e) {
      emit(state.copyWith(
          saveResultFailure: none(), status: PemeriksaanFisikIgdStatus.error));
    }
  }

  Future<void> _onSavePemeriksaanFisikIGDMethodist(
    OnSavePemeriksaanFisikIGDDokterMethodist event,
    Emitter<PemeriksaanFisikIgdState> emit,
  ) async {
    emit(state.copyWith(
        pemeriksaanFisikIgdDokter: state.pemeriksaanFisikIgdDokter,
        saveResultFailure: none(),
        status: PemeriksaanFisikIgdStatus.isLoadingSave));

    try {
      final fisik = await igdServices.onSavePemeriksaanFisikIGDDokterMethodist(
          person: event.person,
          noReg: event.noReg,
          deviceID: event.deviceID,
          pelayanan: event.pelayanan,
          pemeriksaanFisikIgdDokter: event.pemeriksaanFisik);

      final fisiks = await igdServices.onGetPemeriksaanFisikIGDokterMethodist(
          person: event.person, noReg: event.noReg);

      PemeriksaanFisikMethodistDokter pemeriksaanFisikIgdDokter =
          PemeriksaanFisikMethodistDokter.fromJson(fisiks["response"]);

      emit(state.copyWith(
          pemeriksaanFisikIgdDokterMethodist: pemeriksaanFisikIgdDokter,
          saveResultFailure: optionOf(fisik),
          status: PemeriksaanFisikIgdStatus.isLoadedSave));

      emit(state.copyWith(
          saveResultFailure: none(),
          status: PemeriksaanFisikIgdStatus.isLoadedSave));
    } catch (e) {
      emit(state.copyWith(
          saveResultFailure: none(), status: PemeriksaanFisikIgdStatus.error));
    }
  }

  Future<void> _onSavePemeriksaanFisikBangsal(
    OnSavePemeriksaanFisikBangsal event,
    Emitter<PemeriksaanFisikIgdState> emit,
  ) async {
    emit(state.copyWith(
        pemeriksaanFisikIgdDokter: state.pemeriksaanFisikIgdDokter,
        saveResultFailure: none(),
        status:
            PemeriksaanFisikIgdStatus.isLoadingSavePemeriksaanFisikBangsal));

    try {
      final fisik = await igdServices.onSavePemeriksaanFisikBangsal(
          person: event.person,
          noReg: event.noReg,
          deviceID: event.deviceID,
          pelayanan: event.pelayanan,
          pemeriksaanFisikIgdDokter: event.pemeriksaanFisik);

      final fisiks = await igdServices.onGetPemeriksaanFisikBangsal(
          person: event.person, noReg: event.noReg);

      PemeriksaanFisikIgdDokter pemeriksaanFisikIgdDokter =
          PemeriksaanFisikIgdDokter.fromJson(fisiks["response"]);

      emit(state.copyWith(
          pemeriksaanFisikIgdDokter: pemeriksaanFisikIgdDokter,
          saveResultFailure: optionOf(fisik),
          status: PemeriksaanFisikIgdStatus.isLoadedPemeriksaanFisikBangsal));

      emit(state.copyWith(
          saveResultFailure: none(),
          status: PemeriksaanFisikIgdStatus.isLoadedPemeriksaanFisikBangsal));
    } catch (e) {
      emit(state.copyWith(
          saveResultFailure: none(), status: PemeriksaanFisikIgdStatus.error));
    }
  }

  Future<void> _kepalaOnChanged(
    KepalaOnChanged event,
    Emitter<PemeriksaanFisikIgdState> emit,
  ) async {
    emit(state.copyWith(
      pemeriksaanFisikIgdDokter:
          state.pemeriksaanFisikIgdDokter.copyWith(kepala: event.value),
    ));
  }

  Future<void> _mataOnChanged(
    MataOnChanged event,
    Emitter<PemeriksaanFisikIgdState> emit,
  ) async {
    emit(state.copyWith(
      pemeriksaanFisikIgdDokter:
          state.pemeriksaanFisikIgdDokter.copyWith(mata: event.value),
    ));
  }

  Future<void> _thtOnChanged(
    ThtOnChanged event,
    Emitter<PemeriksaanFisikIgdState> emit,
  ) async {
    emit(state.copyWith(
      pemeriksaanFisikIgdDokter:
          state.pemeriksaanFisikIgdDokter.copyWith(tht: event.value),
    ));
  }

  Future<void> _mulutOnChanged(
    MulutOnChanged event,
    Emitter<PemeriksaanFisikIgdState> emit,
  ) async {
    emit(state.copyWith(
      pemeriksaanFisikIgdDokter:
          state.pemeriksaanFisikIgdDokter.copyWith(mulut: event.value),
    ));
  }

  Future<void> _leherOnChanged(
    LeherOnchanged event,
    Emitter<PemeriksaanFisikIgdState> emit,
  ) async {
    emit(state.copyWith(
      pemeriksaanFisikIgdDokter:
          state.pemeriksaanFisikIgdDokter.copyWith(leher: event.value),
    ));
  }

  Future<void> _gigiOnchanged(
    GigiOnchanged event,
    Emitter<PemeriksaanFisikIgdState> emit,
  ) async {
    emit(state.copyWith(
      pemeriksaanFisikIgdDokter:
          state.pemeriksaanFisikIgdDokter.copyWith(gigi: event.value),
    ));
  }

  Future<void> _abdomenOnchanged(
    AbdomenOnchanged event,
    Emitter<PemeriksaanFisikIgdState> emit,
  ) async {
    emit(state.copyWith(
      pemeriksaanFisikIgdDokter:
          state.pemeriksaanFisikIgdDokter.copyWith(abdomen: event.value),
    ));
  }

  Future<void> _dadaOnChanged(
    DadaOnChanged event,
    Emitter<PemeriksaanFisikIgdState> emit,
  ) async {
    emit(state.copyWith(
      pemeriksaanFisikIgdDokter:
          state.pemeriksaanFisikIgdDokter.copyWith(dada: event.value),
    ));
  }

  Future<void> _jantungOnchanged(
    JantungOnChanged event,
    Emitter<PemeriksaanFisikIgdState> emit,
  ) async {
    emit(state.copyWith(
      pemeriksaanFisikIgdDokter:
          state.pemeriksaanFisikIgdDokter.copyWith(jantung: event.value),
    ));
  }

  Future<void> _paruOnChanged(
    ParuOnChanged event,
    Emitter<PemeriksaanFisikIgdState> emit,
  ) async {
    emit(state.copyWith(
      pemeriksaanFisikIgdDokter:
          state.pemeriksaanFisikIgdDokter.copyWith(paru: event.value),
    ));
  }

  Future<void> _perutOnChanged(
    PerutOnChanged event,
    Emitter<PemeriksaanFisikIgdState> emit,
  ) async {
    emit(state.copyWith(
      pemeriksaanFisikIgdDokter:
          state.pemeriksaanFisikIgdDokter.copyWith(perut: event.value),
    ));
  }

  Future<void> _hatiOnChanged(
    HatiOnChanged event,
    Emitter<PemeriksaanFisikIgdState> emit,
  ) async {
    emit(state.copyWith(
      pemeriksaanFisikIgdDokter:
          state.pemeriksaanFisikIgdDokter.copyWith(hati: event.value),
    ));
  }

  Future<void> _limpaOnChanged(
    LimpaOnChanged event,
    Emitter<PemeriksaanFisikIgdState> emit,
  ) async {
    emit(state.copyWith(
      pemeriksaanFisikIgdDokter:
          state.pemeriksaanFisikIgdDokter.copyWith(limpa: event.value),
    ));
  }

  Future<void> _ginjalOnChanged(
    GinjalOnChanged event,
    Emitter<PemeriksaanFisikIgdState> emit,
  ) async {
    emit(state.copyWith(
      pemeriksaanFisikIgdDokter:
          state.pemeriksaanFisikIgdDokter.copyWith(ginjal: event.value),
    ));
  }

  Future<void> _alatKelaminOnChanged(
    AlatKelaminOnChanged event,
    Emitter<PemeriksaanFisikIgdState> emit,
  ) async {
    emit(state.copyWith(
      pemeriksaanFisikIgdDokter:
          state.pemeriksaanFisikIgdDokter.copyWith(alatKelamin: event.value),
    ));
  }

  Future<void> _anggotaGerakOnChanged(
    AnggotaGerakOnChanged event,
    Emitter<PemeriksaanFisikIgdState> emit,
  ) async {
    emit(state.copyWith(
      pemeriksaanFisikIgdDokter:
          state.pemeriksaanFisikIgdDokter.copyWith(anggotaGerak: event.value),
    ));
  }

  Future<void> _refleksOnChanged(
    RefleksOnChanged event,
    Emitter<PemeriksaanFisikIgdState> emit,
  ) async {
    emit(state.copyWith(
      pemeriksaanFisikIgdDokter:
          state.pemeriksaanFisikIgdDokter.copyWith(refleks: event.value),
    ));
  }

  Future<void> _kekuatanOtotOnChanged(
    KekuatanOtotOnChanged event,
    Emitter<PemeriksaanFisikIgdState> emit,
  ) async {
    emit(state.copyWith(
      pemeriksaanFisikIgdDokter:
          state.pemeriksaanFisikIgdDokter.copyWith(kekuatanOtot: event.value),
    ));
  }

  Future<void> _kulitOnChanged(
    KulitOnChanged event,
    Emitter<PemeriksaanFisikIgdState> emit,
  ) async {
    emit(state.copyWith(
      pemeriksaanFisikIgdDokter:
          state.pemeriksaanFisikIgdDokter.copyWith(kulit: event.value),
    ));
  }

  Future<void> _getahBeningOnChanged(
    GetahBeningOnChanged event,
    Emitter<PemeriksaanFisikIgdState> emit,
  ) async {
    emit(state.copyWith(
      pemeriksaanFisikIgdDokter:
          state.pemeriksaanFisikIgdDokter.copyWith(getahBening: event.value),
    ));
  }

  Future<void> _rtVTOnChanged(
    RtRVOnChanged event,
    Emitter<PemeriksaanFisikIgdState> emit,
  ) async {
    emit(state.copyWith(
      pemeriksaanFisikIgdDokter:
          state.pemeriksaanFisikIgdDokter.copyWith(rtvt: event.value),
    ));
  }
}
