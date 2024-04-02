import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/kebidanan/repository/analisa_data_model_repository.dart';
import 'package:hms_app/presentation/kebidanan/repository/diagnosa_kebidanan_model_response.dart';
import 'package:hms_app/presentation/kebidanan/services/kebidanan_service.dart';

part 'analisa_event.dart';
part 'analisa_state.dart';

class AnalisaBloc extends Bloc<AnalisaEvent, AnalisaState> {
  AnalisaBloc() : super(AnalisaState.initial()) {
    on<AnalisaEvent>((event, emit) {});
    on<OnGetDiagnosaKeperawatan>(_onGetDiagnosaKeperawatan);
    on<OnAddDiagnosaKeperawatan>(_onAddDiagnosaEvent);
    on<OnRemoveDiagnosaKeperawatan>(_onRemoveDiagnosaKeperawatanEvent);
    on<OnSaveDiagnosaKeperawatan>(_onSaveDiagnosaKeperawatanEvent);
    on<OnGetAnalisaDataEvent>(_onGetAnalisaDataEvent);
    on<OnValidasiAnalisaDataEvent>(_onValidasiAnalisaData);
    on<OnDeleteAnalisaKeperawatan>(_onDeleteAnalisaData);
  }

  Future<void> _onGetDiagnosaKeperawatan(
    OnGetDiagnosaKeperawatan event,
    Emitter<AnalisaState> emit,
  ) async {
    emit(state.copyWith(
        status: AnalisaStatus.loading,
        saveResult: none(),
        analisaData: state.analisaData));

    try {
      final data = await kebidananService.getAllDiagnosaKeperawatan();

      List<DiagnosaKeperawatanModel> datas = (data["response"] as Iterable)
          .map((e) => DiagnosaKeperawatanModel.fromJson(e))
          .toList();

      // GET DATA
      emit(state.copyWith(
          status: AnalisaStatus.loaded, diagnosaKeperawatanModel: datas));
      // GET DATA
    } catch (e) {
      emit(state.copyWith(
          status: AnalisaStatus.loaded, diagnosaKeperawatanModel: []));
    }
  }

  Future<void> _onDeleteAnalisaData(
    OnDeleteAnalisaKeperawatan event,
    Emitter<AnalisaState> emit,
  ) async {
    emit(state.copyWith(
        status: AnalisaStatus.loading,
        saveResult: none(),
        analisaData: state.analisaData));

    try {
      final delete = await kebidananService.onDeleteAnalisaData(
          kodeAnalisa: event.kodeAnalisa);

      // GET DATA
      emit(state.copyWith(
          status: AnalisaStatus.loaded, onDelete: optionOf(delete)));
      emit(state.copyWith(status: AnalisaStatus.loaded, onDelete: none()));
    } catch (e) {
      emit(state.copyWith(
          status: AnalisaStatus.loaded, diagnosaKeperawatanModel: []));
    }
  }

  Future<void> _onAddDiagnosaEvent(
    OnAddDiagnosaKeperawatan event,
    Emitter<AnalisaState> emit,
  ) async {
    List<DiagnosaKeperawatanModel> myList =
        List.from(state.selectedDiagnosa); // Initialize an empty list

    myList.add(event.diagnosa);
    emit(state.copyWith(status: AnalisaStatus.selected, saveResult: none()));
    emit(state.copyWith(
        status: AnalisaStatus.loaded,
        diagnosaKeperawatanModel: state.diagnosaKeperawatanModel,
        selectedDiagnosa: myList));
  }

  Future<void> _onRemoveDiagnosaKeperawatanEvent(
    OnRemoveDiagnosaKeperawatan event,
    Emitter<AnalisaState> emit,
  ) async {
    List<DiagnosaKeperawatanModel> myList =
        List.from(state.selectedDiagnosa); // Initialize an empty list

    myList.removeWhere((element) => element == event.diagnosa);

    emit(state.copyWith(status: AnalisaStatus.selected, saveResult: none()));
    emit(state.copyWith(
        status: AnalisaStatus.loaded,
        diagnosaKeperawatanModel: state.diagnosaKeperawatanModel,
        selectedDiagnosa: myList));
  }

  Future<void> _onSaveDiagnosaKeperawatanEvent(
    OnSaveDiagnosaKeperawatan event,
    Emitter<AnalisaState> emit,
  ) async {
    //DO IT
    emit(state.copyWith(
        status: AnalisaStatus.isloadingSaveData, saveResult: none()));

    try {
      final saveData = await kebidananService.onSaveAnalisaData(
          noReg: event.noReg, data: event.data, diagnosa: event.diagnosa);

      emit(state.copyWith(
          status: AnalisaStatus.loaded, saveResult: optionOf(saveData)));

      emit(state.copyWith(
          status: AnalisaStatus.loaded,
          saveResult: none(),
          selectedDiagnosa: []));

      //== GET DATA ==//
      final getData =
          await kebidananService.onGetAnalisaData(noReg: event.noReg);

      List<AnalisaDataModel> datas = (getData["response"] as Iterable)
          .map((e) => AnalisaDataModel.fromJson(e))
          .toList();

      emit(state.copyWith(status: AnalisaStatus.loaded, analisaData: datas));
    } catch (e) {
      emit(state.copyWith(
          status: AnalisaStatus.loaded,
          saveResult: none(),
          selectedDiagnosa: []));
    }
  }

  Future<void> _onGetAnalisaDataEvent(
    OnGetAnalisaDataEvent event,
    Emitter<AnalisaState> emit,
  ) async {
    //DO IT
    emit(state.copyWith(
        status: AnalisaStatus.isLoadingGetAnalisaData, saveResult: none()));

    try {
      final getData =
          await kebidananService.onGetAnalisaData(noReg: event.noReg);

      List<AnalisaDataModel> datas = (getData["response"] as Iterable)
          .map((e) => AnalisaDataModel.fromJson(e))
          .toList();

      emit(state.copyWith(status: AnalisaStatus.loaded, analisaData: datas));
    } catch (e) {
      emit(state.copyWith(status: AnalisaStatus.loaded, saveResult: none()));
    }
  }

  Future<void> _onValidasiAnalisaData(
    OnValidasiAnalisaDataEvent event,
    Emitter<AnalisaState> emit,
  ) async {
    //DO IT
    emit(state.copyWith(
        status: AnalisaStatus.isLoadingGetAnalisaData, saveResult: none()));

    try {
      final analisaData = await kebidananService.onValidasiAnalisaData(
          noReg: event.noReg,
          jam: event.jam,
          kodeAnalisa: event.kodeAnalisa,
          tgl: event.tanggal);

      emit(state.copyWith(
          status: AnalisaStatus.loaded, onValidasi: optionOf(analisaData)));

      emit(state.copyWith(status: AnalisaStatus.loaded, onValidasi: none()));

      final getData =
          await kebidananService.onGetAnalisaData(noReg: event.noReg);

      List<AnalisaDataModel> datas = (getData["response"] as Iterable)
          .map((e) => AnalisaDataModel.fromJson(e))
          .toList();

      emit(state.copyWith(status: AnalisaStatus.loaded, analisaData: datas));
    } catch (e) {
      emit(state.copyWith(status: AnalisaStatus.loaded, saveResult: none()));
    }
  }
}
