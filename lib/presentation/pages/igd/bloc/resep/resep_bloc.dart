import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/pages/igd/repository/history_resep_repositori.dart';
import 'package:hms_app/presentation/pages/igd/repository/ktaripobat_repository.dart';
import 'package:hms_app/presentation/pages/igd/services/igd_services.dart';

part 'resep_event.dart';
part 'resep_state.dart';

class ResepBloc extends Bloc<ResepEvent, ResepState> {
  ResepBloc() : super(ResepState.initial()) {
    on<ResepEvent>((event, emit) {});
    on<OnGetResepObatEvent>(_onGetKapersediaanObat);
    on<OnAddResepObatEvent>(_onAddResepObat);
    on<OnDeleteResepObatEvent>(_onDeleteResepObat);
    on<OnSaveResepObatEvent>(_onSaveResepObat);
    on<OnChangeInformasiResepEvent>(_onChangeInformasiResep);
    on<OnSaveResepObatEventV2>(_onSaveResepObatV2);
    on<OnGetHistoryResepEvent>(_onGetHitoryResep);
  }

  Future<void> _onGetHitoryResep(
    OnGetHistoryResepEvent event,
    Emitter<ResepState> emit,
  ) async {
    emit(state.copyWith(
        status: ResepStatus.isLoadingGetHistoryResep,
        ktaripObat: state.ktaripObat,
        ktaripObatSelection: [],
        historyResep: [],
        saveResultResepFailure: none()));
    try {
      final data = await igdServices.onGetHistoryResepObat(noRM: event.noRM);

      List<HistoryResepObatModel> history = (data["response"] as Iterable)
          .map((e) => HistoryResepObatModel.fromJson(e))
          .toList();

      emit(state.copyWith(
        status: ResepStatus.loaded,
        ktaripObat: state.ktaripObat,
        ktaripObatSelection: [],
        historyResep: history,
      ));
    } catch (e) {
      emit(state.copyWith(
          status: ResepStatus.loaded,
          ktaripObat: state.ktaripObat,
          ktaripObatSelection: []));
    }
  }

  Future<void> _onGetKapersediaanObat(
    OnGetResepObatEvent event,
    Emitter<ResepState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: ResepStatus.isLoadingGet,
        ktaripObat: [],
        ktaripObatSelection: []));

    try {
      final data = await igdServices.getKtaripResep();

      List<KTaripObatModel> obat = (data["response"] as Iterable)
          .map((e) => KTaripObatModel.fromJson(e))
          .toList();

      emit(state.copyWith(
          status: ResepStatus.loaded,
          ktaripObat: obat,
          ktaripObatSelection: []));
    } catch (e) {
      emit(state.copyWith(
          status: ResepStatus.loaded, ktaripObat: [], ktaripObatSelection: []));
    }
  }

  Future<void> _onChangeInformasiResep(
    OnChangeInformasiResepEvent event,
    Emitter<ResepState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(status: ResepStatus.isChange));

    emit(state.copyWith(
        status: ResepStatus.loaded,
        ktaripObat: state.ktaripObat,
        informasiResep: event.value,
        ktaripObatSelection: state.ktaripObatSelection));
  }

  Future<void> _onSaveResepObatV2(
    OnSaveResepObatEventV2 event,
    Emitter<ResepState> emit,
  ) async {
    //====//
    emit(state.copyWith(
        status: ResepStatus.isLoadingSaveResep,
        ktaripObat: state.ktaripObat,
        ktaripObatSelection: state.ktaripObatSelection));

    try {
      final data = await igdServices.onSaveResepObatV2(
        kasur: event.kasur,
        kelas: event.kelas,
        kamar: event.kamar,
        namaApotik: event.namaApotik,
        pelayanan: event.pelayanan,
        namaPasien: event.namaPasien,
        catatan: event.catatan,
        deviceID: event.deviceID,
        keterangan: event.keterangan,
        namaUser: event.namaUser,
        noRM: event.noRM,
        noReg: event.noReg,
        selectionResep: event.selectionResep,
      );

      emit(state.copyWith(
          status: ResepStatus.loadedSaveResep,
          saveResultResepFailure: optionOf(data),
          informasiResep: "",
          ktaripObat: state.ktaripObat,
          ktaripObatSelection: []));

      emit(state.copyWith(
          status: ResepStatus.loadedSaveResep,
          informasiResep: "",
          saveResultResepFailure: none(),
          ktaripObat: state.ktaripObat,
          ktaripObatSelection: []));

      //==
    } catch (e) {
      emit(state.copyWith(
          status: ResepStatus.loaded,
          ktaripObat: state.ktaripObat,
          ktaripObatSelection: []));
    }
  }

  Future<void> _onSaveResepObat(
    OnSaveResepObatEvent event,
    Emitter<ResepState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: ResepStatus.isLoadingSaveResep,
        ktaripObat: state.ktaripObat,
        ktaripObatSelection: state.ktaripObatSelection));

    try {
      final data = await igdServices.onSaveResepObat(
          namaPasien: event.namaPasien,
          catatan: event.catatan,
          deviceID: event.deviceID,
          keterangan: event.keterangan,
          namaUser: event.namaUser,
          noRM: event.noRM,
          noReg: event.noReg,
          selectionResep: event.selectionResep);

      emit(state.copyWith(
          status: ResepStatus.loadedSaveResep,
          saveResultResepFailure: optionOf(data),
          informasiResep: "",
          ktaripObat: state.ktaripObat,
          ktaripObatSelection: []));

      emit(state.copyWith(
          status: ResepStatus.loadedSaveResep,
          informasiResep: "",
          saveResultResepFailure: none(),
          ktaripObat: state.ktaripObat,
          ktaripObatSelection: []));
    } catch (e) {
      emit(state.copyWith(
          status: ResepStatus.loaded,
          ktaripObat: state.ktaripObat,
          ktaripObatSelection: []));
    }
  }

  Future<void> _onAddResepObat(
    OnAddResepObatEvent event,
    Emitter<ResepState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: ResepStatus.loading,
        ktaripObat: state.ktaripObat,
        ktaripObatSelection: state.ktaripObatSelection));

    List<KTaripObatModel> newObat = state.ktaripObatSelection;
    newObat.add(event.obat);

    emit(state.copyWith(
        status: ResepStatus.loaded,
        ktaripObat: state.ktaripObat,
        ktaripObatSelection: newObat));
  }

  Future<void> _onDeleteResepObat(
    OnDeleteResepObatEvent event,
    Emitter<ResepState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        status: ResepStatus.loading,
        ktaripObat: state.ktaripObat,
        ktaripObatSelection: state.ktaripObatSelection));

    List<KTaripObatModel> newObat = state.ktaripObatSelection;
    newObat.remove(event.kTaripObatModel);

    emit(state.copyWith(
        status: ResepStatus.loaded,
        ktaripObat: state.ktaripObat,
        ktaripObatSelection: newObat));
  }
}
