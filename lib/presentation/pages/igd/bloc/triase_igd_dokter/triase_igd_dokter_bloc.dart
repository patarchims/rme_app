import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/pages/igd/repository/igd_triase_igd_dokter_repository.dart';
import 'package:hms_app/presentation/pages/igd/services/igd_services.dart';
part 'triase_igd_dokter_event.dart';
part 'triase_igd_dokter_state.dart';

class TriaseIgdDokterBloc
    extends Bloc<TriaseIgdDokterEvent, TriaseIgdDokterState> {
  TriaseIgdDokterBloc() : super(TriaseIgdDokterState.initial()) {
    on<TriaseIgdDokterEvent>((event, emit) {});
    on<OnChangedAlasanDatang>(_onChangedAlasanDatang);
    on<OnChangedKehamilan>(_onChangedHamil);
    on<OnChangedSkalaNyeri>(_onChangedSkalaNyeri);
    on<OnChangedSkalaNyeriP>(_onChangedSkalaNyeriP);
    on<OnChangedGravida>(_onChangedGravida);
    on<OnChangedPara>(_onChangedPara);
    on<OnChangedAbortus>(_onChangedAbortus);
    on<OnChangedHPHT>(_onChangedHPHT);
    on<OnChangedDDJEvent>(_onChangedDDJ);
    on<OnChangedSkalaTriase>(_onChangedSkalaTriase);
    on<OnGetTriaseIGDDokterEvent>(_onGetDataTriaseIGDDokter);
    on<OnSaveTriaseIGDDokterEvent>(_onSaveAsesmenTriaseIGDDokter);
    on<OnChangedSEvent>(_onChangedSEvent);
    on<OnChangedTEvent>(_onChangedTEvent);
    on<OnChangedQEvent>(_onChangedQEvent);
    on<OnChangedREvent>(_onChangedREvent);
    on<OnChangedPEvent>(_onChangedPEvent);
    on<OnChangedFlaggWajah>(_onChangedFlaggWajah);
    on<OnChangedFlaggKaki>(_onChangedFlaggKaki);
    on<OnChangedFlaggAktifitas>(_onChangedFlaggAktivitas);
    on<OnChangedFlaggMenangis>(_onChangedFlaggMenangis);
    on<OnChangedFlaggBersuara>(_onChangedFlaggBersuara);
    on<OnGetReportTriaseIGDDokterEvent>(_onGetReportTriaseIGD);
    on<OnChangedGangguanPerilaku>(_onChangedGangguanPerilaku);
    on<OnGetReportTriasePonekEvent>(_onGetReportTriasePonek);
  }

  Future<void> _onChangedAlasanDatang(
    OnChangedAlasanDatang event,
    Emitter<TriaseIgdDokterState> emit,
  ) async {
    // ======//
    emit(state.copyWith(status: TriaseIGDDokterStatus.isChanged));

    emit(state.copyWith(
        triaseIgdDokterModel:
            state.triaseIgdDokterModel.copyWith(alasanMasuk: event.value)));
  }

  Future<void> _onChangedSkalaNyeri(
    OnChangedSkalaNyeri event,
    Emitter<TriaseIgdDokterState> emit,
  ) async {
    // ======//
    emit(state.copyWith(status: TriaseIGDDokterStatus.isChanged));

    emit(state.copyWith(
        triaseIgdDokterModel: state.triaseIgdDokterModel
            .copyWith(skalaNyeri: event.value.toInt())));
  }

  Future<void> _onGetReportTriaseIGD(
    OnGetReportTriaseIGDDokterEvent event,
    Emitter<TriaseIgdDokterState> emit,
  ) async {
    emit(state.copyWith(status: TriaseIGDDokterStatus.isLoadingGetReport));

    try {
      final getReport = await igdServices.onGetReportTriaseIGDDokter(
          noReg: event.noReg, noRM: event.noRM, tanggal: event.tanggal);

      log("TRIASE IGD DOKTER");

      log(getReport.toString());

      TriaseReportIgdDokterResponse data =
          TriaseReportIgdDokterResponse.fromMap(getReport["response"]);

      emit(state.copyWith(
          status: TriaseIGDDokterStatus.isLoadedGetReport,
          triaseResponse: data));
    } catch (e) {
      // === //
      emit(state.copyWith(
          status: TriaseIGDDokterStatus.isLoadedGetReport,
          triaseResponse: TriaseReportIgdDokterResponse(
              triase: TriaseIgdDokterModel(
                gangguanPerilaku: "",
                jam: "",
                tglMasuk: "",
                ddj: "",
                alasanMasuk: "",
                caraMasuk: "",
                penyebabCedera: "",
                kehamilan: "",
                gravida: "",
                para: "",
                abortus: "",
                hpht: "",
                ttp: "",
                skalaNyeri: 0,
                nyeriP: "",
                nyeriQ: "",
                nyeriR: "",
                nyeriS: "",
                nyeriT: "",
                skalaTriase: "",
                flagWajah: 0,
                flagKaki: 0,
                flagAktifitas: 0,
                flagMenangis: 0,
                flagBersuara: 0,
                flagTotal: 0,
              ),
              karyawan: Karyawan(nama: "", jenisKelamin: "", tglLahir: ""),
              keluhanUtama: KeluhanUtama(
                  riwayatTerdahulu: [],
                  riwayatKeluarga: [],
                  asesmen: Asesmen(noreg: "", keluhUtama: "", rwtSekarang: "")),
              vital: Vital(
                  gcsE: "",
                  gcsV: "",
                  gcsM: "",
                  td: "",
                  nadi: "",
                  suhu: "",
                  kesadaran: "",
                  pernafasan: "",
                  spo2: "",
                  tinggiBadan: "",
                  beratBadan: ""),
              pemeriksaanFisik: PemeriksaanFisik(
                  pupil: "",
                  insertDttm: "",
                  insertDevice: "",
                  insertUserId: "",
                  ketPerson: "",
                  pelayanan: "",
                  kdBagian: "",
                  kategori: "",
                  noreg: "",
                  alatKelamin: "",
                  anggotaGerak: "",
                  refleks: "",
                  otot: "",
                  rtVt: "",
                  gcsE: "",
                  gcsM: "",
                  gcsV: "",
                  pupilKiri: "",
                  pupilKanan: "",
                  isokor: "",
                  isokorDetail: "",
                  anisokor: "",
                  cahayaKanan: "",
                  cahayaKiri: "",
                  akral: "",
                  kesadaran: "",
                  kepala: "",
                  rambut: "",
                  wajah: "",
                  keadaanUmum: "",
                  jalanNafas: "",
                  sirkulasi: "",
                  gangguan: "",
                  kulit: "",
                  abdomen: "",
                  ginjal: "",
                  abdomenLainnya: "",
                  peristatikUsus: "",
                  thyroid: "",
                  hati: "",
                  paru: "",
                  mata: "",
                  tht: "",
                  telinga: "",
                  hidung: "",
                  mulut: "",
                  gigi: "",
                  lidah: "",
                  tenggorokan: "",
                  leher: "",
                  lien: "",
                  leherLainnya: "",
                  dada: "",
                  respirasi: "",
                  perut: "",
                  jantung: "",
                  integument: "",
                  ekstremitas: "",
                  ekstremitasSuperior: "",
                  ekstremitasInferior: "",
                  kemampuanGenggam: "",
                  genetalia: "",
                  anus: "",
                  punggung: "",
                  lainLain: "",
                  dindingdada: "",
                  dindingdadaRetEpigastrium: "",
                  dindingdadaRetSuprastermal: "",
                  dindingdadaRetraksi: "",
                  hepar: "",
                  heparDetail: "",
                  limpa: "",
                  limpaDetail: "",
                  ouf: "",
                  tugorKulit: "",
                  pemeriksaanFisik: "",
                  skalaNyeri: 0,
                  skalaNyeriP: "",
                  skalaNyeriQ: "",
                  skalaNyeriR: "",
                  skalaNyeriS: "",
                  skalaNyeriT: "",
                  flaccWajah: 0,
                  flaccKaki: 0,
                  flaccAktifitas: 0,
                  flaccMenangis: 0,
                  flaccBersuara: 0,
                  flaccTotal: 0,
                  skalaTriase: 0))));
    }
  }

  Future<void> _onGetReportTriasePonek(
    OnGetReportTriasePonekEvent event,
    Emitter<TriaseIgdDokterState> emit,
  ) async {
    emit(state.copyWith(status: TriaseIGDDokterStatus.isLoadingGetReport));

    try {
      final getReport = await igdServices.onGetReportTriasePonek(
          noReg: event.noReg, noRM: event.noRM, tanggal: event.tanggal);

      TriaseReportIgdDokterResponse data =
          TriaseReportIgdDokterResponse.fromMap(getReport["response"]);

      emit(state.copyWith(
          status: TriaseIGDDokterStatus.isLoadedGetReport,
          triaseResponse: data));
    } catch (e) {
      // === //
      emit(state.copyWith(status: TriaseIGDDokterStatus.isLoadedGetReport));
    }
  }

  Future<void> _onGetDataTriaseIGDDokter(
    OnGetTriaseIGDDokterEvent event,
    Emitter<TriaseIgdDokterState> emit,
  ) async {
    emit(state.copyWith(status: TriaseIGDDokterStatus.isLoadingGet));

    try {
      final getData = await igdServices.onGetDataTriaseIGDDokter(
          noReg: event.noReg, pelayanan: event.pelayanan, person: event.person);

      TriaseIgdDokterModel data =
          TriaseIgdDokterModel.fromJson(getData["response"]);

      emit(state.copyWith(
          status: TriaseIGDDokterStatus.loaded, triaseIgdDokterModel: data));
    } catch (e) {
      emit(state.copyWith(
          status: TriaseIGDDokterStatus.loaded,
          triaseIgdDokterModel: TriaseIgdDokterModel(
              gangguanPerilaku: "",
              jam: "",
              tglMasuk: "",
              ddj: "",
              alasanMasuk: "",
              caraMasuk: "",
              penyebabCedera: "",
              kehamilan: "",
              gravida: "",
              para: "",
              abortus: "",
              hpht: "",
              ttp: "",
              skalaNyeri: 0,
              nyeriP: "",
              nyeriQ: "",
              nyeriR: "",
              nyeriS: "",
              nyeriT: "",
              skalaTriase: "",
              flagWajah: 0,
              flagKaki: 0,
              flagAktifitas: 0,
              flagMenangis: 0,
              flagBersuara: 0,
              flagTotal: 0)));
    }
  }

  Future<void> _onChangedSkalaNyeriP(
    OnChangedSkalaNyeriP event,
    Emitter<TriaseIgdDokterState> emit,
  ) async {
    emit(state.copyWith(status: TriaseIGDDokterStatus.isChanged));

    emit(state.copyWith(
        triaseIgdDokterModel:
            state.triaseIgdDokterModel.copyWith(nyeriP: event.value)));
  }

  Future<void> _onChangedGangguanPerilaku(
    OnChangedGangguanPerilaku event,
    Emitter<TriaseIgdDokterState> emit,
  ) async {
    emit(state.copyWith(status: TriaseIGDDokterStatus.isChanged));

    emit(state.copyWith(
        triaseIgdDokterModel: state.triaseIgdDokterModel
            .copyWith(gangguanPerilaku: event.value)));
  }

  Future<void> _onChangedFlaggWajah(
    OnChangedFlaggWajah event,
    Emitter<TriaseIgdDokterState> emit,
  ) async {
    emit(state.copyWith(status: TriaseIGDDokterStatus.isChanged));

    emit(state.copyWith(
        triaseIgdDokterModel:
            state.triaseIgdDokterModel.copyWith(flagWajah: event.value)));
  }

  Future<void> _onChangedFlaggKaki(
    OnChangedFlaggKaki event,
    Emitter<TriaseIgdDokterState> emit,
  ) async {
    emit(state.copyWith(status: TriaseIGDDokterStatus.isChanged));

    emit(state.copyWith(
        triaseIgdDokterModel:
            state.triaseIgdDokterModel.copyWith(flagKaki: event.value)));
  }

  Future<void> _onChangedFlaggAktivitas(
    OnChangedFlaggAktifitas event,
    Emitter<TriaseIgdDokterState> emit,
  ) async {
    emit(state.copyWith(status: TriaseIGDDokterStatus.isChanged));

    emit(state.copyWith(
        triaseIgdDokterModel:
            state.triaseIgdDokterModel.copyWith(flagAktifitas: event.value)));
  }

  Future<void> _onChangedFlaggMenangis(
    OnChangedFlaggMenangis event,
    Emitter<TriaseIgdDokterState> emit,
  ) async {
    emit(state.copyWith(status: TriaseIGDDokterStatus.isChanged));

    emit(state.copyWith(
        triaseIgdDokterModel:
            state.triaseIgdDokterModel.copyWith(flagMenangis: event.value)));
  }

  Future<void> _onChangedFlaggBersuara(
    OnChangedFlaggBersuara event,
    Emitter<TriaseIgdDokterState> emit,
  ) async {
    emit(state.copyWith(status: TriaseIGDDokterStatus.isChanged));

    emit(state.copyWith(
        triaseIgdDokterModel:
            state.triaseIgdDokterModel.copyWith(flagBersuara: event.value)));
  }

  Future<void> _onSaveAsesmenTriaseIGDDokter(
    OnSaveTriaseIGDDokterEvent event,
    Emitter<TriaseIgdDokterState> emit,
  ) async {
    emit(state.copyWith(status: TriaseIGDDokterStatus.isLoadingSave));

    try {
      // SAVE DATA
      final saveData = await igdServices.onSaveAsesmenTriaseIGDDokter(
          noReg: event.noReg,
          person: event.person,
          pelayanan: event.pelayanan,
          devicesID: event.devicesID,
          kategori: event.kategori,
          triase: event.triase);

      emit(state.copyWith(
          status: TriaseIGDDokterStatus.loaded,
          saveResultFailure: optionOf(saveData)));
      // ==== //
      emit(state.copyWith(
          status: TriaseIGDDokterStatus.loaded, saveResultFailure: none()));
    } catch (e) {
      // SAVE DATA
      emit(state.copyWith(status: TriaseIGDDokterStatus.loaded));
    }
  }

  Future<void> _onChangedGravida(
    OnChangedGravida event,
    Emitter<TriaseIgdDokterState> emit,
  ) async {
    emit(state.copyWith(status: TriaseIGDDokterStatus.isChanged));

    emit(state.copyWith(
        triaseIgdDokterModel:
            state.triaseIgdDokterModel.copyWith(gravida: event.value)));
  }

  Future<void> _onChangedSEvent(
    OnChangedSEvent event,
    Emitter<TriaseIgdDokterState> emit,
  ) async {
    emit(state.copyWith(status: TriaseIGDDokterStatus.isChanged));

    emit(state.copyWith(
        triaseIgdDokterModel:
            state.triaseIgdDokterModel.copyWith(nyeriS: event.value)));
  }

  Future<void> _onChangedQEvent(
    OnChangedQEvent event,
    Emitter<TriaseIgdDokterState> emit,
  ) async {
    emit(state.copyWith(status: TriaseIGDDokterStatus.isChanged));

    emit(state.copyWith(
        triaseIgdDokterModel:
            state.triaseIgdDokterModel.copyWith(nyeriQ: event.value)));
  }

  Future<void> _onChangedPEvent(
    OnChangedPEvent event,
    Emitter<TriaseIgdDokterState> emit,
  ) async {
    emit(state.copyWith(status: TriaseIGDDokterStatus.isChanged));

    emit(state.copyWith(
        triaseIgdDokterModel:
            state.triaseIgdDokterModel.copyWith(nyeriP: event.value)));
  }

  Future<void> _onChangedREvent(
    OnChangedREvent event,
    Emitter<TriaseIgdDokterState> emit,
  ) async {
    emit(state.copyWith(status: TriaseIGDDokterStatus.isChanged));

    emit(state.copyWith(
        triaseIgdDokterModel:
            state.triaseIgdDokterModel.copyWith(nyeriR: event.value)));
  }

  Future<void> _onChangedTEvent(
    OnChangedTEvent event,
    Emitter<TriaseIgdDokterState> emit,
  ) async {
    emit(state.copyWith(status: TriaseIGDDokterStatus.isChanged));

    emit(state.copyWith(
        triaseIgdDokterModel:
            state.triaseIgdDokterModel.copyWith(nyeriT: event.value)));
  }

  Future<void> _onChangedPara(
    OnChangedPara event,
    Emitter<TriaseIgdDokterState> emit,
  ) async {
    emit(state.copyWith(status: TriaseIGDDokterStatus.isChanged));

    emit(state.copyWith(
        triaseIgdDokterModel:
            state.triaseIgdDokterModel.copyWith(para: event.value)));
  }

  Future<void> _onChangedHPHT(
    OnChangedHPHT event,
    Emitter<TriaseIgdDokterState> emit,
  ) async {
    emit(state.copyWith(status: TriaseIGDDokterStatus.isChanged));

    emit(state.copyWith(
        triaseIgdDokterModel:
            state.triaseIgdDokterModel.copyWith(hpht: event.value)));
  }

  Future<void> _onChangedDDJ(
    OnChangedDDJEvent event,
    Emitter<TriaseIgdDokterState> emit,
  ) async {
    emit(state.copyWith(status: TriaseIGDDokterStatus.isChanged));

    emit(state.copyWith(
        triaseIgdDokterModel:
            state.triaseIgdDokterModel.copyWith(ddj: event.value)));
  }

  Future<void> _onChangedSkalaTriase(
    OnChangedSkalaTriase event,
    Emitter<TriaseIgdDokterState> emit,
  ) async {
    emit(state.copyWith(status: TriaseIGDDokterStatus.isChanged));

    emit(state.copyWith(
        triaseIgdDokterModel:
            state.triaseIgdDokterModel.copyWith(skalaTriase: event.value)));
  }

  Future<void> _onChangedAbortus(
    OnChangedAbortus event,
    Emitter<TriaseIgdDokterState> emit,
  ) async {
    emit(state.copyWith(status: TriaseIGDDokterStatus.isChanged));

    emit(state.copyWith(
        triaseIgdDokterModel:
            state.triaseIgdDokterModel.copyWith(abortus: event.value)));
  }

  Future<void> _onChangedHamil(
    OnChangedKehamilan event,
    Emitter<TriaseIgdDokterState> emit,
  ) async {
    // ======//
    emit(state.copyWith(status: TriaseIGDDokterStatus.isChanged));

    emit(state.copyWith(
        triaseIgdDokterModel:
            state.triaseIgdDokterModel.copyWith(kehamilan: event.value)));
  }
}
