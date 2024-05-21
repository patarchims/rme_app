import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/kebidanan/repository/double_check_rmodel.dart';
import 'package:hms_app/presentation/kebidanan/services/kebidanan_service.dart';

part 'double_check_event.dart';
part 'double_check_state.dart';

class DoubleCheckBloc extends Bloc<DoubleCheckEvent, DoubleCheckState> {
  DoubleCheckBloc() : super(DoubleCheckState.initial()) {
    on<DoubleCheckEvent>((event, emit) {});
    on<OnChangedPasien>(_onChangedPasien);
    on<OnChangedObat>(_onChangedObat);
    on<OnChangedWaktu>(_onChangedWaktu);
    on<OnChangedCara>(_onChangedCara);
    on<OnChangedInformasi>(_onChangedInformasi);
    on<OnChangedDokumentasi>(_onChangedDokumentasi);
    on<OnChangedKeterangan>(_onChangedKeterangan);
    on<OnChangedDosis>(_onChangedDosis);
    on<OnInitCheckHigh>(_onChangedINIT);
    on<OnSaveDoubleCheckHigh>(_onSaveDoubleCheckHigh);
    on<OnGetDoubleCheckEvent>(_onGetDoubleCheck);
    on<OnSaveDoubleCheckVerify>(_onSaveVerifyDoubleCheck);
  }

  Future<void> _onChangedPasien(
    OnChangedPasien event,
    Emitter<DoubleCheckState> emit,
  ) async {
    emit(state.copyWith(status: DoubleCheckStatus.isChanged));

    emit(state.copyWith(
        saveResult: none(),
        doubleCheckRepository:
            state.doubleCheckRepository.copyWith(pasien: event.isChanged)));
  }

  Future<void> _onChangedVerifyPasien(
    OnChangedPasien event,
    Emitter<DoubleCheckState> emit,
  ) async {}

  Future<void> _onSaveVerifyDoubleCheck(
    OnSaveDoubleCheckVerify event,
    Emitter<DoubleCheckState> emit,
  ) async {
    emit(state.copyWith(status: DoubleCheckStatus.isChanged));

    try {
      // ON SAVE DOUBLE CHECK VERIFY
      emit(state.copyWith(status: DoubleCheckStatus.isLoadingSave));

      final saveData = await kebidananService.onSaveVerifyFormulirDoubleCheck(
        noReg: event.noReg,
        pasien: event.pasien,
        obat: event.obat,
        dosis: event.dosis,
        cara: event.cara,
        waktu: event.waktu,
        informasi: event.informasi,
        dokumentasi: event.dokumentasi,
      );

      emit(state.copyWith(
          saveResult: optionOf(saveData), status: DoubleCheckStatus.loaded));

      emit(
          state.copyWith(saveResult: none(), status: DoubleCheckStatus.loaded));

      // =====//
    } catch (e) {
      // ON SAVE DOUBLE CHECK
      emit(state.copyWith(
        status: DoubleCheckStatus.loaded,
      ));
    }
  }

  Future<void> _onGetDoubleCheck(
    OnGetDoubleCheckEvent event,
    Emitter<DoubleCheckState> emit,
  ) async {
    emit(state.copyWith(
        status: DoubleCheckStatus.isLoadingGetData, saveResult: none()));
    try {
      final getData =
          await kebidananService.onGetDoubleCheck(noReg: event.noReg);

      List<DoubleCheckRepository> data = (getData["response"] as Iterable)
          .map((e) => DoubleCheckRepository.fromMap(e))
          .toList();

      emit(state.copyWith(
          status: DoubleCheckStatus.loaded,
          saveResult: none(),
          listCheck: data));
    } catch (e) {
      emit(state.copyWith(
        status: DoubleCheckStatus.loaded,
        saveResult: none(),
        listCheck: [],
      ));
    }
  }

  Future<void> _onChangedINIT(
    OnInitCheckHigh event,
    Emitter<DoubleCheckState> emit,
  ) async {
    emit(state.copyWith(status: DoubleCheckStatus.isChanged));

    emit(state.copyWith(
        saveResult: none(),
        doubleCheckRepository: state.doubleCheckRepository.copyWith(
            pasien: false,
            cara: false,
            dokumentasi: false,
            dosis: false,
            informasi: false,
            keterangan: "",
            obat: false,
            waktu: false)));
  }

  Future<void> _onSaveDoubleCheckHigh(
    OnSaveDoubleCheckHigh event,
    Emitter<DoubleCheckState> emit,
  ) async {
    //===//
    final saveData = await kebidananService.onSaveDoubleCheck(
      noReg: event.noReg,
      devicesID: event.devices,
      pasien: event.pasien,
      obat: event.obat,
      dosis: event.dosis,
      cara: event.cara,
      waktu: event.waktu,
      informasi: event.informasi,
      dokumentasi: event.dokumentasi,
      keterangan: event.keterangan,
    );

    // == //
    emit(state.copyWith(
        saveResult: optionOf(saveData), status: DoubleCheckStatus.loaded));

    // == //
    emit(state.copyWith(saveResult: none(), status: DoubleCheckStatus.loaded));

    try {
      emit(state.copyWith(
        status: DoubleCheckStatus.loading,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: DoubleCheckStatus.loading,
      ));
    }
  }

  Future<void> _onChangedDosis(
    OnChangedDosis event,
    Emitter<DoubleCheckState> emit,
  ) async {
    emit(state.copyWith(status: DoubleCheckStatus.isChanged));

    emit(state.copyWith(
        saveResult: none(),
        doubleCheckRepository:
            state.doubleCheckRepository.copyWith(dosis: event.isChanged)));
  }

  Future<void> _onChangedObat(
    OnChangedObat event,
    Emitter<DoubleCheckState> emit,
  ) async {
    emit(state.copyWith(status: DoubleCheckStatus.isChanged));

    emit(state.copyWith(
        saveResult: none(),
        doubleCheckRepository:
            state.doubleCheckRepository.copyWith(obat: event.isChanged)));
  }

  Future<void> _onChangedCara(
    OnChangedCara event,
    Emitter<DoubleCheckState> emit,
  ) async {
    emit(state.copyWith(status: DoubleCheckStatus.isChanged));

    emit(state.copyWith(
        saveResult: none(),
        doubleCheckRepository:
            state.doubleCheckRepository.copyWith(cara: event.isChanged)));
  }

  Future<void> _onChangedWaktu(
    OnChangedWaktu event,
    Emitter<DoubleCheckState> emit,
  ) async {
    emit(state.copyWith(status: DoubleCheckStatus.isChanged));

    emit(state.copyWith(
        saveResult: none(),
        doubleCheckRepository:
            state.doubleCheckRepository.copyWith(waktu: event.isChanged)));
  }

  Future<void> _onChangedInformasi(
    OnChangedInformasi event,
    Emitter<DoubleCheckState> emit,
  ) async {
    emit(state.copyWith(status: DoubleCheckStatus.isChanged));

    emit(state.copyWith(
        saveResult: none(),
        doubleCheckRepository:
            state.doubleCheckRepository.copyWith(informasi: event.isChanged)));
  }

  Future<void> _onChangedDokumentasi(
    OnChangedDokumentasi event,
    Emitter<DoubleCheckState> emit,
  ) async {
    emit(state.copyWith(status: DoubleCheckStatus.isChanged));

    emit(state.copyWith(
        saveResult: none(),
        doubleCheckRepository: state.doubleCheckRepository
            .copyWith(dokumentasi: event.isChanged)));
  }

  Future<void> _onChangedKeterangan(
    OnChangedKeterangan event,
    Emitter<DoubleCheckState> emit,
  ) async {
    emit(state.copyWith(status: DoubleCheckStatus.isChanged));

    emit(state.copyWith(
        saveResult: none(),
        doubleCheckRepository: state.doubleCheckRepository
            .copyWith(keterangan: event.keterangan)));
  }
}
