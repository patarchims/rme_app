import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/kebidanan/repository/asesmen_kebidanan_model_response.dart';
import 'package:hms_app/presentation/kebidanan/services/kebidanan_service.dart';

part 'pengkajian_kebidanan_event.dart';
part 'pengkajian_kebidanan_state.dart';

class PengkajianKebidananBloc
    extends Bloc<PengkajianKebidananEvent, PengkajianKebidananState> {
  PengkajianKebidananBloc() : super(PengkajianKebidananState.initial()) {
    on<PengkajianKebidananEvent>((event, emit) {});
    on<OnGetAsesmenKebidananEvent>(_onGetAsesmenKebidananEvent);
    on<OnSaveAsesmenKebidananEvent>(_onSaveAsesmenKebidananEvent);
    on<OnChangedHaidterakhir>(_onChangedTanggalHaidTerakhir);
    on<OnChangedKehamilanG>(_onChangedKehamilanG);
    on<OnChangedKehamilanAB>(_onChangedKehamilanAB);
    on<OnChangedHaidEvent>(_onChangedHaid);
    on<OnChangedKehamilanP>(_onChangedKehamilanP);
    on<OnChangedUsiaKehamilanEvent>(_onChangedUsiaKehamilanEvent);
    on<OnChangePerkiraanPartus>(_onChangedPerkiraanPartus);
    on<OnChangedHamilMudaEvent>(_onChangeHamilMuda);
    on<OnChangedHamilTuaEvent>(_onChangedHamilTua);
    on<OnChangedLeopold1>(_onChangedLeopold1);
    on<OnChangedLeopold2>(_onChangedLeopold2);
    on<OnChangedLeopold3>(_onChangedLeopold3);
    on<OnChangedLeopold4>(_onChangedLeopold4);
    on<OnChangedNyeriTekan>(_onChangedNyeriTekan);
    on<OnChangedTbj>(_onChangedTbj);
    on<OnChangedTfu>(_onChangedTfu);
    on<OnChangedHodgeEvent>(_onChangedHodge);
    on<OnchangedInspeksiEvent>(_onChangedInspeksiEvent);
    on<OnChangedPalpasiEvent>(_onChangedPalpasi);
    on<OnChangedInspekuloV>(_onChangedInspekV);
    on<OnChangedPemeriksaanDalam>(_onChangedPemeriksaanDalam);
    on<OnChangedInspekuloP>(_onChangedPortio);
  }

  Future<void> _onGetAsesmenKebidananEvent(
    OnGetAsesmenKebidananEvent event,
    Emitter<PengkajianKebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        saveResult: none(), status: PengkajianKebidananStatus.isLoadingGet));

    try {
      final getData = await kebidananService.getAsesmenKebidananV2(
          noReg: event.noReg, person: event.person);

      // ONGET ASESMENT
      // log("GET DATA");
      log(getData.toString());

      AsesmenKebidananModel datas =
          AsesmenKebidananModel.fromJson(getData["response"]);

      emit(state.copyWith(
        saveResult: none(),
        pengkajianKebidanan: datas,
        status: PengkajianKebidananStatus.loaded,
      ));
    } catch (e) {
      emit(state.copyWith(
          pengkajianKebidanan: AsesmenKebidananModel(
              palpasi: "",
              nyeriTekan: "",
              tbj: "",
              tfu: "",
              hamilMuda: "",
              hamilTua: "",
              gravida: "",
              abortus: "",
              para: "",
              haid: "",
              haidTerakhir: "",
              usiaKehamilan: "",
              partusHpl: "",
              leopold1: "",
              leopold2: "",
              leopold3: "",
              leopold4: "",
              hodge: "",
              inspeksi: "",
              inspekuloV: "",
              inspekuloP: "",
              pemeriksaanDalam: ""),
          saveResult: none(),
          status: PengkajianKebidananStatus.loaded));
    }
  }

  Future<void> _onChangedTanggalHaidTerakhir(
    OnChangedHaidterakhir event,
    Emitter<PengkajianKebidananState> emit,
  ) async {
    // REPLACE LIST ON LIST
    emit(state.copyWith(
        pengkajianKebidanan:
            state.pengkajianKebidanan.copyWith(haidTerakhir: event.value)));
  }

  Future<void> _onChangedKehamilanG(
    OnChangedKehamilanG event,
    Emitter<PengkajianKebidananState> emit,
  ) async {
    emit(state.copyWith(
        pengkajianKebidanan:
            state.pengkajianKebidanan.copyWith(gravida: event.value)));
  }

  Future<void> _onChangedKehamilanAB(
    OnChangedKehamilanAB event,
    Emitter<PengkajianKebidananState> emit,
  ) async {
    emit(state.copyWith(
        pengkajianKebidanan:
            state.pengkajianKebidanan.copyWith(abortus: event.value)));
  }

  Future<void> _onChangedPerkiraanPartus(
    OnChangePerkiraanPartus event,
    Emitter<PengkajianKebidananState> emit,
  ) async {
    emit(state.copyWith(
        pengkajianKebidanan:
            state.pengkajianKebidanan.copyWith(partusHpl: event.value)));
  }

  Future<void> _onChangedHodge(
    OnChangedHodgeEvent event,
    Emitter<PengkajianKebidananState> emit,
  ) async {
    emit(state.copyWith(
        pengkajianKebidanan:
            state.pengkajianKebidanan.copyWith(hodge: event.value)));
  }

  Future<void> _onChangedPemeriksaanDalam(
    OnChangedPemeriksaanDalam event,
    Emitter<PengkajianKebidananState> emit,
  ) async {
    emit(state.copyWith(
        pengkajianKebidanan:
            state.pengkajianKebidanan.copyWith(pemeriksaanDalam: event.value)));
  }

  Future<void> _onChangedInspeksiEvent(
    OnchangedInspeksiEvent event,
    Emitter<PengkajianKebidananState> emit,
  ) async {
    emit(state.copyWith(
        pengkajianKebidanan:
            state.pengkajianKebidanan.copyWith(inspeksi: event.value)));
  }

  Future<void> _onChangedPalpasi(
    OnChangedPalpasiEvent event,
    Emitter<PengkajianKebidananState> emit,
  ) async {
    emit(state.copyWith(
        pengkajianKebidanan:
            state.pengkajianKebidanan.copyWith(palpasi: event.value)));
  }

  Future<void> _onChangedUsiaKehamilanEvent(
    OnChangedUsiaKehamilanEvent event,
    Emitter<PengkajianKebidananState> emit,
  ) async {
    emit(state.copyWith(
        pengkajianKebidanan:
            state.pengkajianKebidanan.copyWith(usiaKehamilan: event.value)));
  }

  Future<void> _onChangedInspekV(
    OnChangedInspekuloV event,
    Emitter<PengkajianKebidananState> emit,
  ) async {
    emit(state.copyWith(
        pengkajianKebidanan:
            state.pengkajianKebidanan.copyWith(inspekuloV: event.value)));
  }

  Future<void> _onChangedKehamilanP(
    OnChangedKehamilanP event,
    Emitter<PengkajianKebidananState> emit,
  ) async {
    emit(state.copyWith(
        pengkajianKebidanan:
            state.pengkajianKebidanan.copyWith(para: event.value)));
  }

  Future<void> _onChangeHamilMuda(
    OnChangedHamilMudaEvent event,
    Emitter<PengkajianKebidananState> emit,
  ) async {
    emit(state.copyWith(
        pengkajianKebidanan:
            state.pengkajianKebidanan.copyWith(hamilMuda: event.value)));
  }

  Future<void> _onChangedHamilTua(
    OnChangedHamilTuaEvent event,
    Emitter<PengkajianKebidananState> emit,
  ) async {
    emit(state.copyWith(
        pengkajianKebidanan:
            state.pengkajianKebidanan.copyWith(hamilTua: event.value)));
  }

  Future<void> _onChangedLeopold1(
    OnChangedLeopold1 event,
    Emitter<PengkajianKebidananState> emit,
  ) async {
    emit(state.copyWith(
        pengkajianKebidanan:
            state.pengkajianKebidanan.copyWith(leopold1: event.value)));
  }

  Future<void> _onChangedNyeriTekan(
    OnChangedNyeriTekan event,
    Emitter<PengkajianKebidananState> emit,
  ) async {
    emit(state.copyWith(
        pengkajianKebidanan:
            state.pengkajianKebidanan.copyWith(nyeriTekan: event.value)));
  }

  Future<void> _onChangedTbj(
    OnChangedTbj event,
    Emitter<PengkajianKebidananState> emit,
  ) async {
    emit(state.copyWith(
        pengkajianKebidanan:
            state.pengkajianKebidanan.copyWith(tbj: event.value)));
  }

  Future<void> _onChangedTfu(
    OnChangedTfu event,
    Emitter<PengkajianKebidananState> emit,
  ) async {
    emit(state.copyWith(
        pengkajianKebidanan:
            state.pengkajianKebidanan.copyWith(tfu: event.value)));
  }

  Future<void> _onChangedLeopold2(
    OnChangedLeopold2 event,
    Emitter<PengkajianKebidananState> emit,
  ) async {
    emit(state.copyWith(
        pengkajianKebidanan:
            state.pengkajianKebidanan.copyWith(leopold2: event.value)));
  }

  Future<void> _onChangedLeopold3(
    OnChangedLeopold3 event,
    Emitter<PengkajianKebidananState> emit,
  ) async {
    emit(state.copyWith(
        pengkajianKebidanan:
            state.pengkajianKebidanan.copyWith(leopold3: event.value)));
  }

  Future<void> _onChangedLeopold4(
    OnChangedLeopold4 event,
    Emitter<PengkajianKebidananState> emit,
  ) async {
    emit(state.copyWith(
        pengkajianKebidanan:
            state.pengkajianKebidanan.copyWith(leopold4: event.value)));
  }

  Future<void> _onChangedPortio(
    OnChangedInspekuloP event,
    Emitter<PengkajianKebidananState> emit,
  ) async {
    emit(state.copyWith(
        pengkajianKebidanan:
            state.pengkajianKebidanan.copyWith(inspekuloP: event.value)));
  }

  Future<void> _onChangedHaid(
    OnChangedHaidEvent event,
    Emitter<PengkajianKebidananState> emit,
  ) async {
    emit(state.copyWith(
        pengkajianKebidanan:
            state.pengkajianKebidanan.copyWith(haid: event.value)));
  }

  Future<void> _onSaveAsesmenKebidananEvent(
    OnSaveAsesmenKebidananEvent event,
    Emitter<PengkajianKebidananState> emit,
  ) async {
    emit(state.copyWith(
        saveResult: none(),
        status: PengkajianKebidananStatus.isLoadingSavePengkajian));

    try {
      // ==================== //

      final save = await kebidananService.onSavePengkajianKebidananEvent(
        asemenKebidanan: event.asesmenKebidananModel,
        kdDPJP: event.dpjp,
        pelayanan: event.pelayanan,
        noReg: event.noReg,
        person: event.person,
        devicesID: event.devicesID,
      );

      emit(state.copyWith(
          saveResult: optionOf(save),
          status: PengkajianKebidananStatus.loaded));

      emit(state.copyWith(
          saveResult: none(), status: PengkajianKebidananStatus.loaded));
    } catch (e) {
      emit(state.copyWith(
          saveResult: none(), status: PengkajianKebidananStatus.loaded));
    }
  }
}
