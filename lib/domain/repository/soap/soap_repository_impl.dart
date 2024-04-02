import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:hms_app/core/api/api_db.dart';
import 'package:hms_app/di/injection.dart';
import 'package:hms_app/domain/models/asesment_keb_edukasi/assement_keb_edu.dart';
import 'package:hms_app/domain/models/asesment_keb_edukasi/assement_rawat_jalan_dokter_model.dart';
import 'package:hms_app/domain/models/dto/dto.dart';
import 'package:hms_app/domain/models/meta/meta_model.dart';
import 'package:hms_app/domain/models/response/asesmen_keperawatan_bidan_model.dart';
import 'package:hms_app/domain/models/response/input_detail_pemeriksaan_labor_model.dart';
import 'package:hms_app/domain/models/response/input_detail_pemeriksaan_penunjang_model.dart';
import 'package:hms_app/domain/models/response/input_penunjang_model.dart';
import 'package:hms_app/domain/models/response/intervensi_model.dart';
import 'package:hms_app/domain/models/response/skala/skala_nyeri_model.dart';
import 'package:hms_app/domain/models/soap/medis/anamnesa_igd_model.dart';
import 'package:hms_app/domain/models/soap/medis/data_intra_oral_model.dart';
import 'package:hms_app/domain/models/soap/medis/pemeriksaan_fisik_model.dart';
import 'package:hms_app/domain/models/token/token_pref.dart';
import 'package:hms_app/domain/models/triase/triase_model.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/network/endpoints.dart';
import 'package:hms_app/domain/network/my_dio.dart';
import 'package:hms_app/domain/repository/soap/soap_repository.dart';
import 'package:http/src/multipart_request.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@LazySingleton(as: SoapRepository)
class SoapRepositoryImpl extends SoapRepository {
  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveAnatomi({
    required String picturePath,
    MultipartRequest? request,
    required String nama,
    required String norm,
    required String keterangan,
  }) {
    return getIt<MyDio>().saveAnatomi(
      keterangan: keterangan,
      nama: nama,
      norm: norm,
      picturePath: picturePath,
      endPoint: EndPoint.saveAnatomi,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> simpanDataAnatomi({
    required File pictureFile,
    MultipartRequest? request,
    required String nama,
    required String norm,
    required String keterangan,
  }) async {
    try {
      String url = ApiDb.baseUrl + EndPoint.saveAnatomi;
      var uri = Uri.parse(url);

      final currentToken = await TokenPref.getCurrentToken();

      var multipartFile =
          await http.MultipartFile.fromPath('imageUrl', pictureFile.path);

      var field = {"nama": nama, "norm": norm, "keterangan": keterangan};

      request ??= http.MultipartRequest("POST", uri)
        ..headers["Content-Type"] = "application/json"
        ..headers["x-token"] = currentToken!.token!;

      request.files.add(multipartFile);
      request.fields.addAll(field);
      //  LAKUKAN REQUEST

      var response = await request.send();

      switch (response.statusCode) {
        case 200:
          String responseBody = await response.stream.bytesToString();
          var data = jsonDecode(responseBody);
          return right(ApiSuccessResult.loaded(value: data));
        case 202:
          String responseBody = await response.stream.bytesToString();
          var data = jsonDecode(responseBody);
          return left(ApiFailureResult.unProccessable(value: data));
        case 201:
          var responseBody = await response.stream.bytesToString();
          var data = jsonDecode(responseBody);
          MetaModel meta = MetaModel.fromJson(data["metadata"]);
          return left(ApiFailureResult.failure(meta: meta));
        default:
          return left(const ApiFailureResult.failure(
              meta: MetaModel(code: 201, message: "Data gagal disimpan")));
      }
    } catch (e) {
      return left(ApiFailureResult.failure(
          meta: MetaModel(code: 201, message: e.toString())));
    }
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveSkrining(
      {required String kdBagian,
      required String noReg,
      required String k1,
      required String k2,
      required String k3,
      required String k4,
      required String k5,
      required String k6,
      required String kF1,
      required String kF2,
      required String kF3,
      required String kF4,
      required String b1,
      required String b2,
      required String rJ,
      required String iV1,
      required String iV2,
      required String iV3,
      required String iV4}) {
    return getIt<MyDio>().postDataWithToken(
      data: DTO.skrining(
          kdBagian: kdBagian,
          noReg: noReg,
          k1: k1,
          k2: k2,
          k3: k3,
          k4: k4,
          k5: k5,
          k6: k6,
          kF1: kF1,
          kF2: kF2,
          kF3: kF3,
          kF4: kF4,
          b1: b1,
          b2: b2,
          rJ: rJ,
          iV1: iV1,
          iV2: iV2,
          iV3: iV3,
          iV4: iV4),
      endPoint: EndPoint.saveSkrining,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getSkrining(
      {required String noReg}) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.getSkrining, data: DTO.getSkrining(noReg: noReg));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveOdontogram(
      {required String noReg,
      required String noGigi,
      required String keterangan}) async {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.saveOdontogram,
        data: DTO.saveOdontogram(
            noReg: noReg, noGigi: noGigi, keterangan: keterangan));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> deleteOdontogram(
      {required String noReg, required String noGigi}) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.deleteOdontogram,
        data: DTO.deleteOdontogram(noReg: noReg, noGigi: noGigi));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveAsesRawatJalanPerawat({
    required String kdBagian,
    required String noReg,
    required String kelUtama,
    required String riwayatPenyakit,
    required String riwayatSaatDirumah,
    required String riwayatObat,
    required String riwayatObatDetail,
    required String tekananDarah,
    required String nadi,
    required String suhu,
    required String pernapasan,
    required String beratBadan,
    required String tinggiBadan,
    required String skriningNyeri,
    required String psikologis,
    required String fungsional,
    required String perencanaanPemulangan,
    required String masalahKeperawatan,
    required String rencanaKeperawatan,
    required String aseskepHasilKajiRj,
    required String aseskepHasilKajiRjDetail,
    required String aseskepHasilKajiRjTindakan,
    required String aseskepNyeri,
    required String aseskepPulang1,
    required String aseskepPulang1Detail,
    required String aseskepPulang2,
    required String aseskepPulang2Detail,
    required String aseskepPulang3,
    required String aseskepPulang3Detail,
    required String aseskepRj1,
    required String aseskepRj2,
    required String fungsionalDetail,
    required String psikologisDetail,
    required String riwayatPenyakitDetail,
  }) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.saveAsesRawatJalanPerawat,
        data: DTO.saveAsesRawatJalanPerawat(
            riwayatObat: riwayatObat,
            riwayatObatDetail: riwayatObatDetail,
            aseskepHasilKajiRj: aseskepHasilKajiRj,
            aseskepHasilKajiRjDetail: aseskepHasilKajiRjDetail,
            aseskepHasilKajiRjTindakan: aseskepHasilKajiRjTindakan,
            aseskepNyeri: aseskepNyeri,
            aseskepPulang1: aseskepPulang1,
            aseskepPulang1Detail: aseskepPulang1Detail,
            aseskepPulang2: aseskepPulang2,
            aseskepPulang2Detail: aseskepPulang2Detail,
            aseskepPulang3: aseskepPulang3,
            aseskepPulang3Detail: aseskepPulang3Detail,
            aseskepRj1: aseskepRj1,
            aseskepRj2: aseskepRj2,
            fungsionalDetail: fungsionalDetail,
            psikologisDetail: psikologisDetail,
            kdBagian: kdBagian,
            noReg: noReg,
            kelUtama: kelUtama,
            riwayatPenyakit: riwayatPenyakit,
            riwayatPenyakitDetail: riwayatPenyakitDetail,
            riwayatSaatDirumah: riwayatSaatDirumah,
            tekananDarah: tekananDarah,
            nadi: nadi,
            suhu: suhu,
            pernapasan: pernapasan,
            beratBadan: beratBadan,
            tinggiBadan: tinggiBadan,
            skriningNyeri: skriningNyeri,
            psikologis: psikologis,
            fungsional: fungsional,
            perencanaanPemulangan: perencanaanPemulangan,
            masalahKeperawatan: masalahKeperawatan,
            rencanaKeperawatan: rencanaKeperawatan));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getAssesRawatJalanPerawat(
      {required String noReg}) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.getAsesRawatJalanPerawat,
        data: DTO.getData(noReg: noReg));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getOdontogram(
      {required String noReg}) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.listOdontogram, data: DTO.getData(noReg: noReg));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getKebEdukasi(
      {required String noReg}) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.getKebEdukasi, data: DTO.getData(noReg: noReg));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveAssesKebEdukasi(
      {required AssementKebEdukasiModel assementKebEdukasiModel}) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.saveKebEdukasi,
        data: assementKebEdukasiModel.toMap());
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getAssesRawatJalanDokter({
    required String noReg,
  }) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.getRawatJalanDokter,
        data: DTO.getData(noReg: noReg));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> publishOdontogram(
      {required String noReg,
      required String picturePath,
      MultipartRequest? request,
      required String kdBagian}) async {
    try {
      String url = ApiDb.baseUrl + EndPoint.publishOdontogram;
      var uri = Uri.parse(url);

      final currentToken = await TokenPref.getCurrentToken();

      var multipartFile =
          await http.MultipartFile.fromPath('imageUrl', picturePath);

      var field = {
        "noReg": noReg,
        "kdBagian": kdBagian,
      };

      request ??= http.MultipartRequest("POST", uri)
        ..headers["Content-Type"] = "application/json"
        ..headers["x-token"] = currentToken!.token!;

      request.files.add(multipartFile);
      request.fields.addAll(field);

      var response = await request.send();

      switch (response.statusCode) {
        case 200:
          String responseBody = await response.stream.bytesToString();
          var data = jsonDecode(responseBody);
          return right(ApiSuccessResult.loaded(value: data));
        case 202:
          String responseBody = await response.stream.bytesToString();
          var data = jsonDecode(responseBody);
          return left(ApiFailureResult.unProccessable(value: data));
        case 201:
          var responseBody = await response.stream.bytesToString();
          var data = jsonDecode(responseBody);
          MetaModel meta = MetaModel.fromJson(data["metadata"]);
          return left(ApiFailureResult.failure(meta: meta));
        default:
          return left(const ApiFailureResult.failure(
              meta: MetaModel(code: 201, message: "Data gagal disimpan")));
      }
    } catch (e) {
      return left(ApiFailureResult.failure(
          meta: MetaModel(code: 201, message: e.toString())));
    }
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveRawatJalanDokter(
      {required AssementRawatJalanModel assementRawatJalanModel}) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.svaeRawatJalanDokter,
        data: assementRawatJalanModel.toMap());
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> skriningReport() {
    throw UnimplementedError();
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveInformasiMedis(
      {required String noReg,
      required String kdBagian,
      required String masalahMedis,
      required String terapi,
      required String pemeriksaanFisik,
      required String anjuran}) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.informasiMedis,
        data: DTO.saveInformasiMedis(
            noReg: noReg,
            kdBagian: kdBagian,
            masalahMedis: masalahMedis,
            terapi: terapi,
            pemeriksaanFisik: pemeriksaanFisik,
            anjuran: anjuran));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> uploadOdontogram({
    required String noReg,
    required String picturePath,
    MultipartRequest? request,
  }) async {
    try {
      String url = ApiDb.baseUrl + EndPoint.odontogram;
      var uri = Uri.parse(url);

      final currentToken = await TokenPref.getCurrentToken();

      var multipartFile =
          await http.MultipartFile.fromPath('imageUrl', picturePath);

      var field = {"noReg": noReg};

      request ??= http.MultipartRequest("POST", uri)
        ..headers["Content-Type"] = "application/json"
        ..headers["x-token"] = currentToken!.token!;

      request.files.add(multipartFile);
      request.fields.addAll(field);

      var response = await request.send();

      switch (response.statusCode) {
        case 200:
          String responseBody = await response.stream.bytesToString();
          var data = jsonDecode(responseBody);
          return right(ApiSuccessResult.loaded(value: data));
        case 202:
          String responseBody = await response.stream.bytesToString();
          var data = jsonDecode(responseBody);
          return left(ApiFailureResult.unProccessable(value: data));
        case 201:
          var responseBody = await response.stream.bytesToString();
          var data = jsonDecode(responseBody);
          MetaModel meta = MetaModel.fromJson(data["metadata"]);
          return left(ApiFailureResult.failure(meta: meta));
        default:
          return left(const ApiFailureResult.failure(
              meta: MetaModel(code: 201, message: "Data gagal disimpan")));
      }
    } catch (e) {
      return left(ApiFailureResult.failure(
          meta: MetaModel(code: 201, message: e.toString())));
    }
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveDataIntraOral(
      {required DataIntraOralModel dataIntraOralModel}) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.dataIntraOral, data: dataIntraOralModel.toMap());
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getDataIntraOral(
      {required String noReg}) {
    return getIt<MyDio>().getDataWithToken(
        endPoint: EndPoint.dataIntraOral, data: DTO.getNoreg(noReg: noReg));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getRiwayatDetailPasien(
      {required String noRM}) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.historyPasien, data: DTO.noRM(noRM: noRM));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveTriase(
      {required TriaseModel triaseModel}) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.triase, data: triaseModel.toJson());
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getTriase(
      {required String noReg}) {
    return getIt<MyDio>().getDataWithToken(
        endPoint: EndPoint.triase, data: DTO.getNoreg(noReg: noReg));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getStatusLokalis(
      {required String noReg}) {
    return getIt<MyDio>().getDataWithToken(
        endPoint: EndPoint.lokalis, data: DTO.getNoreg(noReg: noReg));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveStatusLokalis({
    required String noReg,
    required String imageURL,
    required String person,
    required String userID,
    required String deviceID,
    required String pelayanan,
  }) async {
    return getIt<MyDio>().formData(
        endPoint: EndPoint.lokalis,
        data: await DTO.saveImageLokalis(
            noReg: noReg,
            picturePath: imageURL,
            deviceID: deviceID,
            pelayanan: pelayanan,
            person: person,
            userID: userID));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getAnamnesaIGD(
      {required String noReg}) {
    return getIt<MyDio>().getDataWithToken(
        endPoint: EndPoint.anamnesaIGD, data: DTO.getNoreg(noReg: noReg));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveAnamnesaIGD({
    required AnamnesaIgdModel anamnesaIgdModel,
    required String person,
    required String userID,
    required String deviceID,
    required String pelayanan,
  }) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.anamnesaIGD,
        data: anamnesaIgdModel.toJson(
            deviceID: deviceID,
            pelayanan: pelayanan,
            person: person,
            userID: userID));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getPemeriksaanFisik(
      {required String noReg}) {
    return getIt<MyDio>().getDataWithToken(
        endPoint: EndPoint.pemeriksaanFisik, data: DTO.getNoreg(noReg: noReg));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> savePemeriksaanFisik({
    required PemeriksaanFisikModel pemeriksaanFisikModel,
    required String person,
    required String userID,
    required String deviceID,
    required String pelayanan,
  }) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.pemeriksaanFisik,
        data: pemeriksaanFisikModel.toJson(
            deviceID: deviceID,
            pelayanan: pelayanan,
            person: person,
            userID: userID));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveDetailPemeriksaanFisik(
      {required InputDetailPemeriksaanLaborModel
          inputDetailPemeriksaanLaborModel}) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.inputPemeriksaanLabor,
        data: DTO.inputPemeriksaanLaborDetail(
            inputDetailPemeriksaanLaborModel:
                inputDetailPemeriksaanLaborModel));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>>
      saveDetailPemeriksaanPenunjang(
          {required InputPemeriksaanPenunjangModel
              inputPemeriksaanPenunjangModel}) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.inputPemeriksaanPenunjang,
        data: DTO.inputPemeriksaanPenunjangMedik(
            inputPemeriksaanPenunjangModel: inputPemeriksaanPenunjangModel));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> savePenunjangMedik(
      {required InputPenunjangModel inputPenunjangModel}) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.inputPemeriksaanPenunjang,
        data:
            DTO.inputPenunjangModel(inputPenunjangModel: inputPenunjangModel));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveRencanaTindakLanjut({
    required String noreg,
    required String prognosis,
    required String anjuran,
    required String alasanOpname,
    required String konsulKe,
    // PENAMBAHAN USER ID
    required String person,
    required String userID,
    required String deviceID,
    required String pelayanan,
    required String alasanKonsul,
  }) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.rencanaTindakLanjut,
        data: DTO.saveRencanaTindakLanjut(
            prognosis: prognosis,
            alasanKonsul: alasanKonsul,
            deviceID: deviceID,
            pelayanan: pelayanan,
            person: person,
            userID: userID,
            noreg: noreg,
            anjuran: anjuran,
            alasanOpname: alasanOpname,
            konsulKe: konsulKe));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getRencanaTindakLanjut(
      {required String noreg}) {
    return getIt<MyDio>().getDataWithToken(
        endPoint: EndPoint.rencanaTindakLanjut, data: DTO.noReg(noReg: noreg));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>>
      saveAsesmedKeperawatanBidan(
          {required AsesmenKeperawatanBidanModel
              asesmenKeperawatanBidanModel}) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.asesmedKeperawatanBidan,
        data: asesmenKeperawatanBidanModel.toJson());
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getAsesmedKeperawatanBidan(
      {required String noReg}) {
    return getIt<MyDio>().getDataWithToken(
      endPoint: EndPoint.asesmedKeperawatanBidan,
      data: DTO.noReg(noReg: noReg),
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> cariSDKI(
      {required String value}) {
    return getIt<MyDio>().getDataWithToken(
      endPoint: EndPoint.cariSDKI + value,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getIntervensi(
      {required String value}) {
    return getIt<MyDio>().getDataWithToken(
      endPoint: EndPoint.cariSDKI + value,
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getSLKI(
      {required String value}) {
    return getIt<MyDio>().postDataWithToken(
      endPoint: EndPoint.cariIntervensi,
      data: DTO.cariIntervensi(slki: value),
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> cariSIKI(
      {required String value}) {
    return getIt<MyDio>().postDataWithToken(
      endPoint: EndPoint.cariSIKI,
      data: DTO.cariSIKI(siki: value),
    );
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>>
      simpanAsesmenKeperawatanBidan(
          {required AsesmenKeperawatanBidanModel asesmenKeperawatanBidanModel,
          required List<IntervensiModel> intervesiModel,
          required String sdki,
          required String siki}) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.saveAsesmenKeperawatan,
        data: DTO.saveAsesmentKeperawatanBidan(
            asesmenKeperawatanBidanModel: asesmenKeperawatanBidanModel,
            intervesiModel: intervesiModel,
            sdki: sdki,
            siki: siki));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getAsuhanKeperawatan(
      {required String noReg}) {
    return getIt<MyDio>().getDataWithToken(
        endPoint: EndPoint.getAsesmenKeperawatan,
        data: DTO.getNoreg(noReg: noReg));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveRiwayatAlergi(
      {required String noReg,
      required String keluhanUtama,
      required String statusAlergi,
      required String statusAlergiDetail,
      required String person,
      required String userID,
      required String deviceID,
      required String pelayanan}) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.riwayatAlergi,
        data: DTO.saveRiwayatAlergi(
            noReg: noReg,
            deviceID: deviceID,
            keluhanUtama: keluhanUtama,
            pelayanan: pelayanan,
            person: person,
            statusAlergi: statusAlergi,
            statusAlergiDetail: statusAlergiDetail,
            userID: userID));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getRiwayatAlergi(
      {required String noReg}) {
    return getIt<MyDio>().getDataWithToken(
        endPoint: EndPoint.riwayatAlergi, data: DTO.getNoreg(noReg: noReg));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> getSkalaTriase(
      {required String noReg}) {
    return getIt<MyDio>().getDataWithToken(
        endPoint: EndPoint.skalaNyeri, data: DTO.getNoreg(noReg: noReg));
  }

  @override
  Future<Either<ApiFailureResult, ApiSuccessResult>> saveSkalaTirase(
      {required String person,
      required String userID,
      required String noReg,
      required String deviceID,
      required String pelayanan,
      required SkalaTriaseModel skalaTriaseModel}) {
    return getIt<MyDio>().postDataWithToken(
        endPoint: EndPoint.skalaNyeri,
        data: skalaTriaseModel.toJson(
            deviceID: deviceID,
            pelayanan: pelayanan,
            noReg: noReg,
            person: person));
  }
}
