import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/models/resiko_jatuh/resiko_jatuh_pasien_model.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/repository/librari/librari_repository.dart';
import 'package:injectable/injectable.dart';

part 'reassesmen_resiko_jatuh_event.dart';
part 'reassesmen_resiko_jatuh_state.dart';

@injectable
class ReassesmenResikoJatuhBloc
    extends Bloc<ReassesmenResikoJatuhEvent, ReassesmenResikoJatuhState> {
  final LibrariRepositori librariRepositori;
  ReassesmenResikoJatuhBloc(this.librariRepositori)
      : super(ReassesmenResikoJatuhState.initial()) {
    on<ReassesmenResikoJatuhEvent>((event, emit) {});
    on<OnGetReAsesmenResikoJatuh>(_onGetResikoJatuhAnak);
    on<OnCheclistReAsesmenResikoJatuh>(_onChangedChecklisReAssesment);
    on<OnSaveReAssesmenResikoJatuh>(_onSaveResikoJatuhPasien);
  }

  Future<void> _onGetResikoJatuhAnak(
    OnGetReAsesmenResikoJatuh event,
    Emitter<ReassesmenResikoJatuhState> emit,
  ) async {
    emit(state.copyWith(
        status: ReassesmenResikoJatuhStatus.loading,
        total: state.total,
        saveData: none(),
        resikoJatuh: []));

    // GET RESIKO JATUH ANAK
    final data = await librariRepositori.getRisikoJatuh(
        kategori: "Dewasa", jenis: "Morse");

    data.fold(
        (l) => l.maybeMap(
            orElse: () {},
            failure: (e) {
              return emit(state.copyWith(
                  total: state.total,
                  saveData: none(),
                  status: ReassesmenResikoJatuhStatus.error,
                  resikoJatuh: []));
            }),
        (r) => r.maybeMap(
            orElse: () {},
            loaded: (e) {
              try {
                List<ResikoJatuhPasienModel> data =
                    (e.value['response'] as Iterable)
                        .map((e) => ResikoJatuhPasienModel.fromJson(e))
                        .toList();

                return emit(state.copyWith(
                    total: state.total,
                    saveData: none(),
                    status: ReassesmenResikoJatuhStatus.loaded,
                    resikoJatuh: data));
              } catch (e) {
                return emit(state.copyWith(
                    total: state.total,
                    saveData: none(),
                    status: ReassesmenResikoJatuhStatus.error,
                    resikoJatuh: []));
              }
            }));
  }

  // ========================== ON SAVE RESIKO JATUH PASIEN
  Future<void> _onSaveResikoJatuhPasien(
    OnSaveReAssesmenResikoJatuh event,
    Emitter<ReassesmenResikoJatuhState> emit,
  ) async {
    emit(state.copyWith(
        status: ReassesmenResikoJatuhStatus.isLoadingSave,
        resikoJatuh: state.resikoJatuh,
        total: state.total,
        saveData: none()));

    // ====   === //
    final saveData = await librariRepositori.saveResikoJatuhPasien(
        resikoJatuh: state.resikoJatuh,
        noreg: event.noreg,
        person: event.person,
        kategori: event.kategori,
        deviceID: event.deviceID,
        skor: event.skor,
        jenis: event.jenis,
        pelayanan: event.pelayanan);

    emit(state.copyWith(
        status: ReassesmenResikoJatuhStatus.loaded,
        resikoJatuh: state.resikoJatuh,
        total: state.total,
        saveData: optionOf(saveData)));

    emit(state.copyWith(
        status: ReassesmenResikoJatuhStatus.loaded,
        resikoJatuh: state.resikoJatuh,
        total: state.total,
        saveData: none()));
  }

  Future<void> _onChangedChecklisReAssesment(
    OnCheclistReAsesmenResikoJatuh event,
    Emitter<ReassesmenResikoJatuhState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: ReassesmenResikoJatuhStatus.loaded,
        resikoJatuh: state.resikoJatuh,
        total: state.total,
        saveData: none()));

    List<ResikoJatuhPasienModel> newResikoJatuh;
    newResikoJatuh = state.resikoJatuh;

    newResikoJatuh[event.faktorIndex - 1]
        .resikoJatuh[event.resikoJatuhIndex - 1] = event.resikoJatuh;

    emit(state.copyWith(
        status: ReassesmenResikoJatuhStatus.initial,
        saveData: none(),
        total: state.total,
        resikoJatuh: newResikoJatuh));

    var dat = newResikoJatuh[event.faktorIndex - 1]
        .resikoJatuh
        .where((e) => e.isEnable == true && e != event.resikoJatuh);

    if (dat.isNotEmpty) {
      newResikoJatuh[event.faktorIndex - 1].resikoJatuh[dat.first.noUrut - 1] =
          dat.first.copyWith(isEnable: false);
    }

    int totals = 0;

    log("HITUNG SEMUA TOTAL YANG DIPILIH");
    for (final entry in state.resikoJatuh) {
      for (final data in entry.resikoJatuh) {
        if (data.isEnable == true) {
          totals = totals + data.skor;
        }
      }
    }

    log(totals.toString());

    emit(state.copyWith(
        saveData: none(),
        status: ReassesmenResikoJatuhStatus.onSelected,
        resikoJatuh: newResikoJatuh,
        total: totals));
  }
}
