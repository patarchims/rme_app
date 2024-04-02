import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/models/response/asesmen_bangsal/asesmen_dokter_model.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/repository/librari/librari_repository.dart';
import 'package:injectable/injectable.dart';

part 'asesmen_dokter_event.dart';
part 'asesmen_dokter_state.dart';
part 'asesmen_dokter_bloc.freezed.dart';

@injectable
class AsesmenDokterBloc extends Bloc<AsesmenDokterEvent, AsesmenDokterState> {
  LibrariRepositori librariRepositori;
  AsesmenDokterBloc(this.librariRepositori)
      : super(AsesmenDokterState.initial()) {
    on<AsesmenDokterEvent>((event, emit) => _onEventChanged(event, emit));
  }

  Future<void> _onEventChanged(
      AsesmenDokterEvent event, Emitter<AsesmenDokterState> emit) async {
    await event.maybeMap(
        orElse: () {},
        telaahOnchanged: (e) {
          emit(state.copyWith(
              asesmentDokter: state.asesmentDokter.copyWith(telaah: e.value)));
        },
        keluhanTambahanOnchanged: (e) {
          emit(state.copyWith(
              asesmentDokter:
                  state.asesmentDokter.copyWith(keluhanTambahan: e.value)));
        },
        anamnesaOnchanged: (e) {
          emit(state.copyWith(
              asesmentDokter:
                  state.asesmentDokter.copyWith(anamnesa: e.value)));
        },
        jenisPelayananOnchanged: (e) {
          emit(state.copyWith(
              asesmentDokter: state.asesmentDokter.copyWith(jenpel: e.value)));
        },
        keluhanUtamaOnchanged: (e) {
          emit(state.copyWith(
              asesmentDokter:
                  state.asesmentDokter.copyWith(keluhanUtama: e.value)));
        },
        masalahMedisOnchanged: (e) {
          emit(state.copyWith(
              asesmentDokter:
                  state.asesmentDokter.copyWith(masalahMedis: e.value)));
        },
        onGetAsesment: (e) async {
          emit(state.copyWith(getResult: none(), isLoadingGetAsesmen: true));

          final onGet =
              await librariRepositori.getAsesmenDokter(noReg: e.value);

          log(onGet.toString());

          onGet.fold(
              (l) => l.maybeMap(
                  orElse: () {},
                  failure: (e) {
                    emit(state.copyWith(
                        asesmentDokter: AsesmenDokterModel(
                            keluhanTambahan: "",
                            jenpel: "",
                            keluhanUtama: "",
                            telaah: "",
                            masalahMedis: "",
                            riwayatSekarang: "",
                            riwayatDulu: "",
                            riwayatObat: "",
                            riwayatKeluarga: "",
                            riwayatAlergi: "",
                            riwayatDetail: "",
                            anamnesa: "")));
                  }),
              (r) => r.maybeMap(
                  orElse: () {},
                  loaded: (e) {
                    try {
                      final data =
                          AsesmenDokterModel.fromJson(e.value["response"]);

                      log(data.toString());

                      emit(state.copyWith(asesmentDokter: data));
                    } catch (e) {
                      emit(state.copyWith(
                          asesmentDokter: AsesmenDokterModel(
                              keluhanTambahan: "",
                              jenpel: "",
                              keluhanUtama: "",
                              telaah: "",
                              masalahMedis: "",
                              riwayatSekarang: "",
                              riwayatDulu: "",
                              riwayatObat: "",
                              riwayatKeluarga: "",
                              riwayatAlergi: "",
                              riwayatDetail: "",
                              anamnesa: "")));
                    }
                  }));

          // ======================= //
          emit(state.copyWith(getResult: none(), isLoadingGetAsesmen: false));
        },
        onSaveAsesment: (e) async {
          emit(state.copyWith(saveResult: none(), isLoadingSaveAsesmen: true));

          final onSave = await librariRepositori.saveAsesmenDokter(
              asesmenDokterModel: e.asesmentDokter,
              noreg: e.noReg,
              person: e.person,
              deviceID: e.deviceID,
              pelayanan: e.pelayanan);

          // ======================= //  =========================== //
          emit(state.copyWith(
              saveResult: optionOf(onSave), isLoadingSaveAsesmen: false));

          emit(state.copyWith(saveResult: none(), isLoadingSaveAsesmen: false));
        },
        riwayatAlergiOnchanged: (e) {
          emit(state.copyWith(
              asesmentDokter:
                  state.asesmentDokter.copyWith(riwayatAlergi: e.value)));
        },
        riwayatDetailOnchanged: (e) {
          emit(state.copyWith(
              asesmentDokter:
                  state.asesmentDokter.copyWith(riwayatDetail: e.value)));
        },
        riwayatDuluOnchanged: (e) {
          emit(state.copyWith(
              asesmentDokter:
                  state.asesmentDokter.copyWith(riwayatDulu: e.value)));
        },
        riwayatKeluargaOnchanged: (e) {
          emit(state.copyWith(
              asesmentDokter:
                  state.asesmentDokter.copyWith(riwayatKeluarga: e.value)));
        },
        riwayatObatOnchanged: (e) {
          emit(state.copyWith(
              asesmentDokter:
                  state.asesmentDokter.copyWith(riwayatObat: e.value)));
        },
        riwayatSekarangOnchanged: (e) {
          emit(state.copyWith(
              asesmentDokter:
                  state.asesmentDokter.copyWith(riwayatSekarang: e.value)));
        },
        started: (e) {});
  }
}
