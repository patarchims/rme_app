import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/models/asuhan_keperawatan/deskripsi_siki_model.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/services/library_services.dart';

part 'selection_siki_event.dart';
part 'selection_siki_state.dart';

class SelectionSikiBloc extends Bloc<SelectionSikiEvent, SelectionSikiState> {
  SelectionSikiBloc() : super(SelectionSikiState.initial()) {
    on<SelectionSikiEvent>((event, emit) {});
    on<OnGetDeskripsiSikiEvent>(_onGetDeskripsi);
    on<OnCheclistResikoJatuh>(_onChecklistDeskripsi);
  }

  Future<void> _onGetDeskripsi(
    OnGetDeskripsiSikiEvent event,
    Emitter<SelectionSikiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: SelectionSikiStatus.loading,
        getData: none(),
        deskripsi: state.deskripsi));

    final data = await libraryService.getDeskripsiSIKI(siki: event.siki);

    data.fold(
        (l) => l.maybeMap(
            orElse: () {},
            failure: (e) {
              emit(state.copyWith(
                status: SelectionSikiStatus.error,
                getData: none(),
                deskripsi: [],
              ));
            }),
        (r) => r.maybeMap(
            orElse: () {},
            emty: (e) {
              // JIKA KOSONG
              emit(state.copyWith(
                status: SelectionSikiStatus.loaded,
                getData: none(),
                deskripsi: [],
              ));
            },
            loaded: (e) {
              // AMBIL DATA
              // LAKUKAN MAPPING
              try {
                List<DeskripsiSikiModel> data =
                    (e.value['response'] as Iterable)
                        .map((e) => DeskripsiSikiModel.fromJson(e))
                        .toList();

                // GET DESKRIPSI SIKI
                emit(state.copyWith(
                  status: SelectionSikiStatus.loaded,
                  getData: none(),
                  deskripsi: data,
                ));
              } catch (e) {
                emit(state.copyWith(
                  status: SelectionSikiStatus.loaded,
                  getData: none(),
                  deskripsi: [],
                ));
              }
            }));
  }

  Future<void> _onChecklistDeskripsi(
    OnCheclistResikoJatuh event,
    Emitter<SelectionSikiState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: SelectionSikiStatus.initial,
        getData: none(),
        deskripsi: state.deskripsi));

    List<DeskripsiSikiModel> newDeskripsi = state.deskripsi;

    if (event.katergori == "Observasi") {
      newDeskripsi[event.sikiIndex].observasi![event.deskripsiIndex] =
          event.deskripsi;
    }

    if (event.katergori == "Terapeutik") {
      newDeskripsi[event.sikiIndex].terapetutik![event.deskripsiIndex] =
          event.deskripsi;
    }

    if (event.katergori == "Edukasi") {
      newDeskripsi[event.sikiIndex].edukasi![event.deskripsiIndex] =
          event.deskripsi;
    }
    if (event.katergori == "Kolaborasi") {
      newDeskripsi[event.sikiIndex].kolaborasi![event.deskripsiIndex] =
          event.deskripsi;
    }

    emit(state.copyWith(
        status: SelectionSikiStatus.loaded, deskripsi: newDeskripsi));
  }
}
