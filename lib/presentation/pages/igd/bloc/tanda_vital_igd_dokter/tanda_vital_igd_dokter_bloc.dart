import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/pages/igd/repository/tanda_vital_igd_dokter_repository.dart';
import 'package:hms_app/presentation/pages/igd/services/igd_services.dart';

part 'tanda_vital_igd_dokter_event.dart';
part 'tanda_vital_igd_dokter_state.dart';

class TandaVitalIgdDokterBloc
    extends Bloc<TandaVitalIgdDokterEvent, TandaVitalIgdDokterState> {
  TandaVitalIgdDokterBloc() : super(TandaVitalIgdDokterState.initial()) {
    on<TandaVitalIgdDokterEvent>((event, emit) {});
    on<OnGetTandaVitalIGDDokter>(_onGetTandaVitalIGDDokter);
    on<OnChangedE>(_onChangedE);
    on<OnChangedV>(_onChangedV);
    on<OnChangedM>(_onChangedM);
    on<OnChangedTekananDarahEvent>(_onChangedTD);
    on<OnChangedPernapasanEvent>(_onChangedPernapasan);
    on<OnChangedSpoEvent>(_onChangedSpo2);
    on<OnSaveTandaVitalIGDDokter>(_onSaveTandaVital);
    on<OnChangedKesadaranEvent>(_onChangedKesadaran);
    on<OnChangedSuhuEvent>(_onChangeSuhu);
    on<OnChangedNadiEvent>(_onChangeNadi);
    on<OnChangedBeratBadan>(_onChangedBeratBadan);
    on<OnChangedTinggiBadanEvent>(_onChangedTinggiBadan);
    on<OnChangedPupilEvent>(_onChangedPupil);
    on<OnChangedAkralEvent>(_onChangedAkral);
    on<OnGetTandaVitalIGDPerawat>(_onGetTandaVitalIGDPerawat);
  }

  Future<void> _onGetTandaVitalIGDDokter(
    OnGetTandaVitalIGDDokter event,
    Emitter<TandaVitalIgdDokterState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: TandaVitalIgdDokterStatus.isLoadingGet,
        tandaVitalIgdDokter: state.tandaVitalIgdDokter));

    try {
      final getData = await igdServices.onGetTandaVitalIGDDokter(
          pelayanan: event.pelayanan, noReg: event.noReg, person: event.person);

      TandaVitalIgdDokter data =
          TandaVitalIgdDokter.fromJson(getData["response"]);

      emit(state.copyWith(
        status: TandaVitalIgdDokterStatus.isLoadedGet,
        tandaVitalIgdDokter: data,
      ));
    } catch (e) {
      emit(state.copyWith(
          status: TandaVitalIgdDokterStatus.loaded,
          tandaVitalIgdDokter: state.tandaVitalIgdDokter));
    }
  }

  Future<void> _onGetTandaVitalIGDPerawat(
    OnGetTandaVitalIGDPerawat event,
    Emitter<TandaVitalIgdDokterState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: TandaVitalIgdDokterStatus.isLoadingGet,
        tandaVitalIgdDokter: state.tandaVitalIgdDokter));

    try {
      final getData = await igdServices.onGetTandaVitalIGDPerawat(
          pelayanan: event.pelayanan, noReg: event.noReg, person: event.person);

      TandaVitalIgdDokter data =
          TandaVitalIgdDokter.fromJson(getData["response"]);

      emit(state.copyWith(
        status: TandaVitalIgdDokterStatus.isLoadedGet,
        tandaVitalIgdDokter: data,
      ));
    } catch (e) {
      emit(state.copyWith(
          status: TandaVitalIgdDokterStatus.loaded,
          tandaVitalIgdDokter: state.tandaVitalIgdDokter));
    }
  }

  Future<void> _onSaveTandaVital(
    OnSaveTandaVitalIGDDokter event,
    Emitter<TandaVitalIgdDokterState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: TandaVitalIgdDokterStatus.isLoadedSave,
        tandaVitalIgdDokter: state.tandaVitalIgdDokter));

    try {
      final getData = await igdServices.onSaveTandaVitalIGDDokter(
          devicesID: event.deviceId,
          pelayanan: event.pelayanan,
          noReg: event.noReg,
          person: event.person,
          tandaVitalIgdDokter: event.tandaVital);

      emit(state.copyWith(
        status: TandaVitalIgdDokterStatus.isLoadedSave,
        saveResultFailure: optionOf(getData),
        tandaVitalIgdDokter: state.tandaVitalIgdDokter,
      ));

      emit(state.copyWith(
        status: TandaVitalIgdDokterStatus.isLoadedSave,
        saveResultFailure: none(),
        tandaVitalIgdDokter: state.tandaVitalIgdDokter,
      ));
    } catch (e) {
      emit(state.copyWith(
          status: TandaVitalIgdDokterStatus.loaded,
          tandaVitalIgdDokter: state.tandaVitalIgdDokter));
    }
  }

  Future<void> _onChangedE(
    OnChangedE event,
    Emitter<TandaVitalIgdDokterState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(status: TandaVitalIgdDokterStatus.isChanged));
    log(event.value);
    emit(state.copyWith(
        status: TandaVitalIgdDokterStatus.loaded,
        tandaVitalIgdDokter:
            state.tandaVitalIgdDokter.copyWith(gcsE: event.value)));
  }

  Future<void> _onChangedPupil(
    OnChangedPupilEvent event,
    Emitter<TandaVitalIgdDokterState> emit,
  ) async {
    emit(state.copyWith(status: TandaVitalIgdDokterStatus.isChanged));
    emit(state.copyWith(
        status: TandaVitalIgdDokterStatus.loaded,
        tandaVitalIgdDokter:
            state.tandaVitalIgdDokter.copyWith(pupil: event.value)));
  }

  Future<void> _onChangedAkral(
    OnChangedAkralEvent event,
    Emitter<TandaVitalIgdDokterState> emit,
  ) async {
    emit(state.copyWith(status: TandaVitalIgdDokterStatus.isChanged));
    emit(state.copyWith(
        status: TandaVitalIgdDokterStatus.loaded,
        tandaVitalIgdDokter:
            state.tandaVitalIgdDokter.copyWith(akral: event.value)));
  }

  Future<void> _onChangedTinggiBadan(
    OnChangedTinggiBadanEvent event,
    Emitter<TandaVitalIgdDokterState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(status: TandaVitalIgdDokterStatus.isChanged));
    log(event.value);
    emit(state.copyWith(
        status: TandaVitalIgdDokterStatus.loaded,
        tandaVitalIgdDokter:
            state.tandaVitalIgdDokter.copyWith(tinggiBadan: event.value)));
  }

  Future<void> _onChangedBeratBadan(
    OnChangedBeratBadan event,
    Emitter<TandaVitalIgdDokterState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(status: TandaVitalIgdDokterStatus.isChanged));
    log(event.value);
    emit(state.copyWith(
        status: TandaVitalIgdDokterStatus.loaded,
        tandaVitalIgdDokter:
            state.tandaVitalIgdDokter.copyWith(beratBadan: event.value)));
  }

  Future<void> _onChangedKesadaran(
    OnChangedKesadaranEvent event,
    Emitter<TandaVitalIgdDokterState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(status: TandaVitalIgdDokterStatus.isChanged));

    log(event.value);

    emit(state.copyWith(
        status: TandaVitalIgdDokterStatus.loaded,
        tandaVitalIgdDokter:
            state.tandaVitalIgdDokter.copyWith(kesadaran: event.value)));
  }

  Future<void> _onChangedV(
    OnChangedV event,
    Emitter<TandaVitalIgdDokterState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(status: TandaVitalIgdDokterStatus.isChanged));
    log(event.value);
    emit(state.copyWith(
        status: TandaVitalIgdDokterStatus.loaded,
        tandaVitalIgdDokter:
            state.tandaVitalIgdDokter.copyWith(gcsV: event.value)));
  }

  Future<void> _onChangedM(
    OnChangedM event,
    Emitter<TandaVitalIgdDokterState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(status: TandaVitalIgdDokterStatus.isChanged));
    log(event.value);
    emit(state.copyWith(
        status: TandaVitalIgdDokterStatus.loaded,
        tandaVitalIgdDokter:
            state.tandaVitalIgdDokter.copyWith(gcsM: event.value)));
  }

  Future<void> _onChangeNadi(
    OnChangedNadiEvent event,
    Emitter<TandaVitalIgdDokterState> emit,
  ) async {
    // REPLACE LIST ON LIST
    log(event.value);
    emit(state.copyWith(status: TandaVitalIgdDokterStatus.isChanged));
    emit(state.copyWith(
        status: TandaVitalIgdDokterStatus.loaded,
        tandaVitalIgdDokter:
            state.tandaVitalIgdDokter.copyWith(nadi: event.value)));
  }

  Future<void> _onChangeSuhu(
    OnChangedSuhuEvent event,
    Emitter<TandaVitalIgdDokterState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(status: TandaVitalIgdDokterStatus.isChanged));
    log(event.value);
    emit(state.copyWith(
        status: TandaVitalIgdDokterStatus.loaded,
        tandaVitalIgdDokter:
            state.tandaVitalIgdDokter.copyWith(suhu: event.value)));
  }

  Future<void> _onChangedTD(
    OnChangedTekananDarahEvent event,
    Emitter<TandaVitalIgdDokterState> emit,
  ) async {
    // REPLACE LIST ON LIST

    emit(state.copyWith(status: TandaVitalIgdDokterStatus.isChanged));
    log(event.value);
    emit(state.copyWith(
        status: TandaVitalIgdDokterStatus.loaded,
        tandaVitalIgdDokter:
            state.tandaVitalIgdDokter.copyWith(td: event.value)));
  }

  Future<void> _onChangedPernapasan(
    OnChangedPernapasanEvent event,
    Emitter<TandaVitalIgdDokterState> emit,
  ) async {
    // REPLACE LIST ON LIST
    log(event.value);
    emit(state.copyWith(status: TandaVitalIgdDokterStatus.isChanged));

    emit(state.copyWith(
        status: TandaVitalIgdDokterStatus.loaded,
        tandaVitalIgdDokter:
            state.tandaVitalIgdDokter.copyWith(pernafasan: event.value)));
  }

  Future<void> _onChangedSpo2(
    OnChangedSpoEvent event,
    Emitter<TandaVitalIgdDokterState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(status: TandaVitalIgdDokterStatus.isChanged));
    log(event.value);
    emit(state.copyWith(
        status: TandaVitalIgdDokterStatus.loaded,
        tandaVitalIgdDokter:
            state.tandaVitalIgdDokter.copyWith(spo2: event.value)));
  }

// === //
}
