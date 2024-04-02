import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/repository/librari/librari_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../network/api_failure_handler.dart';
import '../../../network/api_success_handler.dart';

part 'cppt_event.dart';
part 'cppt_state.dart';
part 'cppt_bloc.freezed.dart';

@injectable
class CpptBloc extends Bloc<CpptEvent, CpptState> {
  final LibrariRepositori librariRepositori;
  CpptBloc(this.librariRepositori) : super(CpptState.initial()) {
    on<CpptEvent>((event, emit) => _onEventChanged(event, emit));
  }

  Future<void> _onEventChanged(CpptEvent event, Emitter<CpptState> emit) async {
    await event.maybeMap(
      orElse: () {},
      onDeleteCPPTPasien: (e) async {
        emit(state.copyWith(isLoadingCPPT: true, getResult: none()));
        // GET DATA
        // await Future.delayed(const Duration(seconds: 5));
        final data =
            await librariRepositori.onDeleteCPPTPasien(noRM: e.noRM, no: e.no);
        // KIRIM DATA KE UI
        emit(state.copyWith(isLoadingCPPT: false, getResult: optionOf(data)));
      },

      onUpdateCPPT: (e) async {
        emit(state.copyWith(
            isLoadingSaveCPPT: true, updateResultFailure: none()));

        final data = await librariRepositori.onUpdateCPPTPasien(
            ppa: e.ppa,
            bagian: e.bagian,
            subjetif: e.subjetif,
            idCPPT: e.idCppt,
            instruksiPPA: e.instruksiPPA,
            objektif: e.objektif,
            asesmen: e.asesmen,
            plan: e.plan);

        emit(state.copyWith(
            isLoadingSaveCPPT: false, updateResultFailure: optionOf(data)));

        emit(state.copyWith(
            isLoadingSaveCPPT: false, updateResultFailure: none()));
      },
      saveCPPTPasien: (e) async {
        emit(
            state.copyWith(isLoadingSaveCPPT: true, saveResultFailure: none()));

        final data = await librariRepositori.saveCPPTPasien(
            waktu: e.waktu,
            ppa: e.ppa,
            deviceID: e.deviceID,
            kelompok: e.kelompok,
            kdbagian: e.kdbagian,
            noReg: e.noReg,
            dpjp: e.dpjp,
            subjetif: e.subjetif,
            pelayanan: e.pelayanan,
            objektif: e.objektif,
            asesmen: e.asesmen,
            plan: e.plan);

        emit(state.copyWith(
            isLoadingSaveCPPT: false, saveResultFailure: optionOf(data)));

        emit(state.copyWith(
            isLoadingSaveCPPT: false, saveResultFailure: none()));
      },
      // ON GET CPPT PASIEN
      onGetCPPTPasien: (e) async {
        // TAMPILKAN LOADING
        emit(state.copyWith(isLoadingCPPT: true, getResult: none()));
        // GET DATA
        // await Future.delayed(const Duration(seconds: 5));
        final data = await librariRepositori.getCPPTPasien(noRM: e.noRM);
        // KIRIM DATA KE UI
        emit(state.copyWith(isLoadingCPPT: false, getResult: optionOf(data)));
      },
    );
  }
}
