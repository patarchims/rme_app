import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/presentation/report/repository/report_pengkajian_kebidanan_model.dart';
import 'package:hms_app/presentation/report/services/report_service.dart';

part 'pengkajian_kebidanan_awal_kebidanan_event.dart';
part 'pengkajian_kebidanan_awal_kebidanan_state.dart';

class ReportPengkajianKebidananAwalKebidananBloc extends Bloc<
    PengkajianKebidananAwalKebidananEvent,
    PengkajianKebidananAwalKebidananState> {
  ReportPengkajianKebidananAwalKebidananBloc()
      : super(PengkajianKebidananAwalKebidananState.initial()) {
    on<PengkajianKebidananAwalKebidananEvent>((event, emit) {});
    on<OnGetPengkajianEvent>(_onGetReportPengkajianKebidanan);
  }

  Future<void> _onGetReportPengkajianKebidanan(
    OnGetPengkajianEvent event,
    Emitter<PengkajianKebidananAwalKebidananState> emit,
  ) async {
    emit(state.copyWith(
      status: PengkajianKebidananAwalKebidananStatus.loading,
    ));

    try {
      final getData = await reportServices.onGetPengkajianKebidananReport(
          noReg: event.noReg, person: event.person, noRM: event.noRM);

      log(getData.toString());

      ReportPengkajianKebidanan datas =
          ReportPengkajianKebidanan.fromJson(getData["response"]);

      emit(state.copyWith(
          report: datas,
          status: PengkajianKebidananAwalKebidananStatus.loaded));
    } catch (e) {
      emit(state.copyWith(
          report: ReportPengkajianKebidanan(
            user: User(id: "", nama: "", jenisKelamin: "", tglLahir: ""),
            karu: User(id: "", nama: "", jenisKelamin: "", tglLahir: ""),
            penyakitKeluarga: [],
            diagnosa: [],
            fungsional: Fungsional(
                insertDttm: "",
                updDttm: "",
                device: "",
                userId: "",
                kdBagian: "",
                noreg: "",
                f1: "",
                f2: "",
                f3: "",
                f4: "",
                f5: "",
                f6: "",
                f7: "",
                f8: "",
                f9: "",
                f10: "",
                nilai: 0),
            nutrisi: Nutrisi(
                insertDttm: "",
                updDttm: "",
                device: "",
                userId: "",
                kdBagian: "",
                noreg: "",
                n1: "",
                n2: "",
                nilai: 0),
            fisik: Fisik(
                insertDttm: "",
                updDttm: "",
                device: "",
                userId: "",
                kategori: "",
                person: "",
                pelayanan: "",
                kdBagian: "",
                noreg: "",
                kepala: "",
                mata: "",
                telinga: "",
                leherDahBahu: "",
                mulut: "",
                mucosaMulut: "",
                gigi: "",
                hidung: "",
                tenggorokan: "",
                payudara: "",
                abdomen: "",
                nutrisiDanHidrasi: ""),
            pengobatanDirumah: [],
            kehamilan: [],
            vitalSign: VitalSign(
                tekananDarah: "",
                pernapasan: "",
                suhu: "",
                nadi: "",
                ddj: "",
                beratBadan: "",
                tinggiBadan: "",
                gcsE: "",
                gcsV: "",
                gcsM: "",
                tfu: ""),
            pengkajian: Pengkajian(
                kehamilanHis: "",
                kehamilanLendir: "",
                keluhanMenyertai: "",
                aktivitas: "",
                ekonomi: "",
                eliminasiBab: "",
                eliminasiBak: "",
                haidTerakhir: "",
                hamilMuda: "",
                hamilTua: "",
                hpl: "",
                istirahat: "",
                nilaiKepercayaan: "",
                pemeriksaaanDalam: "",
                spiritual: "",
                tbj: "",
                tfu: "",
                usiaKehamilan: "",
                bahasaSehari: "",
                caraBelajar: "",
                eliminasi: "",
                haid: "",
                hambatanBahasa: "",
                hambatanSosial: "",
                hamil: "",
                inspekuloP: "",
                inspekuloV: "",
                integumen: "",
                kardiovaskuler: "",
                kenyamanan: "",
                kepercayaan: "",
                mobilisasi: "",
                papsSmer: "",
                pencernaan: "",
                perfusiPerifer: "",
                presepsiSakit: "",
                proteksi: "",
                respiratori: "",
                responseEmosi: "",
                secebral: "",
                sistemBerpakaian: "",
                sistemMakan: "",
                sistemMandi: "",
                sistemPendarahan: "",
                spikologis: "",
                thermoregulasi: "",
                tglMasuk: "",
                tglKeluar: "",
                pelayanan: "",
                kdBagian: "",
                noreg: "",
                keluhanUtama: "",
                rwtPenyakit: "",
                penyakitDahulu: "",
                menstruasi: "",
                siklusHaid: "",
                rwtPernikahan: "",
                alergi: "",
                gravida: "",
                para: "",
                abortus: "",
                hpht: "",
                tpp: "",
                leopold1: "",
                leopold2: "",
                leopold3: "",
                leopold4: ""),
          ),
          status: PengkajianKebidananAwalKebidananStatus.loaded));
    }
  }
}
