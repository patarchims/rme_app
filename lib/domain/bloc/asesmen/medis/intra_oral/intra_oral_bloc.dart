import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/models/soap/medis/data_intra_oral_model.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/repository/soap/soap_repository.dart';
import 'package:injectable/injectable.dart';

part 'intra_oral_event.dart';
part 'intra_oral_state.dart';
part 'intra_oral_bloc.freezed.dart';

@injectable
class IntraOralBloc extends Bloc<IntraOralEvent, IntraOralState> {
  SoapRepository soapRepository;
  IntraOralBloc(this.soapRepository) : super(IntraOralState.initial()) {
    on<IntraOralEvent>((event, emit) => _onEventChanged(event, emit));
  }

  Future<void> _onEventChanged(
      IntraOralEvent event, Emitter<IntraOralState> emit) async {
    await event.maybeMap(
        orElse: () {},
        saveData: (e) async {
          emit(state.copyWith(
              getResult: none(), saveResult: none(), isLoading: true));
          final data = await soapRepository.saveDataIntraOral(
              dataIntraOralModel: e.dataIntraOralModel);

          emit(state.copyWith(
              getResult: none(), saveResult: optionOf(data), isLoading: false));

          emit(state.copyWith(
              getResult: none(), saveResult: none(), isLoading: false));
        },
        getData: (e) async {
          emit(state.copyWith(getResult: none(), isLoadingGetResult: true));

          final data = await soapRepository.getDataIntraOral(noReg: e.noReg);

          emit(state.copyWith(
              getResult: optionOf(data), isLoadingGetResult: false));
          emit(state.copyWith(getResult: none(), isLoadingGetResult: false));
        });
  }
}
