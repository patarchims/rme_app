import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:hms_app/domain/models/resiko_jatuh/hasil_resiko_jatuh_response_model.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/services/library_services.dart';

part 'deteksi_resiko_jatuh_event.dart';
part 'deteksi_resiko_jatuh_state.dart';

class DeteksiResikoJatuhBloc
    extends Bloc<DeteksiResikoJatuhEvent, DeteksiResikoJatuhState> {
  DeteksiResikoJatuhBloc() : super(DeteksiResikoJatuhState.initial()) {
    on<DeteksiResikoJatuhEvent>((event, emit) {});
    on<OnDetectionResikoJatuhEvent>(_onDetectionResikoJatuhPasien);
    on<OnGetDetectionResikoJatuhEvent>(_onGetDetectionResikoJatuh);
  }

  // ========================== ON SAVE RESIKO JATUH PASIEN
  Future<void> _onDetectionResikoJatuhPasien(
    OnDetectionResikoJatuhEvent event,
    Emitter<DeteksiResikoJatuhState> emit,
  ) async {
    emit(state.copyWith(
        getData: none(), status: DeteksiResikoJatuhStatus.loading));

    // LAKUKAN GET DATA
    final data =
        await libraryService.deteksiResikoJatuhPasien(noreg: event.noReg);

    // LAKUKAN PARSING DATA
    return data.fold(
        (l) => l.maybeMap(orElse: () {
              return emit(state.copyWith(
                  resiko: HasilResikoJatuhResponseModel(
                      isShow: false, hasil: "", tindakan: ""),
                  getData: none(),
                  status: DeteksiResikoJatuhStatus.loaded));
            }, failure: (e) {
              return emit(state.copyWith(
                  resiko: HasilResikoJatuhResponseModel(
                      isShow: false, hasil: "", tindakan: ""),
                  getData: none(),
                  status: DeteksiResikoJatuhStatus.loaded));
            }),
        (r) => r.maybeMap(orElse: () {
              return null;
            }, loaded: (e) {
              try {
                HasilResikoJatuhResponseModel data =
                    HasilResikoJatuhResponseModel.fromJson(e.value["response"]);

                return emit(state.copyWith(
                    getData: none(),
                    resiko: data,
                    status: DeteksiResikoJatuhStatus.loaded));
              } catch (e) {
                return emit(state.copyWith(
                    resiko: HasilResikoJatuhResponseModel(
                        isShow: false, hasil: "", tindakan: ""),
                    getData: none(),
                    status: DeteksiResikoJatuhStatus.loaded));
              }
            }));
  }

  Future<void> _onGetDetectionResikoJatuh(
    OnGetDetectionResikoJatuhEvent event,
    Emitter<DeteksiResikoJatuhState> emit,
  ) async {
    try {
      emit(state.copyWith(
          getData: none(),
          status: DeteksiResikoJatuhStatus.loading,
          resiko: state.resiko));

      final data =
          await libraryService.getDeteksiResikoJatuh(noreg: event.noReg);

      HasilResikoJatuhResponseModel newData =
          HasilResikoJatuhResponseModel.fromJson(data["response"]);

      emit(state.copyWith(
          getData: none(),
          resiko: newData,
          status: DeteksiResikoJatuhStatus.loaded));
    } catch (e) {
      emit(state.copyWith(
          getData: none(),
          resiko: HasilResikoJatuhResponseModel(
              isShow: false, hasil: "", tindakan: ""),
          status: DeteksiResikoJatuhStatus.loaded));
    }
  }
}
