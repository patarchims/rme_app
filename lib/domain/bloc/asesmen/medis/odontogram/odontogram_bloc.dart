import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/repository/soap/soap_repository.dart';
import 'package:injectable/injectable.dart';

part 'odontogram_event.dart';
part 'odontogram_state.dart';
part 'odontogram_bloc.freezed.dart';

@injectable
class OdontogramBloc extends Bloc<OdontogramEvent, OdontogramState> {
  SoapRepository soapRepository;
  OdontogramBloc(this.soapRepository) : super(OdontogramState.initial()) {
    on<OdontogramEvent>((event, emit) => _onEventChanged(event, emit));
  }

  Future<void> _onEventChanged(
      OdontogramEvent event, Emitter<OdontogramState> emit) async {
    await event.maybeMap(
      orElse: () {},
      getOdontogram: (e) async {
        emit(state.copyWith(isLoading: true));

        emit(state.copyWith(isLoading: false));
      },
      startLoading: (e) {
        emit(state.copyWith(isLoading: true));
      },
      saveOdontogram: (e) async {
        emit(state.copyWith(isLoading: true, saveResult: none()));
        final upload = await soapRepository.uploadOdontogram(
            noReg: e.norReg, picturePath: e.imageUrl);

        emit(state.copyWith(isLoading: false, saveResult: optionOf(upload)));

        emit(state.copyWith(isLoading: false, saveResult: none()));
      },
    );
  }
}
