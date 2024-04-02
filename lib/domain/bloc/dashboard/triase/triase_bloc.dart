import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/models/response/asesmen_keperawatan_igd/skrining_nyeri_response_model.dart';
import 'package:hms_app/domain/models/response/riwayat_alergi_reponse_model.dart';
import 'package:hms_app/domain/models/response/skala/skala_nyeri_model.dart';
import 'package:hms_app/domain/models/triase/triase_model.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/repository/librari/librari_repository.dart';
import 'package:hms_app/domain/repository/soap/soap_repository.dart';
import 'package:injectable/injectable.dart';

part 'triase_event.dart';
part 'triase_state.dart';
part 'triase_bloc.freezed.dart';

@injectable
class TriaseBloc extends Bloc<TriaseEvent, TriaseState> {
  SoapRepository soapRepository;
  LibrariRepositori librariRepositori;
  TriaseBloc(this.soapRepository, this.librariRepositori)
      : super(TriaseState.initial()) {
    on<TriaseEvent>((event, emit) => _onEventChanged(event, emit));
  }

  Future<void> _onEventChanged(
      TriaseEvent event, Emitter<TriaseState> emit) async {
    await event.maybeMap(
        orElse: () {},
        skriningNyeriOnchanged: (e) {},
        saveSkriningNyeri: (e) async {
          emit(state.copyWith(
              saveSkriningNyeri: none(), isLoadingSaveSkriningNyeri: true));

          final simpanData = await librariRepositori.saveSkriningNyeri(
              skriningNyeriModel: e.skriningNyeri,
              noreg: e.noReg,
              person: e.person,
              deviceID: e.deviceID,
              pelayanan: e.pelayanan);

          emit(state.copyWith(
              saveSkriningNyeri: optionOf(simpanData),
              isLoadingSaveSkriningNyeri: false));

          emit(state.copyWith(
              saveSkriningNyeri: none(), isLoadingSaveSkriningNyeri: false));
        },
        menjalarOnchanged: (e) {
          emit(state.copyWith(
              skriningNyeri:
                  state.skriningNyeri.copyWith(nyeriMenjalar: e.value)));
        },
        menjalarDetailOnchanged: (e) {
          emit(state.copyWith(
              skriningNyeri:
                  state.skriningNyeri.copyWith(manjalarDetail: e.value)));
        },
        lamaNyeriOnchanged: (e) {
          emit(state.copyWith(
              skriningNyeri: state.skriningNyeri.copyWith(lamaNyeri: e.value)));
        },
        kualitasNyeriOnchanged: (e) {
          emit(state.copyWith(
              skriningNyeri:
                  state.skriningNyeri.copyWith(kualitasNyeri: e.value)));
        },
        getSkriningNyeri: (e) async {
          emit(state.copyWith(
              getSkriningNyeri: none(), isLoadingGetSkriningNyeri: true));

          final simpanData =
              await librariRepositori.getSkriningNyeri(noReg: e.noReg);

          log("GET SRIKING NYERI");
          log(simpanData.toString());

          simpanData.fold(
              (l) => l.maybeMap(
                  orElse: () {},
                  failure: (e) {
                    // ================================= //
                    emit(state.copyWith(
                        skriningNyeri: SkriningNyeriModel(
                            skalaNyeri: 0,
                            frekuensiNyeri: "",
                            lamaNyeri: "",
                            nyeriMenjalar: "",
                            manjalarDetail: "",
                            kualitasNyeri: "",
                            nyeriPemicu: "",
                            nyeriPengurang: "")));
                  }),
              (r) => r.maybeMap(
                  orElse: () {},
                  loaded: (e) {
                    // ======================= TAMPILKAN DATA
                    try {
                      SkriningNyeriModel data =
                          SkriningNyeriModel.fromJson(e.value["response"]);

                      emit(state.copyWith(skriningNyeri: data));
                    } catch (e) {
                      emit(state.copyWith(
                          skriningNyeri: SkriningNyeriModel(
                              skalaNyeri: 0,
                              frekuensiNyeri: "",
                              lamaNyeri: "",
                              nyeriMenjalar: "",
                              manjalarDetail: "",
                              kualitasNyeri: "",
                              nyeriPemicu: "",
                              nyeriPengurang: "")));
                    }
                  }));

          emit(state.copyWith(
              getSkriningNyeri: none(), isLoadingGetSkriningNyeri: false));
        },
        frekuensiNyeriOnchanged: (e) {
          emit(state.copyWith(
              skriningNyeri:
                  state.skriningNyeri.copyWith(frekuensiNyeri: e.value)));
        },
        faktorPemicuOnchanged: (e) {
          emit(state.copyWith(
              skriningNyeri:
                  state.skriningNyeri.copyWith(nyeriPemicu: e.value)));
        },
        faktorMengurangi: (e) {
          emit(state.copyWith(
              skriningNyeri:
                  state.skriningNyeri.copyWith(nyeriPengurang: e.value)));
        },
        saveTriaseSkala: (e) async {
          // ================================ //
          emit(state.copyWith(
              isLoadingSaveSkalaTriase: true,
              savefailOrSuccessSkalaTriaseResult: none()));

          final saveData = await soapRepository.saveSkalaTirase(
              deviceID: e.deviceID,
              noReg: e.noReg,
              pelayanan: e.pelayanan,
              person: e.person,
              skalaTriaseModel: e.skalaTriaseModel,
              userID: e.userID);

          emit(state.copyWith(
              isLoadingSaveSkalaTriase: false,
              savefailOrSuccessSkalaTriaseResult: optionOf(saveData)));

          emit(state.copyWith(
              isLoadingSaveSkalaTriase: false,
              savefailOrSuccessSkalaTriaseResult: none()));
        },
        getTriaseSkala: (e) async {
          emit(state.copyWith(
              isLoadingGetSkalaTriase: true, getfailOrSuccessResult: none()));

          final getData = await soapRepository.getSkalaTriase(noReg: e.noReg);

          getData.fold(
              (l) => l.maybeMap(orElse: () {
                    emit(state.copyWith(
                      skalaFlaccWajah: 0,
                      skalaFlaccKaki: 0,
                      skalaFlaccAktifitas: 0,
                      skalaFlaccMenangis: 0,
                      skalaFlaccBersuara: 0,
                      skalaNyeriValue: 0,
                      skalaTriaseValue: 0,
                      profokatifStr: "",
                      qualityStr: "",
                      radiationStr: "",
                      severityStr: "",
                      timeStr: "",
                    ));
                  }, failure: (e) {
                    emit(state.copyWith(
                        skalaFlaccWajah: 0,
                        skalaFlaccKaki: 0,
                        skalaFlaccAktifitas: 0,
                        skalaFlaccMenangis: 0,
                        skalaFlaccBersuara: 0,
                        skalaNyeriValue: 0,
                        skalaTriaseValue: 0,
                        profokatifStr: "",
                        qualityStr: "",
                        radiationStr: "",
                        severityStr: "",
                        timeStr: ""));
                  }),
              (r) => r.maybeMap(orElse: () {
                    emit(state.copyWith(
                      skalaFlaccWajah: 0,
                      skalaFlaccKaki: 0,
                      skalaFlaccAktifitas: 0,
                      skalaFlaccMenangis: 0,
                      skalaFlaccBersuara: 0,
                      skalaNyeriValue: 0,
                      skalaTriaseValue: 0,
                      profokatifStr: "",
                      qualityStr: "",
                      radiationStr: "",
                      severityStr: "",
                      timeStr: "",
                    ));
                  }, loaded: (value) {
                    // ========== ============= //
                    try {
                      SkalaTriaseModel riwayat =
                          SkalaTriaseModel.fromJson(value.value["response"]);

                      emit(state.copyWith(
                        skalaFlaccWajah: riwayat.flaccWajah.toDouble(),
                        skalaFlaccKaki: riwayat.flaccKaki.toDouble(),
                        skalaFlaccAktifitas: riwayat.flaccAktifitas.toDouble(),
                        skalaFlaccMenangis: riwayat.flaccMenangis.toDouble(),
                        skalaFlaccBersuara: riwayat.flaccBersuara.toDouble(),
                        skalaNyeriValue: riwayat.nyeri.toDouble(),
                        skalaTriaseValue: riwayat.skalaTriase.toDouble(),
                        profokatifStr: riwayat.nyeriP,
                        qualityStr: riwayat.nyeriQ,
                        radiationStr: riwayat.nyeriR,
                        severityStr: riwayat.nyeriS,
                        timeStr: riwayat.nyeriT,
                      ));
                    } catch (e) {
                      emit(state.copyWith(
                        skalaFlaccWajah: 0,
                        skalaFlaccKaki: 0,
                        skalaFlaccAktifitas: 0,
                        skalaFlaccMenangis: 0,
                        skalaFlaccBersuara: 0,
                        skalaNyeriValue: 0,
                        skalaTriaseValue: 0,
                        profokatifStr: "",
                        qualityStr: "",
                        radiationStr: "",
                        severityStr: "",
                        timeStr: "",
                      ));
                    }
                  }, emty: (e) {
                    emit(state.copyWith(
                      skalaFlaccWajah: 0,
                      skalaFlaccKaki: 0,
                      skalaFlaccAktifitas: 0,
                      skalaFlaccMenangis: 0,
                      skalaFlaccBersuara: 0,
                      skalaNyeriValue: 0,
                      skalaTriaseValue: 0,
                      profokatifStr: "",
                      qualityStr: "",
                      radiationStr: "",
                      severityStr: "",
                      timeStr: "",
                    ));
                  }));

          emit(state.copyWith(
              isLoadingGetSkalaTriase: false, getfailOrSuccessResult: none()));
        },
        skalaFlaccAktifitasOnchanged: (e) {
          emit(state.copyWith(skalaFlaccAktifitas: e.value));
        },
        skalaFlaccBersuaraOnchanged: (e) {
          emit(state.copyWith(skalaFlaccBersuara: e.value));
        },
        skalaFlaccKakiOnchanged: (e) {
          emit(state.copyWith(skalaFlaccKaki: e.value));
        },
        skalaFlaccMenangisOnchanged: (e) {
          emit(state.copyWith(skalaFlaccMenangis: e.value));
        },
        skalaFlaccWajahOnchanged: (e) {
          emit(state.copyWith(skalaFlaccWajah: e.value));
        },
        skalaNyeriOnchanged: (e) {
          emit(state.copyWith(skalaNyeriValue: e.value));
          emit(state.copyWith(
              skriningNyeri:
                  state.skriningNyeri.copyWith(skalaNyeri: e.value.toInt())));
        },
        skalaTriaseOnchanged: (e) {
          emit(state.copyWith(skalaTriaseValue: e.value));
        },
        severityOnchanged: (e) {
          emit(state.copyWith(severityStr: e.value));
        },
        provokatifOnchanged: (e) {
          emit(state.copyWith(profokatifStr: e.value));
        },
        qualityOnchanged: (e) {
          emit(state.copyWith(qualityStr: e.value));
        },
        radiationOnchanged: (e) {
          emit(state.copyWith(radiationStr: e.value));
        },
        timeOnchanged: (e) {
          emit(state.copyWith(timeStr: e.value));
        },
        getRiwayatAlergi: (e) async {
          emit(state.copyWith(
              isLoadingGetRiwayatAlergi: true,
              getfailOrSuccessResultRiwayatAlergi: none()));

          // LAKUKAN SIMPAN PADA
          // RIWAYAT ALERGI
          final saveData =
              await soapRepository.getRiwayatAlergi(noReg: e.noReg);

          saveData.fold(
              (l) => l.maybeMap(orElse: () {
                    emit(state.copyWith(
                        keluhanUtama: "",
                        statusAlergi: "",
                        statusAlergiDetail: ""));
                  }, failure: (e) {
                    emit(state.copyWith(
                        keluhanUtama: "",
                        statusAlergi: "",
                        statusAlergiDetail: ""));
                  }),
              (r) => r.maybeMap(
                  orElse: () {},
                  loaded: (value) {
                    try {
                      RiwayatAlergiResponseModel riwayat =
                          RiwayatAlergiResponseModel.fromJson(
                              value.value["response"]);

                      emit(state.copyWith(
                          keluhanUtama: riwayat.keluhanUtama,
                          statusAlergi: riwayat.alergi,
                          statusAlergiDetail: riwayat.alergiDetail));
                    } catch (e) {
                      emit(state.copyWith(
                          keluhanUtama: "",
                          statusAlergi: "",
                          statusAlergiDetail: ""));
                    }
                  }));

          emit(state.copyWith(
              isLoadingGetRiwayatAlergi: false,
              getfailOrSuccessResultRiwayatAlergi: none()));
        },
        saveRiwayatAlergi: (e) async {
          emit(state.copyWith(
              isLoadingSaveRiwyatAlergi: true,
              savefailOrSuccessResultRiwayatAlergi: none()));

          // LAKUKAN SIMPAN PADA RIWAYAT ALERGI
          final saveData = await soapRepository.saveRiwayatAlergi(
              noReg: e.noReg,
              deviceID: e.deviceID,
              keluhanUtama: e.keluhanUtama,
              pelayanan: e.pelayanan,
              person: e.person,
              statusAlergi: e.statusAlergi,
              statusAlergiDetail: e.statusAlergiDetail,
              userID: e.userID);

          emit(state.copyWith(
              isLoadingSaveRiwyatAlergi: false,
              savefailOrSuccessResultRiwayatAlergi: optionOf(saveData)));

          emit(state.copyWith(
              isLoadingSaveRiwyatAlergi: false,
              savefailOrSuccessResultRiwayatAlergi: none()));
        },
        keluhanUtamaOnchanged: (e) {
          emit(state.copyWith(keluhanUtama: e.value));
        },
        statusAlergiDetailOnchanged: (e) {
          emit(state.copyWith(statusAlergiDetail: e.value));
        },
        statusAlergiOnchanged: (e) {
          emit(state.copyWith(statusAlergi: e.value));
        },
        started: (e) {},
        getTriase: (e) async {
          emit(state.copyWith(isLoading: true, getfailOrSuccessResult: none()));
          final saveData = await soapRepository.getTriase(noReg: e.noReg);
          emit(state.copyWith(
              isLoading: false, getfailOrSuccessResult: optionOf(saveData)));
          emit(
              state.copyWith(isLoading: false, getfailOrSuccessResult: none()));
        },
        saveTriase: (e) async {
          emit(state.copyWith(isLoading: true));
          final saveData =
              await soapRepository.saveTriase(triaseModel: e.triaseModel);

          emit(state.copyWith(isLoading: false));
          emit(state.copyWith(
              isLoading: false, saveOrSuccessResult: optionOf(saveData)));
          emit(state.copyWith(isLoading: false, saveOrSuccessResult: none()));
        });
  }
}
