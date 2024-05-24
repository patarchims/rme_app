import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/response/asesmen_keperawatan_igd/informasi_keluhan_response_model.dart';
import 'package:hms_app/domain/models/response/asesmen_keperawatan_igd/riwayat_kehamilan_response_model.dart';
import 'package:hms_app/domain/models/response/asesmen_keperawatan_igd/skrining_resiko_dekubitus_model.dart';
import 'package:hms_app/domain/models/response/asesmen_keperawatan_igd/tindak_lanjut_response_model.dart';
import 'package:hms_app/domain/models/response/detail_pemeriksaan_labor_model.dart';
import 'package:hms_app/domain/models/response/input_detail_pemeriksaan_labor_model.dart';
import 'package:hms_app/domain/models/response/input_detail_pemeriksaan_penunjang_model.dart';
import 'package:hms_app/domain/models/response/input_penunjang_model.dart';
import 'package:hms_app/domain/models/response/rencana_tindak_lanjut_model.dart';
import 'package:hms_app/domain/models/soap/medis/detail_tarip_radiologi_model.dart';
import 'package:hms_app/domain/models/soap/medis/gizi_model.dart';
import 'package:hms_app/domain/models/soap/medis/kprocedure_fisioterapi_model.dart';
import 'package:hms_app/domain/models/soap/medis/kprocedure_model.dart';
import 'package:hms_app/domain/models/soap/medis/pemeriksaan_fisik_model.dart';
import 'package:hms_app/domain/repository/librari/librari_repository.dart';
import 'package:hms_app/domain/repository/soap/soap_repository.dart';
import 'package:hms_app/domain/services/informasi_medis_service.dart';
import 'package:hms_app/domain/services/library_services.dart';
import 'package:injectable/injectable.dart';
import '../../../models/soap/medis/anamnesa_igd_model.dart';
import '../../../models/soap/medis/dokter_spesialis_model.dart';
import '../../../models/soap/medis/fisioterapi_model.dart';
import '../../../network/api_failure_handler.dart';
import '../../../network/api_success_handler.dart';
part 'asesmen_igd_event.dart';
part 'asesmen_igd_state.dart';
part 'asesmen_igd_bloc.freezed.dart';

@injectable
class AsesmenIgdBloc extends Bloc<AsesmenIgdEvent, AsesmenIgdState> {
  final SoapRepository soapRepository;
  final LibrariRepositori librariRepositori;
  // ================================== //
  AsesmenIgdBloc(this.soapRepository, this.librariRepositori)
      : super(AsesmenIgdState.initial()) {
    on<AsesmenIgdEvent>((event, emit) => _onEventChanged(event, emit));
  }

  Future<void> _onEventChanged(
      AsesmenIgdEvent event, Emitter<AsesmenIgdState> emit) async {
    await event.maybeMap(
        jamOnchanged: (e) {
          emit(state.copyWith(
              tindakLanjutIGDModel:
                  state.tindakLanjutIGDModel.copyWith(jam: e.value)));
        },
        menitOnchanged: (e) {
          emit(state.copyWith(
              tindakLanjutIGDModel:
                  state.tindakLanjutIGDModel.copyWith(menit: e.value)));
        },
        caraPulangOnChanged: (e) {
          emit(state.copyWith(
              tindakLanjutIGDModel:
                  state.tindakLanjutIGDModel.copyWith(caraKeluar: e.value)));
        },
        prognosisOnchanged: (e) {
          emit(state.copyWith(prognosisStr: e.value));
        },

        // ================================ SKRINING NYERI
        getTindakLanjut: (e) async {
          emit(state.copyWith(
              isLoadingGetTindakLanjut: true,
              getTindakLanjutIGDResult: none()));

          // GET DATA
          final data = await librariRepositori.getTindakLanjut(noReg: e.noreg);

          data.fold(
              (l) => l.maybeMap(
                  orElse: () {},
                  failure: (e) {
                    emit(state.copyWith(
                        tindakLanjutIGDModel: TindakLanjutIgdModel(
                            waktu: "",
                            caraKeluar: "",
                            jam: "",
                            menit: "",
                            pulang1: "",
                            pulang1Detail: "",
                            pulang2: "",
                            pulang2Detail: "",
                            pulang3: "",
                            pulang3Detail: "")));
                  }),
              (r) => r.maybeMap(
                  orElse: () {},
                  loaded: (data) {
                    // LOADED DATA
                    try {
                      // LAKUKAN MAPPING DATA
                      TindakLanjutIgdModel datas =
                          TindakLanjutIgdModel.fromJson(data.value["response"]);

                      emit(state.copyWith(tindakLanjutIGDModel: datas));
                    } catch (e) {
                      emit(state.copyWith(
                          tindakLanjutIGDModel: TindakLanjutIgdModel(
                              waktu: "",
                              caraKeluar: "",
                              jam: "",
                              menit: "",
                              pulang1: "",
                              pulang1Detail: "",
                              pulang2: "",
                              pulang2Detail: "",
                              pulang3: "",
                              pulang3Detail: "")));
                    }
                  }));

          emit(state.copyWith(
              isLoadingGetTindakLanjut: false,
              getTindakLanjutIGDResult: none()));
        },
        kondisiPasienOnchanged: (e) {
          emit(state.copyWith(
              tindakLanjutIGDModel:
                  state.tindakLanjutIGDModel.copyWith(pulang1: e.value)));
        },
        pendidikanKesehatanOnchanged: (e) {
          emit(state.copyWith(
              tindakLanjutIGDModel:
                  state.tindakLanjutIGDModel.copyWith(pulang3: e.value)));
        },
        pendidikanKesehatanOnchangedDetail: (e) {
          emit(state.copyWith(
              tindakLanjutIGDModel:
                  state.tindakLanjutIGDModel.copyWith(pulang3Detail: e.value)));
        },
        saveTindakLanjut: (e) async {
          emit(state.copyWith(
              isLoadingSaveTindakLanjut: true,
              saveTindakLanjutIGDResult: none()));

          // ===================== //
          final saveData = await librariRepositori.saveTindakLanjut(
              tindakLanjut: e.tindakLanjut,
              noreg: e.noreg,
              person: e.person,
              deviceID: e.deviceID,
              pelayanan: e.pelayanan);

          emit(state.copyWith(
              isLoadingSaveTindakLanjut: false,
              saveTindakLanjutIGDResult: optionOf(saveData)));
          emit(state.copyWith(
              isLoadingSaveTindakLanjut: false,
              saveTindakLanjutIGDResult: none()));
        },
        transportasiPulangOnchanged: (e) {
          emit(state.copyWith(
              tindakLanjutIGDModel:
                  state.tindakLanjutIGDModel.copyWith(pulang2: e.value)));
        },
        // ================================ SKRINING NYERI
        // ================================ RIWAYAT KEHAMILAN
        getRiwayatKehamilan: (e) async {
          emit(state.copyWith(
              isLoadingGetRiwayatKehamilan: true,
              getRiwayatKehamilanResult: none()));
          // ===================== //
          final getData =
              await librariRepositori.getRiwayatKehamilan(noReg: e.noreg);

          getData.fold(
              (l) => l.maybeMap(
                  orElse: () {},
                  failure: (e) {
                    emit(state.copyWith(
                        riwayatKehamilanModel: RiwayatKehamilanModel(
                            kehamilan: false,
                            gravida: "",
                            para: "",
                            abortus: "",
                            hpht: "",
                            ttp: "",
                            leopold1: "",
                            leopold2: "",
                            leopold3: "",
                            leopold4: "",
                            ddj: "",
                            vt: "")));
                  }),
              (r) => r.maybeMap(
                  orElse: () {},
                  loaded: (e) {
                    // LOADED DATA
                    try {
                      // LAKUKAN MAPPING DATA
                      SkriningResikoDekubitusModel data =
                          SkriningResikoDekubitusModel.fromJson(
                              e.value["response"]);

                      emit(state.copyWith(skriningResikoDekubitus: data));
                    } catch (e) {
                      emit(state.copyWith(
                          skriningResikoDekubitus: SkriningResikoDekubitusModel(
                              dekubitus1: "",
                              dekubitus2: "",
                              dekubitus3: "",
                              dekubitus4: "",
                              dekubitusAnak: "")));
                    }
                  }));

          emit(state.copyWith(
              isLoadingGetRiwayatKehamilan: false,
              getRiwayatKehamilanResult: none()));
        },
        saveRiwayatKehamilan: (e) async {
          emit(state.copyWith(
              isLoadingSaveRiwayatKehamilan: true,
              saveRiwayatKehamilanResult: none()));

          // ===================== //
          final saveData = await librariRepositori.saveRiwayatKehamilan(
              asemenKeluhanIgdModel: e.riwayatKehamilan,
              noreg: e.noreg,
              person: e.person,
              deviceID: e.deviceID,
              pelayanan: e.pelayanan);

          emit(state.copyWith(
              isLoadingSaveRiwayatKehamilan: false,
              saveRiwayatKehamilanResult: optionOf(saveData)));
          emit(state.copyWith(
              isLoadingSaveRiwayatKehamilan: false,
              saveRiwayatKehamilanResult: none()));
        },
        hamilOnchanged: (e) {
          emit(state.copyWith(
              riwayatKehamilanModel:
                  state.riwayatKehamilanModel.copyWith(kehamilan: e.value)));
        },
        abortusOnchanged: (e) {
          emit(state.copyWith(
              riwayatKehamilanModel:
                  state.riwayatKehamilanModel.copyWith(abortus: e.value)));
        },
        vtOnchanged: (e) {
          emit(state.copyWith(
              riwayatKehamilanModel:
                  state.riwayatKehamilanModel.copyWith(vt: e.value)));
        },
        ttpOnchanged: (e) {
          emit(state.copyWith(
              riwayatKehamilanModel:
                  state.riwayatKehamilanModel.copyWith(ttp: e.value)));
        },
        paraOnchanged: (e) {
          emit(state.copyWith(
              riwayatKehamilanModel:
                  state.riwayatKehamilanModel.copyWith(para: e.value)));
        },
        leopoid4Onchanged: (e) {
          emit(state.copyWith(
              riwayatKehamilanModel:
                  state.riwayatKehamilanModel.copyWith(leopold4: e.value)));
        },
        leopoid3Onchanged: (e) {
          emit(state.copyWith(
              riwayatKehamilanModel:
                  state.riwayatKehamilanModel.copyWith(leopold3: e.value)));
        },
        leopoid2Onchanged: (e) {
          emit(state.copyWith(
              riwayatKehamilanModel:
                  state.riwayatKehamilanModel.copyWith(leopold2: e.value)));
        },
        leopoid1Onchanged: (e) {
          emit(state.copyWith(
              riwayatKehamilanModel:
                  state.riwayatKehamilanModel.copyWith(leopold1: e.value)));
        },
        hphtOnchanged: (e) {
          emit(state.copyWith(
              riwayatKehamilanModel:
                  state.riwayatKehamilanModel.copyWith(hpht: e.value)));
        },
        gravidaOnchanged: (e) {
          emit(state.copyWith(
              riwayatKehamilanModel:
                  state.riwayatKehamilanModel.copyWith(gravida: e.value)));
        },
        ddjOnchanged: (e) {
          emit(state.copyWith(
              riwayatKehamilanModel:
                  state.riwayatKehamilanModel.copyWith(ddj: e.value)));
        },
        // ================================ INFORMASI DEKUBITUS
        dekubitusOnchaged1: (e) {
          emit(state.copyWith(
              skriningResikoDekubitus:
                  state.skriningResikoDekubitus.copyWith(dekubitus1: e.value)));
        },
        dekubitusOnchaged2: (e) {
          emit(state.copyWith(
              skriningResikoDekubitus:
                  state.skriningResikoDekubitus.copyWith(dekubitus2: e.value)));
        },
        dekubitusOnchaged3: (e) {
          emit(state.copyWith(
              skriningResikoDekubitus:
                  state.skriningResikoDekubitus.copyWith(dekubitus3: e.value)));
        },
        dekubitusOnchaged4: (e) {
          emit(state.copyWith(
              skriningResikoDekubitus:
                  state.skriningResikoDekubitus.copyWith(dekubitus4: e.value)));
        },
        dekubitusOnchagedAnak: (e) {
          emit(state.copyWith(
              skriningResikoDekubitus: state.skriningResikoDekubitus
                  .copyWith(dekubitusAnak: e.value)));
        },
        getSkriningResikoDekubitus: (e) async {
          emit(state.copyWith(
              saveSkriningResikoDekubitus: none(),
              isloadingGetResikoDekubitus: true));

          // SAVE DATA
          final data =
              await librariRepositori.getResikoDekubitus(noReg: e.noreg);

          data.fold(
              (l) => l.maybeMap(
                  orElse: () {},
                  failure: (e) {
                    emit(state.copyWith(
                        skriningResikoDekubitus: SkriningResikoDekubitusModel(
                            dekubitus1: "",
                            dekubitus2: "",
                            dekubitus3: "",
                            dekubitus4: "",
                            dekubitusAnak: "")));
                  }),
              (r) => r.maybeMap(
                  orElse: () {},
                  loaded: (e) {
                    // LOADED DATA
                    try {
                      // LAKUKAN MAPPING DATA
                      SkriningResikoDekubitusModel data =
                          SkriningResikoDekubitusModel.fromJson(
                              e.value["response"]);

                      emit(state.copyWith(skriningResikoDekubitus: data));
                    } catch (e) {
                      emit(state.copyWith(
                          skriningResikoDekubitus: SkriningResikoDekubitusModel(
                              dekubitus1: "",
                              dekubitus2: "",
                              dekubitus3: "",
                              dekubitus4: "",
                              dekubitusAnak: "")));
                    }
                  }));

          emit(state.copyWith(
              saveSkriningResikoDekubitus: none(),
              isloadingGetResikoDekubitus: false));
        },
        saveSkriningResikoDekubitus: (e) async {
          emit(state.copyWith(
              saveSkriningResikoDekubitus: none(),
              isLoadingSaveResikoDekubitus: true));

          // SAVE DATA
          final data = await librariRepositori.saveResikoDebuitus(
              skriningResikoDekubitusModel: e.skringinResikoDekubitusModel,
              noreg: e.noreg,
              person: e.person,
              deviceID: e.deviceID,
              pelayanan: e.pelayanan);

          emit(state.copyWith(
              saveSkriningResikoDekubitus: optionOf(data),
              isLoadingSaveResikoDekubitus: false));

          emit(state.copyWith(
              saveSkriningResikoDekubitus: none(),
              isLoadingSaveResikoDekubitus: false));
        },

        // ================================ INFORMASI DEKUBITUS
        beratBadanOnchanged: (e) {
          emit(state.copyWith(
              asemenKeluhanIGDModel:
                  state.asemenKeluhanIGDModel.copyWith(beratBedan: e.value)));
        },
        // ================================ INFORMASI DAN KELUHAN
        getInformasiDanKeluhan: (e) async {
          // GET INFORMASI DAN KELUHAN PASIEN
          emit(state.copyWith(
              isLoadingGetInformasiKeluhan: true,
              getInforasiKeluhanResult: none()));
          // GET DATA
          final data =
              await librariRepositori.getAsesmenInfoKeluhanIgd(noReg: e.noreg);

          data.fold(
              (l) => l.maybeMap(
                  orElse: () {},
                  failure: (e) {
                    emit(state.copyWith(
                        asemenKeluhanIGDModel: AsesmenKeluhanIgdModel(
                      asalMasuk: "",
                      asalMasukDetail: "",
                      beratBedan: "",
                      info: "",
                      caraMasuk: "",
                      caraMasukDetail: "",
                      fungsional: "",
                      hasilKaji: "",
                      infoDetail: "",
                      resikoJatuh1: "",
                      resikoJatuh2: "",
                      riwayatObat: "",
                      riwayatPenyakit: "",
                      tinggiBadan: "",
                    )));
                  }),
              (r) => r.maybeMap(
                  orElse: () {},
                  loaded: (e) {
                    // LAKUKAN MAPPING DATA
                    try {
                      // LAKUKAN MAPPING DATA
                      AsesmenKeluhanIgdModel data =
                          AsesmenKeluhanIgdModel.fromJson(e.value["response"]);

                      emit(state.copyWith(asemenKeluhanIGDModel: data));
                    } catch (e) {
                      emit(state.copyWith(
                          asemenKeluhanIGDModel: AsesmenKeluhanIgdModel(
                        asalMasuk: "",
                        asalMasukDetail: "",
                        beratBedan: "",
                        info: "",
                        caraMasuk: "",
                        caraMasukDetail: "",
                        fungsional: "",
                        hasilKaji: "",
                        infoDetail: "",
                        resikoJatuh1: "",
                        resikoJatuh2: "",
                        riwayatObat: "",
                        riwayatPenyakit: "",
                        tinggiBadan: "",
                      )));
                    }
                  }));

          emit(state.copyWith(
              isLoadingGetInformasiKeluhan: false,
              getInforasiKeluhanResult: none()));
        },
        saveInformasiDanKeluhan: (e) async {
          // SAVE INFORMASI DAN
          // KELUHAN PASIEN
          emit(state.copyWith(
              isLoadingSaveInformasiKeluhan: false,
              saveInformasiKeluhanResult: none()));

          final data = await librariRepositori.saveAsesmenInfoKeluhanIgd(
              asemenKeluhanIgdModel: e.asemenKeluhanIgdModel,
              noreg: e.noreg,
              person: e.person,
              deviceID: e.deviceID,
              pelayanan: e.pelayanan);

          emit(state.copyWith(
              isLoadingSaveInformasiKeluhan: false,
              saveInformasiKeluhanResult: optionOf(data)));

          emit(state.copyWith(
              isLoadingSaveInformasiKeluhan: false,
              saveInformasiKeluhanResult: none()));
        },
        asalMasukOnchanged: (e) {
          emit(state.copyWith(
              asemenKeluhanIGDModel:
                  state.asemenKeluhanIGDModel.copyWith(asalMasuk: e.value)));
        },
        asalMasukDetailOnchanged: (e) {
          emit(state.copyWith(
              asemenKeluhanIGDModel: state.asemenKeluhanIGDModel
                  .copyWith(asalMasukDetail: e.value)));
        },
        caraMasukOnchanged: (e) {
          emit(state.copyWith(
              asemenKeluhanIGDModel:
                  state.asemenKeluhanIGDModel.copyWith(caraMasuk: e.value)));
        },
        caraMasukDetailOnchanged: (e) {
          emit(state.copyWith(
              asemenKeluhanIGDModel: state.asemenKeluhanIGDModel
                  .copyWith(caraMasukDetail: e.value)));
        },
        fungsionalOnchanged: (e) {
          emit(state.copyWith(
              asemenKeluhanIGDModel:
                  state.asemenKeluhanIGDModel.copyWith(fungsional: e.value)));
        },
        hasilKajiOnchanged: (e) {
          emit(state.copyWith(
              asemenKeluhanIGDModel:
                  state.asemenKeluhanIGDModel.copyWith(hasilKaji: e.value)));
        },
        resikoJatuh1Onchanged: (e) {
          emit(state.copyWith(
              asemenKeluhanIGDModel: state.asemenKeluhanIGDModel.copyWith(
                  resikoJatuh1: e.value,
                  hasilKaji: (e.value == "Ya" &&
                          state.asemenKeluhanIGDModel.resikoJatuh2 == "Ya")
                      ? "RISIKO TINGGI - Pasang Pin Kuning, Edukasi"
                      : (e.value == "Tidak" &&
                              state.asemenKeluhanIGDModel.resikoJatuh2 ==
                                  "Tidak")
                          ? "TIDAK BERISIKO - Tidak Ada Tindakan"
                          : (e.value == "" &&
                                  state.asemenKeluhanIGDModel.resikoJatuh2 ==
                                      "")
                              ? ""
                              : "RISIKO RENDAH - Edukasi")));
        },
        resikoJatuh2Onchanged: (e) {
          emit(state.copyWith(
              asemenKeluhanIGDModel: state.asemenKeluhanIGDModel.copyWith(
                  resikoJatuh2: e.value,
                  hasilKaji: (e.value == "Ya" &&
                          state.asemenKeluhanIGDModel.resikoJatuh1 == "Ya")
                      ? "RISIKO TINGGI - Pasang Pin Kuning, Edukasi"
                      : (e.value == "Tidak" &&
                              state.asemenKeluhanIGDModel.resikoJatuh1 ==
                                  "Tidak")
                          ? "TIDAK BERISIKO - Tidak Ada Tindakan"
                          : (e.value == "" &&
                                  state.asemenKeluhanIGDModel.resikoJatuh1 ==
                                      "")
                              ? ""
                              : "RISIKO RENDAH - Edukasi")));
        },
        riwayatObatOnchanged: (e) {
          emit(state.copyWith(
              asemenKeluhanIGDModel:
                  state.asemenKeluhanIGDModel.copyWith(riwayatObat: e.value)));
        },
        riwayatPenyakitOnchanged: (e) {
          emit(state.copyWith(
              asemenKeluhanIGDModel: state.asemenKeluhanIGDModel
                  .copyWith(riwayatPenyakit: e.value)));
        },
        selectedInformasi: (e) {
          emit(state.copyWith(
              asemenKeluhanIGDModel:
                  state.asemenKeluhanIGDModel.copyWith(info: e.value)));
        },
        selectedInformasiDetail: (e) {
          emit(state.copyWith(
              asemenKeluhanIGDModel:
                  state.asemenKeluhanIGDModel.copyWith(infoDetail: e.value)));
        },
        tinggiBadanOnchanged: (e) {
          emit(state.copyWith(
              asemenKeluhanIGDModel:
                  state.asemenKeluhanIGDModel.copyWith(tinggiBadan: e.value)));
        },

        // ================================ END INFORMASI DAN KELUHAN
        lainLainOnchanged: (e) {
          emit(state.copyWith(lainLainStr: e.value));
        },
        dadaDetailOnchanged: (e) {
          emit(state.copyWith(dadaDetailStr: e.value));
        },
        ekstreimtasDetailOnchanged: (e) {
          emit(state.copyWith(ekstremitasDetailStr: e.value));
        },
        genetaliaDetailOnchanged: (e) {
          emit(state.copyWith(genetaliaDetailStr: e.value));
        },
        selectedGenetaliaOnchanged: (e) {
          emit(state.copyWith(genetaliaSelectedStr: e.value));
        },
        kepalaDetailOnchanged: (e) {
          emit(state.copyWith(kepalaDetailStr: e.value));
        },
        leherDetailOnchanged: (e) {
          emit(state.copyWith(leherDetailStr: e.value));
        },
        punggunDetailSelected: (e) {
          emit(state.copyWith(punggungDetailStr: e.value));
        },
        selectedKepalaOnchanged: (e) {
          emit(state.copyWith(kepalaSelectedStr: e.value));
        },
        selectedAbdomenOnchanged: (e) {
          emit(state.copyWith(abdomenSelectedStr: e.value));
        },
        abdomenDetailOnchanged: (e) {
          emit(state.copyWith(abdomenDetailStr: e.value));
        },
        selectedDadaOnchanged: (e) {
          emit(state.copyWith(dadaSeletedStr: e.value));
        },
        selectedEkstremitasOnchanged: (e) {
          emit(state.copyWith(ekstremitasSelectedStr: e.value));
        },
        selectedLeherOnchanged: (e) {
          emit(state.copyWith(leherSelectedStr: e.value));
        },
        selectedPunggungOnchanged: (e) {
          emit(state.copyWith(punggungSelectedStr: e.value));
        },
        // Alasan Obname Onchanged
        jenisPelayananOnchanged: (e) {
          emit(state.copyWith(jenisPelayananStr: e.value));
        },
        kesadaranOnchanged: (e) {
          emit(state.copyWith(kesadaranStr: e.value));
        },
        alasanObnameOnchanged: (e) {
          emit(state.copyWith(alasanObnameStr: e.value));
        },
        keluhanUtamaOnchanged: (e) {
          emit(state.copyWith(keluhanUtamaStr: e.value));
        },
        alasanKonsulKeOnchanged: (e) {
          emit(state.copyWith(alasanKonsulStr: e.value));
        },
        riwayatPenyakitDahuluOnchanged: (e) {
          emit(state.copyWith(riwayatPenyakitDahulurStr: e.value));
        },
        riwayatPenyakitDalamKeluargaOnchanged: (e) {
          emit(state.copyWith(riwayatPenayakitDalamKeluargaStr: e.value));
        },
        telaahOnchanged: (e) {
          emit(state.copyWith(telaahStr: e.value));
        },
        // Alasan Terapi Onchanged
        asuhanTerapiOnchanged: (e) {
          emit(state.copyWith(asuhanTerapiStr: e.value));
        },
        getRencanaTindakLanjut: (e) async {
          // GET RENCANA TINDAK LANJUT
          emit(state.copyWith(
              isLoadingGetRencanaTindakLanjut: true,
              getFailResultTindakLanjut: none()));

          final getData =
              await soapRepository.getRencanaTindakLanjut(noreg: e.noreg);

          log('GET DATA');
          log(getData.toString());

          emit(state.copyWith(isLoadingGetRencanaTindakLanjut: false));

          getData.fold(
              (l) => null,
              (r) => r.maybeMap(orElse: () {
                    emit(state.copyWith(alasanObnameStr: "-"));
                    emit(state.copyWith(asuhanTerapiStr: "-"));
                  }, loaded: (e) {
                    try {
                      RencanaTindaklanjutModel rencana =
                          RencanaTindaklanjutModel.fromMap(e.value["response"]);

                      log("ALASAN OBNAME");
                      log(rencana.toMap().toString());

                      emit(state.copyWith(
                        alasanObnameStr: rencana.alasanOpname,
                        asuhanTerapiStr: rencana.anjuran,
                        dokterSpesialisSelected: rencana.konsulKe,
                        prognosisStr: rencana.prognosis,
                      ));
                    } catch (e) {
                      emit(state.copyWith(
                        alasanObnameStr: "",
                        asuhanTerapiStr: "",
                        dokterSpesialisSelected: "",
                      ));
                    }
                  }));
        },
        saveRencanaTindakLanjut: (e) async {
          emit(state.copyWith(
              isLoadingSaveRencanaTindakLanjut: true,
              saveRencanaTindakLanjut: none()));

          // LOADING
          final saveData = await soapRepository.saveRencanaTindakLanjut(
              alasanKonsul: e.alasanKonsul,
              noreg: e.noreg,
              anjuran: e.anjuran,
              alasanOpname: e.alasanOpname,
              prognosis: e.prognosis,
              konsulKe: e.konsulKe,
              // PENAMBAHAN DATA USER ID
              deviceID: e.deviceID,
              pelayanan: e.pelayanan,
              person: e.person,
              userID: e.userID);

          emit(state.copyWith(
              isLoadingSaveRencanaTindakLanjut: false,
              saveRencanaTindakLanjut: optionOf(saveData)));

          // PEMERIKSAAN
          emit(state.copyWith(
              isLoadingSaveRencanaTindakLanjut: false,
              saveRencanaTindakLanjut: none()));
        },
        savePemeriksaanPenunjan: (e) async {
          emit(state.copyWith(
              isLoadingSaveRencanaTindakLanjut: true,
              saveRencanaTindakLanjut: none()));
          // LOADING
          await Future.delayed(const Duration(seconds: 2));
          // PEMERIKSAAN
          emit(state.copyWith(
              isLoadingSaveRencanaTindakLanjut: true,
              saveRencanaTindakLanjut: none()));
        },
        started: (e) {
          // START EVENT
          emit(state.copyWith(
            laborSelection: [],
            detailFisioterapi: [],
            detailGizi: [],
            detailPemeriksaanLabor: [],
            detailRadiologi: [],
            fisioTerapiModel: [],
            fisioterapiSelection: [],
            giziModel: [],
            giziSelection: [],
            isloading: false,
            saveDetailGizi: none(),
            savefailOrSuccessResult: none(),
            saveFisioterapi: none(),
            savefailOrSuccessAnamnesaResult: none(),
            getStatusPemeriksaanFisikResult: none(),
            getfailOrSuccessAnamnesaResult: none(),
            getfailOrSuccessResult: none(),
            isLoadingGetLokalis: false,
            isLoadingGetPemeriksaanFisik: false,
            isLoadingSaveAnamnesa: false,
            isLoadingSaveInputDetailLabor: false,
            isLoadingSavePemeriksaanFisik: false,
            loadingSaveFisioterapi: false,
            radiologiModel: [],
            loadingSaveGizi: false,
            loadingSaveRadiologi: false,
            radiologiSelection: [],
            saveInputDetailLabor: none(),
            saveRadiologi: none(),
            kProcedure: [],
            saveStatusPemeriksaanFisikResult: none(),
          ));
        },
        // ======================== GIZI
        saveFisioterapi: (e) async {
          emit(state.copyWith(
              loadingSaveFisioterapi: true, saveFisioterapi: none()));

          final save = await soapRepository.savePenunjangMedik(
              inputPenunjangModel: e.inputPenunjang);

          emit(state.copyWith(
              loadingSaveFisioterapi: false, saveFisioterapi: optionOf(save)));

          emit(state.copyWith(
              loadingSaveFisioterapi: false, saveFisioterapi: none()));
        },
        saveLabor: (e) async {},
        saveGizi: (e) async {
          emit(state.copyWith(loadingSaveGizi: true, saveDetailGizi: none()));

          final save = await soapRepository.savePenunjangMedik(
              inputPenunjangModel: e.inputPenunjangModel);

          emit(state.copyWith(
              loadingSaveGizi: false, saveDetailGizi: optionOf(save)));

          emit(state.copyWith(loadingSaveGizi: false, saveDetailGizi: none()));
        },
        clearGizi: (e) {
          emit(state.copyWith(giziSelection: [], detailGizi: []));
        },
        deleteItemSelectionGizi: (e) {
          emit(state.copyWith(
              giziSelection: List.of(state.giziSelection)
                ..removeWhere((element) => element == e.value)));
        },
        deleteItemGizi: (e) {
          emit(state.copyWith(
              detailGizi: List.of(state.detailGizi)
                ..removeWhere((element) => element.kode == e.value)));
        },
        getGizi: (e) async {
          try {
            final data = await libraryService.getGizi();

            log("GET GIZI $data");

            List<GiziModel> fisio = (data["response"] as Iterable)
                .map((e) => GiziModel.fromMap(e))
                .toList();

            emit(state.copyWith(giziModel: fisio));
          } catch (e) {
            emit(state.copyWith(giziModel: []));
          }
        },
        getTaripGizi: (e) async {
          try {
            final data = await libraryService.getDetailRadiologi(
                debitur: e.debitur, kdBagian: e.kodeBagian, kode: e.kode);

            log(data.toString());

            final DetailTaripRadiologiModel datas =
                DetailTaripRadiologiModel.fromMap(data["response"]);

            log("DETAIL TARIP GIZI $data");

            emit(state.copyWith(
                detailGizi: List.of(state.detailGizi)..add(datas)));
          } catch (e) {
            emit(state.copyWith(detailGizi: []));
          }
        },
        getTaripFisioTerapi: (e) async {
          try {
            final data = await libraryService.getDetailRadiologi(
                debitur: e.debitur, kdBagian: e.kodeBagian, kode: e.kode);

            log(data.toString());

            final DetailTaripRadiologiModel datas =
                DetailTaripRadiologiModel.fromMap(data["response"]);

            log("DETAIL TARIP FISIOTERAPI $data");

            emit(state.copyWith(
                detailFisioterapi: List.of(state.detailFisioterapi)
                  ..add(datas)));
          } catch (e) {
            emit(state.copyWith(detailFisioterapi: []));
          }
        },

        // ======================= RADIOLOGI
        deleteItemSelectionFisioterapi: (e) {
          emit(state.copyWith(
              fisioterapiSelection: List.of(state.fisioterapiSelection)
                ..removeWhere((element) => element == e.value)));
        },
        deleteItemRadiologi: (e) {
          emit(state.copyWith(
              detailRadiologi: List.of(state.detailRadiologi)
                ..removeWhere((element) => element.kode == e.value)));
        },
        getDetailTaripRadiologi: (e) async {
          log("DETAIL RADIOLOGI$e");
          try {
            final data = await libraryService.getDetailRadiologi(
                debitur: e.debitur, kdBagian: e.kodeBagian, kode: e.kode);

            log(data.toString());

            final DetailTaripRadiologiModel datas =
                DetailTaripRadiologiModel.fromMap(data["response"]);

            log("DETAIL TARIP RADIOLOGI $data");
            emit(state.copyWith(
                detailRadiologi: List.of(state.detailRadiologi)..add(datas)));
          } catch (e) {
            emit(state.copyWith(detailRadiologi: []));
          }
        },
        clearRadiologi: (e) {
          emit(state.copyWith(radiologiSelection: [], detailRadiologi: []));
        },
        addRadiologiSelection: (e) {
          emit(state.copyWith(
              radiologiSelection: List.of(state.radiologiSelection)
                ..add(e.grupName)));
        },
        saveRadiologi: (e) async {
          // LOADING SAVE RADIOLOGI
          emit(state.copyWith(
              loadingSaveRadiologi: true, saveRadiologi: none()));

          final save = await soapRepository.savePenunjangMedik(
              inputPenunjangModel: e.pemeriksaanPenunjangModel);

          log(save.toString());

          emit(state.copyWith(
              loadingSaveRadiologi: false, saveRadiologi: optionOf(save)));

          emit(state.copyWith(
              loadingSaveRadiologi: false, saveRadiologi: none()));
        },
        getRadiologi: (e) async {
          // GET RADIOLOGI
          try {
            final data = await libraryService.getRadiologi();

            List<KfisioTerapiModel> fisio = (data["response"] as Iterable)
                .map((e) => KfisioTerapiModel.fromMap(e))
                .toList();

            log(fisio.toString());

            emit(state.copyWith(radiologiModel: fisio));
          } catch (e) {
            emit(state.copyWith(radiologiModel: []));
          }
        },
        deleteRadiologiSelection: (e) {
          emit(state.copyWith(
              radiologiSelection: List.of(state.radiologiSelection)
                ..removeWhere((element) => element == e.grupName)));
        },
        addGiziSelection: (e) {
          emit(state.copyWith(
              giziSelection: List.of(state.giziSelection)..add(e.value)));
        },
        deleteGiziSelection: (e) {
          emit(state.copyWith(
              giziSelection: List.of(state.giziSelection)
                ..removeWhere((element) => element == e.value)));
        },
        clearFisioTerapi: (e) {
          emit(state.copyWith(detailFisioterapi: []));
          emit(state.copyWith(fisioterapiSelection: []));
        },
        orElse: () {},
        addFisioterapiSelection: (e) {
          emit(state.copyWith(
              fisioterapiSelection: List.of(state.fisioterapiSelection)
                ..add(e.value)));
        },
        deleteFisioTerapiItem: (e) {
          emit(state.copyWith(
              detailFisioterapi: List.of(state.detailFisioterapi)
                ..removeWhere((element) => element.kode == e.value)));
        },
        deleteItemFisioterapi: (e) {
          emit(state.copyWith(
              detailFisioterapi: List.of(state.detailFisioterapi)
                ..removeWhere((element) => element.kode == e.value)));
        },
        getFisioTerapi: (e) async {
          try {
            final data = await libraryService.getKFisioTerapi();

            log(" GET FISIO TERAPI $data");

            List<FisioTerapiModel> fisio = (data["response"] as Iterable)
                .map((e) => FisioTerapiModel.fromMap(e))
                .toList();

            emit(state.copyWith(fisioTerapiModel: fisio));
          } catch (e) {
            emit(state.copyWith(fisioTerapiModel: []));
          }
        },
        inputDetailPemeriksaanLabor: (e) async {
          emit(state.copyWith(isLoadingSaveInputDetailLabor: true));

          final detailLabor = await soapRepository.saveDetailPemeriksaanFisik(
              inputDetailPemeriksaanLaborModel:
                  e.inputDetailPemeriksaanLaborModel);

          emit(state.copyWith(saveInputDetailLabor: optionOf(detailLabor)));

          emit(state.copyWith(
              isLoadingSaveInputDetailLabor: false,
              saveInputDetailLabor: none()));
        },
        deleteLaborSelection: (e) {
          emit(state.copyWith(
              laborSelection: List.of(state.laborSelection)
                ..removeWhere((element) => element == e.grupName)));
        },
        addLaborSelection: (e) {
          emit(state.copyWith(
              laborSelection: List.of(state.laborSelection)..add(e.grupName)));
        },
        deleteItemPemeriksaan: (e) {
          emit(state.copyWith(
              detailPemeriksaanLabor: List.of(state.detailPemeriksaanLabor)
                ..removeWhere(
                    (element) => element.total.namaGrup == e.grupName)));
        },
        clearPemeriksaan: (e) {
          emit(state.copyWith(detailPemeriksaanLabor: [], laborSelection: []));
        },
        getDetailPemeriksaanLabor: (e) async {
          // GET DETAIL PEMERIKSAAN LABOR
          try {
            final detailLabor = await libraryService.getDetailPemeriksaanLabor(
                nameGrup: e.nameGrup);

            PemeriksaanDetailLaborModel labor =
                PemeriksaanDetailLaborModel.fromJson(detailLabor["response"]);

            log(labor.toString());

            emit(state.copyWith(
                detailPemeriksaanLabor: List.of(state.detailPemeriksaanLabor)
                  ..add(labor)));
          } catch (e) {
            emit(state.copyWith(detailPemeriksaanLabor: []));
          }
        },
        getKProcedure: (e) async {
          try {
            emit(state.copyWith(kProcedure: []));
            final data = await libraryService.getKProcedure();

            List<KProcedureModel> dokter = (data["response"] as Iterable)
                .map((e) => KProcedureModel.fromJson(e))
                .toList();

            emit(state.copyWith(kProcedure: dokter));
          } catch (e) {
            emit(state.copyWith(kProcedure: []));
          }
        },
        selectedDokter: (e) {
          emit(state.copyWith(dokterSpesialisSelected: e.dokter));
        },
        getDokterSpesialis: (e) async {
          final data = await informasiMedisService.getDataDokterSpesialis();
          try {
            MetaModel meta = MetaModel.fromJson(data["metadata"]);

            log("DOKTER SPESIALIS $data");

            if (meta.code == 200) {
              List<DokterSpesialisModel> dokter = (data["response"] as Iterable)
                  .map((e) => DokterSpesialisModel.fromJson(e))
                  .toList();

              emit(state.copyWith(
                  dokterSpesialis: dokter,
                  isSuccessSpesialis: true,
                  failMessageSpesialis: ""));
            }

            if (meta.code != 200) {
              emit(state.copyWith(
                  dokterSpesialis: [],
                  isSuccessSpesialis: false,
                  failMessageSpesialis: meta.message.toString()));
            }
          } catch (e) {
            emit(state.copyWith(dokterSpesialis: []));
          }
        },
        getPemeriksaanFisik: (e) async {
          // GET PEMERIKSAAN FISIK

          emit(state.copyWith(
              isLoadingGetPemeriksaanFisik: true,
              getStatusPemeriksaanFisikResult: none()));

          final save = await soapRepository.getPemeriksaanFisik(noReg: e.noReg);

          save.fold(
              (l) => l.maybeMap(
                  orElse: () {},
                  failure: (e) {
                    emit(state.copyWith(
                        kepalaSelectedStr: "",
                        kepalaDetailStr: "",
                        leherSelectedStr: "",
                        dadaDetailStr: "",
                        dadaSeletedStr: "",
                        leherDetailStr: "",
                        abdomenSelectedStr: "",
                        abdomenDetailStr: "",
                        punggungSelectedStr: "",
                        punggungDetailStr: "",
                        genetaliaSelectedStr: "",
                        genetaliaDetailStr: "",
                        ekstremitasSelectedStr: "",
                        ekstremitasDetailStr: ""));
                  }),
              (r) => r.maybeMap(
                    orElse: () {
                      emit(state.copyWith(
                          kepalaSelectedStr: "",
                          kepalaDetailStr: "",
                          leherSelectedStr: "",
                          dadaDetailStr: "",
                          dadaSeletedStr: "",
                          leherDetailStr: "",
                          abdomenSelectedStr: "",
                          abdomenDetailStr: "",
                          punggungSelectedStr: "",
                          punggungDetailStr: "",
                          genetaliaSelectedStr: "",
                          genetaliaDetailStr: "",
                          ekstremitasSelectedStr: "",
                          ekstremitasDetailStr: ""));
                    },
                    loaded: (e) {
                      // GET DATA
                      try {
                        PemeriksaanFisikModel pemeriksaanFisikModel =
                            PemeriksaanFisikModel.fromJson(e.value["response"]);

                        emit(state.copyWith(
                            kepalaSelectedStr: pemeriksaanFisikModel.kepala,
                            kepalaDetailStr: pemeriksaanFisikModel.kepalaDetail,
                            leherSelectedStr: pemeriksaanFisikModel.leher,
                            leherDetailStr: pemeriksaanFisikModel.leherDetail,
                            abdomenSelectedStr: pemeriksaanFisikModel.abdomen,
                            abdomenDetailStr:
                                pemeriksaanFisikModel.abdomenDetail,
                            punggungSelectedStr: pemeriksaanFisikModel.punggung,
                            punggungDetailStr:
                                pemeriksaanFisikModel.punggungDetail,
                            genetaliaSelectedStr:
                                pemeriksaanFisikModel.genetalia,
                            genetaliaDetailStr:
                                pemeriksaanFisikModel.genetaliaDetail,
                            ekstremitasSelectedStr:
                                pemeriksaanFisikModel.ekstremitas,
                            ekstremitasDetailStr:
                                pemeriksaanFisikModel.ekstremitasDetail));
                      } catch (e) {
                        emit(state.copyWith(
                            kepalaSelectedStr: "",
                            kepalaDetailStr: "",
                            leherSelectedStr: "",
                            leherDetailStr: "",
                            abdomenSelectedStr: "",
                            abdomenDetailStr: "",
                            punggungSelectedStr: "",
                            punggungDetailStr: "",
                            genetaliaSelectedStr: "",
                            genetaliaDetailStr: "",
                            ekstremitasSelectedStr: "",
                            ekstremitasDetailStr: ""));
                      }
                    },
                  ));

          emit(state.copyWith(
              isLoadingGetPemeriksaanFisik: false,
              getStatusPemeriksaanFisikResult: none()));
        },
        // SIMPAN PEMERIKSAAN FISIK
        savePemeriksaanFisik: (e) async {
          // SAVE PEMERIKSAAN FISIK
          emit(state.copyWith(
              isLoadingSavePemeriksaanFisik: true,
              saveStatusPemeriksaanFisikResult: none()));

          final save = await soapRepository.savePemeriksaanFisik(
              deviceID: e.deviceID,
              pelayanan: e.pelayanan,
              person: e.person,
              userID: e.userID,
              pemeriksaanFisikModel: e.pemeriksaanFisikModel);

          emit(state.copyWith(
              isLoadingSavePemeriksaanFisik: false,
              saveStatusPemeriksaanFisikResult: optionOf(save)));

          emit(state.copyWith(
              isLoadingSavePemeriksaanFisik: false,
              saveStatusPemeriksaanFisikResult: none()));
        },
        saveAnamnesaIGD: (e) async {
          // SIMPAN DATA
          emit(state.copyWith(
              isLoadingSaveAnamnesa: true,
              savefailOrSuccessAnamnesaResult: none()));

          final data = await soapRepository.saveAnamnesaIGD(
              deviceID: e.deviceID,
              pelayanan: e.pelayanan,
              person: e.person,
              userID: e.userID,
              anamnesaIgdModel: e.anamnesaIGD);

          log(optionOf(data).toString());

          emit(state.copyWith(
              isLoadingSaveAnamnesa: false,
              savefailOrSuccessAnamnesaResult: optionOf(data)));

          emit(state.copyWith(
              isLoadingSaveAnamnesa: false,
              savefailOrSuccessAnamnesaResult: none()));
        },
        resetImage: (e) {
          emit(state.copyWith(
              imageLokalis: "images/lokalis/lokalis_default.png"));
        },
        getAnamnesaIGD: (e) async {
          //  GET STATUS LOKALIS
          emit(state.copyWith(
              isLoadingGetAnamnesa: true,
              getfailOrSuccessAnamnesaResult: none()));

          final data = await soapRepository.getAnamnesaIGD(noReg: e.noReg);

          data.fold(
              (l) => null,
              (r) => r.maybeMap(
                  orElse: () {},
                  loaded: (e) {
                    AnamnesaIgdModel anamnesaIgdModel =
                        AnamnesaIgdModel.fromJson(e.value["response"]);

                    emit(state.copyWith(
                        keluhanUtamaStr: anamnesaIgdModel.keluhanUtama,
                        telaahStr: anamnesaIgdModel.telaah,
                        riwayatPenyakitDahulurStr: anamnesaIgdModel.rwytDulu,
                        riwayatPenayakitDalamKeluargaStr:
                            anamnesaIgdModel.rwytKlrg,
                        kesadaranStr: anamnesaIgdModel.kesadaran,
                        jenisPelayananStr: anamnesaIgdModel.jenpel));
                  }));

          emit(state.copyWith(
              isLoadingGetAnamnesa: false,
              getfailOrSuccessAnamnesaResult: none()));
        },
        getStatusLokalis: (e) async {
          //  GET STATUS LOKALIS
          emit(state.copyWith(isLoadingGetLokalis: true));
          final getdata = await soapRepository.getStatusLokalis(noReg: e.noReg);

          getdata.fold(
              (l) => null,
              (r) => r.maybeMap(
                  orElse: () {},
                  loaded: (data) {
                    String image =
                        data.value["response"]["image_lokalis"].toString();
                    emit(state.copyWith(
                        imageLokalis: image, getStatusLokalisResult: none()));
                  }));

          emit(state.copyWith(
              isLoadingGetLokalis: false, getStatusLokalisResult: none()));
        },
        loadingSaveLokalis: (e) {
          emit(state.copyWith(isLoadingSaveLokalis: true));
        },
        stopLoading: (e) {
          emit(state.copyWith(isLoadingSaveLokalis: false));
        },
        saveStatusLokalis: (e) async {
          // SAVE STATUS LOKALIS
          emit(state.copyWith(
              isLoadingSaveLokalis: true, saveStatusLokalisResult: none()));

          // SAVE DATA
          final saveData = await soapRepository.saveStatusLokalis(
              deviceID: e.deviceID,
              pelayanan: e.pelayanan,
              person: e.person,
              userID: e.userID,
              noReg: e.noReg,
              imageURL: e.imageUrl);

          emit(state.copyWith(
              isLoadingSaveLokalis: false,
              saveStatusLokalisResult: optionOf(saveData)));

          saveData.fold(
              (l) => null,
              (r) => r.maybeMap(
                  orElse: () {},
                  loaded: (data) {
                    String image =
                        data.value["response"]["image_lokalis"].toString();
                    emit(state.copyWith(
                        imageLokalis: image, saveStatusLokalisResult: none()));
                  }));

          emit(state.copyWith(
              isLoadingSaveLokalis: false, saveStatusLokalisResult: none()));
        });
  }
}
