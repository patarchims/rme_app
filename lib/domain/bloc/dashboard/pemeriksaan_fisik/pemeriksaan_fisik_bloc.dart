import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/models/response/asesmen_bangsal/keadaan_umum_model.dart';
import 'package:hms_app/domain/models/response/pemerisaan_fisik/pemeriksaan_fisik_bangsal_model.dart';
import 'package:hms_app/domain/models/response/pemerisaan_fisik/pemeriksaan_fisik_igd_model.dart';
import 'package:hms_app/domain/models/response/pemerisaan_fisik/vital_sign_bangsal_model.dart';
import 'package:hms_app/domain/models/response/pemerisaan_fisik/vital_sign_gangguan_perilaku_model.dart';
import 'package:hms_app/domain/models/soap/medis/pemeriksaan_fisik_anak_model.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/repository/librari/librari_repository.dart';
import 'package:hms_app/presentation/component/constant/list_constants.dart';
import 'package:injectable/injectable.dart';

part 'pemeriksaan_fisik_event.dart';
part 'pemeriksaan_fisik_state.dart';
part 'pemeriksaan_fisik_bloc.freezed.dart';

@injectable
class PemeriksaanFisikBloc
    extends Bloc<PemeriksaanFisikEvent, PemeriksaanFisikState> {
  LibrariRepositori librariRepositori;
  PemeriksaanFisikBloc(this.librariRepositori)
      : super(PemeriksaanFisikState.initial()) {
    on<PemeriksaanFisikEvent>((event, emit) => _onEventChanged(event, emit));
  }

  Future<void> _onEventChanged(
      PemeriksaanFisikEvent event, Emitter<PemeriksaanFisikState> emit) async {
    await event.maybeMap(
        orElse: () {},
        getPemeriksaanFisikBangsalDokter: (e) async {
          emit(state.copyWith(
              getAsesmenPemeriksaanFisikBangsalResult: none(),
              isLoadingGetPemeriksaanFisikBangsal: true));

          final getData = await librariRepositori
              .getPemeriksaanFisikBangsalDokter(noReg: e.noReg);

          log("Pemeriksaan Fisik Bangsal");
          log(getData.toString());

          getData.fold(
              (l) => l.maybeMap(orElse: () {
                    emit(state.copyWith(
                        pemeriksaanFisikBangsalModel:
                            PemeriksaanFisikBangsalModel(
                                dindingDada: "",
                                dindingPerut: "",
                                gigi: "",
                                hati: "",
                                leherlainnya: "",
                                lien: "",
                                mata: "",
                                peristaltikUsus: "",
                                suaraJantung: "",
                                tht: "",
                                thyroid: "",
                                pemeriksaanFisik: "",
                                kepala: "",
                                leher: "",
                                dada: "",
                                abdomen: "",
                                punggung: "",
                                genetalia: "",
                                ekstremitas: "",
                                lainLain: "")));
                  }),
              (r) => r.maybeMap(orElse: () {
                    emit(state.copyWith(
                        pemeriksaanFisikBangsalModel:
                            PemeriksaanFisikBangsalModel(
                                dindingDada: "",
                                dindingPerut: "",
                                gigi: "",
                                hati: "",
                                leherlainnya: "",
                                lien: "",
                                mata: "",
                                peristaltikUsus: "",
                                suaraJantung: "",
                                tht: "",
                                thyroid: "",
                                pemeriksaanFisik: "",
                                kepala: "",
                                leher: "",
                                dada: "",
                                abdomen: "",
                                punggung: "",
                                genetalia: "",
                                ekstremitas: "",
                                lainLain: "")));
                  }, loaded: (e) {
                    try {
                      PemeriksaanFisikBangsalModel data =
                          PemeriksaanFisikBangsalModel.fromJson(
                              e.value["response"]);

                      log("PEMERIKSAAN FISIK");
                      log(data.kepala.toString());

                      emit(state.copyWith(pemeriksaanFisikBangsalModel: data));
                      log(state.pemeriksaanFisikBangsalModel.toString());
                    } catch (e) {
                      emit(state.copyWith(
                          pemeriksaanFisikBangsalModel:
                              PemeriksaanFisikBangsalModel(
                                  dindingDada: "",
                                  dindingPerut: "",
                                  gigi: "",
                                  hati: "",
                                  leherlainnya: "",
                                  lien: "",
                                  mata: "",
                                  peristaltikUsus: "",
                                  suaraJantung: "",
                                  tht: "",
                                  thyroid: "",
                                  pemeriksaanFisik: "",
                                  kepala: "",
                                  leher: "",
                                  dada: "",
                                  abdomen: "",
                                  punggung: "",
                                  genetalia: "",
                                  ekstremitas: "",
                                  lainLain: "")));
                    }
                  }));

          emit(state.copyWith(
              getAsesmenPemeriksaanFisikBangsalResult: none(),
              isLoadingGetPemeriksaanFisikBangsal: false));
        },
        getVitalSignResultPerawat: (e) {
          // LOADING
        },
        onGetPemeriksaanFisikAnak: (e) async {
          // LOADING
          emit(state.copyWith(
              isLoadingGetPemeriksaanFisikAnak: true,
              getPemeriksaanFisikAnakResult: none()));

          final data =
              await librariRepositori.getPemeriksaanFisikAnak(noReg: e.noReg);

          log(data.toString());

          data.fold(
              (l) => l.maybeMap(
                  orElse: () {},
                  failure: (e) {
                    emit(state.copyWith(
                        pemeriksaanFisikAnak: PemeriksaanFisikAnakModel(
                            mata: "",
                            mulut: "",
                            gigi: "",
                            thyroid: "",
                            paru: "",
                            jantung: "",
                            dindingDada: "",
                            dindingdadaRetEpigastrium: "",
                            dindingDadaRetSuprastermal: "",
                            dindingDadaRetraksi: "",
                            hepar: "",
                            heparDetail: "",
                            tugorKulit: "",
                            limpa: "",
                            limpaDetail: "",
                            ginjal: "",
                            ginjalDetail: "",
                            genetalia: "",
                            ouf: "",
                            ekstremitas: "")));
                  }),
              (r) => r.maybeMap(
                  orElse: () {},
                  loaded: (e) {
                    //================= //
                    try {
                      PemeriksaanFisikAnakModel data =
                          PemeriksaanFisikAnakModel.fromMap(
                              e.value["response"]);

                      log("PEMERIKSAAN ANAK");
                      log(data.toString());

                      emit(state.copyWith(pemeriksaanFisikAnak: data));
                    } catch (e) {
                      emit(state.copyWith(
                          pemeriksaanFisikAnak: PemeriksaanFisikAnakModel(
                              mata: "",
                              mulut: "",
                              gigi: "",
                              thyroid: "",
                              paru: "",
                              jantung: "",
                              dindingDada: "",
                              dindingdadaRetEpigastrium: "",
                              dindingDadaRetSuprastermal: "",
                              dindingDadaRetraksi: "",
                              hepar: "",
                              heparDetail: "",
                              tugorKulit: "",
                              limpa: "",
                              limpaDetail: "",
                              ginjal: "",
                              ginjalDetail: "",
                              genetalia: "",
                              ouf: "",
                              ekstremitas: "")));
                    }
                  }));

          emit(state.copyWith(
              isLoadingGetPemeriksaanFisikAnak: false,
              getPemeriksaanFisikAnakResult: none()));
        },
        onSavePemeriksaanFisikAnak: (e) async {
          // LOADING
          emit(state.copyWith(
              isLoadingSavePemeriksaanFisikAnak: true,
              savePemeriksaanFisikAnakResult: none()));

          final data = await librariRepositori.savePemeriksaanFisikAnak(
              deviceID: e.deviceID,
              noreg: e.noReg,
              kategori: e.kategori,
              pelayanan: e.pelayanan,
              pemeriksaanFisikAnak: e.pemeriksaanFisikAnak,
              person: e.person);

          emit(state.copyWith(
              isLoadingSavePemeriksaanFisikAnak: false,
              savePemeriksaanFisikAnakResult: optionOf(data)));

          emit(state.copyWith(
              isLoadingSavePemeriksaanFisikAnak: false,
              savePemeriksaanFisikAnakResult: none()));
        },
        ginjalDetailOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikAnak:
                  state.pemeriksaanFisikAnak.copyWith(ginjalDetail: e.value)));
        },
        heparDetailOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikAnak:
                  state.pemeriksaanFisikAnak.copyWith(heparDetail: e.value)));
        },
        retraksiOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikAnak: state.pemeriksaanFisikAnak
                  .copyWith(dindingDadaRetraksi: e.value)));
        },
        limpaDetailOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikAnak:
                  state.pemeriksaanFisikAnak.copyWith(limpaDetail: e.value)));
        },
        limpaOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikAnak:
                  state.pemeriksaanFisikAnak.copyWith(limpa: e.value)));
        },
        tugorKulitOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikAnak:
                  state.pemeriksaanFisikAnak.copyWith(tugorKulit: e.value)));
        },
        suprastermalOnchanged: (e) {
          emit(state.copyWith(
            pemeriksaanFisikAnak: state.pemeriksaanFisikAnak
                .copyWith(dindingDadaRetSuprastermal: e.value),
          ));
        },
        oufOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikAnak:
                  state.pemeriksaanFisikAnak.copyWith(ouf: e.value)));
        },
        heparOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikAnak:
                  state.pemeriksaanFisikAnak.copyWith(hepar: e.value)));
        },
        epigastriumOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikAnak: state.pemeriksaanFisikAnak
                  .copyWith(dindingdadaRetEpigastrium: e.value)));
        },
        pemeriksaanFisikOchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikBangsalModel: state.pemeriksaanFisikBangsalModel
                  .copyWith(pemeriksaanFisik: e.value)));
        },
        getKeadaanUmum: (e) async {
          emit(state.copyWith(
              isLoadingGetKeadaanUmum: true, getKeadaanUmumResult: none()));

          final getData =
              await librariRepositori.getKeadaanUmum(noReg: e.noReg);

          log("KEADAAN UMUM");
          log(getData.toString());

          getData.fold(
              (l) => l.maybeMap(
                  orElse: () {},
                  failure: (e) {
                    emit(state.copyWith(
                        keadaanUmum: KeadaanUmumModel(
                            keadaanUmum: "",
                            kesadaran: "",
                            kesadaranDetail: "")));
                  }),
              (r) => r.maybeMap(
                  orElse: () {},
                  loaded: (e) {
                    try {
                      KeadaanUmumModel data =
                          KeadaanUmumModel.fromJson(e.value["response"]);

                      log("KEADAAN UMUM");
                      log(data.toString());

                      emit(state.copyWith(keadaanUmum: data));
                    } catch (e) {
                      emit(state.copyWith(
                          keadaanUmum: KeadaanUmumModel(
                              keadaanUmum: "",
                              kesadaran: "",
                              kesadaranDetail: "")));
                    }
                  }));

          emit(state.copyWith(
              isLoadingGetKeadaanUmum: false, getKeadaanUmumResult: none()));
        },
        saveKeadaanUmum: (e) async {
          emit(state.copyWith(
              isLoadingSaveKeadaanUmum: true, saveKeadaanUmumResult: none()));

          final data = await librariRepositori.saveKeadaanUmum(
              keadaanUmumModel: e.keadaanUmumModel,
              noreg: e.noReg,
              person: e.person,
              deviceID: e.deviceID,
              pelayanan: e.pelayanan);

          emit(state.copyWith(
              isLoadingSaveKeadaanUmum: false,
              saveKeadaanUmumResult: optionOf(data)));

          emit(state.copyWith(
              isLoadingSaveKeadaanUmum: false, saveKeadaanUmumResult: none()));
        },
        kesadaranDetailOnchanged: (e) {
          emit(state.copyWith(
              keadaanUmum:
                  state.keadaanUmum.copyWith(kesadaranDetail: e.value)));
        },
        getVitalSignResult: (e) async {
          emit(state.copyWith(
              isLoadingGetVitalSign: true, getVitalSignBangsalResult: none()));

          // TODO : GET VITAL SIGN
          final getData = await librariRepositori.getVitalSign(noReg: e.noReg);

          log(getData.toString());

          getData.fold(
              (l) => l.maybeMap(
                  orElse: () {},
                  failure: (e) {
                    emit(state.copyWith(
                        vitalSignBangsalModel: VitalSignBangsalModel(
                            tekananDarah: "",
                            nadi: "",
                            pernapasan: "",
                            suhu: "",
                            tinggiBadan: "",
                            beratBadan: "")));
                  }),
              (r) => r.maybeMap(
                  orElse: () {},
                  loaded: (e) {
                    try {
                      VitalSignBangsalModel data =
                          VitalSignBangsalModel.fromJson(e.value["response"]);
                      emit(state.copyWith(vitalSignBangsalModel: data));
                    } catch (e) {
                      emit(state.copyWith(
                          vitalSignBangsalModel: VitalSignBangsalModel(
                              tekananDarah: "",
                              nadi: "",
                              pernapasan: "",
                              suhu: "",
                              tinggiBadan: "",
                              beratBadan: "")));
                    }
                  }));

          emit(state.copyWith(
              isLoadingGetVitalSign: false, getVitalSignBangsalResult: none()));
        },
        saveVitalSignResult: (e) async {
          emit(state.copyWith(
              isLoadingSaveVitalSign: true,
              saveVitalSIgnBangsalResult: none()));

          // TODO : SIMPAN VITAL SIGN
          final saveData = await librariRepositori.saveVitalSign(
              kategori: e.kategori,
              vitalSignmodel: e.vitalSignBangsalModel,
              noreg: e.noReg,
              person: e.person,
              deviceID: e.deviceID,
              pelayanan: e.pelayanan);

          emit(state.copyWith(
              isLoadingSaveVitalSign: false,
              saveVitalSIgnBangsalResult: optionOf(saveData)));

          emit(state.copyWith(
              isLoadingSaveVitalSign: false,
              saveVitalSIgnBangsalResult: none()));
        },
        tekananDarahDuachanged: (e) {
          emit(state.copyWith(
              ganguanPerilaku:
                  state.ganguanPerilaku.copyWith(tekananDarah2: e.value)));
        },
        saveGangguanPerilaku: (e) async {
          // ====================== //
          emit(state.copyWith(
              saveGangguanPerilakuSaveResult: none(),
              isLoadingSaveGangguanPerilaku: true));

          // SAVE DATA
          final saveData = await librariRepositori.saveGangguanPerilaku(
              gangguanPerilaku: e.gangguanPerilakku,
              deviceID: e.deviceID,
              pelayanan: e.pelayanan,
              noReg: e.noReg,
              person: e.person);

          emit(state.copyWith(
              saveGangguanPerilakuSaveResult: optionOf(saveData),
              isLoadingSaveGangguanPerilaku: false));

          emit(state.copyWith(
              saveGangguanPerilakuSaveResult: none(),
              isLoadingSaveGangguanPerilaku: false));
        },
        getGangguanPerilaku: (e) async {
          emit(state.copyWith(
              getGangguanPerilakuSaveResult: none(),
              isLoadingGetGangguanPerilaku: true));

          // SAVE DATA
          final getData =
              await librariRepositori.getGangguanPerilaku(noReg: e.noReg);

          getData.fold(
              (l) => l.maybeMap(
                  orElse: () {
                    emit(state.copyWith(
                        ganguanPerilaku: GangguanPerilakuModel(
                            tekananDarah2: "",
                            jalanNafas: "",
                            tekananDarah: "",
                            pernafasan: "",
                            pupilKiri: "",
                            pupilKanan: "",
                            nadi: "",
                            spo2: "",
                            cahayaKanan: "",
                            cahayaKiri: "",
                            suhu: "",
                            akral: "",
                            gcsE: "",
                            gcsM: "",
                            gcsV: "",
                            gangguan: "",
                            gangguanDetail: "")));
                  },
                  failure: (e) {}),
              (r) => r.maybeMap(orElse: () {
                    emit(state.copyWith(
                        ganguanPerilaku: GangguanPerilakuModel(
                            tekananDarah2: "",
                            jalanNafas: "",
                            tekananDarah: "",
                            pernafasan: "",
                            pupilKiri: "",
                            pupilKanan: "",
                            nadi: "",
                            spo2: "",
                            cahayaKanan: "",
                            cahayaKiri: "",
                            suhu: "",
                            akral: "",
                            gcsE: "",
                            gcsM: "",
                            gcsV: "",
                            gangguan: "",
                            gangguanDetail: "")));
                  }, loaded: (e) {
                    try {
                      GangguanPerilakuModel data =
                          GangguanPerilakuModel.fromJson(e.value["response"]);

                      emit(state.copyWith(ganguanPerilaku: data));
                    } catch (e) {
                      emit(state.copyWith(
                          ganguanPerilaku: GangguanPerilakuModel(
                              tekananDarah2: "",
                              jalanNafas: "",
                              tekananDarah: "",
                              pernafasan: "",
                              pupilKiri: "",
                              pupilKanan: "",
                              nadi: "",
                              spo2: "",
                              cahayaKanan: "",
                              cahayaKiri: "",
                              suhu: "",
                              akral: "",
                              gcsE: "",
                              gcsM: "",
                              gcsV: "",
                              gangguan: "",
                              gangguanDetail: "")));
                    }
                    // ====================== //
                  }));

          emit(state.copyWith(
              getGangguanPerilakuSaveResult: none(),
              isLoadingGetGangguanPerilaku: false));
        },
        // ========================== TANDA VITAL DAN GANGGUAN PERILAKU ONCHANGED
        akralOnchanged: (e) {
          emit(state.copyWith(
              ganguanPerilaku: state.ganguanPerilaku.copyWith(akral: e.value)));
        },
        gscMOnchanged: (e) {
          emit(state.copyWith(
              ganguanPerilaku: state.ganguanPerilaku.copyWith(gcsM: e.value)));
        },
        tenggorokanOnchanged: (e) {
          //  emit(state.copyWith(
          //     ganguanPerilaku:
          //         state.ganguanPerilaku.copyWith(ten: e.value)));
        },
        tekananDarah2Onchanged: (e) {
          emit(state.copyWith(
              ganguanPerilaku:
                  state.ganguanPerilaku.copyWith(tekananDarah2: e.value)));
        },
        spo2Onchanged: (e) {
          emit(state.copyWith(
              ganguanPerilaku: state.ganguanPerilaku.copyWith(spo2: e.value)));
        },
        reflekCahayaKiri: (e) {
          emit(state.copyWith(
              ganguanPerilaku:
                  state.ganguanPerilaku.copyWith(cahayaKiri: e.value)));
        },
        reflekCahayaKanan: (e) {
          emit(state.copyWith(
              ganguanPerilaku:
                  state.ganguanPerilaku.copyWith(cahayaKanan: e.value)));
        },
        pupilKiriOnchanged: (e) {
          emit(state.copyWith(
              ganguanPerilaku:
                  state.ganguanPerilaku.copyWith(pupilKiri: e.value)));
        },
        pupilKananOnchanged: (e) {
          emit(state.copyWith(
              ganguanPerilaku:
                  state.ganguanPerilaku.copyWith(pupilKanan: e.value)));
        },
        jalanNafasOnchanged: (e) {
          emit(state.copyWith(
              ganguanPerilaku:
                  state.ganguanPerilaku.copyWith(jalanNafas: e.value)));
        },
        gscVOnchanged: (e) {
          emit(state.copyWith(
              ganguanPerilaku: state.ganguanPerilaku.copyWith(gcsV: e.value)));
        },
        gangguanPerilakuDetailOnchanged: (e) {
          emit(state.copyWith(
              ganguanPerilaku:
                  state.ganguanPerilaku.copyWith(gangguanDetail: e.value)));
        },
        gangguanPerilakuOnchanged: (e) {
          emit(state.copyWith(
              ganguanPerilaku:
                  state.ganguanPerilaku.copyWith(gangguan: e.value)));
        },
        gscEOnchanged: (e) {
          emit(state.copyWith(
              ganguanPerilaku: state.ganguanPerilaku.copyWith(gcsE: e.value)));
        },
        telingaOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikIgdModel: state.pemeriksaanFisikIgdModel
                  .copyWith(mataDetail: e.value)));
        },
        mataDetailOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikIgdModel: state.pemeriksaanFisikIgdModel
                  .copyWith(mataDetail: e.value)));
        },
        deleteGenetaliaSelection: (e) {
          emit(state.copyWith(
              genetaliaSelection: List.of(state.genetaliaSelection)
                ..removeWhere((element) => element == e.value)));
        },
        deletePunggungSelection: (e) {
          emit(state.copyWith(
              punggungSelection: List.of(state.punggungSelection)
                ..removeWhere((element) => element == e.value)));
        },
        deleteTenggorokanSelection: (e) {
          emit(state.copyWith(
              tenggorakanSelection: List.of(state.tenggorakanSelection)
                ..removeWhere((element) => element == e.value)));
        },
        deleteTelingaSelection: (e) {
          emit(state.copyWith(
              telingaSelection: List.of(state.telingaSelection)
                ..removeWhere((element) => element == e.value)));
        },
        deletePerutSelection: (e) {
          emit(state.copyWith(
              perutSelection: List.of(state.perutSelection)
                ..removeWhere((element) => element == e.value)));
        },
        deleteParuSelection: (e) {
          emit(state.copyWith(
              paruSelection: List.of(state.paruSelection)
                ..removeWhere((element) => element == e.value)));
        },
        deleteMulutSelection: (e) {
          emit(state.copyWith(
              mulutSelection: List.of(state.mulutSelection)
                ..removeWhere((element) => element == e.value)));
        },
        deleteLeherSelection: (e) {
          emit(state.copyWith(
              leherSelection: List.of(state.leherSelection)
                ..removeWhere((element) => element == e.value)));
        },
        deleteJantungSelection: (e) {
          emit(state.copyWith(
              jantungSelection: List.of(state.jantungSelection)
                ..removeWhere((element) => element == e.value)));

          // TODO : JANTUNG PADA ANAK
          if (state.jantungSelection.contains(ListConstants.jantungAnak.last)) {
            List<String> data = List.of(state.jantungSelection)
              ..removeWhere(
                  (element) => element == ListConstants.jantungAnak.last);

            String detail =
                "${ListConstants.jantungAnak.last} ${state.pemeriksaanFisikIgdModel.suaraJantung}";

            log("Detail Jantung");
            log(detail);

            String newData = data.join('#').toString();

            emit(state.copyWith(
                pemeriksaanFisikAnak: state.pemeriksaanFisikAnak
                    .copyWith(jantung: "$newData#$detail")));
          } else {
            String newData = state.jantungSelection.join('#').toString();

            emit(state.copyWith(
                pemeriksaanFisikAnak:
                    state.pemeriksaanFisikAnak.copyWith(jantung: newData)));
          }
        },
        deleteDadaSelection: (e) {
          emit(state.copyWith(
              dadaSelection: List.of(state.dadaSelection)
                ..removeWhere((element) => element == e.value)));
        },
        deleteHidungSelection: (e) {
          emit(state.copyWith(
              hidungSelection: List.of(state.hidungSelection)
                ..removeWhere((element) => element == e.value)));
        },
        addJantungSelection: (e) {
          emit(state.copyWith(
              jantungSelection: List.of(state.jantungSelection)..add(e.value)));

          // TODO : JANTUNG PADA ANAK
          if (state.jantungSelection.contains(ListConstants.jantungAnak.last)) {
            List<String> data = List.of(state.jantungSelection)
              ..removeWhere(
                  (element) => element == ListConstants.jantungAnak.last);

            String detail =
                "${ListConstants.jantungAnak.last} ${state.pemeriksaanFisikIgdModel.suaraJantung}";

            // data.add(detail);
            log("Detail Jantung Add");
            log(detail);

            String newData = data.join('#').toString();

            emit(state.copyWith(
                pemeriksaanFisikAnak: state.pemeriksaanFisikAnak
                    .copyWith(jantung: "$newData#$detail")));
          } else {
            String newData = state.jantungSelection.join('#').toString();

            emit(state.copyWith(
                pemeriksaanFisikAnak:
                    state.pemeriksaanFisikAnak.copyWith(jantung: newData)));
          }
        },
        addDadaSelection: (e) {
          emit(state.copyWith(
              dadaSelection: List.of(state.dadaSelection)..add(e.value)));
        },
        addleherSelection: (e) {
          emit(state.copyWith(
              leherSelection: List.of(state.leherSelection)..add(e.value)));
        },
        addTenggorokanSelection: (e) {
          emit(state.copyWith(
              tenggorakanSelection: List.of(state.tenggorakanSelection)
                ..add(e.value)));
        },
        addTelingaSelection: (e) {
          emit(state.copyWith(
              telingaSelection: List.of(state.telingaSelection)..add(e.value)));
        },
        addPunggungSelection: (e) {
          emit(state.copyWith(
              punggungSelection: List.of(state.punggungSelection)
                ..add(e.value)));
        },
        addPerutSelection: (e) {
          emit(state.copyWith(
              perutSelection: List.of(state.perutSelection)..add(e.value)));
        },
        addParuSelection: (e) {
          emit(state.copyWith(
              paruSelection: List.of(state.paruSelection)..add(e.value)));
        },
        addMulutSelection: (e) {
          emit(state.copyWith(
              mulutSelection: List.of(state.mulutSelection)..add(e.value)));
        },
        addHidungSelection: (e) {
          emit(state.copyWith(
              mataSelection: List.of(state.hidungSelection)..add(e.value)));
        },
        addGigiSelection: (e) {
          emit(state.copyWith(
              gigiSelection: List.of(state.gigiSelection)..add(e.value)));
        },
        deleteGigiSelection: (e) {
          emit(state.copyWith(
              gigiSelection: List.of(state.gigiSelection)
                ..removeWhere((element) => element == e.value)));
        },
        addGenetaliaSelection: (e) {
          emit(state.copyWith(
              genetaliaSelection: List.of(state.genetaliaSelection)
                ..add(e.value)));
        },
        deleteEkstremitasSelection: (e) {
          emit(state.copyWith(
              ekstremitasSelection: List.of(state.ekstremitasSelection)
                ..removeWhere((element) => element == e.value)));
        },
        addEkstremitasSelection: (e) {
          emit(state.copyWith(
              ekstremitasSelection: List.of(state.ekstremitasSelection)
                ..add(e.value)));
        },
        deleteAbdomenSelection: (e) {
          emit(state.copyWith(
              abdomenSelection: List.of(state.abdomenSelection)
                ..removeWhere((element) => element == e.value)));
        },
        addAbdomenSelection: (e) {
          emit(state.copyWith(
              abdomenSelection: List.of(state.abdomenSelection)..add(e.value)));
        },
        deleteMataSelection: (e) {
          emit(state.copyWith(
              mataSelection: List.of(state.mataSelection)
                ..removeWhere((element) => element == e.value)));

          emit(state.copyWith(
            pemeriksaanFisikIgdModel: state.pemeriksaanFisikIgdModel.copyWith(
              mata: state.mataSelection.join(',').toString(),
              mataDetail: state.pemeriksaanFisikIgdModel.mataDetail,
            ),
          ));
        },
        addMataSelection: (e) {
          emit(state.copyWith(
              mataSelection: List.of(state.mataSelection)..add(e.value)));

          emit(state.copyWith(
              pemeriksaanFisikIgdModel: state.pemeriksaanFisikIgdModel.copyWith(
                  mataDetail: state.pemeriksaanFisikIgdModel.mataDetail,
                  mata: state.mataSelection.join(',').toString())));
        },
        tinggiBadanOnchanged: (e) {
          emit(state.copyWith(
              vitalSignBangsalModel:
                  state.vitalSignBangsalModel.copyWith(tinggiBadan: e.value)));
        },
        tekananDarahOnchanged: (e) {
          emit(state.copyWith(
              vitalSignBangsalModel:
                  state.vitalSignBangsalModel.copyWith(tekananDarah: e.value)));

          emit(state.copyWith(
            ganguanPerilaku:
                state.ganguanPerilaku.copyWith(tekananDarah: e.value),
          ));
        },
        suhuOnchanged: (e) {
          emit(state.copyWith(
              ganguanPerilaku: state.ganguanPerilaku.copyWith(suhu: e.value),
              vitalSignBangsalModel:
                  state.vitalSignBangsalModel.copyWith(suhu: e.value)));
        },
        pernapasanOnchanged: (e) {
          emit(state.copyWith(
              ganguanPerilaku:
                  state.ganguanPerilaku.copyWith(pernafasan: e.value),
              vitalSignBangsalModel:
                  state.vitalSignBangsalModel.copyWith(pernapasan: e.value)));
        },
        nadiOnchanged: (e) {
          emit(state.copyWith(
              ganguanPerilaku: state.ganguanPerilaku.copyWith(nadi: e.value),
              vitalSignBangsalModel:
                  state.vitalSignBangsalModel.copyWith(nadi: e.value)));
        },
        kesadaranOnchanged: (e) {
          emit(state.copyWith(
            keadaanUmum: state.keadaanUmum.copyWith(kesadaran: e.value),
          ));
        },
        keadaanUmumOnchanged: (e) {
          emit(state.copyWith(
              keadaanUmum: state.keadaanUmum.copyWith(keadaanUmum: e.value)));
        },
        beratBadanOnchanged: (e) {
          emit(state.copyWith(
              vitalSignBangsalModel:
                  state.vitalSignBangsalModel.copyWith(beratBadan: e.value)));
        },
        ekstremitasOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikAnak:
                  state.pemeriksaanFisikAnak.copyWith(ekstremitas: e.value),
              pemeriksaanFisikBangsalModel: state.pemeriksaanFisikBangsalModel
                  .copyWith(ekstremitas: e.value)));
        },
        savePemeriksaanFisikBangsal: (e) async {
          emit(state.copyWith(
              saveAsesmenPemeriksaanFisikBangsalResult: none(),
              isLoadingSavePemeriksaaanFisikBangsal: true));

          // save data
          final saveData = await librariRepositori.savePemeriksaanFisikBangsal(
              kategori: e.kategori,
              pemeriksaanFisikBangsalModel: e.pemeriksaanFisikBangsalModel,
              deviceID: e.deviceID,
              pelayanan: e.pelayanan,
              noReg: e.noReg,
              person: e.person);

          log("Pemeriksaan Fisik Bangsal");

          emit(state.copyWith(
              saveAsesmenPemeriksaanFisikBangsalResult: optionOf(saveData),
              isLoadingSavePemeriksaaanFisikBangsal: false));

          emit(state.copyWith(
              saveAsesmenPemeriksaanFisikBangsalResult: none(),
              isLoadingSavePemeriksaaanFisikBangsal: false));
        },
        // =========================== GET PEMERIKSAAN FISIK BANGSAL
        getPemeriksaanFisikBangsal: (e) async {
          emit(state.copyWith(
              getAsesmenPemeriksaanFisikBangsalResult: none(),
              isLoadingGetPemeriksaanFisikBangsal: true));

          final getData = await librariRepositori.getPemeriksaanFisikBangsal(
              noReg: e.noReg);
          log("Pemeriksaan Fisik Bangsal");
          log(getData.toString());
          getData.fold(
              (l) => l.maybeMap(orElse: () {
                    emit(state.copyWith(
                        pemeriksaanFisikBangsalModel:
                            PemeriksaanFisikBangsalModel(
                                dindingDada: "",
                                dindingPerut: "",
                                gigi: "",
                                hati: "",
                                leherlainnya: "",
                                lien: "",
                                mata: "",
                                peristaltikUsus: "",
                                suaraJantung: "",
                                tht: "",
                                thyroid: "",
                                pemeriksaanFisik: "",
                                kepala: "",
                                leher: "",
                                dada: "",
                                abdomen: "",
                                punggung: "",
                                genetalia: "",
                                ekstremitas: "",
                                lainLain: "")));
                  }),
              (r) => r.maybeMap(orElse: () {
                    emit(state.copyWith(
                        pemeriksaanFisikBangsalModel:
                            PemeriksaanFisikBangsalModel(
                                dindingDada: "",
                                dindingPerut: "",
                                gigi: "",
                                hati: "",
                                leherlainnya: "",
                                lien: "",
                                mata: "",
                                peristaltikUsus: "",
                                suaraJantung: "",
                                tht: "",
                                thyroid: "",
                                pemeriksaanFisik: "",
                                kepala: "",
                                leher: "",
                                dada: "",
                                abdomen: "",
                                punggung: "",
                                genetalia: "",
                                ekstremitas: "",
                                lainLain: "")));
                  }, loaded: (e) {
                    try {
                      PemeriksaanFisikBangsalModel data =
                          PemeriksaanFisikBangsalModel.fromJson(
                              e.value["response"]);

                      emit(state.copyWith(pemeriksaanFisikBangsalModel: data));
                    } catch (e) {
                      emit(state.copyWith(
                          pemeriksaanFisikBangsalModel:
                              PemeriksaanFisikBangsalModel(
                                  dindingDada: "",
                                  dindingPerut: "",
                                  gigi: "",
                                  hati: "",
                                  leherlainnya: "",
                                  lien: "",
                                  mata: "",
                                  peristaltikUsus: "",
                                  suaraJantung: "",
                                  tht: "",
                                  thyroid: "",
                                  pemeriksaanFisik: "",
                                  kepala: "",
                                  leher: "",
                                  dada: "",
                                  abdomen: "",
                                  punggung: "",
                                  genetalia: "",
                                  ekstremitas: "",
                                  lainLain: "")));
                    }
                  }));

          emit(state.copyWith(
              getAsesmenPemeriksaanFisikBangsalResult: none(),
              isLoadingGetPemeriksaanFisikBangsal: false));
        },
        leherOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikBangsalModel:
                  state.pemeriksaanFisikBangsalModel.copyWith(leher: e.value)));
        },
        lainLainOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikBangsalModel: state.pemeriksaanFisikBangsalModel
                  .copyWith(lainLain: e.value)));
        },
        kepalaOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikBangsalModel: state.pemeriksaanFisikBangsalModel
                  .copyWith(kepala: e.value)));
        },
        abdomenOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikBangsalModel: state.pemeriksaanFisikBangsalModel
                  .copyWith(abdomen: e.value)));
        },
        getPemeriksaanFisikIGD: (e) async {
          emit(state.copyWith(
              isLoadingGetPemeriksaanFisikIgd: true,
              saveAsesmenPemeriksaanFisikResult: none()));

          final data =
              await librariRepositori.getPemeriksaanFisikIGD(noReg: e.noReg, person: e.person);

          log("GET PEMERIKSAAN ${data.toString()}");

          data.fold(
              (l) => l.maybeMap(orElse: () {
                    emit(state.copyWith(
                        pemeriksaanFisikIgdModel: PemeriksaanFisikIgdModel(
                            mataDetail: "",
                            abdomenDetail: "",
                            dindingDada: "",
                            dindingPerut: "",
                            genetalia: "",
                            gigi: "",
                            ginjal: "",
                            hati: "",
                            inferior: "",
                            kulit: "",
                            leherLainnya: "",
                            lien: "",
                            mata: "",
                            mulut: "",
                            peristatikUsus: "",
                            suaraJantung: "",
                            suaraParu: "",
                            superior: "",
                            tht: "",
                            thyroid: "")));
                  }, failure: (e) {
                    emit(state.copyWith(
                        pemeriksaanFisikIgdModel: PemeriksaanFisikIgdModel(
                            abdomenDetail: "",
                            mataDetail: "",
                            dindingDada: "",
                            dindingPerut: "",
                            genetalia: "",
                            gigi: "",
                            ginjal: "",
                            hati: "",
                            inferior: "",
                            kulit: "",
                            leherLainnya: "",
                            lien: "",
                            mata: "",
                            mulut: "",
                            peristatikUsus: "",
                            suaraJantung: "",
                            suaraParu: "",
                            superior: "",
                            tht: "",
                            thyroid: "")));
                  }),
              (r) => r.maybeMap(
                  orElse: () {},
                  loaded: (e) {
                    log("LAKUKAN MAPPING PEMERIKSAAN FISIK");
                    try {
                      PemeriksaanFisikIgdModel data =
                          PemeriksaanFisikIgdModel.fromJson(
                              e.value["response"]);
                      log("LAKUKAN SIMPAN MAPPING PEMERIKSAAN FISIK SELESAI");
                      emit(state.copyWith(pemeriksaanFisikIgdModel: data));
                    } catch (e) {
                      log("GAGAL LAKUKAN SIMPAN MAPPING PEMERIKSAAN FISIK");
                      emit(state.copyWith(
                          pemeriksaanFisikIgdModel: PemeriksaanFisikIgdModel(
                              abdomenDetail: "",
                              dindingDada: "",
                              mataDetail: "",
                              dindingPerut: "",
                              genetalia: "",
                              gigi: "",
                              ginjal: "",
                              hati: "",
                              inferior: "",
                              kulit: "",
                              leherLainnya: "",
                              lien: "",
                              mata: "",
                              mulut: "",
                              peristatikUsus: "",
                              suaraJantung: "",
                              suaraParu: "",
                              superior: "",
                              tht: "",
                              thyroid: "")));
                    }
                  }));

          emit(state.copyWith(
              isLoadingGetPemeriksaanFisikIgd: false,
              saveAsesmenPemeriksaanFisikResult: none()));
        },
        savePemeriksaanFisikIGD: (e) async {
          emit(state.copyWith(
              isLoadingSavePemeriksaanFisikIgd: true,
              saveAsesmenPemeriksaanFisikResult: none()));

          final saveData = await librariRepositori.savePemeriksaanFisikIGD(
              pemeriksaanFisikIgdModel: e.pemeriksaanFisikIgdModel,
              deviceID: e.deviceID,
              pelayanan: e.pelayanan,
              noReg: e.noReg,
              person: e.person);

          emit(state.copyWith(
              isLoadingSavePemeriksaanFisikIgd: false,
              saveAsesmenPemeriksaanFisikResult: optionOf(saveData)));

          emit(state.copyWith(
              isLoadingSavePemeriksaanFisikIgd: false,
              saveAsesmenPemeriksaanFisikResult: none()));
        },
        kulitOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikIgdModel:
                  state.pemeriksaanFisikIgdModel.copyWith(kulit: e.value)));
        },
        thyroidOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikAnak:
                  state.pemeriksaanFisikAnak.copyWith(thyroid: e.value),
              pemeriksaanFisikIgdModel:
                  state.pemeriksaanFisikIgdModel.copyWith(thyroid: e.value)));
        },
        thtOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikIgdModel:
                  state.pemeriksaanFisikIgdModel.copyWith(tht: e.value)));
        },
        superiorOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikIgdModel:
                  state.pemeriksaanFisikIgdModel.copyWith(superior: e.value)));
        },
        punggungOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikBangsalModel: state.pemeriksaanFisikBangsalModel
                  .copyWith(punggung: e.value)));
        },
        perutOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikIgdModel: state.pemeriksaanFisikIgdModel
                  .copyWith(dindingPerut: e.value)));
        },
        peristaltikUsusOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikIgdModel: state.pemeriksaanFisikIgdModel
                  .copyWith(peristatikUsus: e.value)));
        },
        paruOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikAnak:
                  state.pemeriksaanFisikAnak.copyWith(paru: e.value),
              pemeriksaanFisikIgdModel:
                  state.pemeriksaanFisikIgdModel.copyWith(suaraParu: e.value)));
        },
        mulutOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikAnak:
                  state.pemeriksaanFisikAnak.copyWith(mulut: e.value),
              pemeriksaanFisikIgdModel:
                  state.pemeriksaanFisikIgdModel.copyWith(mulut: e.value)));
        },
        mataOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikAnak:
                  state.pemeriksaanFisikAnak.copyWith(mata: e.value),
              pemeriksaanFisikIgdModel:
                  state.pemeriksaanFisikIgdModel.copyWith(mata: e.value)));
        },
        lienOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikIgdModel:
                  state.pemeriksaanFisikIgdModel.copyWith(lien: e.value)));
        },
        leherLainnyaOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikIgdModel: state.pemeriksaanFisikIgdModel
                  .copyWith(leherLainnya: e.value)));
        },
        jantungOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikIgdModel: state.pemeriksaanFisikIgdModel
                  .copyWith(suaraJantung: e.value)));

          if (state.jantungSelection.contains(ListConstants.jantungAnak.last)) {
            List<String> data = List.of(state.jantungSelection)
              ..removeWhere(
                  (element) => element == ListConstants.jantungAnak.last);

            String detail =
                "${ListConstants.jantungAnak.last} ${state.pemeriksaanFisikIgdModel.suaraJantung}";

            log("Detail Jantung");
            log(detail);

            String newData = data.join('#').toString();

            emit(state.copyWith(
                pemeriksaanFisikAnak: state.pemeriksaanFisikAnak
                    .copyWith(jantung: "$newData#$detail")));
          } else {
            String newData = state.jantungSelection.join('#').toString();

            emit(state.copyWith(
                pemeriksaanFisikAnak:
                    state.pemeriksaanFisikAnak.copyWith(jantung: newData)));
          }
        },
        inferiorOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikIgdModel:
                  state.pemeriksaanFisikIgdModel.copyWith(inferior: e.value)));
        },
        hatiOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikIgdModel:
                  state.pemeriksaanFisikIgdModel.copyWith(hati: e.value)));
        },
        ginjalOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikAnak:
                  state.pemeriksaanFisikAnak.copyWith(ginjal: e.value),
              pemeriksaanFisikIgdModel:
                  state.pemeriksaanFisikIgdModel.copyWith(ginjal: e.value)));
        },
        gigiOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikAnak:
                  state.pemeriksaanFisikAnak.copyWith(gigi: e.value),
              pemeriksaanFisikIgdModel:
                  state.pemeriksaanFisikIgdModel.copyWith(gigi: e.value)));
        },
        genetaliaOnchanged: (e) {
          emit(state.copyWith(
            pemeriksaanFisikAnak:
                state.pemeriksaanFisikAnak.copyWith(genetalia: e.value),
            pemeriksaanFisikIgdModel:
                state.pemeriksaanFisikIgdModel.copyWith(genetalia: e.value),
            pemeriksaanFisikBangsalModel:
                state.pemeriksaanFisikBangsalModel.copyWith(genetalia: e.value),
          ));
        },
        dadaOnchanged: (e) {
          emit(state.copyWith(
            pemeriksaanFisikAnak:
                state.pemeriksaanFisikAnak.copyWith(dindingDada: e.value),
            pemeriksaanFisikIgdModel:
                state.pemeriksaanFisikIgdModel.copyWith(dindingDada: e.value),
            pemeriksaanFisikBangsalModel:
                state.pemeriksaanFisikBangsalModel.copyWith(dada: e.value),
          ));
        },
        abdomenLainnyaOnchanged: (e) {
          emit(state.copyWith(
              pemeriksaanFisikIgdModel: state.pemeriksaanFisikIgdModel
                  .copyWith(abdomenDetail: e.value)));
        });
  }
}
