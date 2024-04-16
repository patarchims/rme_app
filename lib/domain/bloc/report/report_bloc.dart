import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/models/response/report/report_pengkajian_awal_pasien_rawat_inap_anak_model.dart';
import 'package:hms_app/domain/models/response/report/report_pengkajian_awal_rawat_inap_model.dart';
import 'package:hms_app/domain/models/response/report/report_pengkajian_rawat_inap_perawat_model.dart';
import 'package:hms_app/domain/models/response/report/report_ringkasan_pulang_response_model.dart';
import 'package:hms_app/domain/models/response/report/report_triase_response_model.dart';
import 'package:hms_app/domain/services/library_services.dart';
import 'package:hms_app/presentation/report/repository/intervensi_pasien_response_model.dart';
import 'package:hms_app/presentation/report/repository/response_cppt_pasien_mode.dart';
part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc() : super(ReportState.initial()) {
    on<OnGetReportTriaseEvent>(_onGetTriaseReport);
    on<OnGetReportRingkasanPulangEvent>(_onGetRingkasanPulangReport);
    on<OnGetReportPerkembanganPerkembanganPasien>(
        _onGetPerkembanganPasienReport);
    on<OnGetReportPengkajianPasienRawatInapAnak>(
        _onGetPengkajianAwalPasienRawatInapAnak);
    on<OnGetReportCPPTPasienEvent>(_onGetReportCPPTPasien);
    on<OnGetReportPengkajianAwalRawatInapPerawat>(
        _onGetPengkajianRawatInapPerawat);
    on<OnGetReportPengkajianAwalRawatInapDokter>(
        _onGetReportPengkajianRawatInap);
  }

  Future<void> _onGetTriaseReport(
    OnGetReportTriaseEvent event,
    Emitter<ReportState> emit,
  ) async {
    emit(state.copyWith(status: ReportStatus.loadingReportTriase));

    final data =
        await libraryService.triaseReport(noRM: event.noRM, noReg: event.noReg);

    data.fold(
        (l) => l.maybeMap(
            orElse: () {},
            failure: (e) {
              emit(state.copyWith(
                  status: ReportStatus.error, reportTriase: null));
            }),
        (r) => r.maybeMap(
            orElse: () {},
            loaded: (data) {
              try {
                log("GET DATA RINGKASAN PULANG");
                ReportTriaseResponseModel datas =
                    ReportTriaseResponseModel.fromJson(data.value["response"]);

                log("GET DATA RINGKASAN PULANG");
                emit(state.copyWith(
                    status: ReportStatus.loadedReportTriase,
                    reportTriase: datas));
              } catch (e) {
                emit(state.copyWith(
                    status: ReportStatus.error, reportTriase: null));
              }
            }));
  }

  Future<void> _onGetReportPengkajianRawatInap(
    OnGetReportPengkajianAwalRawatInapDokter event,
    Emitter<ReportState> emit,
  ) async {
    emit(state.copyWith(
        status: ReportStatus.isLoadingReportPengkajianRawatInap));
    // GET REPORT PENGKAJIAN RAWAT INAP
    try {
      final data = await libraryService.reportPengkajianRawatInapDokter(
          noReg: event.noReg, tanggal: event.tanggal, noRM: event.noRM);
      // === //
      ReportPengkajianAwalRawatInapModel datas =
          ReportPengkajianAwalRawatInapModel.fromMap(data["response"]);

      emit(state.copyWith(
          reportPengkajianAwalMedis: datas,
          status: ReportStatus.loadedReportPengkajianRawatInap));
    } catch (e) {
      emit(state.copyWith(
        reportPengkajianAwalMedis: ReportPengkajianAwalRawatInapModel(
            dPenLab: [],
            diagnosa: [],
            radiologi: [],
            asesmenDokter: AsesmenDokter(
                diagnosaBanding: "",
                insertDttm: "",
                person: "",
                userId: "",
                pelayanan: "",
                insertPc: "",
                kdBagian: "",
                noreg: "",
                keluhUtama: "",
                rwtSekarang: "",
                tglMasuk: "",
                jamMasuk: "",
                imageLokalis: "",
                prognosis: "",
                alasanOpname: "",
                terapi: "",
                konsulke: "",
                namaDokter: ""),
            vitalSignDokter: VitalSignDokter(
                insertDttm: "",
                userId: "",
                pelayanan: "",
                kdBagian: "",
                deviceId: "",
                kategori: "",
                person: "",
                noreg: "",
                td: "",
                nadi: "",
                suhu: "",
                spo2: "",
                pernafasan: "",
                tinggiBadan: "",
                beratBadan: ""),
            fisikModel: FisikModel(
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
                pupil: "",
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
                skalaTriase: 0)),
        status: ReportStatus.loadedReportPengkajianRawatInap,
      ));
    }
  }

  Future<void> _onGetReportCPPTPasien(
    OnGetReportCPPTPasienEvent event,
    Emitter<ReportState> emit,
  ) async {
    emit(state.copyWith(status: ReportStatus.loadingReportCPPTPasien));

    try {
      final data = await libraryService.reportCPPTPasien(noRM: event.noRM);

      List<ResponseCpptPasien> value = (data["response"] as Iterable)
          .map((e) => ResponseCpptPasien.fromJson(e))
          .toList();

      emit(state.copyWith(
          status: ReportStatus.loadedReportCPPTPasien,
          intervensiResponse: state.intervensiResponse,
          cpptPasien: value));
    } catch (e) {
      emit(state.copyWith(
          status: ReportStatus.error,
          intervensiResponse: state.intervensiResponse,
          cpptPasien: []));
    }
  }

  Future<void> _onGetPengkajianRawatInapPerawat(
    OnGetReportPengkajianAwalRawatInapPerawat event,
    Emitter<ReportState> emit,
  ) async {
    emit(state.copyWith(
        status: ReportStatus.isLoadingReportPengkajianRawatInapPerawat));

    try {
      final data = await libraryService.reportPengkajianRawatInapPerawat(
          noReg: event.noReg, tanggal: event.tanggal, noRM: event.noRM);

      ReportPengkajianRawatInapPerawat datas =
          ReportPengkajianRawatInapPerawat.fromMap(data["response"]);

      emit(state.copyWith(
          status: ReportStatus.loadedReportPengkajianRawatInapPerawat,
          intervensiResponse: state.intervensiResponse,
          perawat: datas));
    } catch (e) {
      emit(state.copyWith(
          status: ReportStatus.error,
          intervensiResponse: state.intervensiResponse,
          cpptPasien: []));
    }
  }

  Future<void> _onGetRingkasanPulangReport(
    OnGetReportRingkasanPulangEvent event,
    Emitter<ReportState> emit,
  ) async {
    emit(state.copyWith(status: ReportStatus.loadingReportRingkasanPulang));

    final data = await libraryService.ringkasanPulangReport(
        noRM: event.noRM, noReg: event.noReg);

    log("GET DATA RINGKASAN PULANG");
    log(data.toString());

    data.fold(
        (l) => l.maybeMap(
            orElse: () {},
            failure: (e) {
              emit(state.copyWith(
                  status: ReportStatus.error, reportTriase: null));
            }),
        (r) => r.maybeMap(
            orElse: () {},
            loaded: (data) {
              try {
                log("GET DATA RINGKASAN PULANG");
                ReportRingkasanPulangResponseModel datas =
                    ReportRingkasanPulangResponseModel.fromJson(
                        data.value["response"]);
                log("GET DATA RINGKASAN PULANG");
                log(datas.toString());
                emit(state.copyWith(
                  reportRingkasanPulang: datas,
                  status: ReportStatus.loadedRingkasanPulang,
                ));
              } catch (e) {
                emit(state.copyWith(
                    status: ReportStatus.error, reportTriase: null));
              }
            }));
  }

  Future<void> _onGetPerkembanganPasienReport(
    OnGetReportPerkembanganPerkembanganPasien event,
    Emitter<ReportState> emit,
  ) async {
    // getPerkembanganPasienReport
    emit(state.copyWith(
        status: ReportStatus.loadingPerkembanganPasien,
        intervensiResponse: state.intervensiResponse));

    // get data
    try {
      final data = await libraryService.getIntervensiPasien(noRM: event.noRM);

      List<IntervensiPasienResponseModel> value = (data["response"] as Iterable)
          .map((e) => IntervensiPasienResponseModel.fromJson(e))
          .toList();

      log("GET INTERVENSI");
      log(value.toString());

      emit(state.copyWith(
          status: ReportStatus.loadedPerkembanganPasien,
          intervensiResponse: value));
    } catch (e) {
      emit(state.copyWith(
          status: ReportStatus.error,
          intervensiResponse: state.intervensiResponse));
    }
  }

  Future<void> _onGetPengkajianAwalPasienRawatInapAnak(
    OnGetReportPengkajianPasienRawatInapAnak event,
    Emitter<ReportState> emit,
  ) async {
    emit(state.copyWith(status: ReportStatus.loadingReportRawatInapAnak));

    final data = await libraryService.reportRawatInapAnak(
        noRM: event.noRM, noReg: event.noReg);

    data.fold(
        (l) => l.maybeMap(
            orElse: () {},
            failure: (e) {
              emit(state.copyWith(
                  status: ReportStatus.error, reportTriase: null));
            }),
        (r) => r.maybeMap(
            orElse: () {},
            loaded: (data) {
              try {
                log("GET DATA RINGKASAN PULANG");
                ReportPengkajianAwalPasienRawatInapResponseModel datas =
                    ReportPengkajianAwalPasienRawatInapResponseModel.fromJson(
                        data.value["response"]);

                log("GET DATA RINGKASAN PULANG");
                emit(state.copyWith(
                    status: ReportStatus.loadedReportRawwtInapAnak,
                    reportRawatInapResponse: datas));
              } catch (e) {
                emit(state.copyWith(
                    status: ReportStatus.error, reportTriase: null));
              }
            }));
  }
}
