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

part 'resiko_jatuh_dewasa_event.dart';
part 'resiko_jatuh_dewasa_state.dart';

@injectable
class ResikoJatuhDewasaBloc
    extends Bloc<ResikoJatuhDewasaEvent, ResikoJatuhDewasaState> {
  final LibrariRepositori librariRepositori;
  ResikoJatuhDewasaBloc(this.librariRepositori)
      : super(ResikoJatuhDewasaState.initial()) {
    on<ResikoJatuhDewasaEvent>((event, emit) {});
    on<OnGetIntervensiResikoDewasa>(_onGetIntervensiResiko);
    on<OnCheckIntervensiResikoJatuhDewasa>(_onChecklistResikoJatuh);
    on<OnSaveResikoJatuhDewasaEvent>(_onSaveIntervensiResikoJatuhPasien);
  }

  Future<void> _onChecklistResikoJatuh(
    OnCheckIntervensiResikoJatuhDewasa event,
    Emitter<ResikoJatuhDewasaState> emit,
  ) async {
    List<ResikoJatuhPasienModel> newResikoJatuh;
    newResikoJatuh = state.resikoJatuh;

    newResikoJatuh[event.faktorIndex - 1]
        .resikoJatuh[event.resikoJatuhIndex - 1] = event.resikoJatuh;

    emit(state.copyWith(
      status: ResikoJatuhDewasaStatus.initial,
      resikoJatuh: newResikoJatuh,
      saveData: none(),
      total: state.total,
    ));

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
        status: ResikoJatuhDewasaStatus.onSelected,
        resikoJatuh: newResikoJatuh,
        saveData: none(),
        total: totals));
  }

  Future<void> _onGetIntervensiResiko(
    OnGetIntervensiResikoDewasa event,
    Emitter<ResikoJatuhDewasaState> emit,
  ) async {
    // REPLACE LIST ON LIST

    emit(state.copyWith(
        saveData: none(),
        total: state.total,
        status: ResikoJatuhDewasaStatus.initial,
        resikoJatuh: []));

    // GET RESIKO JATUH ANAK
    final data = await librariRepositori.getRisikoJatuh(
        kategori: "Dewasa", jenis: "Re Assesmen");

    data.fold(
        (l) => l.maybeMap(
            orElse: () {},
            failure: (e) {
              return emit(state.copyWith(
                  saveData: none(),
                  total: state.total,
                  status: ResikoJatuhDewasaStatus.error,
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
                    saveData: none(),
                    status: ResikoJatuhDewasaStatus.loaded,
                    total: state.total,
                    resikoJatuh: data));
              } catch (e) {
                return emit(state.copyWith(
                    saveData: none(),
                    total: state.total,
                    status: ResikoJatuhDewasaStatus.error,
                    resikoJatuh: []));
              }
            }));

    // ========================== //
  }

  Future<void> _onSaveIntervensiResikoJatuhPasien(
    OnSaveResikoJatuhDewasaEvent event,
    Emitter<ResikoJatuhDewasaState> emit,
  ) async {
    emit(state.copyWith(
      status: ResikoJatuhDewasaStatus.isLoadingSave,
      resikoJatuh: state.resikoJatuh,
      saveData: none(),
      total: state.total,
    ));
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
        status: ResikoJatuhDewasaStatus.loading,
        total: state.total,
        resikoJatuh: state.resikoJatuh,
        saveData: optionOf(saveData)));

    emit(state.copyWith(
        total: state.total,
        status: ResikoJatuhDewasaStatus.loaded,
        resikoJatuh: state.resikoJatuh,
        saveData: none()));
  }
}
