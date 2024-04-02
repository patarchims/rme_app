import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import '../../../../network/api_failure_handler.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/models/resiko_jatuh/resiko_jatuh_model.dart';
import 'package:hms_app/domain/models/resiko_jatuh/resiko_jatuh_pasien_model.dart';
import 'package:hms_app/domain/repository/librari/librari_repository.dart';
import 'package:injectable/injectable.dart';

part 'resiko_jatuh_event.dart';
part 'resiko_jatuh_state.dart';

@injectable
class ResikoJatuhBloc extends Bloc<ResikoJatuhEvent, ResikoJatuhState> {
  final LibrariRepositori librariRepositori;
  ResikoJatuhBloc(this.librariRepositori) : super(ResikoJatuhState.initial()) {
    // ====
    on<ResikoJatuhEvent>((event, emit) {});
    on<OnCheclistResikoJatuh>(_onChangedChecklis);
    on<OnGetIntervensiResiko>(_onGetIntervensiResiko);
    on<OnCheckIntervensiResikoJatuh>(_onChecListIntervensiResiko);
    on<OnChangeShiftResikoJatuh>(_onChangeSiftResikoJatuh);
    on<OnSaveIntervensiResikoJatuh>(_onSaveIntervensiResikoJatuhPasien);
    on<OnClearCheckListResikoJatuh>(_onClearResikoJatuh);
  }

  Future<void> _onChangedChecklis(
    OnCheclistResikoJatuh event,
    Emitter<ResikoJatuhState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
      status: ResikoJatuhStatus.initial,
      intervensi: state.intervensi,
    ));

    List<IntervensiModel> newIntervensi = state.intervensi;

    newIntervensi[event.invervensiIndex]
        .subIntervensi[event.subIntervensiIndex] = event.subIntervensi;

    emit(state.copyWith(
        status: ResikoJatuhStatus.loaded, intervensi: newIntervensi));
  }

  Future<void> _onChangeSiftResikoJatuh(
    OnChangeShiftResikoJatuh event,
    Emitter<ResikoJatuhState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
      status: ResikoJatuhStatus.initial,
      intervensi: state.intervensi,
    ));

    emit(state.copyWith(
        status: ResikoJatuhStatus.loaded,
        resikoJatuh: state.resikoJatuh,
        saveData: none(),
        shiftSelected: event.value));
  }

  Future<void> _onClearResikoJatuh(
    OnClearCheckListResikoJatuh event,
    Emitter<ResikoJatuhState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
      status: ResikoJatuhStatus.initial,
      intervensi: state.intervensi,
      shiftSelected: state.shiftSelected,
    ));

    // GET RESIKO JATUH ANAK
    // final data = await librariRepositori.getRisikoJatuh(
    //     kategori: "Dewasa", jenis: "Intervensi");

    log("GET RESIKO JATUH ANAK");
    await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(
        shiftSelected: state.shiftSelected,
        status: ResikoJatuhStatus.loaded,
        resikoJatuh: resikoJatuhPasien));
  }

  Future<void> _onChecListIntervensiResiko(
    OnCheckIntervensiResikoJatuh event,
    Emitter<ResikoJatuhState> emit,
  ) async {
    // REPLACE LIST ON LIST

    // REPLACE LIST ON LIST
    emit(state.copyWith(
      status: ResikoJatuhStatus.loaded,
      resikoJatuh: state.resikoJatuh,
    ));

    List<ResikoJatuhPasienModel> newResikoJatuh;
    newResikoJatuh = state.resikoJatuh;

    newResikoJatuh[event.faktorIndex].resikoJatuh[event.resikoJatuhIndex] =
        event.resikoJatuh;

    emit(state.copyWith(
      status: ResikoJatuhStatus.onSelected,
      resikoJatuh: newResikoJatuh,
      shiftSelected: state.shiftSelected,
      saveData: none(),
    ));
  }

  Future<void> _onGetIntervensiResiko(
    OnGetIntervensiResiko event,
    Emitter<ResikoJatuhState> emit,
  ) async {
    // REPLACE LIST ON LIST

    List<int> pagi = [8, 9, 10, 11, 12, 13, 14];
    List<int> sore = [15, 16, 17, 18, 19, 20];

    String greeting() {
      var hour = DateTime.now().hour;
      if (pagi.contains(hour)) {
        return "Pagi";
      }

      if (sore.contains(hour)) {
        return 'Sore';
      }

      return 'Malam';
    }

    emit(state.copyWith(
        status: ResikoJatuhStatus.initial,
        intervensi: [],
        shiftSelected: greeting()));

    // GET RESIKO JATUH ANAK
    final data = await librariRepositori.getRisikoJatuh(
        kategori: "Dewasa", jenis: "Intervensi");

    log("GET RESIKO JATUH ANAK");

    data.fold(
        (l) => l.maybeMap(
            orElse: () {},
            failure: (e) {
              return emit(state
                  .copyWith(status: ResikoJatuhStatus.error, intervensi: []));
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
                    shiftSelected: greeting(),
                    status: ResikoJatuhStatus.loaded,
                    resikoJatuh: data));
              } catch (e) {
                return emit(state.copyWith(
                    shiftSelected: greeting(),
                    status: ResikoJatuhStatus.error,
                    resikoJatuh: []));
              }
            }));
  }

  Future<void> _onSaveIntervensiResikoJatuhPasien(
    OnSaveIntervensiResikoJatuh event,
    Emitter<ResikoJatuhState> emit,
  ) async {
    emit(state.copyWith(
      status: ResikoJatuhStatus.isLoadingSave,
      resikoJatuh: state.resikoJatuh,
    ));

    // SAVE DATA
    final saveData = await librariRepositori.saveIntervensiRisikoJatuhPasien(
        resikoJatuh: state.resikoJatuh,
        shift: event.shift,
        noreg: event.noReg,
        person: event.person,
        kategori: event.kategori,
        deviceID: event.deviceID,
        pelayanan: event.pelayanan);

    log("SIMPAN DATA");

    log(saveData.toString());

    emit(state.copyWith(
        status: ResikoJatuhStatus.loading,
        resikoJatuh: state.resikoJatuh,
        saveData: optionOf(saveData)));

    emit(state.copyWith(
        status: ResikoJatuhStatus.loaded,
        resikoJatuh: state.resikoJatuh,
        saveData: none()));
  }
}
