import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/models/diagnosa/diagnosa_icd_model.dart';
import 'package:hms_app/domain/models/diagnosa/diagnosa_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/services/anamnesa_services.dart';
import 'package:hms_app/domain/services/library_services.dart';

part 'input_diagnosa_event.dart';
part 'input_diagnosa_state.dart';
part 'input_diagnosa_bloc.freezed.dart';

class InputDiagnosaBloc extends Bloc<InputDiagnosaEvent, InputDiagnosaState> {
  InputDiagnosaBloc() : super(InputDiagnosaState()) {
    on<InputDiagnosaEvent>((event, emit) => _onEventChanged(event, emit));
  }

  Future<void> _onEventChanged(
      InputDiagnosaEvent event, Emitter<InputDiagnosaState> emit) async {
    await event.maybeMap(
      orElse: () {},
      saveDiagnosa: (e) async {
        emit(state.copyWith(isSave: true));

        // SIMPAN DATA
        final data = await anamnesaService.saveDiagnosa(
            e.noreg, e.code, e.type, e.table,
            deviceID: e.deviceID,
            pelayanan: e.pelayanan,
            person: e.person,
            userID: e.userID);

        try {
          MetaModel meta = MetaModel.fromJson(data["metadata"]);

          if (meta.code == 200) {
            List<DiagnosaModel> value = (data["response"] as Iterable)
                .map((e) => DiagnosaModel.fromMap(e))
                .toList();

            emit(state.copyWith(
                diagnosa: value,
                isSave: false,
                isErrorSaveData: false,
                errorMessage: ""));
          } else if (meta.code == 201) {
            // ===============
            emit(state.copyWith(
                diagnosa: [],
                isSave: false,
                isErrorSaveData: true,
                errorMessage: meta.message.toString()));

            emit(state.copyWith(
                diagnosa: [],
                isSave: false,
                isErrorSaveData: false,
                errorMessage: ""));
          } else {
            emit(state.copyWith(
                diagnosa: [],
                isSave: false,
                isErrorSaveData: false,
                errorMessage: ""));
          }
        } catch (e) {
          emit(state.copyWith(
              isSave: false, isErrorSaveData: false, errorMessage: ""));
        }
      },
      deleteItem: (e) async {
        emit(state.copyWith(isDelete: true));
        // DETELE ITEM
        final data = await anamnesaService.deleteDiagnosa(e.noReg, e.table);

        try {
          MetaModel meta = MetaModel.fromJson(data["metadata"]);

          if (meta.code == 200) {
            List<DiagnosaModel> value = (data["response"] as Iterable)
                .map((e) => DiagnosaModel.fromMap(e))
                .toList();

            emit(state.copyWith(diagnosa: value, isDelete: false));
          } else {
            emit(state.copyWith(diagnosa: [], isDelete: false));
          }
        } catch (e) {
          emit(state.copyWith(isDelete: false));
        }
        emit(state.copyWith(isDelete: false));
      },
      getDiagnosa: (value) async {
        emit(state.copyWith(isGet: true));
        final data = await anamnesaService.getDiagnosa(value.noreg);

        try {
          MetaModel meta = MetaModel.fromJson(data["metadata"]);

          if (meta.code == 200) {
            List<DiagnosaModel> value = (data["response"] as Iterable)
                .map((e) => DiagnosaModel.fromMap(e))
                .toList();

            emit(state.copyWith(diagnosa: value, isGet: true));
          } else {
            emit(state.copyWith(diagnosa: [], isGet: true));
          }
        } catch (e) {
          emit(state.copyWith(diagnosa: [], isGet: false));
        }
        emit(state.copyWith(isGet: false));
      },
      addDiagnosa: (value) async {
        emit(state.copyWith(isLoading: true));

        await Future.delayed(const Duration(microseconds: 10));

        emit(state.copyWith(
            diagnosaModel: value.diagnosaModel, isLoading: false, isAdd: true));

        emit(state.copyWith(
            isAdd: false,
            diagnosaModel: value.diagnosaModel,
            isLoading: false));
      },
      addSecondaryDiagnosa: (value) {
        final updatedItems =
            List<DiagnosaIcdModel>.from(state.diagnosaSecondary);
        updatedItems.add(value.diagnosaIcdModel);
        emit(state.copyWith(diagnosaSecondary: updatedItems));
      },
      onGetDiagnosa: (e) async {
        emit(state.copyWith(isLoading: true));
        try {
          final data = await libraryService.getAllICD10();

          final meta = MetaModel.fromJson(data["metadata"]);

          if (meta.code == 200) {
            List<DiagnosaIcdModel> value = (data["response"] as Iterable)
                .map((e) => DiagnosaIcdModel.fromMap(e))
                .toList();
            emit(state.copyWith(diagnosaICD: value));
          }
          emit(state.copyWith(isLoading: false));
        } catch (e) {
          emit(state.copyWith(isLoading: false, diagnosaICD: []));
        }
        emit(state.copyWith(isLoading: false));
      },
      deleteButton: (e) {
        emit(state.copyWith(
            enableAdd: e.index, enableDelete: state.enableDelete - 1));
      },
      enableButton: (e) {
        emit(state.copyWith(
            enableAdd: state.enableAdd + 1, enableDelete: e.index));
      },
    );
  }
}
