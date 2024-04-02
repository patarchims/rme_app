import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/repository/librari/librari_repository.dart';
import 'package:injectable/injectable.dart';

part 'hasil_penunjang_event.dart';
part 'hasil_penunjang_state.dart';
part 'hasil_penunjang_bloc.freezed.dart';

@injectable
class HasilPenunjangBloc
    extends Bloc<HasilPenunjangEvent, HasilPenunjangState> {
  LibrariRepositori librariRepositori;
  HasilPenunjangBloc(this.librariRepositori)
      : super(const HasilPenunjangState()) {
    on<HasilPenunjangEvent>((event, emit) async {
      await event.maybeMap(
          orElse: () {},
          getHasilPemeriksaanGiziOldDB: (e) async {
            emit(state.copyWith(
                getOrSuccessResultGiziOldDB: none(), isLoadingGizi: true));
            // GET RESULT LABOR
            final repoSitory =
                await librariRepositori.getGiziOldDB(noreg: e.noReg);

            emit(state.copyWith(
                getOrSuccessResultGiziOldDB: optionOf(repoSitory),
                isLoadingGizi: false));
          },
          getHasilRadiologiOldDB: (e) async {
            emit(state.copyWith(
                getOrSuccessResultRadiologiOldDB: none(),
                isLoadingRadiologi: true));
            // GET RESULT LABOR
            final repoSitory =
                await librariRepositori.getRadiologiOldDB(noreg: e.noReg);

            emit(state.copyWith(
                getOrSuccessResultRadiologiOldDB: optionOf(repoSitory),
                isLoadingRadiologi: false));
          },
          getHasilFisioterapiOldDB: (e) async {
            emit(state.copyWith(
                getOrSuccessResultFisioterapyOldDB: none(),
                isLoadingFisioterapy: true));

            final repoSitory =
                await librariRepositori.getFisioTerapiOldDB(noreg: e.noReg);

            emit(state.copyWith(
                getOrSuccessResultFisioterapyOldDB: optionOf(repoSitory),
                isLoadingFisioterapy: false));
          },
          getHasilLaborOldDB: (e) async {
            // GET DATA
            emit(state.copyWith(
                getOrSuccessResultLaborOldDB: none(), isLoadingLabor: true));
            // GET RESULT LABOR
            final repoSitory =
                await librariRepositori.getLaborOldDB(noreg: e.noReg);

            emit(state.copyWith(
                getOrSuccessResultLaborOldDB: optionOf(repoSitory),
                isLoadingLabor: false));
          },
          getHasilLabor: (e) async {
            // GET LABOR
            emit(state.copyWith(
                getOrSuccessResultLabor: none(), isLoadingLabor: true));
            // GET RESULT LABOR
            final repoSitory = await librariRepositori.getLabor(noreg: e.noReg);

            emit(state.copyWith(
                getOrSuccessResultLabor: optionOf(repoSitory),
                isLoadingLabor: false));
          },
          getHasilRadiologi: (e) async {
            emit(state.copyWith(
                getOrSuccessResultRadiologi: none(), isLoadingRadiologi: true));
            // GET RESULT LABOR
            final repoSitory =
                await librariRepositori.getRadiologi(noreg: e.noReg);

            log("HASIL LABOR $repoSitory");

            emit(state.copyWith(
                getOrSuccessResultRadiologi: optionOf(repoSitory),
                isLoadingRadiologi: false));
          },
          getHasilFisioterapi: (e) async {
            emit(state.copyWith(
                getOrSuccessResultFisioterapy: none(),
                isLoadingFisioterapy: true));
            // GET RESULT LABOR
            final repoSitory =
                await librariRepositori.getFisioTerapi(noreg: e.noReg);

            log("HASIL LABOR $repoSitory");

            emit(state.copyWith(
                getOrSuccessResultFisioterapy: optionOf(repoSitory),
                isLoadingFisioterapy: false));
          },
          getHasilPemeriksaanGizi: (e) async {
            emit(state.copyWith(
                getOrSuccessResultGizi: none(), isLoadingGizi: true));
            // GET RESULT LABOR
            final repoSitory = await librariRepositori.getGizi(noreg: e.noReg);

            log("HASIL GIZI $repoSitory");

            emit(state.copyWith(
                getOrSuccessResultGizi: optionOf(repoSitory),
                isLoadingGizi: false));
          });
    });
  }
}
