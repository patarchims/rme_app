import 'package:bloc/bloc.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/soap/medis/hasil_penunjang_medik_model.dart';
import 'package:hms_app/domain/services/anamnesa_services.dart';
import 'package:meta/meta.dart';

part 'penunjang_medik_event.dart';
part 'penunjang_medik_state.dart';

class PenunjangMedikBloc
    extends Bloc<PenunjangMedikEvent, PenunjangMedikState> {
  PenunjangMedikBloc() : super(const PenunjangMedikState()) {
    on<PenunjangMedikEvent>((event, emit) {});
    on<OnGetData>(_onGetData);
  }

  Future<void> _onGetData(
      OnGetData event, Emitter<PenunjangMedikState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      emit(LoadingState());

      final data = await anamnesaService.getPenunjangMedik(event.noReg);

      await Future.delayed(const Duration(seconds: 2));

      MetaModel meta = MetaModel.fromJson(data["metadata"]);
      if (meta.code == 200) {
        // KIRIMKAN DATA

        List<PenunjangMedikModel> kel = (data["response"] as Iterable)
            .map((e) => PenunjangMedikModel.fromJson(e))
            .toList();

        emit(state.copyWith(isLoading: false));

        if (kel.isEmpty) {
          emit(EmtyState());
          emit(state.copyWith(penunjangMedik: kel));
        }

        if (kel.isNotEmpty) {
          emit(SuccessState());
          emit(state.copyWith(penunjangMedik: kel));
        }
      }
    } catch (e) {
      FailureState();
    }
  }
}
