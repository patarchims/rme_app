import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/services/library_services.dart';
import 'package:hms_app/presentation/kebidanan/services/kebidanan_service.dart';
import 'package:hms_app/presentation/pages/bangsal/repository/pengkajian_awal_igd_repository.dart';
import 'package:hms_app/presentation/pages/bangsal/services/bangsal_services.dart';
import 'package:hms_app/presentation/pages/igd/services/igd_services.dart';

part 'asesmen_igd_event.dart';
part 'asesmen_igd_state.dart';

class AsesmenAwalIgdBloc
    extends Bloc<AsesmenAwalIgdEvent, AsesmenIgdAwalState> {
  AsesmenAwalIgdBloc() : super(AsesmenIgdAwalState.initial()) {
    on<AsesmenAwalIgdEvent>((event, emit) {});
    on<OnGetAsesmenAwalIGDEvent>(_onGetAsesmenAwalIGDEvent);
    on<OnSelectionAnamnesa>(_onSelectionAnamnesaEvent);
    on<OnSavePenyakitKeluargaEvent>(_onSaveRiwayatPenyakitKeluarga);
    on<OnDeletePenyakitKeluargaEvent>(_onDeletePenyakitKeluargaEvent);
    on<OnChangedDetailAnamnesa>(_onChangedDetailAnaneseEvent);
    on<OnSaveAsesmenAwalIGDEvent>(_onSaveAsesmentAwalIGD);
  }

  Future<void> _onSaveAsesmentAwalIGD(
    OnSaveAsesmenAwalIGDEvent event,
    Emitter<AsesmenIgdAwalState> emit,
  ) async {
    try {
      // LOADING
      emit(state.copyWith(
          status: AsesmenIgdStatus.isLoadingSave, saveResultFailure: none()));

      final saveData = await keperawatanBangsalService.onSaveAsesmenIGD(
          noReg: event.noReg,
          noRm: event.noRm,
          tanggal: event.tanggal,
          person: event.person,
          devicesID: event.devicesID,
          pelayanan: event.pelayanan,
          info: event.info,
          infoDetail: event.infoDetail,
          caraMasuk: event.caraMasuk,
          asalMasuk: event.asalMasuk,
          fungsional: event.fungsional,
          keluhanUtama: event.keluhanUtama,
          penyakitSekarang: event.penyakitSekarang,
          penyakitDahulu: event.penyakitDahulu,
          riwayatDahulu: event.riwayatDahulu,
          reaksiAlergi: event.reaksiAlergi);

      emit(state.copyWith(
          status: AsesmenIgdStatus.loaded,
          saveResultFailure: optionOf(saveData)));

      emit(state.copyWith(
        saveResultFailure: none(),
        status: AsesmenIgdStatus.loaded,
      ));
    } catch (e) {
      emit(state.copyWith(
        saveResultFailure: none(),
        status: AsesmenIgdStatus.loaded,
      ));
    }
  }

  Future<void> _onSaveRiwayatPenyakitKeluarga(
    OnSavePenyakitKeluargaEvent event,
    Emitter<AsesmenIgdAwalState> emit,
  ) async {
    try {
      await keperawatanBangsalService.savePenyakitKeluargaEvent(
          noRM: event.noRM, penyakit: event.penyakitKeluarga);

      final getData = await igdServices.onGetAsesmenIGD(
        noReg: event.noReg,
        noRM: event.noRM,
        tanggal: event.tanggal,
        person: event.person,
      );

      // GET DATA
      PengkajianAwalIgdRepository data =
          PengkajianAwalIgdRepository.fromMap(getData["response"]);

      emit(state.copyWith(
          status: AsesmenIgdStatus.loaded, pengkajianWalIGD: data));
    } catch (e) {
      emit(state.copyWith(
          status: AsesmenIgdStatus.loaded,
          pengkajianWalIGD: state.pengkajianWalIGD));
    }
  }

  Future<void> _onDeletePenyakitKeluargaEvent(
    OnDeletePenyakitKeluargaEvent event,
    Emitter<AsesmenIgdAwalState> emit,
  ) async {
    try {
      await libraryService.onDeletePenyakitKeluarga(
          kelompok: event.kelompok, noRM: event.noRm, nomor: event.nomor);

      final getData = await igdServices.onGetAsesmenIGD(
          noReg: event.noReg,
          noRM: event.noRM,
          tanggal: event.tanggal,
          person: event.person);

      // GET DATA
      PengkajianAwalIgdRepository data =
          PengkajianAwalIgdRepository.fromMap(getData["response"]);

      emit(state.copyWith(
          status: AsesmenIgdStatus.loaded, pengkajianWalIGD: data));
    } catch (e) {
      emit(state.copyWith(
          status: AsesmenIgdStatus.loaded,
          pengkajianWalIGD: state.pengkajianWalIGD));
    }
  }

  Future<void> _onGetAsesmenAwalIGDEvent(
    OnGetAsesmenAwalIGDEvent event,
    Emitter<AsesmenIgdAwalState> emit,
  ) async {
    emit(state.copyWith(status: AsesmenIgdStatus.isLodingGetData));

    try {
      // START DATA
      final getData = await igdServices.onGetAsesmenIGD(
          noReg: event.noReg,
          noRM: event.noRM,
          tanggal: event.tanggal,
          person: event.person);

      // GET DATA
      PengkajianAwalIgdRepository data =
          PengkajianAwalIgdRepository.fromMap(getData["response"]);

      emit(state.copyWith(
          status: AsesmenIgdStatus.loaded, pengkajianWalIGD: data));

      //===//
    } catch (e) {
      emit(state.copyWith(
          status: AsesmenIgdStatus.loaded,
          pengkajianWalIGD: state.pengkajianWalIGD));
    }
  }

  Future<void> _onSelectionAnamnesaEvent(
    OnSelectionAnamnesa event,
    Emitter<AsesmenIgdAwalState> emit,
  ) async {
    emit(state.copyWith(status: AsesmenIgdStatus.isChanged));
    emit(state.copyWith(
        pengkajianWalIGD: state.pengkajianWalIGD.copyWith(
            pengkajian: state.pengkajianWalIGD.pengkajian
                .copyWith(info: event.value))));
  }

  Future<void> _onChangedDetailAnaneseEvent(
    OnChangedDetailAnamnesa event,
    Emitter<AsesmenIgdAwalState> emit,
  ) async {
    emit(state.copyWith(status: AsesmenIgdStatus.isChanged));
    emit(state.copyWith(
        pengkajianWalIGD: state.pengkajianWalIGD.copyWith(
            pengkajian: state.pengkajianWalIGD.pengkajian
                .copyWith(infoDetail: event.value))));
  }
}
