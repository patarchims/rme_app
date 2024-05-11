import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/response/asesmen_keperawatan_bidan_model.dart';
import 'package:hms_app/domain/models/response/deskripsi_siki_model.dart';
import 'package:hms_app/domain/models/response/intervensi_model.dart';
import 'package:hms_app/domain/models/response/intervensi_selection_model.dart';
import 'package:hms_app/domain/models/response/sdki_model.dart';
import 'package:hms_app/domain/models/response/siki_model.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/repository/asesmen/asesmen_repository.dart';
import 'package:hms_app/domain/repository/soap/soap_repository.dart';
import 'package:injectable/injectable.dart';

part 'asesmen_keperawatan_bidan_event.dart';
part 'asesmen_keperawatan_bidan_state.dart';
part 'asesmen_keperawatan_bidan_bloc.freezed.dart';

@injectable
class AsesmenKeperawatanBidanBloc
    extends Bloc<AsesmenKeperawatanBidanEvent, AsesmenKeperawatanBidanState> {
  AsesmenRespository asesmenRespository;
  AsesmenKeperawatanBidanBloc(
    this.soapRepository,
    this.asesmenRespository,
  ) : super(const AsesmenKeperawatanBidanState()) {
    on<AsesmenKeperawatanBidanEvent>((event, emit) async {
      await event.maybeMap(
        selectionDeskripsi: (e) {},
        getDeskripsiAsuhan: (e) async {
          final data = await asesmenRespository.getDeskripsiSIKI(value: e.siki);
          data.fold(
              (l) => null,
              (r) => r.maybeMap(
                  orElse: () {},
                  loaded: (e) {
                    try {
                      List<DeskripsisSikiModel> data =
                          (e.value["response"] as Iterable)
                              .map((e) => DeskripsisSikiModel.fromJson(e))
                              .toList();

                      emit(state.copyWith(deskripsiSiki: data));
                    } catch (e) {
                      emit(state.copyWith(
                        deskripsiSiki: [],
                      ));
                    }

                    log(e.toString());
                  }));
        },
        emty: (e) async {
          // KOSONGKAN DATA
          emit(state.copyWith(
              isLoadingSaveAsesmenKeperawatan: false,
              saveResultAsesmenKeperawatan: none()));

          emit(state.copyWith(
              getfailOrSuccessResult: none(),
              getFailOrScuccessCariIntervensi: none(),
              getFailOrSuccessCariSiki: none(),
              getFailResultAsuhanKeperawatan: none(),
              getResultAsesmenKeperawatan: none(),
              getfailOrSuccessCariSDKI: none(),
              intervensiSelectionModel: [],
              isDiagnosa: false,
              isLoadingAsuhanKeperawatan: false,
              isLoadingCariSDKI: false,
              isLoadingGet: false,
              isLoadingGetAsesmenKeperawatan: false,
              isLoadingGetSIKI: false,
              isLoadingIntervensi: false,
              isLoadingSave: false,
              isLoadingSaveAsuhanKeperawatan: false,
              isLoadingSelectionSIKI: false,
              saveOrSuccessResult: none(),
              selectedKeluaran: "",
              saveResultAsuhanKeperawatan: none(),
              deskripsiSiki: [],
              intervesiModel: [],
              isLoadingSaveAsesmenKeperawatan: false,
              saveResultAsesmenKeperawatan: none()));
        },

        saveAsesmenKeperawatan: (e) async {
          // SAVE ASESMEN KEPERAWATAN BIDAN
          emit(state.copyWith(
              isLoadingSaveAsesmenKeperawatan: true,
              saveResultAsesmenKeperawatan: none()));

          // LAKUKAN SIMPAN DATA
          final data = await asesmenRespository.saveAsesmenKeperawatanBidan(
              asesmenKeperawatanBidanModel: e.asesmenKeperawatanBidanModel);

          emit(state.copyWith(
              isLoadingSaveAsesmenKeperawatan: false,
              saveResultAsesmenKeperawatan: optionOf(data)));

          emit(state.copyWith(
              isLoadingSaveAsesmenKeperawatan: false,
              saveResultAsesmenKeperawatan: none()));
        },
        getAsesmenKeperawatan: (e) async {
          // GET ASESMEN KEPERAWATAN
          emit(state.copyWith(
              isLoadingGetAsesmenKeperawatan: true,
              getResultAsesmenKeperawatan: none()));

          // AMBIL KAN DATA
          final data = await asesmenRespository.getAsesmenKeperawatanBidan(
              noReg: e.noReg);

          emit(state.copyWith(
              isLoadingGetAsesmenKeperawatan: false,
              getResultAsesmenKeperawatan: optionOf(data)));

          emit(state.copyWith(
              isLoadingGetAsesmenKeperawatan: false,
              getResultAsesmenKeperawatan: none()));
          //
        },
        // SIMPAN DATA ASUHAN KEPERAWATAN
        saveAsuhanKeperawatan: (e) async {
          emit(state.copyWith(
              isLoadingAsuhanKeperawatan: true,
              saveResultAsuhanKeperawatan: none()));

          final data = await asesmenRespository.saveAsuhanKeperawatan(
              noReg: e.noReg,
              intervesiModel: state.intervesiModel,
              sdki: state.sdkiModel != null ? state.sdkiModel!.kode : "",
              siki:
                  state.selectionSIKI != null ? state.selectionSIKI!.kode : "");

          emit(state.copyWith(
              isLoadingAsuhanKeperawatan: false,
              saveResultAsuhanKeperawatan: optionOf(data)));

          emit(state.copyWith(
              isLoadingAsuhanKeperawatan: false,
              saveResultAsuhanKeperawatan: none()));
        },
        getAsuhanKeperawatanNew: (e) async {
          // GET ASUHAN KEPERAWATAN NEW
          emit(state.copyWith(
              // DIAGNOSA SUDAH DITAMPILKAN JIKA ADA,
              isLoadingAsuhanKeperawatan: true,
              getFailResultAsuhanKeperawatan: none()));

          // ======= GET DATA
          final data = await asesmenRespository.getAsuhanKeperawatanBidan(
              noReg: e.noReg);

          await Future.delayed(const Duration(seconds: 1));

          emit(state.copyWith(
              isLoadingAsuhanKeperawatan: false,
              getFailResultAsuhanKeperawatan: optionOf(data)));
        },
        isDiagnosaAvailable: (e) {
          // TAMPILKAN DIAGNOSA
          emit(state.copyWith(isDiagnosa: e.isDiagnosa));
        },
        getAsuhanKeperawatan: (e) async {
          // LOADING GET DATA // DIAGNOSA SUDAH DITAMPILKAN JIKA ADA,
          emit(state.copyWith(
              isLoadingAsuhanKeperawatan: true,
              getFailResultAsuhanKeperawatan: none()));

          // ======= GET DATA
          final data =
              await soapRepository.getAsuhanKeperawatan(noReg: e.value);

          await Future.delayed(const Duration(seconds: 1));

          emit(state.copyWith(
              isLoadingAsuhanKeperawatan: false,
              getFailResultAsuhanKeperawatan: optionOf(data)));
        },
        copyWriteIntervensi: (e) {
          List<IntervensiModel> oldData = state.intervesiModel;

          for (var innerList in oldData) {
            log("old judul : ${innerList.ekspetasi}");
            for (var innerData in innerList.slki) {
              log('old ID: ${innerData.noUrut}, old Name: ${innerData.judul}  old Select Number: ${innerData.selectedNumber}');
            }
          }

          List<IntervensiModel> newData = state.intervesiModel.map((value) {
            if (value.kode == e.slki.kode) {
              return value.copyWith(
                  slki: value.slki.map((sl) {
                if (sl.noUrut == e.slki.noUrut) {
                  return sl.copyWith(selectedNumber: e.slki.selectedNumber);
                }
                return sl;
              }).toList());
            } else {
              return value;
            }
          }).toList();

          emit(state.copyWith(intervesiModel: newData));

          for (var innerList in state.intervesiModel) {
            log("judul : ${innerList.ekspetasi}");
            for (var innerData in innerList.slki) {
              log('ID: ${innerData.noUrut}, Name: ${innerData.judul}  Select Number: ${innerData.selectedNumber}');
            }
          }
        },
        addIntervensiModel: (e) {
          emit(state.copyWith(intervesiModel: e.intervensi));
        },
        started: (e) {
          // BERSIHKAN KEADAAN
          emit(state.copyWith(
              intervensiSelectionModel: [],
              intervesiModel: [],
              selectionSIKI: null,
              pilihDiagnosaKeperawatan: PilihDiagnosaKeperawatan.diagnosa,
              selectedKeluaran: ""));
        },

        selectIntervensi: (e) {
          // TAMBAHKAN INTERVENSI SELECTION
          emit(state.copyWith(
              intervensiSelectionModel: e.listIntervensiSelectionModel));
        },
        clearIntervensi: (e) {
          emit(state.copyWith(
              intervensiSelectionModel: [],
              getFailResultAsuhanKeperawatan: optionOf(left(
                  const ApiFailureResult.failure(
                      meta: MetaModel(code: 201, message: "")))),
              selectionSIKI: null,
              isDiagnosa: false,
              intervesiModel: []));
        },

        pilihIntervensi: (e) {
          final data = IntervensiSelectionModel(
            selectionNumber: e.number,
            slki: e.slki,
          );

          emit(state.copyWith(
              intervensiSelectionModel: List.of(state.intervensiSelectionModel)
                ..add(data)));
        },
        selectionSIKI: (e) async {
          emit(state.copyWith(isLoadingSelectionSIKI: false));

          emit(state.copyWith(selectionSIKI: e.sikiModel));
          emit(state.copyWith(isLoadingSelectionSIKI: true));
          await Future.delayed(const Duration(seconds: 1));
          emit(state.copyWith(isLoadingSelectionSIKI: false));
        },
        //
        selectSDKI: (e) {
          emit(state.copyWith(sdkiModel: e.sdkiModel));
        },

        cariSIKI: (e) async {
          // LOADING DATA
          emit(state.copyWith(
              isLoadingCariSDKI: true, getFailOrSuccessCariSiki: none()));
          // ==> GET DATA
          final data = await soapRepository.cariSIKI(value: e.sikiSelected);

          emit(state.copyWith(
              isLoadingCariSDKI: false,
              getFailOrSuccessCariSiki: optionOf(data)));
          // GET DATA
        },
        pilihDiagnosa: (e) {
          emit(state.copyWith(
              pilihDiagnosaKeperawatan: e.pilihDiagnosaKeperawatan));
        },
        selectedKeluaran: (e) {
          // SELECTED KELUARAN
          emit(state.copyWith(selectedKeluaran: e.value));
        },
        cariIntervensi: (e) async {
          // SELECTED KELUARAN
          emit(state.copyWith(
              isLoadingIntervensi: true,
              getFailOrScuccessCariIntervensi: none()));

          final data = await soapRepository.getSLKI(value: e.value);

          data.fold(
              (l) => l.maybeMap(orElse: () {
                    emit(state.copyWith(
                        isLoadingIntervensi: false,
                        intervesiModel: [],
                        getFailOrScuccessCariIntervensi: const None()));
                  }),
              (r) => r.maybeMap(orElse: () {
                    emit(state.copyWith(
                        isLoadingIntervensi: false,
                        intervesiModel: [],
                        getFailOrScuccessCariIntervensi: const None()));
                  }, loaded: (e) {
                    // PARSING DATA SLKI

                    try {
                      List<IntervensiModel> data =
                          (e.value["response"] as Iterable)
                              .map((e) => IntervensiModel.fromJson(e))
                              .toList();

                      emit(state.copyWith(
                          isLoadingIntervensi: false,
                          intervesiModel: data,
                          getFailOrScuccessCariIntervensi: const None()));
                    } catch (e) {
                      emit(state.copyWith(
                          isLoadingIntervensi: false,
                          intervesiModel: [],
                          getFailOrScuccessCariIntervensi: const None()));
                    }
                  }));

          // ====
        },
        cariSDKI: (e) async {
          emit(state.copyWith(
              isLoadingCariSDKI: true, getfailOrSuccessCariSDKI: none()));

          // ====== || =====
          final data = await soapRepository.cariSDKI(value: e.value);

          // CARI DATA
          emit(state.copyWith(
              isLoadingCariSDKI: false,
              getfailOrSuccessCariSDKI: optionOf(data)));
        },
        getData: (e) async {
          emit(state.copyWith(
              isLoadingGet: true, getfailOrSuccessResult: none()));
          final getData =
              await soapRepository.getAsesmedKeperawatanBidan(noReg: e.noReg);

          emit(state.copyWith(
              isLoadingGet: true, getfailOrSuccessResult: optionOf(getData)));

          emit(state.copyWith(
              isLoadingGet: true, getfailOrSuccessResult: none()));
        },

        saveData: (e) async {
          emit(
              state.copyWith(isLoadingSave: true, saveOrSuccessResult: none()));

          final data = await soapRepository.simpanAsesmenKeperawatanBidan(
              sdki: state.sdkiModel != null ? state.sdkiModel!.kode : "",
              siki:
                  state.selectionSIKI != null ? state.selectionSIKI!.kode : "",
              asesmenKeperawatanBidanModel: e.asesmenKeperawatanBidanModel,
              intervesiModel: state.intervesiModel);

          emit(state.copyWith(
              isLoadingSave: false, saveOrSuccessResult: optionOf(data)));

          emit(state.copyWith(
              isLoadingSave: false, saveOrSuccessResult: none()));
        },
        orElse: () {},
      );
    });
  }

  final SoapRepository soapRepository;
}
