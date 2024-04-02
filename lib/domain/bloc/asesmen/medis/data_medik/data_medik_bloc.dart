import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/services/anamnesa_services.dart';

part 'data_medik_event.dart';
part 'data_medik_state.dart';
part 'data_medik_bloc.freezed.dart';

class DataMedikBloc extends Bloc<DataMedikEvent, DataMedikState> {
  DataMedikBloc() : super(DataMedikState.initial()) {
    on<DataMedikEvent>((event, emit) => _onEventChanged(event, emit));
  }

  Future<void> _onEventChanged(
      DataMedikEvent event, Emitter<DataMedikState> emit) async {
    await event.maybeMap(
        orElse: () {},
        getDataMedik: (e) async {
          emit(state.copyWith(getResult: none(), isLoadingGetResult: true));

          final data = await anamnesaService.getDataMedik(e.noreg);

          emit(state.copyWith(
              getResult: optionOf(data), isLoadingGetResult: false));

          emit(state.copyWith(getResult: none(), isLoadingGetResult: false));
        },
        saveDataMedik: (e) async {
          emit(state.copyWith(saveResult: none(), isLoading: true));

          final data = await anamnesaService.saveDataMedik(
              noReg: e.noReg,
              golDarah: e.golDarah,
              tekananDarah: e.tekananDarah,
              tekananDarahDetail: e.tekananDarahDetail,
              penyJantung: e.penyJantung,
              penyJantungDetail: e.penyJantungDetail,
              diabet: e.diabet,
              diabetDetail: e.diabetDetail,
              haemop: e.haemop,
              haemopDetail: e.haemopDetail,
              hepat: e.hepat,
              hepatDetail: e.hepatDetail,
              penyLain: e.penyLain,
              penyLainDetail: e.penyLainDetail,
              alergiObat: e.alergiObat,
              alergiObatDetail: e.alergiObatDetail,
              alergiMakanan: e.alergiMakanan,
              alergiMakananDetail: e.alergiMakananDetail,
              kebiasaanBuruk: e.kebiasaanBuruk);

          emit(state.copyWith(saveResult: optionOf(data), isLoading: false));

          emit(state.copyWith(saveResult: none(), isLoading: false));
        });
  }
}
