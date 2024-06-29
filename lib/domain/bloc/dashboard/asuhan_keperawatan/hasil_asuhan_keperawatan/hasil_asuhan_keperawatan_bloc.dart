import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/models/asuhan_keperawatan/hasil_asuhan_keperawatan_model.dart';
import 'package:hms_app/domain/models/asuhan_keperawatan/resume_keperawatan_model.dart';
import 'package:hms_app/domain/models/asuhan_keperawatan/tindakan_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/services/library_services.dart';
import 'package:hms_app/fitur/action_cppt/services/action_service.dart';

part 'hasil_asuhan_keperawatan_event.dart';
part 'hasil_asuhan_keperawatan_state.dart';

class HasilAsuhanKeperawatanBloc
    extends Bloc<HasilAsuhanKeperawatanEvent, HasilAsuhanKeperawatanState> {
  HasilAsuhanKeperawatanBloc() : super(HasilAsuhanKeperawatanState.initial()) {
    on<HasilAsuhanKeperawatanEvent>((event, emit) {});
    on<OnGetTindakanKeperawatan>(_onGetTindakanKeperawatan);
    on<OnGetHasilAsuhanKeperawatanEvent>(_onGetHasilAsuhanKeperawatan);
    on<OnSelectionHasilEvent>(_onSelectionHasil);
    on<OnSaveIntervensiEvent>(_onSaveIntervensi);
    on<OnUpdateStatusHasilEvent>(_onUpdateStatusDaskep);
    on<OnDeleteAsuhanKeperawatanEvent>(_onDeleteAsuhanKeperawatanEvent);
    on<OnSaveIntervensiEventV2>(_onSaveIntervensiV2);
    on<OnGetHasilAsuhanKeperawatanStatusClosedEvent>(
        _onGetHasilKeperawatanStatusClosed);
    on<OnSaveActionKeperawatan>(_onSaveActionKeperawatan);
    on<OnGetResumeKeperawatanEvent>(_onGetResumeKeperawatan);
  }

  // ON GET TINDAKAN
  Future<void> _onGetTindakanKeperawatan(
    OnGetTindakanKeperawatan event,
    Emitter<HasilAsuhanKeperawatanState> emit,
  ) async {
    try {
      emit(state.copyWith(
        getData: none(),
        hasilAsuhanKeperawatanModel: state.hasilAsuhanKeperawatanModel,
        saveData: none(),
        deleteData: none(),
        status: HasilAsuhanStatus.isLoadingGetTindakan,
      ));

      final saveData =
          await actionServices.onGetTindakan(noAskep: event.noAskep);

      List<TindakanModel> datas = (saveData['response'] as Iterable)
          .map((e) => TindakanModel.fromJson(e))
          .toList();

      emit(state.copyWith(
        getData: none(),
        hasilAsuhanKeperawatanModel: state.hasilAsuhanKeperawatanModel,
        saveData: none(),
        deleteData: none(),
        onUpdate: none(),
        onSaveActionKeperawatan: none(),
        listTindakanModel: datas,
        status: HasilAsuhanStatus.loaded,
      ));
    } catch (e) {
      emit(state.copyWith(
        getData: none(),
        hasilAsuhanKeperawatanModel: state.hasilAsuhanKeperawatanModel,
        saveData: none(),
        deleteData: none(),
        onUpdate: none(),
        listTindakanModel: [],
        onSaveActionKeperawatan: none(),
        status: HasilAsuhanStatus.loaded,
      ));
    }
  }

  // SIMPAN ACTION KEPERAWATAN
  Future<void> _onSaveActionKeperawatan(
    OnSaveActionKeperawatan event,
    Emitter<HasilAsuhanKeperawatanState> emit,
  ) async {
    try {
      emit(state.copyWith(
        getData: none(),
        hasilAsuhanKeperawatanModel: state.hasilAsuhanKeperawatanModel,
        saveData: none(),
        deleteData: none(),
        status: HasilAsuhanStatus.isLoadingAction,
      ));

      final saveData = await actionServices.onSaveActionCppt(
          noAskep: event.noAskep, deskripsi: event.deskripsi);

      emit(state.copyWith(
        getData: none(),
        hasilAsuhanKeperawatanModel: state.hasilAsuhanKeperawatanModel,
        saveData: none(),
        deleteData: none(),
        onUpdate: none(),
        onSaveActionKeperawatan: optionOf(saveData),
        status: HasilAsuhanStatus.loaded,
      ));

      emit(state.copyWith(
        getData: none(),
        hasilAsuhanKeperawatanModel: state.hasilAsuhanKeperawatanModel,
        saveData: none(),
        deleteData: none(),
        onUpdate: none(),
        onSaveActionKeperawatan: none(),
        status: HasilAsuhanStatus.loaded,
      ));
    } catch (e) {
      emit(state.copyWith(
        getData: none(),
        hasilAsuhanKeperawatanModel: state.hasilAsuhanKeperawatanModel,
        saveData: none(),
        deleteData: none(),
        onUpdate: none(),
        onSaveActionKeperawatan: none(),
        status: HasilAsuhanStatus.loaded,
      ));
    }
  }

  Future<void> _onGetHasilAsuhanKeperawatan(
    OnGetHasilAsuhanKeperawatanEvent event,
    Emitter<HasilAsuhanKeperawatanState> emit,
  ) async {
    emit(state.copyWith(
        getData: none(),
        hasilAsuhanKeperawatanModel: state.hasilAsuhanKeperawatanModel,
        saveData: none(),
        deleteData: none(),
        status: HasilAsuhanStatus.loading));

    final getData = await libraryService.onGetHasilAsuhanKeperawatan(
        noReg: event.noReg, status: event.status);

    // LAKUKAN PARSING DATA
    getData.fold(
        (l) => l.maybeMap(
            orElse: () {},
            failure: (e) {
              emit(state.copyWith(
                  saveData: none(),
                  hasilAsuhanKeperawatanModel: [],
                  getData:
                      optionOf(left(ApiFailureResult.failure(meta: e.meta))),
                  status: HasilAsuhanStatus.emty));
              emit(state.copyWith(
                  getData: none(),
                  hasilAsuhanKeperawatanModel: [],
                  saveData: none(),
                  status: HasilAsuhanStatus.emty));
            }),
        (r) => r.maybeMap(
            orElse: () {},
            emty: (e) {
              emit(state.copyWith(
                  getData: none(),
                  hasilAsuhanKeperawatanModel: [],
                  saveData: none(),
                  status: HasilAsuhanStatus.emty));
            },
            loaded: (e) {
              // LAODED DATA
              try {
                // LAKUKAN PARSING DATA

                List<HasilAsuhanKeperawatanModel> data =
                    (e.value['response'] as Iterable)
                        .map((e) => HasilAsuhanKeperawatanModel.fromJson(e))
                        .toList();

                emit(state.copyWith(
                    getData: none(),
                    hasilAsuhanKeperawatanModel: data,
                    saveData: none(),
                    status: HasilAsuhanStatus.loaded));
              } catch (e) {
                emit(state.copyWith(
                    saveData: none(),
                    hasilAsuhanKeperawatanModel: [],
                    getData: optionOf(left(const ApiFailureResult.failure(
                        meta: MetaModel(
                            code: 201, message: "Gagal mendapatkan data")))),
                    status: HasilAsuhanStatus.emty));
              }
            }));
  }

  Future<void> _onGetResumeKeperawatan(
    OnGetResumeKeperawatanEvent event,
    Emitter<HasilAsuhanKeperawatanState> emit,
  ) async {
    emit(state.copyWith(
        getData: none(),
        hasilAsuhanKeperawatanModel: state.hasilAsuhanKeperawatanModel,
        resumeKeperawatan: [],
        saveData: none(),
        deleteData: none(),
        status: HasilAsuhanStatus.loading));

    try {
      final getData = await libraryService.onGetResumeKeperawatan(
          noReg: event.noReg, status: event.status);

      List<ResumeKeperawatan> data = (getData['response'] as Iterable)
          .map((e) => ResumeKeperawatan.fromJson(e))
          .toList();

      emit(state.copyWith(
        getData: none(),
        hasilAsuhanKeperawatanModel: state.hasilAsuhanKeperawatanModel,
        resumeKeperawatan: data,
        saveData: none(),
        deleteData: none(),
        status: HasilAsuhanStatus.loadedStatus,
      ));
    } catch (e) {
      emit(state.copyWith(
          getData: none(),
          hasilAsuhanKeperawatanModel: state.hasilAsuhanKeperawatanModel,
          resumeKeperawatan: [],
          saveData: none(),
          deleteData: none(),
          status: HasilAsuhanStatus.loaded));
    }
  }

  Future<void> _onGetHasilKeperawatanStatusClosed(
    OnGetHasilAsuhanKeperawatanStatusClosedEvent event,
    Emitter<HasilAsuhanKeperawatanState> emit,
  ) async {
    emit(state.copyWith(
        getData: none(),
        deleteData: none(),
        hasilAsuhanKeperawatanModel: state.hasilAsuhanKeperawatanModel,
        saveData: none(),
        status: HasilAsuhanStatus.loading));

    final getData = await libraryService.onGetHasilAsuhanKeperawatan(
        noReg: event.noReg, status: "Closed");

    // LAKUKAN PARSING DATA
    getData.fold(
        (l) => l.maybeMap(
            orElse: () {},
            failure: (e) {
              emit(state.copyWith(
                  saveData: none(),
                  hasilAsuhanKeperawatanModel: [],
                  getData:
                      optionOf(left(ApiFailureResult.failure(meta: e.meta))),
                  status: HasilAsuhanStatus.emty));
              // ======= == ====== //
              emit(state.copyWith(
                  getData: none(),
                  hasilAsuhanKeperawatanModel: [],
                  saveData: none(),
                  status: HasilAsuhanStatus.emty));
            }),
        (r) => r.maybeMap(orElse: () {
              emit(state.copyWith(
                  getData: none(),
                  hasilAsuhanKeperawatanModel: [],
                  saveData: none(),
                  status: HasilAsuhanStatus.emty));
            }, emty: (e) {
              emit(state.copyWith(
                  getData: none(),
                  hasilAsuhanKeperawatanModel: [],
                  saveData: none(),
                  status: HasilAsuhanStatus.emty));
            }, loaded: (e) {
              // LAODED DATA
              try {
                // LAKUKAN PARSING DATA
                List<HasilAsuhanKeperawatanModel> data =
                    (e.value['response'] as Iterable)
                        .map((e) => HasilAsuhanKeperawatanModel.fromJson(e))
                        .toList();

                // log("DAPATKAN  DATA ");

                emit(state.copyWith(
                    getData: none(),
                    hasilAsuhanKeperawatanModel: data,
                    saveData: none(),
                    status: HasilAsuhanStatus.loadedStatus));
              } catch (e) {
                emit(state.copyWith(
                    saveData: none(),
                    hasilAsuhanKeperawatanModel: [],
                    getData: optionOf(left(const ApiFailureResult.failure(
                        meta: MetaModel(
                            code: 201, message: "Gagal mendapatkan data")))),
                    status: HasilAsuhanStatus.emty));
              }
            }));
  }

  Future<void> _onDeleteAsuhanKeperawatanEvent(
    OnDeleteAsuhanKeperawatanEvent event,
    Emitter<HasilAsuhanKeperawatanState> emit,
  ) async {
    // ====== //
    emit(state.copyWith(
        getData: none(),
        hasilAsuhanKeperawatanModel: state.hasilAsuhanKeperawatanModel,
        deleteData: none(),
        status: HasilAsuhanStatus.isLoadingDelete));

    try {
      final delete = await libraryService.onDeleteAsuhanKeperawatan(
          noDaskep: event.noDaskep);

      emit(state.copyWith(
          getData: none(),
          hasilAsuhanKeperawatanModel: state.hasilAsuhanKeperawatanModel,
          deleteData: optionOf(delete),
          status: HasilAsuhanStatus.loaded));

      // === //
      emit(state.copyWith(
          getData: none(),
          hasilAsuhanKeperawatanModel: state.hasilAsuhanKeperawatanModel,
          deleteData: none(),
          status: HasilAsuhanStatus.loaded));

      // === //
    } catch (e) {
      emit(state.copyWith(
          getData: none(),
          hasilAsuhanKeperawatanModel: state.hasilAsuhanKeperawatanModel,
          deleteData: none(),
          status: HasilAsuhanStatus.loaded));
    }
  }

  Future<void> _onSelectionHasil(
    OnSelectionHasilEvent event,
    Emitter<HasilAsuhanKeperawatanState> emit,
  ) async {
    emit(state.copyWith(
        getData: none(),
        hasilAsuhanKeperawatanModel: state.hasilAsuhanKeperawatanModel,
        saveData: none(),
        deleteData: none(),
        status: HasilAsuhanStatus.loaded));

    List<HasilAsuhanKeperawatanModel> newDeskripsi =
        state.hasilAsuhanKeperawatanModel;

    newDeskripsi[event.indexDiagnosa].deskripsiSlki[event.indexDeskripsiSiki] =
        event.deskripsiSlki;

    emit(state.copyWith(
        getData: none(),
        deleteData: none(),
        hasilAsuhanKeperawatanModel: newDeskripsi,
        saveData: none(),
        status: HasilAsuhanStatus.onSelected));
  }

  Future<void> _onSaveIntervensi(
    OnSaveIntervensiEvent event,
    Emitter<HasilAsuhanKeperawatanState> emit,
  ) async {
    emit(state.copyWith(
        getData: none(),
        hasilAsuhanKeperawatanModel: state.hasilAsuhanKeperawatanModel,
        saveData: none(),
        deleteData: none(),
        status: HasilAsuhanStatus.loading));

    // LAKUKAN SIMPAN DATA
    final saveData = await libraryService.onSaveDataDaskepSLKI(
      noDaskep: event.noDaskep,
      hasil: event.hasil,
      idKriteria: event.idKriteria,
      kodeSLKI: event.kodeSLKI,
    );

    emit(state.copyWith(
        getData: none(),
        deleteData: none(),
        hasilAsuhanKeperawatanModel: state.hasilAsuhanKeperawatanModel,
        saveData: optionOf(saveData),
        status: HasilAsuhanStatus.loaded));

    emit(state.copyWith(
        getData: none(),
        deleteData: none(),
        hasilAsuhanKeperawatanModel: state.hasilAsuhanKeperawatanModel,
        saveData: none(),
        status: HasilAsuhanStatus.loaded));
  }

  Future<void> _onSaveIntervensiV2(
    OnSaveIntervensiEventV2 event,
    Emitter<HasilAsuhanKeperawatanState> emit,
  ) async {
    emit(state.copyWith(
      saveAllDaskep: none(),
      status: HasilAsuhanStatus.isLoadingSaveAll,
    ));

    //
    try {
      final saveData = await libraryService.onSaveAllDaskep(
          hasilAsuhan: state.hasilAsuhanKeperawatanModel[event.indexDiagnosa],
          noReg: event.noReg);

      emit(state.copyWith(
        saveAllDaskep: optionOf(saveData),
        status: HasilAsuhanStatus.loaded,
      ));
      emit(state.copyWith(
        saveAllDaskep: none(),
        status: HasilAsuhanStatus.loaded,
      ));
    } catch (e) {
      emit(state.copyWith(
        saveAllDaskep: none(),
        status: HasilAsuhanStatus.loaded,
      ));
    }
  }

  // ON UPDATE STATUS
  Future<void> _onUpdateStatusDaskep(
    OnUpdateStatusHasilEvent event,
    Emitter<HasilAsuhanKeperawatanState> emit,
  ) async {
    emit(state.copyWith(
        getData: none(),
        hasilAsuhanKeperawatanModel: state.hasilAsuhanKeperawatanModel,
        saveData: none(),
        deleteData: none(),
        onUpdate: none(),
        status: HasilAsuhanStatus.isLoadingUpdate));

    final updateData = await libraryService.onUpdateStatusDaskep(
        noDaskep: event.noDaskep, noReg: event.noReg);

    updateData.fold(
        (l) => null,
        (r) => r.maybeMap(
            orElse: () {},
            loaded: (e) {
              try {
                // LAKUKAN PARSING DATA
                List<HasilAsuhanKeperawatanModel> data =
                    (e.value['response'] as Iterable)
                        .map((e) => HasilAsuhanKeperawatanModel.fromJson(e))
                        .toList();

                emit(state.copyWith(
                    getData: none(),
                    hasilAsuhanKeperawatanModel: data,
                    saveData: none(),
                    deleteData: none(),
                    onUpdate: none(),
                    status: HasilAsuhanStatus.loaded));
              } catch (e) {
                emit(state.copyWith(
                    saveData: none(),
                    deleteData: none(),
                    onUpdate: none(),
                    hasilAsuhanKeperawatanModel: [],
                    getData: none(),
                    status: HasilAsuhanStatus.error));
              }
            }));

    emit(state.copyWith(
        getData: none(),
        hasilAsuhanKeperawatanModel: state.hasilAsuhanKeperawatanModel,
        onUpdate: optionOf(updateData),
        saveData: none(),
        deleteData: none(),
        status: HasilAsuhanStatus.loaded));

    emit(state.copyWith(
        getData: none(),
        deleteData: none(),
        onUpdate: none(),
        hasilAsuhanKeperawatanModel: state.hasilAsuhanKeperawatanModel,
        saveData: none(),
        status: HasilAsuhanStatus.loaded));
  }
}
