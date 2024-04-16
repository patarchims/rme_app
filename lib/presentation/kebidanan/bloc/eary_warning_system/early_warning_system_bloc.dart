// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/presentation/kebidanan/repository/early_warning_system_repository_widget.dart';
import 'package:hms_app/presentation/kebidanan/services/kebidanan_service.dart';

part 'early_warning_system_event.dart';
part 'early_warning_system_state.dart';

class EarlyWarningSystemBloc
    extends Bloc<EarlyWarningSystemEvent, EarlyWarningSystemState> {
  EarlyWarningSystemBloc() : super(EarlyWarningSystemState.initial()) {
    on<EarlyWarningSystemEvent>((event, emit) {});
    on<OnSaveData>(_onSaveData);
    on<OnDeleteData>(_onDeleteData);
    on<OnGetDataEarlyWarningSystem>(_onGetWarningSystem);
    on<OnChangedKategori>(_onChangedKategori);
    on<OnChangedTingkatKesadaran>(_onChangedTingkatKesadaran);
    on<OnChangedTekananDarah2>(_onChangedTD2);
    on<OnChangedTekananDarah1>(_onChangedTD1);
    on<OnChangedNadi>(_onChangedNadi);
    on<OnChangedObsigenTambahanEvent>(_onChangedObsigenTambahan);
    on<OnChangedKeterangan>(_onChangedKeterangan);
    on<OnChangedPernapasanEvent>(_onChangedPernapasan);
    on<OnChangedReaksiOtot>(_onChangedReaksiOTOT);
    on<OnChangedSkalaNyeri>(_onChangedSkalaNyeri);
    on<OnChangedSuhu>(_onChangedSuhu);
    on<OnChangedSPO2>(_onChangedSPO2);
    on<OnChangedCRT>(_onChangedCRT);
  }

  void hitungSkor(Emitter<EarlyWarningSystemState> emit) {
    if (state.earlyWarningSystemModel.kategori == "Dewasa") {
      switch (state.earlyWarningSystemModel.obsigenTambahan) {
        case "Tidak":
          emit(state.copyWith(
              earlyWarningSystemModel:
                  state.earlyWarningSystemModel.copyWith(nilaiObsigen: 0)));
          break;
        case "Ya":
          emit(state.copyWith(
              earlyWarningSystemModel:
                  state.earlyWarningSystemModel.copyWith(nilaiObsigen: 2)));
          break;
        default:
      }

      if (state.earlyWarningSystemModel.td < 70) {
        emit(state.copyWith(
            earlyWarningSystemModel:
                state.earlyWarningSystemModel.copyWith(nilaiTd: 3)));
      }
      if (state.earlyWarningSystemModel.td >= 71 &&
          state.earlyWarningSystemModel.td <= 80) {
        emit(state.copyWith(
            earlyWarningSystemModel:
                state.earlyWarningSystemModel.copyWith(nilaiTd: 2)));
      }
      if (state.earlyWarningSystemModel.td >= 81 &&
          state.earlyWarningSystemModel.td <= 100) {
        emit(state.copyWith(
            earlyWarningSystemModel:
                state.earlyWarningSystemModel.copyWith(nilaiTd: 1)));
      }

      if (state.earlyWarningSystemModel.td >= 101 &&
          state.earlyWarningSystemModel.td <= 159) {
        emit(state.copyWith(
            earlyWarningSystemModel:
                state.earlyWarningSystemModel.copyWith(nilaiTd: 0)));
      }

      if (state.earlyWarningSystemModel.td >= 160 &&
          state.earlyWarningSystemModel.td <= 199) {
        emit(state.copyWith(
            earlyWarningSystemModel:
                state.earlyWarningSystemModel.copyWith(nilaiTd: 1)));
      }

      if (state.earlyWarningSystemModel.td >= 200 &&
          state.earlyWarningSystemModel.td <= 220) {
        emit(state.copyWith(
            earlyWarningSystemModel:
                state.earlyWarningSystemModel.copyWith(nilaiTd: 2)));
      }

      if (state.earlyWarningSystemModel.td >= 220) {
        emit(state.copyWith(
            earlyWarningSystemModel:
                state.earlyWarningSystemModel.copyWith(nilaiTd: 3)));
      }

      if (state.earlyWarningSystemModel.nadi < 40) {
        emit(state.copyWith(
            earlyWarningSystemModel:
                state.earlyWarningSystemModel.copyWith(nilaiNadi: 2)));
      }

      if (state.earlyWarningSystemModel.nadi > 40 &&
          state.earlyWarningSystemModel.nadi > 50) {
        emit(state.copyWith(
            earlyWarningSystemModel:
                state.earlyWarningSystemModel.copyWith(nilaiNadi: 1)));
      }

      if (state.earlyWarningSystemModel.nadi >= 51 &&
          state.earlyWarningSystemModel.nadi <= 100) {
        emit(state.copyWith(
            earlyWarningSystemModel:
                state.earlyWarningSystemModel.copyWith(nilaiNadi: 0)));
      }

      if (state.earlyWarningSystemModel.nadi >= 101 &&
          state.earlyWarningSystemModel.nadi <= 110) {
        emit(state.copyWith(
            earlyWarningSystemModel:
                state.earlyWarningSystemModel.copyWith(nilaiNadi: 1)));
      }

      if (state.earlyWarningSystemModel.nadi >= 111 &&
          state.earlyWarningSystemModel.nadi <= 129) {
        emit(state.copyWith(
            earlyWarningSystemModel:
                state.earlyWarningSystemModel.copyWith(nilaiNadi: 2)));
      }

      if (state.earlyWarningSystemModel.nadi >= 130) {
        emit(state.copyWith(
            earlyWarningSystemModel:
                state.earlyWarningSystemModel.copyWith(nilaiNadi: 3)));
      }

      switch (state.earlyWarningSystemModel.tingkatKesadaran) {
        case "Alert":
          emit(state.copyWith(
              earlyWarningSystemModel:
                  state.earlyWarningSystemModel.copyWith(nilaiKesadaran: 0)));
        case "Voice":
          emit(state.copyWith(
              earlyWarningSystemModel:
                  state.earlyWarningSystemModel.copyWith(nilaiKesadaran: 1)));
        case "Pain":
          emit(state.copyWith(
              earlyWarningSystemModel:
                  state.earlyWarningSystemModel.copyWith(nilaiKesadaran: 2)));
        case "Unreponsiv":
          emit(state.copyWith(
              earlyWarningSystemModel:
                  state.earlyWarningSystemModel.copyWith(nilaiKesadaran: 3)));
        default:
      }
    }

    if (state.earlyWarningSystemModel.kategori == "Anak") {
      switch (state.earlyWarningSystemModel.obsigenTambahan) {
        case "Tidak":
          emit(state.copyWith(
              earlyWarningSystemModel:
                  state.earlyWarningSystemModel.copyWith(nilaiObsigen: 0)));
          break;
        case "Ya":
          emit(state.copyWith(
              earlyWarningSystemModel:
                  state.earlyWarningSystemModel.copyWith(nilaiObsigen: 1)));
          break;
        default:
      }

      switch (state.earlyWarningSystemModel.crt) {
        case > 2:
          emit(state.copyWith(
              earlyWarningSystemModel:
                  state.earlyWarningSystemModel.copyWith(nilaiCRT: 1)));
          break;
        case < 2:
          emit(state.copyWith(
              earlyWarningSystemModel:
                  state.earlyWarningSystemModel.copyWith(nilaiCRT: 0)));
          break;
        default:
      }

      switch (state.earlyWarningSystemModel.pernapasan) {
        case < 85:
          emit(state.copyWith(
              earlyWarningSystemModel:
                  state.earlyWarningSystemModel.copyWith(nilaiObsigen: 3)));
          break;
        case >= 86 && <= 89:
          emit(state.copyWith(
              earlyWarningSystemModel:
                  state.earlyWarningSystemModel.copyWith(nilaiObsigen: 2)));
          break;
        case >= 90 && <= 93:
          emit(state.copyWith(
              earlyWarningSystemModel:
                  state.earlyWarningSystemModel.copyWith(nilaiObsigen: 1)));
          break;
        case >= 94:
          emit(state.copyWith(
              earlyWarningSystemModel:
                  state.earlyWarningSystemModel.copyWith(nilaiObsigen: 0)));
          break;
        default:
      }

      switch (state.earlyWarningSystemModel.tingkatKesadaran) {
        case "Alert":
          emit(state.copyWith(
              earlyWarningSystemModel:
                  state.earlyWarningSystemModel.copyWith(nilaiKesadaran: 0)));
        case "Voice":
          emit(state.copyWith(
              earlyWarningSystemModel:
                  state.earlyWarningSystemModel.copyWith(nilaiKesadaran: 1)));
        case "Pain":
          emit(state.copyWith(
              earlyWarningSystemModel:
                  state.earlyWarningSystemModel.copyWith(nilaiKesadaran: 2)));
        case "Unreponsiv":
          emit(state.copyWith(
              earlyWarningSystemModel:
                  state.earlyWarningSystemModel.copyWith(nilaiKesadaran: 3)));
        default:
      }
    }

    emit(state.copyWith(
        earlyWarningSystemModel: state.earlyWarningSystemModel.copyWith(
            totalSkor: state.earlyWarningSystemModel.nilaiCRT +
                state.earlyWarningSystemModel.nilaiDarah +
                state.earlyWarningSystemModel.nilaiKesadaran +
                state.earlyWarningSystemModel.nilaiNadi +
                state.earlyWarningSystemModel.nilaiNafas +
                state.earlyWarningSystemModel.nilaiObsigen +
                state.earlyWarningSystemModel.nilaiSuhu +
                state.earlyWarningSystemModel.nilaiTd)));
  }

  Future<void> _onSaveData(
    OnSaveData event,
    Emitter<EarlyWarningSystemState> emit,
  ) async {
    emit(state.copyWith(status: EarlyWarningSystemStatus.loading));
    try {
      final save = await kebidananService.onSaveDataEWS(
          totalSkor: event.totalSkor,
          kategori: event.kategori,
          obsigenTambahan: event.obsigenTambahan,
          td2: event.td2,
          keterangan: event.keterangan,
          noreg: event.noreg,
          kesadaran: event.kesadaran,
          td: event.td,
          nadi: event.nadi,
          pernapasan: event.pernapasan,
          reaksiOtot: event.reaksiOtot,
          suhu: event.suhu,
          spo2: event.spo2,
          crt: event.crt,
          skalaNyeri: event.skalaNyeri);

      emit(state.copyWith(
          status: EarlyWarningSystemStatus.loaded, saveResult: optionOf(save)));
      emit(state.copyWith(
          status: EarlyWarningSystemStatus.loaded, saveResult: none()));
    } catch (e) {
      emit(state.copyWith());
    }
  }

  Future<void> _onDeleteData(
    OnDeleteData event,
    Emitter<EarlyWarningSystemState> emit,
  ) async {
    emit(state.copyWith(status: EarlyWarningSystemStatus.loading));
    try {
      final delete = await kebidananService.onDelete(id: event.id);

      emit(state.copyWith(
          status: EarlyWarningSystemStatus.loaded,
          onDeleteResult: optionOf(delete)));
      emit(state.copyWith(
          status: EarlyWarningSystemStatus.loaded, onDeleteResult: none()));
    } catch (e) {
      emit(state.copyWith());
    }
  }

  Future<void> _onChangedKategori(
    OnChangedKategori event,
    Emitter<EarlyWarningSystemState> emit,
  ) async {
    emit(state.copyWith(status: EarlyWarningSystemStatus.loaded));

    emit(state.copyWith(
        earlyWarningSystemModel:
            state.earlyWarningSystemModel.copyWith(kategori: event.kategori)));

    hitungSkor(emit);
  }

  Future<void> _onChangedTingkatKesadaran(
    OnChangedTingkatKesadaran event,
    Emitter<EarlyWarningSystemState> emit,
  ) async {
    emit(state.copyWith(status: EarlyWarningSystemStatus.loaded));

    emit(state.copyWith(
        earlyWarningSystemModel: state.earlyWarningSystemModel
            .copyWith(tingkatKesadaran: event.value)));

    hitungSkor(emit);
  }

  Future<void> _onChangedTD1(
    OnChangedTekananDarah1 event,
    Emitter<EarlyWarningSystemState> emit,
  ) async {
    emit(state.copyWith(status: EarlyWarningSystemStatus.isChanged));

    emit(state.copyWith(
        earlyWarningSystemModel:
            state.earlyWarningSystemModel.copyWith(td: event.value)));

    emit(state.copyWith(status: EarlyWarningSystemStatus.loaded));

    hitungSkor(emit);
  }

  Future<void> _onChangedObsigenTambahan(
    OnChangedObsigenTambahanEvent event,
    Emitter<EarlyWarningSystemState> emit,
  ) async {
    emit(state.copyWith(status: EarlyWarningSystemStatus.isChanged));

    emit(state.copyWith(
        earlyWarningSystemModel: state.earlyWarningSystemModel
            .copyWith(obsigenTambahan: event.value)));

    emit(state.copyWith(status: EarlyWarningSystemStatus.loaded));

    hitungSkor(emit);
  }

  Future<void> _onChangedPernapasan(
    OnChangedPernapasanEvent event,
    Emitter<EarlyWarningSystemState> emit,
  ) async {
    emit(state.copyWith(status: EarlyWarningSystemStatus.isChanged));

    emit(state.copyWith(
        earlyWarningSystemModel:
            state.earlyWarningSystemModel.copyWith(pernapasan: event.value)));

    emit(state.copyWith(status: EarlyWarningSystemStatus.loaded));

    hitungSkor(emit);
  }

  Future<void> _onChangedReaksiOTOT(
    OnChangedReaksiOtot event,
    Emitter<EarlyWarningSystemState> emit,
  ) async {
    emit(state.copyWith(status: EarlyWarningSystemStatus.isChanged));

    emit(state.copyWith(
        earlyWarningSystemModel:
            state.earlyWarningSystemModel.copyWith(reaksiOtot: event.value)));

    emit(state.copyWith(status: EarlyWarningSystemStatus.loaded));

    hitungSkor(emit);
  }

  Future<void> _onChangedTD2(
    OnChangedTekananDarah2 event,
    Emitter<EarlyWarningSystemState> emit,
  ) async {
    log(event.value.toString());
    emit(state.copyWith(status: EarlyWarningSystemStatus.isChanged));

    emit(state.copyWith(
        earlyWarningSystemModel:
            state.earlyWarningSystemModel.copyWith(td2: event.value)));

    emit(state.copyWith(status: EarlyWarningSystemStatus.loaded));

    hitungSkor(emit);
  }

  Future<void> _onChangedSkalaNyeri(
    OnChangedSkalaNyeri event,
    Emitter<EarlyWarningSystemState> emit,
  ) async {
    emit(state.copyWith(status: EarlyWarningSystemStatus.isChanged));

    emit(state.copyWith(
        earlyWarningSystemModel:
            state.earlyWarningSystemModel.copyWith(skalaNyeri: event.value)));

    emit(state.copyWith(status: EarlyWarningSystemStatus.loaded));

    hitungSkor(emit);
  }

  Future<void> _onChangedSuhu(
    OnChangedSuhu event,
    Emitter<EarlyWarningSystemState> emit,
  ) async {
    emit(state.copyWith(status: EarlyWarningSystemStatus.isChanged));

    emit(state.copyWith(
        earlyWarningSystemModel:
            state.earlyWarningSystemModel.copyWith(suhu: event.value)));

    emit(state.copyWith(status: EarlyWarningSystemStatus.loaded));

    hitungSkor(emit);
  }

  Future<void> _onChangedNadi(
    OnChangedNadi event,
    Emitter<EarlyWarningSystemState> emit,
  ) async {
    emit(state.copyWith(status: EarlyWarningSystemStatus.isChanged));

    emit(state.copyWith(
        earlyWarningSystemModel:
            state.earlyWarningSystemModel.copyWith(nadi: event.value)));

    emit(state.copyWith(status: EarlyWarningSystemStatus.loaded));
    hitungSkor(emit);
  }

  Future<void> _onChangedSPO2(
    OnChangedSPO2 event,
    Emitter<EarlyWarningSystemState> emit,
  ) async {
    emit(state.copyWith(status: EarlyWarningSystemStatus.isChanged));

    emit(state.copyWith(
        earlyWarningSystemModel:
            state.earlyWarningSystemModel.copyWith(spo2: event.value)));

    emit(state.copyWith(status: EarlyWarningSystemStatus.loaded));
    hitungSkor(emit);
  }

  Future<void> _onChangedCRT(
    OnChangedCRT event,
    Emitter<EarlyWarningSystemState> emit,
  ) async {
    emit(state.copyWith(status: EarlyWarningSystemStatus.isChanged));

    emit(state.copyWith(
        earlyWarningSystemModel:
            state.earlyWarningSystemModel.copyWith(crt: event.value)));

    emit(state.copyWith(status: EarlyWarningSystemStatus.loaded));
    hitungSkor(emit);
  }

  Future<void> _onChangedKeterangan(
    OnChangedKeterangan event,
    Emitter<EarlyWarningSystemState> emit,
  ) async {
    emit(state.copyWith(status: EarlyWarningSystemStatus.isChanged));

    emit(state.copyWith(
        earlyWarningSystemModel:
            state.earlyWarningSystemModel.copyWith(keterangan: event.value)));

    emit(state.copyWith(status: EarlyWarningSystemStatus.loaded));
  }

  Future<void> _onGetWarningSystem(
    OnGetDataEarlyWarningSystem event,
    Emitter<EarlyWarningSystemState> emit,
  ) async {
    emit(state.copyWith(
        status: EarlyWarningSystemStatus.isLoadingGetData,
        onDeleteResult: none(),
        saveResult: none()));
    try {
      final delete = await kebidananService.getEwsSystem(noReg: event.noReg);

      List<EarlyWarningSystem> data = (delete["response"] as Iterable)
          .map((e) => EarlyWarningSystem.fromJson(e))
          .toList();

      log(data.toString());

      emit(state.copyWith(
          status: EarlyWarningSystemStatus.loaded, earlyWarningSystem: data));
    } catch (e) {
      emit(state.copyWith());
    }
  }
}

class EarlyWarningSystemModel {
  final String kategori;
  final String tingkatKesadaran;
  final double td;
  final double td2;
  final double nadi;
  final double pernapasan;
  final String reaksiOtot;
  final double suhu;
  final double spo2;
  final double crt;
  final double skalaNyeri;
  final String obsigenTambahan;
  final String keterangan;

  final double totalSkor;
  final double nilaiKesadaran;
  final double nilaiNafas;
  final double nilaiNadi;
  final double nilaiTd;
  final double nilaiDarah;
  final double nilaiSuhu;
  final double nilaiCRT;
  final double nilaiObsigen;

  EarlyWarningSystemModel({
    required this.kategori,
    required this.tingkatKesadaran,
    required this.td,
    required this.td2,
    required this.nadi,
    required this.pernapasan,
    required this.reaksiOtot,
    required this.suhu,
    required this.spo2,
    required this.crt,
    required this.skalaNyeri,
    required this.obsigenTambahan,
    required this.keterangan,
    required this.totalSkor,
    required this.nilaiKesadaran,
    required this.nilaiNafas,
    required this.nilaiNadi,
    required this.nilaiTd,
    required this.nilaiDarah,
    required this.nilaiSuhu,
    required this.nilaiCRT,
    required this.nilaiObsigen,
  });

  EarlyWarningSystemModel copyWith({
    String? kategori,
    String? tingkatKesadaran,
    double? td,
    double? td2,
    double? nadi,
    double? pernapasan,
    String? reaksiOtot,
    double? suhu,
    double? spo2,
    double? crt,
    double? skalaNyeri,
    String? obsigenTambahan,
    String? keterangan,
    double? totalSkor,
    double? nilaiKesadaran,
    double? nilaiNafas,
    double? nilaiNadi,
    double? nilaiTd,
    double? nilaiDarah,
    double? nilaiSuhu,
    double? nilaiCRT,
    double? nilaiObsigen,
  }) {
    return EarlyWarningSystemModel(
      kategori: kategori ?? this.kategori,
      tingkatKesadaran: tingkatKesadaran ?? this.tingkatKesadaran,
      td: td ?? this.td,
      td2: td2 ?? this.td2,
      nadi: nadi ?? this.nadi,
      pernapasan: pernapasan ?? this.pernapasan,
      reaksiOtot: reaksiOtot ?? this.reaksiOtot,
      suhu: suhu ?? this.suhu,
      spo2: spo2 ?? this.spo2,
      crt: crt ?? this.crt,
      skalaNyeri: skalaNyeri ?? this.skalaNyeri,
      obsigenTambahan: obsigenTambahan ?? this.obsigenTambahan,
      keterangan: keterangan ?? this.keterangan,
      totalSkor: totalSkor ?? this.totalSkor,
      nilaiKesadaran: nilaiKesadaran ?? this.nilaiKesadaran,
      nilaiNafas: nilaiNafas ?? this.nilaiNafas,
      nilaiNadi: nilaiNadi ?? this.nilaiNadi,
      nilaiTd: nilaiTd ?? this.nilaiTd,
      nilaiDarah: nilaiDarah ?? this.nilaiDarah,
      nilaiSuhu: nilaiSuhu ?? this.nilaiSuhu,
      nilaiCRT: nilaiCRT ?? this.nilaiCRT,
      nilaiObsigen: nilaiObsigen ?? this.nilaiObsigen,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kategori': kategori,
      'tingkatKesadaran': tingkatKesadaran,
      'td': td,
      'td2': td2,
      'nadi': nadi,
      'pernapasan': pernapasan,
      'reaksiOtot': reaksiOtot,
      'suhu': suhu,
      'spo2': spo2,
      'crt': crt,
      'skalaNyeri': skalaNyeri,
      'obsigenTambahan': obsigenTambahan,
      'keterangan': keterangan,
      'totalSkor': totalSkor,
      'nilaiKesadaran': nilaiKesadaran,
      'nilaiNafas': nilaiNafas,
      'nilaiNadi': nilaiNadi,
      'nilaiTd': nilaiTd,
      'nilaiDarah': nilaiDarah,
      'nilaiSuhu': nilaiSuhu,
      'nilaiCRT': nilaiCRT,
      'nilaiObsigen': nilaiObsigen,
    };
  }

  factory EarlyWarningSystemModel.fromMap(Map<String, dynamic> map) {
    return EarlyWarningSystemModel(
      kategori: map['kategori'] as String,
      tingkatKesadaran: map['tingkatKesadaran'] as String,
      td: map['td'] as double,
      td2: map['td2'] as double,
      nadi: map['nadi'] as double,
      pernapasan: map['pernapasan'] as double,
      reaksiOtot: map['reaksiOtot'] as String,
      suhu: map['suhu'] as double,
      spo2: map['spo2'] as double,
      crt: map['crt'] as double,
      skalaNyeri: map['skalaNyeri'] as double,
      obsigenTambahan: map['obsigenTambahan'] as String,
      keterangan: map['keterangan'] as String,
      totalSkor: map['totalSkor'] as double,
      nilaiKesadaran: map['nilaiKesadaran'] as double,
      nilaiNafas: map['nilaiNafas'] as double,
      nilaiNadi: map['nilaiNadi'] as double,
      nilaiTd: map['nilaiTd'] as double,
      nilaiDarah: map['nilaiDarah'] as double,
      nilaiSuhu: map['nilaiSuhu'] as double,
      nilaiCRT: map['nilaiCRT'] as double,
      nilaiObsigen: map['nilaiObsigen'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory EarlyWarningSystemModel.fromJson(String source) =>
      EarlyWarningSystemModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
