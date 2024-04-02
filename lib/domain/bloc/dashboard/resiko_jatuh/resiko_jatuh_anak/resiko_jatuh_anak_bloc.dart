import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import '../../../../network/api_failure_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:hms_app/domain/models/resiko_jatuh/resiko_jatuh_pasien_model.dart';
import 'package:hms_app/domain/repository/librari/librari_repository.dart';
import 'package:injectable/injectable.dart';

part 'resiko_jatuh_anak_event.dart';
part 'resiko_jatuh_anak_state.dart';

@injectable
class ResikoJatuhAnakBloc
    extends Bloc<ResikoJatuhAnakEvent, ResikoJatuhAnakState> {
  final LibrariRepositori librariRepositori;
  ResikoJatuhAnakBloc(this.librariRepositori)
      : super(ResikoJatuhAnakState.initial()) {
    on<ResikoJatuhAnakEvent>((event, emit) {});
    on<OnGetResikoJatuhAnak>(_onGetResikoJatuhAnak);
    on<OnCheclistResikoJatuhAnak>(_onChangedChecklisAnak);
    on<OnSaveResikoJatuhAnak>(_onSaveResikoJatuhPasien);
  }

  Future<void> _onGetResikoJatuhAnak(
    OnGetResikoJatuhAnak event,
    Emitter<ResikoJatuhAnakState> emit,
  ) async {
    emit(state.copyWith(status: ResikoJatuhAnakStatus.loading));

    // GET RESIKO JATUH ANAK
    final data = await librariRepositori.getRisikoJatuh(
        kategori: "Anak", jenis: "Assesmen");

    data.fold(
        (l) => l.maybeMap(
            orElse: () {},
            failure: (e) {
              return emit(state.copyWith(
                  status: ResikoJatuhAnakStatus.error, resikoJatuh: []));
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
                    status: ResikoJatuhAnakStatus.loaded, resikoJatuh: data));
              } catch (e) {
                return emit(state.copyWith(
                    status: ResikoJatuhAnakStatus.error, resikoJatuh: []));
              }
              // LOADED
            }));
  }

  // ========================== ON SAVE RESIKO JATUH PASIEN
  Future<void> _onSaveResikoJatuhPasien(
    OnSaveResikoJatuhAnak event,
    Emitter<ResikoJatuhAnakState> emit,
  ) async {
    emit(state.copyWith(
        status: ResikoJatuhAnakStatus.isLoadingSave,
        resikoJatuh: state.resikoJatuh,
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
        status: ResikoJatuhAnakStatus.loaded,
        resikoJatuh: state.resikoJatuh,
        saveData: optionOf(saveData)));

    emit(state.copyWith(
        status: ResikoJatuhAnakStatus.loaded,
        resikoJatuh: state.resikoJatuh,
        saveData: none()));
  }

  Future<void> _onChangedChecklisAnak(
    OnCheclistResikoJatuhAnak event,
    Emitter<ResikoJatuhAnakState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
      status: ResikoJatuhAnakStatus.loaded,
      resikoJatuh: state.resikoJatuh,
    ));

    List<ResikoJatuhPasienModel> newResikoJatuh;
    newResikoJatuh = state.resikoJatuh;

    newResikoJatuh[event.faktorIndex - 1]
        .resikoJatuh[event.resikoJatuhIndex - 1] = event.resikoJatuh;

    emit(state.copyWith(
        status: ResikoJatuhAnakStatus.initial,
        resikoJatuh: newResikoJatuh,
        saveData: none()));

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
        status: ResikoJatuhAnakStatus.onSelected,
        resikoJatuh: newResikoJatuh,
        saveData: none(),
        total: totals));
  }
}
