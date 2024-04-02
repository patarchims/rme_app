import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/models/asuhan_keperawatan/deskripsi_luaran_siki_model.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/services/library_services.dart';

part 'deskripsi_luaran_slki_event.dart';
part 'deskripsi_luaran_slki_state.dart';

class DeskripsiLuaranSlkiBloc
    extends Bloc<DeskripsiLuaranSlkiEvent, DeskripsiLuaranSlkiState> {
  DeskripsiLuaranSlkiBloc() : super(DeskripsiLuaranSlkiState.initial()) {
    on<DeskripsiLuaranSlkiEvent>((event, emit) {});
    on<OnGetDeskripsiLuaranSikiEvent>(_onGetDeskripsiLuaranSiki);
    on<OnSelectedSLKIEvent>(_onSelectedKriteriaSLKI);
    on<OnSelectionTargetEvent>(_onSelectionTarget);
    on<OnSelectionSikiEvent>(_onSelectionSiki);
    on<OnSelectionWaktuEvent>(_onSelectionWaktu);
    on<OnSaveDataEvent>(_onSaveData);
  }

  Future<void> _onGetDeskripsiLuaranSiki(
    OnGetDeskripsiLuaranSikiEvent event,
    Emitter<DeskripsiLuaranSlkiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        onSaveData: none(),
        status: DeskripsiLuaranSlkiStatus.loading,
        deskripsiLuaranSikiModel: state.deskripsiLuaranSikiModel));

    final data = await libraryService.onGetDeskripsiDiagnosaKeperawatan(
        kodeDiagnosa: event.diagnosa);

    // LAKUKAN PARSING DATA
    data.fold(
        (l) => l.maybeMap(
              orElse: () {
                return emit(state.copyWith(
                    onSaveData: none(),
                    status: DeskripsiLuaranSlkiStatus.error,
                    deskripsiLuaranSikiModel: state.deskripsiLuaranSikiModel));
              },
            ),
        (r) => r.maybeMap(
            orElse: () {},
            emty: (e) {
              return emit(state.copyWith(
                  onSaveData: none(),
                  status: DeskripsiLuaranSlkiStatus.error,
                  deskripsiLuaranSikiModel: state.deskripsiLuaranSikiModel));
            },
            loaded: (e) {
              log("loade data");
              log(e.value.toString());
              // LOADED DATA
              try {
                DeskripsiLuaranSikiModel data =
                    DeskripsiLuaranSikiModel.fromJson(e.value["response"]);

                return emit(state.copyWith(
                    onSaveData: none(),
                    status: DeskripsiLuaranSlkiStatus.loaded,
                    deskripsiLuaranSikiModel: data));
              } catch (e) {
                return emit(state.copyWith(
                    onSaveData: none(),
                    status: DeskripsiLuaranSlkiStatus.error,
                    deskripsiLuaranSikiModel: state.deskripsiLuaranSikiModel));
              }
            }));
  }

  Future<void> _onSelectedKriteriaSLKI(
    OnSelectedSLKIEvent event,
    Emitter<DeskripsiLuaranSlkiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        onSaveData: none(),
        status: DeskripsiLuaranSlkiStatus.initial,
        deskripsiLuaranSikiModel: state.deskripsiLuaranSikiModel));

    DeskripsiLuaranSikiModel newDeskripsi = state.deskripsiLuaranSikiModel;

    if (event.kategori == Kategori.memburuk) {
      newDeskripsi.slki[event.indexSLKI].memburuk[event.indexKriteriaSlki] =
          event.kriteriaSlki;

      emit(state.copyWith(
          onSaveData: none(),
          status: DeskripsiLuaranSlkiStatus.loaded,
          deskripsiLuaranSikiModel: newDeskripsi));
    }

    if (event.kategori == Kategori.meningkat) {
      newDeskripsi.slki[event.indexSLKI].meningkat[event.indexKriteriaSlki] =
          event.kriteriaSlki;

      emit(state.copyWith(
          onSaveData: none(),
          status: DeskripsiLuaranSlkiStatus.loaded,
          deskripsiLuaranSikiModel: newDeskripsi));
    }

    if (event.kategori == Kategori.menurun) {
      newDeskripsi.slki[event.indexSLKI].menurun[event.indexKriteriaSlki] =
          event.kriteriaSlki;

      emit(state.copyWith(
          onSaveData: none(),
          status: DeskripsiLuaranSlkiStatus.loaded,
          deskripsiLuaranSikiModel: newDeskripsi));
    }
  }

  Future<void> _onSelectionTarget(
    OnSelectionTargetEvent event,
    Emitter<DeskripsiLuaranSlkiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        onSaveData: none(),
        status: DeskripsiLuaranSlkiStatus.initial,
        deskripsiLuaranSikiModel: state.deskripsiLuaranSikiModel));

    DeskripsiLuaranSikiModel newDeskripsi = state.deskripsiLuaranSikiModel;

    if (event.kategori == Kategori.memburuk) {
      newDeskripsi.slki[event.indexSLKI].memburuk[event.indexKriteriaSlki] =
          event.kriteriaSlki;

      emit(state.copyWith(
          onSaveData: none(),
          status: DeskripsiLuaranSlkiStatus.loaded,
          deskripsiLuaranSikiModel: newDeskripsi));
    }

    if (event.kategori == Kategori.meningkat) {
      newDeskripsi.slki[event.indexSLKI].meningkat[event.indexKriteriaSlki] =
          event.kriteriaSlki;

      emit(state.copyWith(
          onSaveData: none(),
          status: DeskripsiLuaranSlkiStatus.loaded,
          deskripsiLuaranSikiModel: newDeskripsi));
    }

    if (event.kategori == Kategori.menurun) {
      newDeskripsi.slki[event.indexSLKI].menurun[event.indexKriteriaSlki] =
          event.kriteriaSlki;

      emit(state.copyWith(
          onSaveData: none(),
          status: DeskripsiLuaranSlkiStatus.loaded,
          deskripsiLuaranSikiModel: newDeskripsi));
    }
  }

  Future<void> _onSelectionSiki(
    OnSelectionSikiEvent event,
    Emitter<DeskripsiLuaranSlkiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        onSaveData: none(),
        status: DeskripsiLuaranSlkiStatus.initial,
        deskripsiLuaranSikiModel: state.deskripsiLuaranSikiModel));

    DeskripsiLuaranSikiModel newDeskripsi = state.deskripsiLuaranSikiModel;

    if (event.kategori == "observasi") {
      newDeskripsi.siki[event.indexSIKI].observasi[event.noUrut - 1] =
          event.edukasi;
    }

    if (event.kategori == "terapetutik") {
      newDeskripsi.siki[event.indexSIKI].terapetutik[event.noUrut - 1] =
          event.edukasi;
    }

    if (event.kategori == "kolaborasi") {
      newDeskripsi.siki[event.indexSIKI].kolaborasi[event.noUrut - 1] =
          event.edukasi;
    }

    if (event.kategori == "edukasi") {
      newDeskripsi.siki[event.indexSIKI].edukasi[event.noUrut - 1] =
          event.edukasi;
    }

    emit(state.copyWith(
        onSaveData: none(),
        status: DeskripsiLuaranSlkiStatus.loaded,
        deskripsiLuaranSikiModel: newDeskripsi));
  }

  Future<void> _onSaveData(
    OnSaveDataEvent event,
    Emitter<DeskripsiLuaranSlkiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: DeskripsiLuaranSlkiStatus.isLoadingSave, onSaveData: none()));

    final saveData = await libraryService.onSaveAsuhanKeperawatan(
      deskripsiLuaranSikiModel: state.deskripsiLuaranSikiModel,
      deviceID: event.deviceID,
      pelayanan: event.pelayanan,
      noReg: event.noReg,
      person: event.person,
    );

    log("LAKUKAN SIMPAN DATA ASUHAN KEPERAWATAN");

    // log(saveData.toString());

    emit(state.copyWith(
        status: DeskripsiLuaranSlkiStatus.loaded,
        onSaveData: optionOf(saveData)));

    emit(state.copyWith(
        status: DeskripsiLuaranSlkiStatus.loaded, onSaveData: none()));
  }

  Future<void> _onSelectionWaktu(
    OnSelectionWaktuEvent event,
    Emitter<DeskripsiLuaranSlkiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: DeskripsiLuaranSlkiStatus.initial,
        onSaveData: none(),
        deskripsiLuaranSikiModel: state.deskripsiLuaranSikiModel));

    DeskripsiLuaranSikiModel newDeskripsi = state.deskripsiLuaranSikiModel;

    if (event.kategori == Kategori.memburuk) {
      newDeskripsi.slki[event.indexSLKI].memburuk[event.indexKriteriaSlki] =
          event.kriteriaSlki;

      emit(state.copyWith(
          status: DeskripsiLuaranSlkiStatus.loaded,
          onSaveData: none(),
          deskripsiLuaranSikiModel: newDeskripsi));
    }

    if (event.kategori == Kategori.meningkat) {
      newDeskripsi.slki[event.indexSLKI].meningkat[event.indexKriteriaSlki] =
          event.kriteriaSlki;

      emit(state.copyWith(
          status: DeskripsiLuaranSlkiStatus.loaded,
          deskripsiLuaranSikiModel: newDeskripsi));
    }

    if (event.kategori == Kategori.menurun) {
      newDeskripsi.slki[event.indexSLKI].menurun[event.indexKriteriaSlki] =
          event.kriteriaSlki;

      emit(state.copyWith(
          onSaveData: none(),
          status: DeskripsiLuaranSlkiStatus.loaded,
          deskripsiLuaranSikiModel: newDeskripsi));
    }
  }
}
