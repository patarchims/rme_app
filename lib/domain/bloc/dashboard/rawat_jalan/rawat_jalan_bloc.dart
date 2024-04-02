import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/models/diagnosa/diagnosa_icd_model.dart';
import 'package:hms_app/domain/models/lib_model/bank_data_model.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/repository/librari/librari_repository.dart';
import 'package:injectable/injectable.dart';

part 'rawat_jalan_event.dart';
part 'rawat_jalan_state.dart';
part 'rawat_jalan_bloc.freezed.dart';

@injectable
class RawatJalanBloc extends Bloc<RawatJalanEvent, RawatJalanState> {
  LibrariRepositori librariRepositori;
  RawatJalanBloc(this.librariRepositori) : super(RawatJalanState.initial()) {
    on<RawatJalanEvent>((event, emit) => _onEventChanged(event, emit));
  }

  Future<void> _onEventChanged(
      RawatJalanEvent event, Emitter<RawatJalanState> emit) async {
    await event.maybeMap(
      selectedDiagnosa: (data) async {
        emit(state.copyWith(
            selectedDiagnosa: List.from(state.selectedDiagnosa)
              ..add(data.diagnosaIcdModel)));
      },
      orElse: () {},
      selectedTerapi: (value) {
        emit(state.copyWith(terapiStr: value.value));
      },
      addDiagnosa: (value) {
        emit(state.copyWith(diagnosa: value.diagnosa));
      },
      getMasalahMedis: (e) async {
        final data =
            await librariRepositori.getBankData(kategori: "masalah_medis");

        data.fold(
            (l) => null,
            (r) => r.maybeMap(
                orElse: () {},
                loaded: (value) {
                  List<BankDataModel> data =
                      (value.value['response'] as Iterable)
                          .map((e) => BankDataModel.fromMap(e))
                          .toList();
                  emit(state.copyWith(bankData: data));
                }));
      },
      getDiagnosa: (value) async {
        emit(state.copyWith(loading: true, getResult: none()));
        final data = await librariRepositori.getDiagnosaICD10(
            code: value.code, limit: value.limit, page: value.page);

        emit(state.copyWith(loading: false, getResult: optionOf(data)));

        emit(state.copyWith(loading: false, getResult: none()));
      },
      getTerapi: (e) async {
        final data = await librariRepositori.getBankData(kategori: "terapi");

        data.fold(
            (l) => null,
            (r) => r.maybeMap(
                orElse: () {},
                loaded: (value) {
                  List<BankDataModel> data =
                      (value.value['response'] as Iterable)
                          .map((e) => BankDataModel.fromMap(e))
                          .toList();
                  emit(state.copyWith(bankData: data));
                }));
      },
      selectMasalahMedis: (value) {
        emit(state.copyWith(masalahMedisStr: value.value));
      },
    );
  }
}
