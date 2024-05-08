import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/presentation/pages/bangsal/repository/nyeri_icu_repository.dart';
import 'package:hms_app/presentation/pages/bangsal/repository/pengkajian_nyeri_nips_anak_repository.dart';
import 'package:hms_app/presentation/pages/bangsal/services/bangsal_services.dart';

part 'asesmen_nyeri_anak_event.dart';
part 'asesmen_nyeri_anak_state.dart';

class AsesmenNyeriAnakBloc
    extends Bloc<AsesmenNyeriAnakEvent, AsesmenNyeriAnakState> {
  AsesmenNyeriAnakBloc() : super(AsesmenNyeriAnakState.initial()) {
    on<AsesmenNyeriAnakEvent>((event, emit) {});
    on<OnGetAsesmenNyeriAnakEvent>(_onGetPengkajianNyeriEvent);
    on<OnChangeEkspresiWajahEvent>(_onChanagedEkspresiWajahEvent);
    on<OnChangedTangisanEvent>(_onChangedTangisanEvent);
    on<OnChangedPolaNapasEvent>(_onChangedPolaNapasEvent);
    on<OnchangedTanganEvent>(_onChangedTanganEvent);
    on<OnChangedKakiEvent>(_onChangedKakiEvent);
    on<OnChangedKesadaraEvent>(_onChangedKesadaran);
    on<OnChangedSkalaNyeriEvent>(_onChangedSkalaNyeri);
  }

  Future<void> _onGetPengkajianNyeriEvent(
    OnGetAsesmenNyeriAnakEvent event,
    Emitter<AsesmenNyeriAnakState> emit,
  ) async {
    emit(state.copyWith(status: AsesmenNyeriAnakStatus.isLoadingGet));
    try {
      final getData = await keperawatanBangsalService.onGetPengkajianNyeriAnak(
          noreg: event.noReg);

      PengkajianNyeriNips data =
          PengkajianNyeriNips.fromJson(getData["response"]);

      emit(state.copyWith(
          penkajianNyeri: data, status: AsesmenNyeriAnakStatus.loaded));

      //====//
    } catch (e) {
      emit(state.copyWith(
        status: AsesmenNyeriAnakStatus.loaded,
      ));
    }
  }

  Future<void> _onChanagedEkspresiWajahEvent(
    OnChangeEkspresiWajahEvent event,
    Emitter<AsesmenNyeriAnakState> emit,
  ) async {
    emit(state.copyWith(status: AsesmenNyeriAnakStatus.onSelected));
    emit(state.copyWith(
        penkajianNyeri:
            state.penkajianNyeri.copyWith(ekspresiWajah: event.value)));
  }

  Future<void> _onChangedTangisanEvent(
    OnChangedTangisanEvent event,
    Emitter<AsesmenNyeriAnakState> emit,
  ) async {
    emit(state.copyWith(status: AsesmenNyeriAnakStatus.onSelected));
    emit(state.copyWith(
        penkajianNyeri: state.penkajianNyeri.copyWith(tangisan: event.value)));
  }

  Future<void> _onChangedPolaNapasEvent(
    OnChangedPolaNapasEvent event,
    Emitter<AsesmenNyeriAnakState> emit,
  ) async {
    emit(state.copyWith(status: AsesmenNyeriAnakStatus.onSelected));
    emit(state.copyWith(
        penkajianNyeri: state.penkajianNyeri.copyWith(polaNapas: event.value)));
  }

  Future<void> _onChangedTanganEvent(
    OnchangedTanganEvent event,
    Emitter<AsesmenNyeriAnakState> emit,
  ) async {
    emit(state.copyWith(status: AsesmenNyeriAnakStatus.onSelected));
    emit(state.copyWith(
        penkajianNyeri: state.penkajianNyeri.copyWith(tangan: event.value)));
  }

  Future<void> _onChangedKesadaran(
    OnChangedKesadaraEvent event,
    Emitter<AsesmenNyeriAnakState> emit,
  ) async {
    emit(state.copyWith(status: AsesmenNyeriAnakStatus.onSelected));
    emit(state.copyWith(
        penkajianNyeri: state.penkajianNyeri.copyWith(kesadaran: event.value)));
  }

  Future<void> _onChangedSkalaNyeri(
    OnChangedSkalaNyeriEvent event,
    Emitter<AsesmenNyeriAnakState> emit,
  ) async {
    emit(state.copyWith(status: AsesmenNyeriAnakStatus.onSelected));
    emit(state.copyWith(
        penkajianNyeri:
            state.penkajianNyeri.copyWith(nyeri: event.skalaNyeri)));
  }

  Future<void> _onChangedKakiEvent(
    OnChangedKakiEvent event,
    Emitter<AsesmenNyeriAnakState> emit,
  ) async {
    emit(state.copyWith(status: AsesmenNyeriAnakStatus.onSelected));
    emit(state.copyWith(
        penkajianNyeri: state.penkajianNyeri.copyWith(kaki: event.value)));
  }
}
