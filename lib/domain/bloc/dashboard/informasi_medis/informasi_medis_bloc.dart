import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/models/lib_model/bank_data_model.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/soap/medis/informasi_medis_model.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/repository/soap/soap_repository.dart';
import 'package:hms_app/domain/services/anamnesa_services.dart';
import 'package:hms_app/domain/services/informasi_medis_service.dart';
import 'package:injectable/injectable.dart';

part 'informasi_medis_event.dart';
part 'informasi_medis_state.dart';
part 'informasi_medis_bloc.freezed.dart';

@injectable
class InformasiMedisBloc
    extends Bloc<InformasiMedisEvent, InformasiMedisState> {
  SoapRepository soapRepository;
  InformasiMedisBloc(this.soapRepository) : super(const InformasiMedisState()) {
    on<InformasiMedisEvent>(_onEventChanged);
  }

  Future<void> _onEventChanged(
      InformasiMedisEvent event, Emitter<InformasiMedisState> emit) async {
    await event.maybeMap(
      orElse: () {},
      saveMedis: (e) async {
        emit(state.copyWith(isLoading: true, failOrSuccessResult: none()));
        final data = await soapRepository.saveInformasiMedis(
            noReg: e.noReg,
            kdBagian: e.kdBagian,
            masalahMedis: e.masalahMedis,
            terapi: e.terapi,
            pemeriksaanFisik: e.pemeriksaanFisik,
            anjuran: e.anjuran);

        emit(state.copyWith(
            isLoading: false, failOrSuccessResult: optionOf(data)));
        emit(state.copyWith(isLoading: false, failOrSuccessResult: none()));
      },
      selectedAnjuran: (e) {
        emit(state.copyWith(selectAnjuran: e.value));
      },
      selectedPemeriksaanFisik: (e) {
        emit(state.copyWith(selectPemeriksaanFisik: e.value));
      },
      getInformasiMedis: (e) async {
        try {
          emit(state.copyWith(isLoading: true));
          final data = await informasiMedisService.getData(
              kdBagian: e.kdBagian, noReg: e.noReg);

          MetaModel meta = MetaModel.fromJson(data["metadata"]);

          if (meta.code == 200) {
            InformasiMedisModel kel =
                InformasiMedisModel.fromJson(data["response"]);

            emit(state.copyWith(
              selectAnjuran: kel.anjuran,
              selectMasalahMedis: kel.masalahMedis,
              selectPemeriksaanFisik: kel.fisik,
              selectTerapi: kel.terapi,
            ));
          }

          emit(state.copyWith(isLoading: false));
        } catch (e) {
          emit(state.copyWith(isLoading: false));
        }
      },
      // SIMPAN DATA INFORMASI MEDIS
      saveInformasiMedis: (e) async {
        try {
          emit(
              state.copyWith(isLoading: true, isSave: false, isFailure: false));

          final data = await informasiMedisService.saveData(
              anjuran: e.anjuran,
              kdBagian: e.kdBagian,
              masalahMedis: e.masalahMedis,
              noReg: e.noReg,
              pemeriksaanFisik: e.pemeriksaanFisik,
              terapi: e.terapi);

          MetaModel meta = MetaModel.fromJson(data["metadata"]);

          if (meta.code == 200) {
            InformasiMedisModel kel =
                InformasiMedisModel.fromJson(data["response"]);

            emit(state.copyWith(
              selectAnjuran: kel.anjuran,
              selectMasalahMedis: kel.masalahMedis,
              selectPemeriksaanFisik: kel.fisik,
              isSave: false,
              isFailure: false,
              metaModel: meta,
              selectTerapi: kel.terapi,
            ));

            emit(state.copyWith(
              isLoading: false,
              isSave: false,
              isFailure: true,
            ));
          }

          if (meta.code != 200) {
            emit(state.copyWith(
              isLoading: false,
              isSave: false,
              isFailure: true,
              metaModel: meta,
            ));
          }
        } catch (e) {
          emit(
              state.copyWith(isLoading: false, isSave: false, isFailure: true));
          emit(state.copyWith(
              isLoading: false, isSave: false, isFailure: false));
        }
      },
      getMasalahMedis: (e) async {
        try {
          emit(state.copyWith(isLoading: true, metaModel: null));
          final data = await anamnesaService.getBankData("masalah_medis");

          MetaModel meta = MetaModel.fromJson(data["metadata"]);

          if (meta.code == 200) {
            List<BankDataModel> kel = (data["response"] as Iterable)
                .map((e) => BankDataModel.fromMap(e))
                .toList();
            emit(state.copyWith(masalahMedis: kel, isLoading: false));
          }
          emit(state.copyWith(isLoading: false));
        } catch (e) {
          emit(state.copyWith(isLoading: false, masalahMedis: []));
        }
      },
      getTerapi: (e) async {
        try {
          emit(state.copyWith(isLoading: true));
          final data = await anamnesaService.getBankData("terapi");
          MetaModel meta = MetaModel.fromJson(data["metadata"]);

          if (meta.code == 200) {
            List<BankDataModel> kel = (data["response"] as Iterable)
                .map((e) => BankDataModel.fromMap(e))
                .toList();

            emit(state.copyWith(terapi: kel, isLoading: false));
          }
          emit(state.copyWith(isLoading: false));
        } catch (e) {
          emit(state.copyWith(isLoading: false, terapi: []));
        }
      },
      selectedMasalahMedis: (e) {
        emit(state.copyWith(selectMasalahMedis: e.value));
      },
      selectedTerapi: (e) {
        emit(state.copyWith(selectTerapi: e.value));
      },
    );
  }
}
