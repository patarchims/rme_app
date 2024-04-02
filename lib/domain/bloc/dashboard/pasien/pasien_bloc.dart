import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/di/injection.dart';
import 'package:hms_app/domain/models/response/list_antrean_model_response.dart';
import 'package:hms_app/domain/models/subjective/skrining_model.dart';
import 'package:hms_app/domain/models/users/detail_profil_pasien_model.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/repository/librari/librari_repository.dart';
import 'package:hms_app/domain/repository/soap/soap_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../models/asesment_keb_edukasi/assement_keb_edu.dart';
import '../../../models/asesment_keb_edukasi/assement_rawat_jalan_dokter_model.dart';

part 'pasien_event.dart';
part 'pasien_state.dart';
part 'pasien_bloc.freezed.dart';

@injectable
class PasienBloc extends Bloc<PasienEvent, PasienState> {
  SoapRepository soapRepository;
  PasienBloc(this.soapRepository) : super(PasienState.initial()) {
    on<PasienEvent>((event, emit) => _onEventChanged(event, emit));
  }

  Future<void> _onEventChanged(
      PasienEvent event, Emitter<PasienState> emit) async {
    await event.maybeMap(
        orElse: () {},
        addRiwayatPasien: (e) {
          emit(state.copyWith(detailProfilPasienModel: e.detailProfilePasien));
        },
        riwayatPasien: (e) async {
          // RIWAYAT PASIEN
          emit(state.copyWith(
              getDetailPasien: none(), loadingDetailRiwayatPasien: true));

          final data =
              await soapRepository.getRiwayatDetailPasien(noRM: e.noRM);

          await Future.delayed(const Duration(seconds: 2));

          emit(state.copyWith(
              getDetailPasien: optionOf(data),
              loadingDetailRiwayatPasien: false));
        },
        uploadOdontogram: (e) {},
        saveStateSkrining: (value) {
          emit(state.copyWith(skriningModel: value.skrining));
        },
        selectedPasien: (value) {
          emit(state.copyWith(selectedPasien: value.pasien));
        },
        saveRawatJalanDokter: (e) async {
          emit(state.copyWith(saveResult: none(), loading: true));
          final getJalanDokter = await soapRepository.saveRawatJalanDokter(
              assementRawatJalanModel: e.assementRawatJalanModel);
          emit(state.copyWith(saveResult: optionOf(getJalanDokter)));
          emit(state.copyWith(saveResult: none(), loading: false));
        },
        // ==== //
        publishOdontogram: (e) async {
          emit(state.copyWith(saveOdontogram: none(), loading: true));
          final getJalanDokter = await soapRepository.publishOdontogram(
              noReg: e.noReg, kdBagian: e.kdBagian, picturePath: e.picturePath);
          emit(state.copyWith(saveOdontogram: optionOf(getJalanDokter)));
          emit(state.copyWith(saveOdontogram: none(), loading: false));
        },
        getAssmentRawatjalanDokter: (e) async {
          emit(state.copyWith(getResult: none()));
          final getJalanDokter =
              await soapRepository.getAssesRawatJalanDokter(noReg: e.noReg);
          emit(state.copyWith(getResult: optionOf(getJalanDokter)));
          emit(state.copyWith(getResult: none()));
        },
        saveAssesKebEdukasi: (e) async {
          emit(state.copyWith(saveResult: none(), loading: true));
          final saveEdukasi = await soapRepository.saveAssesKebEdukasi(
              assementKebEdukasiModel: e.assementKebEdukasiModel);

          emit(state.copyWith(saveResult: optionOf(saveEdukasi)));
          emit(state.copyWith(saveResult: none(), loading: false));
        },
        getKebEdukasi: (e) async {
          emit(state.copyWith(getResult: none()));
          final edukasi = await soapRepository.getKebEdukasi(noReg: e.noReg);
          emit(state.copyWith(getResult: optionOf(edukasi)));
        },
        getOdontogram: (e) async {
          final getOdontogram =
              await soapRepository.getOdontogram(noReg: e.noReg);
          emit(state.copyWith(getResult: optionOf(getOdontogram)));
          emit(state.copyWith(getResult: none()));
        },
        saveAsesRawatJalanPerawat: (e) async {
          emit(state.copyWith(loading: true, saveResult: none()));
          final getData = await soapRepository.saveAsesRawatJalanPerawat(
              riwayatObat: e.riwayatObat,
              riwayatObatDetail: e.riwayatObatDetail,
              aseskepHasilKajiRj: e.aseskepHasilKajiRj,
              aseskepHasilKajiRjDetail: e.aseskepHasilKajiRjDetail,
              aseskepHasilKajiRjTindakan: e.aseskepHasilKajiRjTindakan,
              aseskepNyeri: e.aseskepNyeri,
              aseskepPulang1: e.aseskepPulang1,
              aseskepPulang1Detail: e.aseskepPulang1Detail,
              aseskepPulang2: e.aseskepPulang2,
              aseskepPulang2Detail: e.aseskepPulang2Detail,
              aseskepPulang3: e.aseskepPulang3,
              aseskepPulang3Detail: e.aseskepPulang3Detail,
              aseskepRj1: e.aseskepRj1,
              aseskepRj2: e.aseskepRj2,
              fungsionalDetail: e.fungsionalDetail,
              psikologisDetail: e.psikologisDetail,
              kdBagian: e.kdBagian,
              noReg: e.noReg,
              kelUtama: e.kelUtama,
              riwayatPenyakit: e.riwayatPenyakit,
              riwayatPenyakitDetail: e.riwayatPenyakitDetail,
              riwayatSaatDirumah: e.riwayatSaatDirumah,
              tekananDarah: e.tekananDarah,
              nadi: e.nadi,
              suhu: e.suhu,
              pernapasan: e.pernapasan,
              beratBadan: e.beratBadan,
              tinggiBadan: e.tinggiBadan,
              skriningNyeri: e.skriningNyeri,
              psikologis: e.psikologis,
              fungsional: e.fungsional,
              perencanaanPemulangan: e.perencanaanPemulangan,
              masalahKeperawatan: e.masalahKeperawatan,
              rencanaKeperawatan: e.rencanaKeperawatan);

          emit(state.copyWith(loading: false, saveResult: optionOf(getData)));
          emit(state.copyWith(loading: false, saveResult: none()));
        },
        getAssesRawatJalanPerawat: (e) async {
          emit(state.copyWith(getResult: none(), loadingGetData: true));
          final fetAssesRawatJalanPerawat =
              await soapRepository.getAssesRawatJalanPerawat(noReg: e.noReg);

          emit(state.copyWith(getResult: optionOf(fetAssesRawatJalanPerawat)));
          emit(state.copyWith(getResult: none()));
          emit(state.copyWith(getResult: none(), loadingGetData: false));
        },
        deleteOdontogram: (e) async {
          final deleteOdontogram = await soapRepository.deleteOdontogram(
              noReg: e.noReg, noGigi: e.noGigi);

          emit(state.copyWith(skriningResult: optionOf(deleteOdontogram)));
          emit(state.copyWith(skriningResult: none()));
        },
        saveOdontogram: (e) async {
          emit(state.copyWith(skriningResult: none()));

          final saveOdontogram = await soapRepository.saveOdontogram(
              noReg: e.noReg, noGigi: e.noGigi, keterangan: e.keterangan);

          emit(state.copyWith(skriningResult: optionOf(saveOdontogram)));

          emit(state.copyWith(skriningResult: none()));
        },
        getSkrining: (value) async {
          emit(state.copyWith(
              loadingGetSkrining: true, getSkriningResult: none()));

          final getSkrining =
              await soapRepository.getSkrining(noReg: value.noReg);

          emit(state.copyWith(
              getSkriningResult: optionOf(getSkrining),
              loadingGetSkrining: false));

          emit(state.copyWith(getSkriningResult: none()));
        },
        saveSkrining: (value) async {
          emit(
            state.copyWith(loadingSkrining: true, skriningResult: none()),
          );

          final skrining = await soapRepository.saveSkrining(
              kdBagian: value.kdBagian,
              noReg: value.noReg,
              k1: value.k1,
              k2: value.k2,
              k3: value.k3,
              k4: value.k4,
              k5: value.k5,
              k6: value.k6,
              kF1: value.kF1,
              kF2: value.kF2,
              kF3: value.kF3,
              kF4: value.kF4,
              b1: value.b1,
              b2: value.b2,
              rJ: value.rJ,
              iV1: value.iV1,
              iV2: value.iV2,
              iV3: value.iV3,
              iV4: value.iV4);

          emit(state.copyWith(
              skriningResult: optionOf(skrining), loadingSkrining: false));
          emit(state.copyWith(skriningResult: none(), loadingSkrining: false));
        },
        selectedNorm: (e) {
          emit(state.copyWith(normSelected: e.norm));
        },
        addLoadingAnatomi: (e) {
          emit(state.copyWith(loadigSaveAnatomi: e.enable));
        },
        addKeterangan: (e) {
          emit(state.copyWith(keterangan: e.keterangan));
        },
        simpanAnatomi: (e) async {
          emit(state.copyWith(failOrSuccessResultAnatomi: none()));

          final antomi = await soapRepository.simpanDataAnatomi(
              pictureFile: e.picturePath,
              nama: e.nama,
              norm: e.norm,
              keterangan: e.keterangan);

          emit(state.copyWith(
              failOrSuccessResultAnatomi: optionOf(antomi),
              loadigSaveAnatomi: false));
          emit(state.copyWith(failOrSuccessResultAnatomi: none()));
        },
        saveAnatomi: (e) async {
          emit(state.copyWith(
              failOrSuccessResultAnatomi: none(), loadigSaveAnatomi: true));
        },
        getKVitalSign: (e) async {
          emit(state.copyWith(kVitalSignResult: none()));
          final kVItalSign =
              await getIt<LibrariRepositori>().getAllKVitalSign();

          emit(state.copyWith(kVitalSignResult: optionOf(kVItalSign)));
        },
        getDetailPasien: (e) async {
          emit(state.copyWith(
              loadingDetailPasien: true, detailPasienResult: none()));

          final detailPasien =
              await getIt<LibrariRepositori>().getDetailPasien(noRM: e.noRM);

          emit(state.copyWith(
              loadingDetailPasien: false,
              detailPasienResult: optionOf(detailPasien)));
        },
        addPasien: (e) async {
          emit(state.copyWith(listPasienModel: e.antreanPasien));
        },
        getAntreanPasien: (e) async {
          emit(state.copyWith(
            loadingPasien: true,
            failOrSuccessResult: none(),
          ));
          final pasien =
              await getIt<LibrariRepositori>().getListAntreanPasien();
          emit(state.copyWith(
            loadingPasien: false,
            failOrSuccessResult: optionOf(pasien),
          ));
        });
  }
}
