// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pasien_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PasienEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)
        saveSkrining,
    required TResult Function(String noRM) riwayatPasien,
    required TResult Function(List<DetailProfilPasienModel> detailProfilePasien)
        addRiwayatPasien,
    required TResult Function(AntreanPasienModel pasien) selectedPasien,
    required TResult Function(SkirningModel skrining) saveStateSkrining,
    required TResult Function(String noReg) getOdontogram,
    required TResult Function(AssementRawatJalanModel assementRawatJalanModel)
        saveRawatJalanDokter,
    required TResult Function(String noReg) uploadOdontogram,
    required TResult Function(String noReg, String picturePath, String kdBagian)
        publishOdontogram,
    required TResult Function(String noReg) getAssmentRawatjalanDokter,
    required TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)
        saveAssesKebEdukasi,
    required TResult Function(String noReg) getKebEdukasi,
    required TResult Function(String noReg) getAssesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi, String keterangan)
        saveOdontogram,
    required TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)
        saveAsesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi) deleteOdontogram,
    required TResult Function(String noReg) getSkrining,
    required TResult Function() started,
    required TResult Function(String norm) selectedNorm,
    required TResult Function(bool enable) addLoadingAnatomi,
    required TResult Function(String keterangan) addKeterangan,
    required TResult Function(
            String nama, String norm, String keterangan, File picturePath)
        simpanAnatomi,
    required TResult Function(
            String nama, String norm, String keterangan, String picturePath)
        saveAnatomi,
    required TResult Function() getAntreanPasien,
    required TResult Function() getKVitalSign,
    required TResult Function(String noRM) getDetailPasien,
    required TResult Function(List<AntreanPasienModel> antreanPasien) addPasien,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult? Function(String noRM)? riwayatPasien,
    TResult? Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult? Function(AntreanPasienModel pasien)? selectedPasien,
    TResult? Function(SkirningModel skrining)? saveStateSkrining,
    TResult? Function(String noReg)? getOdontogram,
    TResult? Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult? Function(String noReg)? uploadOdontogram,
    TResult? Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult? Function(String noReg)? getAssmentRawatjalanDokter,
    TResult? Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult? Function(String noReg)? getKebEdukasi,
    TResult? Function(String noReg)? getAssesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult? Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi)? deleteOdontogram,
    TResult? Function(String noReg)? getSkrining,
    TResult? Function()? started,
    TResult? Function(String norm)? selectedNorm,
    TResult? Function(bool enable)? addLoadingAnatomi,
    TResult? Function(String keterangan)? addKeterangan,
    TResult? Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult? Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult? Function()? getAntreanPasien,
    TResult? Function()? getKVitalSign,
    TResult? Function(String noRM)? getDetailPasien,
    TResult? Function(List<AntreanPasienModel> antreanPasien)? addPasien,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult Function(String noRM)? riwayatPasien,
    TResult Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult Function(AntreanPasienModel pasien)? selectedPasien,
    TResult Function(SkirningModel skrining)? saveStateSkrining,
    TResult Function(String noReg)? getOdontogram,
    TResult Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult Function(String noReg)? uploadOdontogram,
    TResult Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult Function(String noReg)? getAssmentRawatjalanDokter,
    TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult Function(String noReg)? getKebEdukasi,
    TResult Function(String noReg)? getAssesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi)? deleteOdontogram,
    TResult Function(String noReg)? getSkrining,
    TResult Function()? started,
    TResult Function(String norm)? selectedNorm,
    TResult Function(bool enable)? addLoadingAnatomi,
    TResult Function(String keterangan)? addKeterangan,
    TResult Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult Function()? getAntreanPasien,
    TResult Function()? getKVitalSign,
    TResult Function(String noRM)? getDetailPasien,
    TResult Function(List<AntreanPasienModel> antreanPasien)? addPasien,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveSkrining value) saveSkrining,
    required TResult Function(RiwayatPasien value) riwayatPasien,
    required TResult Function(addRiwayatPasien value) addRiwayatPasien,
    required TResult Function(SelectedPasien value) selectedPasien,
    required TResult Function(SaveStateSkrining value) saveStateSkrining,
    required TResult Function(GetOdontogram value) getOdontogram,
    required TResult Function(SaveRawatJalanDokter value) saveRawatJalanDokter,
    required TResult Function(UploadOdontogram value) uploadOdontogram,
    required TResult Function(PublishOdontogram value) publishOdontogram,
    required TResult Function(GetAssmentRawatjalanDokter value)
        getAssmentRawatjalanDokter,
    required TResult Function(SaveAssesKebEdukasi value) saveAssesKebEdukasi,
    required TResult Function(GetKebEdukasi value) getKebEdukasi,
    required TResult Function(GetAssesRawatJalanPerawat value)
        getAssesRawatJalanPerawat,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_SaveAsesRawatJalanPerawat value)
        saveAsesRawatJalanPerawat,
    required TResult Function(_DeleteOdontogram value) deleteOdontogram,
    required TResult Function(_GetSkrining value) getSkrining,
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedNorm value) selectedNorm,
    required TResult Function(_AddLoadingAnatomi value) addLoadingAnatomi,
    required TResult Function(_AddKeterangan value) addKeterangan,
    required TResult Function(_SimpanAnatomi value) simpanAnatomi,
    required TResult Function(_SaveAnatomi value) saveAnatomi,
    required TResult Function(_GetAntreanPasien value) getAntreanPasien,
    required TResult Function(_GetKVitalSign value) getKVitalSign,
    required TResult Function(_GetDetailPasien value) getDetailPasien,
    required TResult Function(_AddPasien value) addPasien,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveSkrining value)? saveSkrining,
    TResult? Function(RiwayatPasien value)? riwayatPasien,
    TResult? Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult? Function(SelectedPasien value)? selectedPasien,
    TResult? Function(SaveStateSkrining value)? saveStateSkrining,
    TResult? Function(GetOdontogram value)? getOdontogram,
    TResult? Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult? Function(UploadOdontogram value)? uploadOdontogram,
    TResult? Function(PublishOdontogram value)? publishOdontogram,
    TResult? Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult? Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult? Function(GetKebEdukasi value)? getKebEdukasi,
    TResult? Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult? Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult? Function(_GetSkrining value)? getSkrining,
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedNorm value)? selectedNorm,
    TResult? Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult? Function(_AddKeterangan value)? addKeterangan,
    TResult? Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult? Function(_SaveAnatomi value)? saveAnatomi,
    TResult? Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult? Function(_GetKVitalSign value)? getKVitalSign,
    TResult? Function(_GetDetailPasien value)? getDetailPasien,
    TResult? Function(_AddPasien value)? addPasien,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveSkrining value)? saveSkrining,
    TResult Function(RiwayatPasien value)? riwayatPasien,
    TResult Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult Function(SelectedPasien value)? selectedPasien,
    TResult Function(SaveStateSkrining value)? saveStateSkrining,
    TResult Function(GetOdontogram value)? getOdontogram,
    TResult Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult Function(UploadOdontogram value)? uploadOdontogram,
    TResult Function(PublishOdontogram value)? publishOdontogram,
    TResult Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult Function(GetKebEdukasi value)? getKebEdukasi,
    TResult Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult Function(_GetSkrining value)? getSkrining,
    TResult Function(_Started value)? started,
    TResult Function(_SelectedNorm value)? selectedNorm,
    TResult Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult Function(_AddKeterangan value)? addKeterangan,
    TResult Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult Function(_SaveAnatomi value)? saveAnatomi,
    TResult Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult Function(_GetKVitalSign value)? getKVitalSign,
    TResult Function(_GetDetailPasien value)? getDetailPasien,
    TResult Function(_AddPasien value)? addPasien,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasienEventCopyWith<$Res> {
  factory $PasienEventCopyWith(
          PasienEvent value, $Res Function(PasienEvent) then) =
      _$PasienEventCopyWithImpl<$Res, PasienEvent>;
}

/// @nodoc
class _$PasienEventCopyWithImpl<$Res, $Val extends PasienEvent>
    implements $PasienEventCopyWith<$Res> {
  _$PasienEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SaveSkriningImplCopyWith<$Res> {
  factory _$$SaveSkriningImplCopyWith(
          _$SaveSkriningImpl value, $Res Function(_$SaveSkriningImpl) then) =
      __$$SaveSkriningImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String kdBagian,
      String noReg,
      String k1,
      String k2,
      String k3,
      String k4,
      String k5,
      String k6,
      String kF1,
      String kF2,
      String kF3,
      String kF4,
      String b1,
      String b2,
      String rJ,
      String iV1,
      String iV2,
      String iV3,
      String iV4,
      String tanggal,
      String jam,
      String user});
}

/// @nodoc
class __$$SaveSkriningImplCopyWithImpl<$Res>
    extends _$PasienEventCopyWithImpl<$Res, _$SaveSkriningImpl>
    implements _$$SaveSkriningImplCopyWith<$Res> {
  __$$SaveSkriningImplCopyWithImpl(
      _$SaveSkriningImpl _value, $Res Function(_$SaveSkriningImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kdBagian = null,
    Object? noReg = null,
    Object? k1 = null,
    Object? k2 = null,
    Object? k3 = null,
    Object? k4 = null,
    Object? k5 = null,
    Object? k6 = null,
    Object? kF1 = null,
    Object? kF2 = null,
    Object? kF3 = null,
    Object? kF4 = null,
    Object? b1 = null,
    Object? b2 = null,
    Object? rJ = null,
    Object? iV1 = null,
    Object? iV2 = null,
    Object? iV3 = null,
    Object? iV4 = null,
    Object? tanggal = null,
    Object? jam = null,
    Object? user = null,
  }) {
    return _then(_$SaveSkriningImpl(
      kdBagian: null == kdBagian
          ? _value.kdBagian
          : kdBagian // ignore: cast_nullable_to_non_nullable
              as String,
      noReg: null == noReg
          ? _value.noReg
          : noReg // ignore: cast_nullable_to_non_nullable
              as String,
      k1: null == k1
          ? _value.k1
          : k1 // ignore: cast_nullable_to_non_nullable
              as String,
      k2: null == k2
          ? _value.k2
          : k2 // ignore: cast_nullable_to_non_nullable
              as String,
      k3: null == k3
          ? _value.k3
          : k3 // ignore: cast_nullable_to_non_nullable
              as String,
      k4: null == k4
          ? _value.k4
          : k4 // ignore: cast_nullable_to_non_nullable
              as String,
      k5: null == k5
          ? _value.k5
          : k5 // ignore: cast_nullable_to_non_nullable
              as String,
      k6: null == k6
          ? _value.k6
          : k6 // ignore: cast_nullable_to_non_nullable
              as String,
      kF1: null == kF1
          ? _value.kF1
          : kF1 // ignore: cast_nullable_to_non_nullable
              as String,
      kF2: null == kF2
          ? _value.kF2
          : kF2 // ignore: cast_nullable_to_non_nullable
              as String,
      kF3: null == kF3
          ? _value.kF3
          : kF3 // ignore: cast_nullable_to_non_nullable
              as String,
      kF4: null == kF4
          ? _value.kF4
          : kF4 // ignore: cast_nullable_to_non_nullable
              as String,
      b1: null == b1
          ? _value.b1
          : b1 // ignore: cast_nullable_to_non_nullable
              as String,
      b2: null == b2
          ? _value.b2
          : b2 // ignore: cast_nullable_to_non_nullable
              as String,
      rJ: null == rJ
          ? _value.rJ
          : rJ // ignore: cast_nullable_to_non_nullable
              as String,
      iV1: null == iV1
          ? _value.iV1
          : iV1 // ignore: cast_nullable_to_non_nullable
              as String,
      iV2: null == iV2
          ? _value.iV2
          : iV2 // ignore: cast_nullable_to_non_nullable
              as String,
      iV3: null == iV3
          ? _value.iV3
          : iV3 // ignore: cast_nullable_to_non_nullable
              as String,
      iV4: null == iV4
          ? _value.iV4
          : iV4 // ignore: cast_nullable_to_non_nullable
              as String,
      tanggal: null == tanggal
          ? _value.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
      jam: null == jam
          ? _value.jam
          : jam // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SaveSkriningImpl implements _SaveSkrining {
  const _$SaveSkriningImpl(
      {required this.kdBagian,
      required this.noReg,
      required this.k1,
      required this.k2,
      required this.k3,
      required this.k4,
      required this.k5,
      required this.k6,
      required this.kF1,
      required this.kF2,
      required this.kF3,
      required this.kF4,
      required this.b1,
      required this.b2,
      required this.rJ,
      required this.iV1,
      required this.iV2,
      required this.iV3,
      required this.iV4,
      required this.tanggal,
      required this.jam,
      required this.user});

  @override
  final String kdBagian;
  @override
  final String noReg;
  @override
  final String k1;
  @override
  final String k2;
  @override
  final String k3;
  @override
  final String k4;
  @override
  final String k5;
  @override
  final String k6;
  @override
  final String kF1;
  @override
  final String kF2;
  @override
  final String kF3;
  @override
  final String kF4;
  @override
  final String b1;
  @override
  final String b2;
  @override
  final String rJ;
  @override
  final String iV1;
  @override
  final String iV2;
  @override
  final String iV3;
  @override
  final String iV4;
  @override
  final String tanggal;
  @override
  final String jam;
  @override
  final String user;

  @override
  String toString() {
    return 'PasienEvent.saveSkrining(kdBagian: $kdBagian, noReg: $noReg, k1: $k1, k2: $k2, k3: $k3, k4: $k4, k5: $k5, k6: $k6, kF1: $kF1, kF2: $kF2, kF3: $kF3, kF4: $kF4, b1: $b1, b2: $b2, rJ: $rJ, iV1: $iV1, iV2: $iV2, iV3: $iV3, iV4: $iV4, tanggal: $tanggal, jam: $jam, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveSkriningImpl &&
            (identical(other.kdBagian, kdBagian) ||
                other.kdBagian == kdBagian) &&
            (identical(other.noReg, noReg) || other.noReg == noReg) &&
            (identical(other.k1, k1) || other.k1 == k1) &&
            (identical(other.k2, k2) || other.k2 == k2) &&
            (identical(other.k3, k3) || other.k3 == k3) &&
            (identical(other.k4, k4) || other.k4 == k4) &&
            (identical(other.k5, k5) || other.k5 == k5) &&
            (identical(other.k6, k6) || other.k6 == k6) &&
            (identical(other.kF1, kF1) || other.kF1 == kF1) &&
            (identical(other.kF2, kF2) || other.kF2 == kF2) &&
            (identical(other.kF3, kF3) || other.kF3 == kF3) &&
            (identical(other.kF4, kF4) || other.kF4 == kF4) &&
            (identical(other.b1, b1) || other.b1 == b1) &&
            (identical(other.b2, b2) || other.b2 == b2) &&
            (identical(other.rJ, rJ) || other.rJ == rJ) &&
            (identical(other.iV1, iV1) || other.iV1 == iV1) &&
            (identical(other.iV2, iV2) || other.iV2 == iV2) &&
            (identical(other.iV3, iV3) || other.iV3 == iV3) &&
            (identical(other.iV4, iV4) || other.iV4 == iV4) &&
            (identical(other.tanggal, tanggal) || other.tanggal == tanggal) &&
            (identical(other.jam, jam) || other.jam == jam) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        kdBagian,
        noReg,
        k1,
        k2,
        k3,
        k4,
        k5,
        k6,
        kF1,
        kF2,
        kF3,
        kF4,
        b1,
        b2,
        rJ,
        iV1,
        iV2,
        iV3,
        iV4,
        tanggal,
        jam,
        user
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveSkriningImplCopyWith<_$SaveSkriningImpl> get copyWith =>
      __$$SaveSkriningImplCopyWithImpl<_$SaveSkriningImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)
        saveSkrining,
    required TResult Function(String noRM) riwayatPasien,
    required TResult Function(List<DetailProfilPasienModel> detailProfilePasien)
        addRiwayatPasien,
    required TResult Function(AntreanPasienModel pasien) selectedPasien,
    required TResult Function(SkirningModel skrining) saveStateSkrining,
    required TResult Function(String noReg) getOdontogram,
    required TResult Function(AssementRawatJalanModel assementRawatJalanModel)
        saveRawatJalanDokter,
    required TResult Function(String noReg) uploadOdontogram,
    required TResult Function(String noReg, String picturePath, String kdBagian)
        publishOdontogram,
    required TResult Function(String noReg) getAssmentRawatjalanDokter,
    required TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)
        saveAssesKebEdukasi,
    required TResult Function(String noReg) getKebEdukasi,
    required TResult Function(String noReg) getAssesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi, String keterangan)
        saveOdontogram,
    required TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)
        saveAsesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi) deleteOdontogram,
    required TResult Function(String noReg) getSkrining,
    required TResult Function() started,
    required TResult Function(String norm) selectedNorm,
    required TResult Function(bool enable) addLoadingAnatomi,
    required TResult Function(String keterangan) addKeterangan,
    required TResult Function(
            String nama, String norm, String keterangan, File picturePath)
        simpanAnatomi,
    required TResult Function(
            String nama, String norm, String keterangan, String picturePath)
        saveAnatomi,
    required TResult Function() getAntreanPasien,
    required TResult Function() getKVitalSign,
    required TResult Function(String noRM) getDetailPasien,
    required TResult Function(List<AntreanPasienModel> antreanPasien) addPasien,
  }) {
    return saveSkrining(kdBagian, noReg, k1, k2, k3, k4, k5, k6, kF1, kF2, kF3,
        kF4, b1, b2, rJ, iV1, iV2, iV3, iV4, tanggal, jam, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult? Function(String noRM)? riwayatPasien,
    TResult? Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult? Function(AntreanPasienModel pasien)? selectedPasien,
    TResult? Function(SkirningModel skrining)? saveStateSkrining,
    TResult? Function(String noReg)? getOdontogram,
    TResult? Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult? Function(String noReg)? uploadOdontogram,
    TResult? Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult? Function(String noReg)? getAssmentRawatjalanDokter,
    TResult? Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult? Function(String noReg)? getKebEdukasi,
    TResult? Function(String noReg)? getAssesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult? Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi)? deleteOdontogram,
    TResult? Function(String noReg)? getSkrining,
    TResult? Function()? started,
    TResult? Function(String norm)? selectedNorm,
    TResult? Function(bool enable)? addLoadingAnatomi,
    TResult? Function(String keterangan)? addKeterangan,
    TResult? Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult? Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult? Function()? getAntreanPasien,
    TResult? Function()? getKVitalSign,
    TResult? Function(String noRM)? getDetailPasien,
    TResult? Function(List<AntreanPasienModel> antreanPasien)? addPasien,
  }) {
    return saveSkrining?.call(kdBagian, noReg, k1, k2, k3, k4, k5, k6, kF1, kF2,
        kF3, kF4, b1, b2, rJ, iV1, iV2, iV3, iV4, tanggal, jam, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult Function(String noRM)? riwayatPasien,
    TResult Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult Function(AntreanPasienModel pasien)? selectedPasien,
    TResult Function(SkirningModel skrining)? saveStateSkrining,
    TResult Function(String noReg)? getOdontogram,
    TResult Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult Function(String noReg)? uploadOdontogram,
    TResult Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult Function(String noReg)? getAssmentRawatjalanDokter,
    TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult Function(String noReg)? getKebEdukasi,
    TResult Function(String noReg)? getAssesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi)? deleteOdontogram,
    TResult Function(String noReg)? getSkrining,
    TResult Function()? started,
    TResult Function(String norm)? selectedNorm,
    TResult Function(bool enable)? addLoadingAnatomi,
    TResult Function(String keterangan)? addKeterangan,
    TResult Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult Function()? getAntreanPasien,
    TResult Function()? getKVitalSign,
    TResult Function(String noRM)? getDetailPasien,
    TResult Function(List<AntreanPasienModel> antreanPasien)? addPasien,
    required TResult orElse(),
  }) {
    if (saveSkrining != null) {
      return saveSkrining(kdBagian, noReg, k1, k2, k3, k4, k5, k6, kF1, kF2,
          kF3, kF4, b1, b2, rJ, iV1, iV2, iV3, iV4, tanggal, jam, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveSkrining value) saveSkrining,
    required TResult Function(RiwayatPasien value) riwayatPasien,
    required TResult Function(addRiwayatPasien value) addRiwayatPasien,
    required TResult Function(SelectedPasien value) selectedPasien,
    required TResult Function(SaveStateSkrining value) saveStateSkrining,
    required TResult Function(GetOdontogram value) getOdontogram,
    required TResult Function(SaveRawatJalanDokter value) saveRawatJalanDokter,
    required TResult Function(UploadOdontogram value) uploadOdontogram,
    required TResult Function(PublishOdontogram value) publishOdontogram,
    required TResult Function(GetAssmentRawatjalanDokter value)
        getAssmentRawatjalanDokter,
    required TResult Function(SaveAssesKebEdukasi value) saveAssesKebEdukasi,
    required TResult Function(GetKebEdukasi value) getKebEdukasi,
    required TResult Function(GetAssesRawatJalanPerawat value)
        getAssesRawatJalanPerawat,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_SaveAsesRawatJalanPerawat value)
        saveAsesRawatJalanPerawat,
    required TResult Function(_DeleteOdontogram value) deleteOdontogram,
    required TResult Function(_GetSkrining value) getSkrining,
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedNorm value) selectedNorm,
    required TResult Function(_AddLoadingAnatomi value) addLoadingAnatomi,
    required TResult Function(_AddKeterangan value) addKeterangan,
    required TResult Function(_SimpanAnatomi value) simpanAnatomi,
    required TResult Function(_SaveAnatomi value) saveAnatomi,
    required TResult Function(_GetAntreanPasien value) getAntreanPasien,
    required TResult Function(_GetKVitalSign value) getKVitalSign,
    required TResult Function(_GetDetailPasien value) getDetailPasien,
    required TResult Function(_AddPasien value) addPasien,
  }) {
    return saveSkrining(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveSkrining value)? saveSkrining,
    TResult? Function(RiwayatPasien value)? riwayatPasien,
    TResult? Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult? Function(SelectedPasien value)? selectedPasien,
    TResult? Function(SaveStateSkrining value)? saveStateSkrining,
    TResult? Function(GetOdontogram value)? getOdontogram,
    TResult? Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult? Function(UploadOdontogram value)? uploadOdontogram,
    TResult? Function(PublishOdontogram value)? publishOdontogram,
    TResult? Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult? Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult? Function(GetKebEdukasi value)? getKebEdukasi,
    TResult? Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult? Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult? Function(_GetSkrining value)? getSkrining,
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedNorm value)? selectedNorm,
    TResult? Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult? Function(_AddKeterangan value)? addKeterangan,
    TResult? Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult? Function(_SaveAnatomi value)? saveAnatomi,
    TResult? Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult? Function(_GetKVitalSign value)? getKVitalSign,
    TResult? Function(_GetDetailPasien value)? getDetailPasien,
    TResult? Function(_AddPasien value)? addPasien,
  }) {
    return saveSkrining?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveSkrining value)? saveSkrining,
    TResult Function(RiwayatPasien value)? riwayatPasien,
    TResult Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult Function(SelectedPasien value)? selectedPasien,
    TResult Function(SaveStateSkrining value)? saveStateSkrining,
    TResult Function(GetOdontogram value)? getOdontogram,
    TResult Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult Function(UploadOdontogram value)? uploadOdontogram,
    TResult Function(PublishOdontogram value)? publishOdontogram,
    TResult Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult Function(GetKebEdukasi value)? getKebEdukasi,
    TResult Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult Function(_GetSkrining value)? getSkrining,
    TResult Function(_Started value)? started,
    TResult Function(_SelectedNorm value)? selectedNorm,
    TResult Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult Function(_AddKeterangan value)? addKeterangan,
    TResult Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult Function(_SaveAnatomi value)? saveAnatomi,
    TResult Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult Function(_GetKVitalSign value)? getKVitalSign,
    TResult Function(_GetDetailPasien value)? getDetailPasien,
    TResult Function(_AddPasien value)? addPasien,
    required TResult orElse(),
  }) {
    if (saveSkrining != null) {
      return saveSkrining(this);
    }
    return orElse();
  }
}

abstract class _SaveSkrining implements PasienEvent {
  const factory _SaveSkrining(
      {required final String kdBagian,
      required final String noReg,
      required final String k1,
      required final String k2,
      required final String k3,
      required final String k4,
      required final String k5,
      required final String k6,
      required final String kF1,
      required final String kF2,
      required final String kF3,
      required final String kF4,
      required final String b1,
      required final String b2,
      required final String rJ,
      required final String iV1,
      required final String iV2,
      required final String iV3,
      required final String iV4,
      required final String tanggal,
      required final String jam,
      required final String user}) = _$SaveSkriningImpl;

  String get kdBagian;
  String get noReg;
  String get k1;
  String get k2;
  String get k3;
  String get k4;
  String get k5;
  String get k6;
  String get kF1;
  String get kF2;
  String get kF3;
  String get kF4;
  String get b1;
  String get b2;
  String get rJ;
  String get iV1;
  String get iV2;
  String get iV3;
  String get iV4;
  String get tanggal;
  String get jam;
  String get user;
  @JsonKey(ignore: true)
  _$$SaveSkriningImplCopyWith<_$SaveSkriningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RiwayatPasienImplCopyWith<$Res> {
  factory _$$RiwayatPasienImplCopyWith(
          _$RiwayatPasienImpl value, $Res Function(_$RiwayatPasienImpl) then) =
      __$$RiwayatPasienImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String noRM});
}

/// @nodoc
class __$$RiwayatPasienImplCopyWithImpl<$Res>
    extends _$PasienEventCopyWithImpl<$Res, _$RiwayatPasienImpl>
    implements _$$RiwayatPasienImplCopyWith<$Res> {
  __$$RiwayatPasienImplCopyWithImpl(
      _$RiwayatPasienImpl _value, $Res Function(_$RiwayatPasienImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noRM = null,
  }) {
    return _then(_$RiwayatPasienImpl(
      noRM: null == noRM
          ? _value.noRM
          : noRM // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RiwayatPasienImpl implements RiwayatPasien {
  const _$RiwayatPasienImpl({required this.noRM});

  @override
  final String noRM;

  @override
  String toString() {
    return 'PasienEvent.riwayatPasien(noRM: $noRM)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RiwayatPasienImpl &&
            (identical(other.noRM, noRM) || other.noRM == noRM));
  }

  @override
  int get hashCode => Object.hash(runtimeType, noRM);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RiwayatPasienImplCopyWith<_$RiwayatPasienImpl> get copyWith =>
      __$$RiwayatPasienImplCopyWithImpl<_$RiwayatPasienImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)
        saveSkrining,
    required TResult Function(String noRM) riwayatPasien,
    required TResult Function(List<DetailProfilPasienModel> detailProfilePasien)
        addRiwayatPasien,
    required TResult Function(AntreanPasienModel pasien) selectedPasien,
    required TResult Function(SkirningModel skrining) saveStateSkrining,
    required TResult Function(String noReg) getOdontogram,
    required TResult Function(AssementRawatJalanModel assementRawatJalanModel)
        saveRawatJalanDokter,
    required TResult Function(String noReg) uploadOdontogram,
    required TResult Function(String noReg, String picturePath, String kdBagian)
        publishOdontogram,
    required TResult Function(String noReg) getAssmentRawatjalanDokter,
    required TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)
        saveAssesKebEdukasi,
    required TResult Function(String noReg) getKebEdukasi,
    required TResult Function(String noReg) getAssesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi, String keterangan)
        saveOdontogram,
    required TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)
        saveAsesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi) deleteOdontogram,
    required TResult Function(String noReg) getSkrining,
    required TResult Function() started,
    required TResult Function(String norm) selectedNorm,
    required TResult Function(bool enable) addLoadingAnatomi,
    required TResult Function(String keterangan) addKeterangan,
    required TResult Function(
            String nama, String norm, String keterangan, File picturePath)
        simpanAnatomi,
    required TResult Function(
            String nama, String norm, String keterangan, String picturePath)
        saveAnatomi,
    required TResult Function() getAntreanPasien,
    required TResult Function() getKVitalSign,
    required TResult Function(String noRM) getDetailPasien,
    required TResult Function(List<AntreanPasienModel> antreanPasien) addPasien,
  }) {
    return riwayatPasien(noRM);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult? Function(String noRM)? riwayatPasien,
    TResult? Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult? Function(AntreanPasienModel pasien)? selectedPasien,
    TResult? Function(SkirningModel skrining)? saveStateSkrining,
    TResult? Function(String noReg)? getOdontogram,
    TResult? Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult? Function(String noReg)? uploadOdontogram,
    TResult? Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult? Function(String noReg)? getAssmentRawatjalanDokter,
    TResult? Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult? Function(String noReg)? getKebEdukasi,
    TResult? Function(String noReg)? getAssesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult? Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi)? deleteOdontogram,
    TResult? Function(String noReg)? getSkrining,
    TResult? Function()? started,
    TResult? Function(String norm)? selectedNorm,
    TResult? Function(bool enable)? addLoadingAnatomi,
    TResult? Function(String keterangan)? addKeterangan,
    TResult? Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult? Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult? Function()? getAntreanPasien,
    TResult? Function()? getKVitalSign,
    TResult? Function(String noRM)? getDetailPasien,
    TResult? Function(List<AntreanPasienModel> antreanPasien)? addPasien,
  }) {
    return riwayatPasien?.call(noRM);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult Function(String noRM)? riwayatPasien,
    TResult Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult Function(AntreanPasienModel pasien)? selectedPasien,
    TResult Function(SkirningModel skrining)? saveStateSkrining,
    TResult Function(String noReg)? getOdontogram,
    TResult Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult Function(String noReg)? uploadOdontogram,
    TResult Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult Function(String noReg)? getAssmentRawatjalanDokter,
    TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult Function(String noReg)? getKebEdukasi,
    TResult Function(String noReg)? getAssesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi)? deleteOdontogram,
    TResult Function(String noReg)? getSkrining,
    TResult Function()? started,
    TResult Function(String norm)? selectedNorm,
    TResult Function(bool enable)? addLoadingAnatomi,
    TResult Function(String keterangan)? addKeterangan,
    TResult Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult Function()? getAntreanPasien,
    TResult Function()? getKVitalSign,
    TResult Function(String noRM)? getDetailPasien,
    TResult Function(List<AntreanPasienModel> antreanPasien)? addPasien,
    required TResult orElse(),
  }) {
    if (riwayatPasien != null) {
      return riwayatPasien(noRM);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveSkrining value) saveSkrining,
    required TResult Function(RiwayatPasien value) riwayatPasien,
    required TResult Function(addRiwayatPasien value) addRiwayatPasien,
    required TResult Function(SelectedPasien value) selectedPasien,
    required TResult Function(SaveStateSkrining value) saveStateSkrining,
    required TResult Function(GetOdontogram value) getOdontogram,
    required TResult Function(SaveRawatJalanDokter value) saveRawatJalanDokter,
    required TResult Function(UploadOdontogram value) uploadOdontogram,
    required TResult Function(PublishOdontogram value) publishOdontogram,
    required TResult Function(GetAssmentRawatjalanDokter value)
        getAssmentRawatjalanDokter,
    required TResult Function(SaveAssesKebEdukasi value) saveAssesKebEdukasi,
    required TResult Function(GetKebEdukasi value) getKebEdukasi,
    required TResult Function(GetAssesRawatJalanPerawat value)
        getAssesRawatJalanPerawat,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_SaveAsesRawatJalanPerawat value)
        saveAsesRawatJalanPerawat,
    required TResult Function(_DeleteOdontogram value) deleteOdontogram,
    required TResult Function(_GetSkrining value) getSkrining,
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedNorm value) selectedNorm,
    required TResult Function(_AddLoadingAnatomi value) addLoadingAnatomi,
    required TResult Function(_AddKeterangan value) addKeterangan,
    required TResult Function(_SimpanAnatomi value) simpanAnatomi,
    required TResult Function(_SaveAnatomi value) saveAnatomi,
    required TResult Function(_GetAntreanPasien value) getAntreanPasien,
    required TResult Function(_GetKVitalSign value) getKVitalSign,
    required TResult Function(_GetDetailPasien value) getDetailPasien,
    required TResult Function(_AddPasien value) addPasien,
  }) {
    return riwayatPasien(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveSkrining value)? saveSkrining,
    TResult? Function(RiwayatPasien value)? riwayatPasien,
    TResult? Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult? Function(SelectedPasien value)? selectedPasien,
    TResult? Function(SaveStateSkrining value)? saveStateSkrining,
    TResult? Function(GetOdontogram value)? getOdontogram,
    TResult? Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult? Function(UploadOdontogram value)? uploadOdontogram,
    TResult? Function(PublishOdontogram value)? publishOdontogram,
    TResult? Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult? Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult? Function(GetKebEdukasi value)? getKebEdukasi,
    TResult? Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult? Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult? Function(_GetSkrining value)? getSkrining,
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedNorm value)? selectedNorm,
    TResult? Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult? Function(_AddKeterangan value)? addKeterangan,
    TResult? Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult? Function(_SaveAnatomi value)? saveAnatomi,
    TResult? Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult? Function(_GetKVitalSign value)? getKVitalSign,
    TResult? Function(_GetDetailPasien value)? getDetailPasien,
    TResult? Function(_AddPasien value)? addPasien,
  }) {
    return riwayatPasien?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveSkrining value)? saveSkrining,
    TResult Function(RiwayatPasien value)? riwayatPasien,
    TResult Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult Function(SelectedPasien value)? selectedPasien,
    TResult Function(SaveStateSkrining value)? saveStateSkrining,
    TResult Function(GetOdontogram value)? getOdontogram,
    TResult Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult Function(UploadOdontogram value)? uploadOdontogram,
    TResult Function(PublishOdontogram value)? publishOdontogram,
    TResult Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult Function(GetKebEdukasi value)? getKebEdukasi,
    TResult Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult Function(_GetSkrining value)? getSkrining,
    TResult Function(_Started value)? started,
    TResult Function(_SelectedNorm value)? selectedNorm,
    TResult Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult Function(_AddKeterangan value)? addKeterangan,
    TResult Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult Function(_SaveAnatomi value)? saveAnatomi,
    TResult Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult Function(_GetKVitalSign value)? getKVitalSign,
    TResult Function(_GetDetailPasien value)? getDetailPasien,
    TResult Function(_AddPasien value)? addPasien,
    required TResult orElse(),
  }) {
    if (riwayatPasien != null) {
      return riwayatPasien(this);
    }
    return orElse();
  }
}

abstract class RiwayatPasien implements PasienEvent {
  const factory RiwayatPasien({required final String noRM}) =
      _$RiwayatPasienImpl;

  String get noRM;
  @JsonKey(ignore: true)
  _$$RiwayatPasienImplCopyWith<_$RiwayatPasienImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$addRiwayatPasienImplCopyWith<$Res> {
  factory _$$addRiwayatPasienImplCopyWith(_$addRiwayatPasienImpl value,
          $Res Function(_$addRiwayatPasienImpl) then) =
      __$$addRiwayatPasienImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<DetailProfilPasienModel> detailProfilePasien});
}

/// @nodoc
class __$$addRiwayatPasienImplCopyWithImpl<$Res>
    extends _$PasienEventCopyWithImpl<$Res, _$addRiwayatPasienImpl>
    implements _$$addRiwayatPasienImplCopyWith<$Res> {
  __$$addRiwayatPasienImplCopyWithImpl(_$addRiwayatPasienImpl _value,
      $Res Function(_$addRiwayatPasienImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detailProfilePasien = null,
  }) {
    return _then(_$addRiwayatPasienImpl(
      detailProfilePasien: null == detailProfilePasien
          ? _value._detailProfilePasien
          : detailProfilePasien // ignore: cast_nullable_to_non_nullable
              as List<DetailProfilPasienModel>,
    ));
  }
}

/// @nodoc

class _$addRiwayatPasienImpl implements addRiwayatPasien {
  const _$addRiwayatPasienImpl(
      {required final List<DetailProfilPasienModel> detailProfilePasien})
      : _detailProfilePasien = detailProfilePasien;

  final List<DetailProfilPasienModel> _detailProfilePasien;
  @override
  List<DetailProfilPasienModel> get detailProfilePasien {
    if (_detailProfilePasien is EqualUnmodifiableListView)
      return _detailProfilePasien;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_detailProfilePasien);
  }

  @override
  String toString() {
    return 'PasienEvent.addRiwayatPasien(detailProfilePasien: $detailProfilePasien)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$addRiwayatPasienImpl &&
            const DeepCollectionEquality()
                .equals(other._detailProfilePasien, _detailProfilePasien));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_detailProfilePasien));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$addRiwayatPasienImplCopyWith<_$addRiwayatPasienImpl> get copyWith =>
      __$$addRiwayatPasienImplCopyWithImpl<_$addRiwayatPasienImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)
        saveSkrining,
    required TResult Function(String noRM) riwayatPasien,
    required TResult Function(List<DetailProfilPasienModel> detailProfilePasien)
        addRiwayatPasien,
    required TResult Function(AntreanPasienModel pasien) selectedPasien,
    required TResult Function(SkirningModel skrining) saveStateSkrining,
    required TResult Function(String noReg) getOdontogram,
    required TResult Function(AssementRawatJalanModel assementRawatJalanModel)
        saveRawatJalanDokter,
    required TResult Function(String noReg) uploadOdontogram,
    required TResult Function(String noReg, String picturePath, String kdBagian)
        publishOdontogram,
    required TResult Function(String noReg) getAssmentRawatjalanDokter,
    required TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)
        saveAssesKebEdukasi,
    required TResult Function(String noReg) getKebEdukasi,
    required TResult Function(String noReg) getAssesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi, String keterangan)
        saveOdontogram,
    required TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)
        saveAsesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi) deleteOdontogram,
    required TResult Function(String noReg) getSkrining,
    required TResult Function() started,
    required TResult Function(String norm) selectedNorm,
    required TResult Function(bool enable) addLoadingAnatomi,
    required TResult Function(String keterangan) addKeterangan,
    required TResult Function(
            String nama, String norm, String keterangan, File picturePath)
        simpanAnatomi,
    required TResult Function(
            String nama, String norm, String keterangan, String picturePath)
        saveAnatomi,
    required TResult Function() getAntreanPasien,
    required TResult Function() getKVitalSign,
    required TResult Function(String noRM) getDetailPasien,
    required TResult Function(List<AntreanPasienModel> antreanPasien) addPasien,
  }) {
    return addRiwayatPasien(detailProfilePasien);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult? Function(String noRM)? riwayatPasien,
    TResult? Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult? Function(AntreanPasienModel pasien)? selectedPasien,
    TResult? Function(SkirningModel skrining)? saveStateSkrining,
    TResult? Function(String noReg)? getOdontogram,
    TResult? Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult? Function(String noReg)? uploadOdontogram,
    TResult? Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult? Function(String noReg)? getAssmentRawatjalanDokter,
    TResult? Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult? Function(String noReg)? getKebEdukasi,
    TResult? Function(String noReg)? getAssesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult? Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi)? deleteOdontogram,
    TResult? Function(String noReg)? getSkrining,
    TResult? Function()? started,
    TResult? Function(String norm)? selectedNorm,
    TResult? Function(bool enable)? addLoadingAnatomi,
    TResult? Function(String keterangan)? addKeterangan,
    TResult? Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult? Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult? Function()? getAntreanPasien,
    TResult? Function()? getKVitalSign,
    TResult? Function(String noRM)? getDetailPasien,
    TResult? Function(List<AntreanPasienModel> antreanPasien)? addPasien,
  }) {
    return addRiwayatPasien?.call(detailProfilePasien);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult Function(String noRM)? riwayatPasien,
    TResult Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult Function(AntreanPasienModel pasien)? selectedPasien,
    TResult Function(SkirningModel skrining)? saveStateSkrining,
    TResult Function(String noReg)? getOdontogram,
    TResult Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult Function(String noReg)? uploadOdontogram,
    TResult Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult Function(String noReg)? getAssmentRawatjalanDokter,
    TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult Function(String noReg)? getKebEdukasi,
    TResult Function(String noReg)? getAssesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi)? deleteOdontogram,
    TResult Function(String noReg)? getSkrining,
    TResult Function()? started,
    TResult Function(String norm)? selectedNorm,
    TResult Function(bool enable)? addLoadingAnatomi,
    TResult Function(String keterangan)? addKeterangan,
    TResult Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult Function()? getAntreanPasien,
    TResult Function()? getKVitalSign,
    TResult Function(String noRM)? getDetailPasien,
    TResult Function(List<AntreanPasienModel> antreanPasien)? addPasien,
    required TResult orElse(),
  }) {
    if (addRiwayatPasien != null) {
      return addRiwayatPasien(detailProfilePasien);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveSkrining value) saveSkrining,
    required TResult Function(RiwayatPasien value) riwayatPasien,
    required TResult Function(addRiwayatPasien value) addRiwayatPasien,
    required TResult Function(SelectedPasien value) selectedPasien,
    required TResult Function(SaveStateSkrining value) saveStateSkrining,
    required TResult Function(GetOdontogram value) getOdontogram,
    required TResult Function(SaveRawatJalanDokter value) saveRawatJalanDokter,
    required TResult Function(UploadOdontogram value) uploadOdontogram,
    required TResult Function(PublishOdontogram value) publishOdontogram,
    required TResult Function(GetAssmentRawatjalanDokter value)
        getAssmentRawatjalanDokter,
    required TResult Function(SaveAssesKebEdukasi value) saveAssesKebEdukasi,
    required TResult Function(GetKebEdukasi value) getKebEdukasi,
    required TResult Function(GetAssesRawatJalanPerawat value)
        getAssesRawatJalanPerawat,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_SaveAsesRawatJalanPerawat value)
        saveAsesRawatJalanPerawat,
    required TResult Function(_DeleteOdontogram value) deleteOdontogram,
    required TResult Function(_GetSkrining value) getSkrining,
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedNorm value) selectedNorm,
    required TResult Function(_AddLoadingAnatomi value) addLoadingAnatomi,
    required TResult Function(_AddKeterangan value) addKeterangan,
    required TResult Function(_SimpanAnatomi value) simpanAnatomi,
    required TResult Function(_SaveAnatomi value) saveAnatomi,
    required TResult Function(_GetAntreanPasien value) getAntreanPasien,
    required TResult Function(_GetKVitalSign value) getKVitalSign,
    required TResult Function(_GetDetailPasien value) getDetailPasien,
    required TResult Function(_AddPasien value) addPasien,
  }) {
    return addRiwayatPasien(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveSkrining value)? saveSkrining,
    TResult? Function(RiwayatPasien value)? riwayatPasien,
    TResult? Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult? Function(SelectedPasien value)? selectedPasien,
    TResult? Function(SaveStateSkrining value)? saveStateSkrining,
    TResult? Function(GetOdontogram value)? getOdontogram,
    TResult? Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult? Function(UploadOdontogram value)? uploadOdontogram,
    TResult? Function(PublishOdontogram value)? publishOdontogram,
    TResult? Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult? Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult? Function(GetKebEdukasi value)? getKebEdukasi,
    TResult? Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult? Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult? Function(_GetSkrining value)? getSkrining,
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedNorm value)? selectedNorm,
    TResult? Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult? Function(_AddKeterangan value)? addKeterangan,
    TResult? Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult? Function(_SaveAnatomi value)? saveAnatomi,
    TResult? Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult? Function(_GetKVitalSign value)? getKVitalSign,
    TResult? Function(_GetDetailPasien value)? getDetailPasien,
    TResult? Function(_AddPasien value)? addPasien,
  }) {
    return addRiwayatPasien?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveSkrining value)? saveSkrining,
    TResult Function(RiwayatPasien value)? riwayatPasien,
    TResult Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult Function(SelectedPasien value)? selectedPasien,
    TResult Function(SaveStateSkrining value)? saveStateSkrining,
    TResult Function(GetOdontogram value)? getOdontogram,
    TResult Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult Function(UploadOdontogram value)? uploadOdontogram,
    TResult Function(PublishOdontogram value)? publishOdontogram,
    TResult Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult Function(GetKebEdukasi value)? getKebEdukasi,
    TResult Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult Function(_GetSkrining value)? getSkrining,
    TResult Function(_Started value)? started,
    TResult Function(_SelectedNorm value)? selectedNorm,
    TResult Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult Function(_AddKeterangan value)? addKeterangan,
    TResult Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult Function(_SaveAnatomi value)? saveAnatomi,
    TResult Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult Function(_GetKVitalSign value)? getKVitalSign,
    TResult Function(_GetDetailPasien value)? getDetailPasien,
    TResult Function(_AddPasien value)? addPasien,
    required TResult orElse(),
  }) {
    if (addRiwayatPasien != null) {
      return addRiwayatPasien(this);
    }
    return orElse();
  }
}

abstract class addRiwayatPasien implements PasienEvent {
  const factory addRiwayatPasien(
          {required final List<DetailProfilPasienModel> detailProfilePasien}) =
      _$addRiwayatPasienImpl;

  List<DetailProfilPasienModel> get detailProfilePasien;
  @JsonKey(ignore: true)
  _$$addRiwayatPasienImplCopyWith<_$addRiwayatPasienImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectedPasienImplCopyWith<$Res> {
  factory _$$SelectedPasienImplCopyWith(_$SelectedPasienImpl value,
          $Res Function(_$SelectedPasienImpl) then) =
      __$$SelectedPasienImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AntreanPasienModel pasien});
}

/// @nodoc
class __$$SelectedPasienImplCopyWithImpl<$Res>
    extends _$PasienEventCopyWithImpl<$Res, _$SelectedPasienImpl>
    implements _$$SelectedPasienImplCopyWith<$Res> {
  __$$SelectedPasienImplCopyWithImpl(
      _$SelectedPasienImpl _value, $Res Function(_$SelectedPasienImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pasien = null,
  }) {
    return _then(_$SelectedPasienImpl(
      pasien: null == pasien
          ? _value.pasien
          : pasien // ignore: cast_nullable_to_non_nullable
              as AntreanPasienModel,
    ));
  }
}

/// @nodoc

class _$SelectedPasienImpl implements SelectedPasien {
  const _$SelectedPasienImpl({required this.pasien});

  @override
  final AntreanPasienModel pasien;

  @override
  String toString() {
    return 'PasienEvent.selectedPasien(pasien: $pasien)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedPasienImpl &&
            (identical(other.pasien, pasien) || other.pasien == pasien));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pasien);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedPasienImplCopyWith<_$SelectedPasienImpl> get copyWith =>
      __$$SelectedPasienImplCopyWithImpl<_$SelectedPasienImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)
        saveSkrining,
    required TResult Function(String noRM) riwayatPasien,
    required TResult Function(List<DetailProfilPasienModel> detailProfilePasien)
        addRiwayatPasien,
    required TResult Function(AntreanPasienModel pasien) selectedPasien,
    required TResult Function(SkirningModel skrining) saveStateSkrining,
    required TResult Function(String noReg) getOdontogram,
    required TResult Function(AssementRawatJalanModel assementRawatJalanModel)
        saveRawatJalanDokter,
    required TResult Function(String noReg) uploadOdontogram,
    required TResult Function(String noReg, String picturePath, String kdBagian)
        publishOdontogram,
    required TResult Function(String noReg) getAssmentRawatjalanDokter,
    required TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)
        saveAssesKebEdukasi,
    required TResult Function(String noReg) getKebEdukasi,
    required TResult Function(String noReg) getAssesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi, String keterangan)
        saveOdontogram,
    required TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)
        saveAsesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi) deleteOdontogram,
    required TResult Function(String noReg) getSkrining,
    required TResult Function() started,
    required TResult Function(String norm) selectedNorm,
    required TResult Function(bool enable) addLoadingAnatomi,
    required TResult Function(String keterangan) addKeterangan,
    required TResult Function(
            String nama, String norm, String keterangan, File picturePath)
        simpanAnatomi,
    required TResult Function(
            String nama, String norm, String keterangan, String picturePath)
        saveAnatomi,
    required TResult Function() getAntreanPasien,
    required TResult Function() getKVitalSign,
    required TResult Function(String noRM) getDetailPasien,
    required TResult Function(List<AntreanPasienModel> antreanPasien) addPasien,
  }) {
    return selectedPasien(pasien);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult? Function(String noRM)? riwayatPasien,
    TResult? Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult? Function(AntreanPasienModel pasien)? selectedPasien,
    TResult? Function(SkirningModel skrining)? saveStateSkrining,
    TResult? Function(String noReg)? getOdontogram,
    TResult? Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult? Function(String noReg)? uploadOdontogram,
    TResult? Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult? Function(String noReg)? getAssmentRawatjalanDokter,
    TResult? Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult? Function(String noReg)? getKebEdukasi,
    TResult? Function(String noReg)? getAssesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult? Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi)? deleteOdontogram,
    TResult? Function(String noReg)? getSkrining,
    TResult? Function()? started,
    TResult? Function(String norm)? selectedNorm,
    TResult? Function(bool enable)? addLoadingAnatomi,
    TResult? Function(String keterangan)? addKeterangan,
    TResult? Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult? Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult? Function()? getAntreanPasien,
    TResult? Function()? getKVitalSign,
    TResult? Function(String noRM)? getDetailPasien,
    TResult? Function(List<AntreanPasienModel> antreanPasien)? addPasien,
  }) {
    return selectedPasien?.call(pasien);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult Function(String noRM)? riwayatPasien,
    TResult Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult Function(AntreanPasienModel pasien)? selectedPasien,
    TResult Function(SkirningModel skrining)? saveStateSkrining,
    TResult Function(String noReg)? getOdontogram,
    TResult Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult Function(String noReg)? uploadOdontogram,
    TResult Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult Function(String noReg)? getAssmentRawatjalanDokter,
    TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult Function(String noReg)? getKebEdukasi,
    TResult Function(String noReg)? getAssesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi)? deleteOdontogram,
    TResult Function(String noReg)? getSkrining,
    TResult Function()? started,
    TResult Function(String norm)? selectedNorm,
    TResult Function(bool enable)? addLoadingAnatomi,
    TResult Function(String keterangan)? addKeterangan,
    TResult Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult Function()? getAntreanPasien,
    TResult Function()? getKVitalSign,
    TResult Function(String noRM)? getDetailPasien,
    TResult Function(List<AntreanPasienModel> antreanPasien)? addPasien,
    required TResult orElse(),
  }) {
    if (selectedPasien != null) {
      return selectedPasien(pasien);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveSkrining value) saveSkrining,
    required TResult Function(RiwayatPasien value) riwayatPasien,
    required TResult Function(addRiwayatPasien value) addRiwayatPasien,
    required TResult Function(SelectedPasien value) selectedPasien,
    required TResult Function(SaveStateSkrining value) saveStateSkrining,
    required TResult Function(GetOdontogram value) getOdontogram,
    required TResult Function(SaveRawatJalanDokter value) saveRawatJalanDokter,
    required TResult Function(UploadOdontogram value) uploadOdontogram,
    required TResult Function(PublishOdontogram value) publishOdontogram,
    required TResult Function(GetAssmentRawatjalanDokter value)
        getAssmentRawatjalanDokter,
    required TResult Function(SaveAssesKebEdukasi value) saveAssesKebEdukasi,
    required TResult Function(GetKebEdukasi value) getKebEdukasi,
    required TResult Function(GetAssesRawatJalanPerawat value)
        getAssesRawatJalanPerawat,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_SaveAsesRawatJalanPerawat value)
        saveAsesRawatJalanPerawat,
    required TResult Function(_DeleteOdontogram value) deleteOdontogram,
    required TResult Function(_GetSkrining value) getSkrining,
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedNorm value) selectedNorm,
    required TResult Function(_AddLoadingAnatomi value) addLoadingAnatomi,
    required TResult Function(_AddKeterangan value) addKeterangan,
    required TResult Function(_SimpanAnatomi value) simpanAnatomi,
    required TResult Function(_SaveAnatomi value) saveAnatomi,
    required TResult Function(_GetAntreanPasien value) getAntreanPasien,
    required TResult Function(_GetKVitalSign value) getKVitalSign,
    required TResult Function(_GetDetailPasien value) getDetailPasien,
    required TResult Function(_AddPasien value) addPasien,
  }) {
    return selectedPasien(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveSkrining value)? saveSkrining,
    TResult? Function(RiwayatPasien value)? riwayatPasien,
    TResult? Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult? Function(SelectedPasien value)? selectedPasien,
    TResult? Function(SaveStateSkrining value)? saveStateSkrining,
    TResult? Function(GetOdontogram value)? getOdontogram,
    TResult? Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult? Function(UploadOdontogram value)? uploadOdontogram,
    TResult? Function(PublishOdontogram value)? publishOdontogram,
    TResult? Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult? Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult? Function(GetKebEdukasi value)? getKebEdukasi,
    TResult? Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult? Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult? Function(_GetSkrining value)? getSkrining,
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedNorm value)? selectedNorm,
    TResult? Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult? Function(_AddKeterangan value)? addKeterangan,
    TResult? Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult? Function(_SaveAnatomi value)? saveAnatomi,
    TResult? Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult? Function(_GetKVitalSign value)? getKVitalSign,
    TResult? Function(_GetDetailPasien value)? getDetailPasien,
    TResult? Function(_AddPasien value)? addPasien,
  }) {
    return selectedPasien?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveSkrining value)? saveSkrining,
    TResult Function(RiwayatPasien value)? riwayatPasien,
    TResult Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult Function(SelectedPasien value)? selectedPasien,
    TResult Function(SaveStateSkrining value)? saveStateSkrining,
    TResult Function(GetOdontogram value)? getOdontogram,
    TResult Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult Function(UploadOdontogram value)? uploadOdontogram,
    TResult Function(PublishOdontogram value)? publishOdontogram,
    TResult Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult Function(GetKebEdukasi value)? getKebEdukasi,
    TResult Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult Function(_GetSkrining value)? getSkrining,
    TResult Function(_Started value)? started,
    TResult Function(_SelectedNorm value)? selectedNorm,
    TResult Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult Function(_AddKeterangan value)? addKeterangan,
    TResult Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult Function(_SaveAnatomi value)? saveAnatomi,
    TResult Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult Function(_GetKVitalSign value)? getKVitalSign,
    TResult Function(_GetDetailPasien value)? getDetailPasien,
    TResult Function(_AddPasien value)? addPasien,
    required TResult orElse(),
  }) {
    if (selectedPasien != null) {
      return selectedPasien(this);
    }
    return orElse();
  }
}

abstract class SelectedPasien implements PasienEvent {
  const factory SelectedPasien({required final AntreanPasienModel pasien}) =
      _$SelectedPasienImpl;

  AntreanPasienModel get pasien;
  @JsonKey(ignore: true)
  _$$SelectedPasienImplCopyWith<_$SelectedPasienImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveStateSkriningImplCopyWith<$Res> {
  factory _$$SaveStateSkriningImplCopyWith(_$SaveStateSkriningImpl value,
          $Res Function(_$SaveStateSkriningImpl) then) =
      __$$SaveStateSkriningImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SkirningModel skrining});
}

/// @nodoc
class __$$SaveStateSkriningImplCopyWithImpl<$Res>
    extends _$PasienEventCopyWithImpl<$Res, _$SaveStateSkriningImpl>
    implements _$$SaveStateSkriningImplCopyWith<$Res> {
  __$$SaveStateSkriningImplCopyWithImpl(_$SaveStateSkriningImpl _value,
      $Res Function(_$SaveStateSkriningImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skrining = null,
  }) {
    return _then(_$SaveStateSkriningImpl(
      skrining: null == skrining
          ? _value.skrining
          : skrining // ignore: cast_nullable_to_non_nullable
              as SkirningModel,
    ));
  }
}

/// @nodoc

class _$SaveStateSkriningImpl implements SaveStateSkrining {
  const _$SaveStateSkriningImpl({required this.skrining});

  @override
  final SkirningModel skrining;

  @override
  String toString() {
    return 'PasienEvent.saveStateSkrining(skrining: $skrining)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveStateSkriningImpl &&
            (identical(other.skrining, skrining) ||
                other.skrining == skrining));
  }

  @override
  int get hashCode => Object.hash(runtimeType, skrining);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveStateSkriningImplCopyWith<_$SaveStateSkriningImpl> get copyWith =>
      __$$SaveStateSkriningImplCopyWithImpl<_$SaveStateSkriningImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)
        saveSkrining,
    required TResult Function(String noRM) riwayatPasien,
    required TResult Function(List<DetailProfilPasienModel> detailProfilePasien)
        addRiwayatPasien,
    required TResult Function(AntreanPasienModel pasien) selectedPasien,
    required TResult Function(SkirningModel skrining) saveStateSkrining,
    required TResult Function(String noReg) getOdontogram,
    required TResult Function(AssementRawatJalanModel assementRawatJalanModel)
        saveRawatJalanDokter,
    required TResult Function(String noReg) uploadOdontogram,
    required TResult Function(String noReg, String picturePath, String kdBagian)
        publishOdontogram,
    required TResult Function(String noReg) getAssmentRawatjalanDokter,
    required TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)
        saveAssesKebEdukasi,
    required TResult Function(String noReg) getKebEdukasi,
    required TResult Function(String noReg) getAssesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi, String keterangan)
        saveOdontogram,
    required TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)
        saveAsesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi) deleteOdontogram,
    required TResult Function(String noReg) getSkrining,
    required TResult Function() started,
    required TResult Function(String norm) selectedNorm,
    required TResult Function(bool enable) addLoadingAnatomi,
    required TResult Function(String keterangan) addKeterangan,
    required TResult Function(
            String nama, String norm, String keterangan, File picturePath)
        simpanAnatomi,
    required TResult Function(
            String nama, String norm, String keterangan, String picturePath)
        saveAnatomi,
    required TResult Function() getAntreanPasien,
    required TResult Function() getKVitalSign,
    required TResult Function(String noRM) getDetailPasien,
    required TResult Function(List<AntreanPasienModel> antreanPasien) addPasien,
  }) {
    return saveStateSkrining(skrining);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult? Function(String noRM)? riwayatPasien,
    TResult? Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult? Function(AntreanPasienModel pasien)? selectedPasien,
    TResult? Function(SkirningModel skrining)? saveStateSkrining,
    TResult? Function(String noReg)? getOdontogram,
    TResult? Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult? Function(String noReg)? uploadOdontogram,
    TResult? Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult? Function(String noReg)? getAssmentRawatjalanDokter,
    TResult? Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult? Function(String noReg)? getKebEdukasi,
    TResult? Function(String noReg)? getAssesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult? Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi)? deleteOdontogram,
    TResult? Function(String noReg)? getSkrining,
    TResult? Function()? started,
    TResult? Function(String norm)? selectedNorm,
    TResult? Function(bool enable)? addLoadingAnatomi,
    TResult? Function(String keterangan)? addKeterangan,
    TResult? Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult? Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult? Function()? getAntreanPasien,
    TResult? Function()? getKVitalSign,
    TResult? Function(String noRM)? getDetailPasien,
    TResult? Function(List<AntreanPasienModel> antreanPasien)? addPasien,
  }) {
    return saveStateSkrining?.call(skrining);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult Function(String noRM)? riwayatPasien,
    TResult Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult Function(AntreanPasienModel pasien)? selectedPasien,
    TResult Function(SkirningModel skrining)? saveStateSkrining,
    TResult Function(String noReg)? getOdontogram,
    TResult Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult Function(String noReg)? uploadOdontogram,
    TResult Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult Function(String noReg)? getAssmentRawatjalanDokter,
    TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult Function(String noReg)? getKebEdukasi,
    TResult Function(String noReg)? getAssesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi)? deleteOdontogram,
    TResult Function(String noReg)? getSkrining,
    TResult Function()? started,
    TResult Function(String norm)? selectedNorm,
    TResult Function(bool enable)? addLoadingAnatomi,
    TResult Function(String keterangan)? addKeterangan,
    TResult Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult Function()? getAntreanPasien,
    TResult Function()? getKVitalSign,
    TResult Function(String noRM)? getDetailPasien,
    TResult Function(List<AntreanPasienModel> antreanPasien)? addPasien,
    required TResult orElse(),
  }) {
    if (saveStateSkrining != null) {
      return saveStateSkrining(skrining);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveSkrining value) saveSkrining,
    required TResult Function(RiwayatPasien value) riwayatPasien,
    required TResult Function(addRiwayatPasien value) addRiwayatPasien,
    required TResult Function(SelectedPasien value) selectedPasien,
    required TResult Function(SaveStateSkrining value) saveStateSkrining,
    required TResult Function(GetOdontogram value) getOdontogram,
    required TResult Function(SaveRawatJalanDokter value) saveRawatJalanDokter,
    required TResult Function(UploadOdontogram value) uploadOdontogram,
    required TResult Function(PublishOdontogram value) publishOdontogram,
    required TResult Function(GetAssmentRawatjalanDokter value)
        getAssmentRawatjalanDokter,
    required TResult Function(SaveAssesKebEdukasi value) saveAssesKebEdukasi,
    required TResult Function(GetKebEdukasi value) getKebEdukasi,
    required TResult Function(GetAssesRawatJalanPerawat value)
        getAssesRawatJalanPerawat,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_SaveAsesRawatJalanPerawat value)
        saveAsesRawatJalanPerawat,
    required TResult Function(_DeleteOdontogram value) deleteOdontogram,
    required TResult Function(_GetSkrining value) getSkrining,
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedNorm value) selectedNorm,
    required TResult Function(_AddLoadingAnatomi value) addLoadingAnatomi,
    required TResult Function(_AddKeterangan value) addKeterangan,
    required TResult Function(_SimpanAnatomi value) simpanAnatomi,
    required TResult Function(_SaveAnatomi value) saveAnatomi,
    required TResult Function(_GetAntreanPasien value) getAntreanPasien,
    required TResult Function(_GetKVitalSign value) getKVitalSign,
    required TResult Function(_GetDetailPasien value) getDetailPasien,
    required TResult Function(_AddPasien value) addPasien,
  }) {
    return saveStateSkrining(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveSkrining value)? saveSkrining,
    TResult? Function(RiwayatPasien value)? riwayatPasien,
    TResult? Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult? Function(SelectedPasien value)? selectedPasien,
    TResult? Function(SaveStateSkrining value)? saveStateSkrining,
    TResult? Function(GetOdontogram value)? getOdontogram,
    TResult? Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult? Function(UploadOdontogram value)? uploadOdontogram,
    TResult? Function(PublishOdontogram value)? publishOdontogram,
    TResult? Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult? Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult? Function(GetKebEdukasi value)? getKebEdukasi,
    TResult? Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult? Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult? Function(_GetSkrining value)? getSkrining,
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedNorm value)? selectedNorm,
    TResult? Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult? Function(_AddKeterangan value)? addKeterangan,
    TResult? Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult? Function(_SaveAnatomi value)? saveAnatomi,
    TResult? Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult? Function(_GetKVitalSign value)? getKVitalSign,
    TResult? Function(_GetDetailPasien value)? getDetailPasien,
    TResult? Function(_AddPasien value)? addPasien,
  }) {
    return saveStateSkrining?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveSkrining value)? saveSkrining,
    TResult Function(RiwayatPasien value)? riwayatPasien,
    TResult Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult Function(SelectedPasien value)? selectedPasien,
    TResult Function(SaveStateSkrining value)? saveStateSkrining,
    TResult Function(GetOdontogram value)? getOdontogram,
    TResult Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult Function(UploadOdontogram value)? uploadOdontogram,
    TResult Function(PublishOdontogram value)? publishOdontogram,
    TResult Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult Function(GetKebEdukasi value)? getKebEdukasi,
    TResult Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult Function(_GetSkrining value)? getSkrining,
    TResult Function(_Started value)? started,
    TResult Function(_SelectedNorm value)? selectedNorm,
    TResult Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult Function(_AddKeterangan value)? addKeterangan,
    TResult Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult Function(_SaveAnatomi value)? saveAnatomi,
    TResult Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult Function(_GetKVitalSign value)? getKVitalSign,
    TResult Function(_GetDetailPasien value)? getDetailPasien,
    TResult Function(_AddPasien value)? addPasien,
    required TResult orElse(),
  }) {
    if (saveStateSkrining != null) {
      return saveStateSkrining(this);
    }
    return orElse();
  }
}

abstract class SaveStateSkrining implements PasienEvent {
  const factory SaveStateSkrining({required final SkirningModel skrining}) =
      _$SaveStateSkriningImpl;

  SkirningModel get skrining;
  @JsonKey(ignore: true)
  _$$SaveStateSkriningImplCopyWith<_$SaveStateSkriningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetOdontogramImplCopyWith<$Res> {
  factory _$$GetOdontogramImplCopyWith(
          _$GetOdontogramImpl value, $Res Function(_$GetOdontogramImpl) then) =
      __$$GetOdontogramImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String noReg});
}

/// @nodoc
class __$$GetOdontogramImplCopyWithImpl<$Res>
    extends _$PasienEventCopyWithImpl<$Res, _$GetOdontogramImpl>
    implements _$$GetOdontogramImplCopyWith<$Res> {
  __$$GetOdontogramImplCopyWithImpl(
      _$GetOdontogramImpl _value, $Res Function(_$GetOdontogramImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noReg = null,
  }) {
    return _then(_$GetOdontogramImpl(
      noReg: null == noReg
          ? _value.noReg
          : noReg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetOdontogramImpl implements GetOdontogram {
  const _$GetOdontogramImpl({required this.noReg});

  @override
  final String noReg;

  @override
  String toString() {
    return 'PasienEvent.getOdontogram(noReg: $noReg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetOdontogramImpl &&
            (identical(other.noReg, noReg) || other.noReg == noReg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, noReg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetOdontogramImplCopyWith<_$GetOdontogramImpl> get copyWith =>
      __$$GetOdontogramImplCopyWithImpl<_$GetOdontogramImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)
        saveSkrining,
    required TResult Function(String noRM) riwayatPasien,
    required TResult Function(List<DetailProfilPasienModel> detailProfilePasien)
        addRiwayatPasien,
    required TResult Function(AntreanPasienModel pasien) selectedPasien,
    required TResult Function(SkirningModel skrining) saveStateSkrining,
    required TResult Function(String noReg) getOdontogram,
    required TResult Function(AssementRawatJalanModel assementRawatJalanModel)
        saveRawatJalanDokter,
    required TResult Function(String noReg) uploadOdontogram,
    required TResult Function(String noReg, String picturePath, String kdBagian)
        publishOdontogram,
    required TResult Function(String noReg) getAssmentRawatjalanDokter,
    required TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)
        saveAssesKebEdukasi,
    required TResult Function(String noReg) getKebEdukasi,
    required TResult Function(String noReg) getAssesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi, String keterangan)
        saveOdontogram,
    required TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)
        saveAsesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi) deleteOdontogram,
    required TResult Function(String noReg) getSkrining,
    required TResult Function() started,
    required TResult Function(String norm) selectedNorm,
    required TResult Function(bool enable) addLoadingAnatomi,
    required TResult Function(String keterangan) addKeterangan,
    required TResult Function(
            String nama, String norm, String keterangan, File picturePath)
        simpanAnatomi,
    required TResult Function(
            String nama, String norm, String keterangan, String picturePath)
        saveAnatomi,
    required TResult Function() getAntreanPasien,
    required TResult Function() getKVitalSign,
    required TResult Function(String noRM) getDetailPasien,
    required TResult Function(List<AntreanPasienModel> antreanPasien) addPasien,
  }) {
    return getOdontogram(noReg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult? Function(String noRM)? riwayatPasien,
    TResult? Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult? Function(AntreanPasienModel pasien)? selectedPasien,
    TResult? Function(SkirningModel skrining)? saveStateSkrining,
    TResult? Function(String noReg)? getOdontogram,
    TResult? Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult? Function(String noReg)? uploadOdontogram,
    TResult? Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult? Function(String noReg)? getAssmentRawatjalanDokter,
    TResult? Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult? Function(String noReg)? getKebEdukasi,
    TResult? Function(String noReg)? getAssesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult? Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi)? deleteOdontogram,
    TResult? Function(String noReg)? getSkrining,
    TResult? Function()? started,
    TResult? Function(String norm)? selectedNorm,
    TResult? Function(bool enable)? addLoadingAnatomi,
    TResult? Function(String keterangan)? addKeterangan,
    TResult? Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult? Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult? Function()? getAntreanPasien,
    TResult? Function()? getKVitalSign,
    TResult? Function(String noRM)? getDetailPasien,
    TResult? Function(List<AntreanPasienModel> antreanPasien)? addPasien,
  }) {
    return getOdontogram?.call(noReg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult Function(String noRM)? riwayatPasien,
    TResult Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult Function(AntreanPasienModel pasien)? selectedPasien,
    TResult Function(SkirningModel skrining)? saveStateSkrining,
    TResult Function(String noReg)? getOdontogram,
    TResult Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult Function(String noReg)? uploadOdontogram,
    TResult Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult Function(String noReg)? getAssmentRawatjalanDokter,
    TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult Function(String noReg)? getKebEdukasi,
    TResult Function(String noReg)? getAssesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi)? deleteOdontogram,
    TResult Function(String noReg)? getSkrining,
    TResult Function()? started,
    TResult Function(String norm)? selectedNorm,
    TResult Function(bool enable)? addLoadingAnatomi,
    TResult Function(String keterangan)? addKeterangan,
    TResult Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult Function()? getAntreanPasien,
    TResult Function()? getKVitalSign,
    TResult Function(String noRM)? getDetailPasien,
    TResult Function(List<AntreanPasienModel> antreanPasien)? addPasien,
    required TResult orElse(),
  }) {
    if (getOdontogram != null) {
      return getOdontogram(noReg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveSkrining value) saveSkrining,
    required TResult Function(RiwayatPasien value) riwayatPasien,
    required TResult Function(addRiwayatPasien value) addRiwayatPasien,
    required TResult Function(SelectedPasien value) selectedPasien,
    required TResult Function(SaveStateSkrining value) saveStateSkrining,
    required TResult Function(GetOdontogram value) getOdontogram,
    required TResult Function(SaveRawatJalanDokter value) saveRawatJalanDokter,
    required TResult Function(UploadOdontogram value) uploadOdontogram,
    required TResult Function(PublishOdontogram value) publishOdontogram,
    required TResult Function(GetAssmentRawatjalanDokter value)
        getAssmentRawatjalanDokter,
    required TResult Function(SaveAssesKebEdukasi value) saveAssesKebEdukasi,
    required TResult Function(GetKebEdukasi value) getKebEdukasi,
    required TResult Function(GetAssesRawatJalanPerawat value)
        getAssesRawatJalanPerawat,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_SaveAsesRawatJalanPerawat value)
        saveAsesRawatJalanPerawat,
    required TResult Function(_DeleteOdontogram value) deleteOdontogram,
    required TResult Function(_GetSkrining value) getSkrining,
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedNorm value) selectedNorm,
    required TResult Function(_AddLoadingAnatomi value) addLoadingAnatomi,
    required TResult Function(_AddKeterangan value) addKeterangan,
    required TResult Function(_SimpanAnatomi value) simpanAnatomi,
    required TResult Function(_SaveAnatomi value) saveAnatomi,
    required TResult Function(_GetAntreanPasien value) getAntreanPasien,
    required TResult Function(_GetKVitalSign value) getKVitalSign,
    required TResult Function(_GetDetailPasien value) getDetailPasien,
    required TResult Function(_AddPasien value) addPasien,
  }) {
    return getOdontogram(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveSkrining value)? saveSkrining,
    TResult? Function(RiwayatPasien value)? riwayatPasien,
    TResult? Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult? Function(SelectedPasien value)? selectedPasien,
    TResult? Function(SaveStateSkrining value)? saveStateSkrining,
    TResult? Function(GetOdontogram value)? getOdontogram,
    TResult? Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult? Function(UploadOdontogram value)? uploadOdontogram,
    TResult? Function(PublishOdontogram value)? publishOdontogram,
    TResult? Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult? Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult? Function(GetKebEdukasi value)? getKebEdukasi,
    TResult? Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult? Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult? Function(_GetSkrining value)? getSkrining,
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedNorm value)? selectedNorm,
    TResult? Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult? Function(_AddKeterangan value)? addKeterangan,
    TResult? Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult? Function(_SaveAnatomi value)? saveAnatomi,
    TResult? Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult? Function(_GetKVitalSign value)? getKVitalSign,
    TResult? Function(_GetDetailPasien value)? getDetailPasien,
    TResult? Function(_AddPasien value)? addPasien,
  }) {
    return getOdontogram?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveSkrining value)? saveSkrining,
    TResult Function(RiwayatPasien value)? riwayatPasien,
    TResult Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult Function(SelectedPasien value)? selectedPasien,
    TResult Function(SaveStateSkrining value)? saveStateSkrining,
    TResult Function(GetOdontogram value)? getOdontogram,
    TResult Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult Function(UploadOdontogram value)? uploadOdontogram,
    TResult Function(PublishOdontogram value)? publishOdontogram,
    TResult Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult Function(GetKebEdukasi value)? getKebEdukasi,
    TResult Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult Function(_GetSkrining value)? getSkrining,
    TResult Function(_Started value)? started,
    TResult Function(_SelectedNorm value)? selectedNorm,
    TResult Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult Function(_AddKeterangan value)? addKeterangan,
    TResult Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult Function(_SaveAnatomi value)? saveAnatomi,
    TResult Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult Function(_GetKVitalSign value)? getKVitalSign,
    TResult Function(_GetDetailPasien value)? getDetailPasien,
    TResult Function(_AddPasien value)? addPasien,
    required TResult orElse(),
  }) {
    if (getOdontogram != null) {
      return getOdontogram(this);
    }
    return orElse();
  }
}

abstract class GetOdontogram implements PasienEvent {
  const factory GetOdontogram({required final String noReg}) =
      _$GetOdontogramImpl;

  String get noReg;
  @JsonKey(ignore: true)
  _$$GetOdontogramImplCopyWith<_$GetOdontogramImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveRawatJalanDokterImplCopyWith<$Res> {
  factory _$$SaveRawatJalanDokterImplCopyWith(_$SaveRawatJalanDokterImpl value,
          $Res Function(_$SaveRawatJalanDokterImpl) then) =
      __$$SaveRawatJalanDokterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AssementRawatJalanModel assementRawatJalanModel});
}

/// @nodoc
class __$$SaveRawatJalanDokterImplCopyWithImpl<$Res>
    extends _$PasienEventCopyWithImpl<$Res, _$SaveRawatJalanDokterImpl>
    implements _$$SaveRawatJalanDokterImplCopyWith<$Res> {
  __$$SaveRawatJalanDokterImplCopyWithImpl(_$SaveRawatJalanDokterImpl _value,
      $Res Function(_$SaveRawatJalanDokterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assementRawatJalanModel = null,
  }) {
    return _then(_$SaveRawatJalanDokterImpl(
      assementRawatJalanModel: null == assementRawatJalanModel
          ? _value.assementRawatJalanModel
          : assementRawatJalanModel // ignore: cast_nullable_to_non_nullable
              as AssementRawatJalanModel,
    ));
  }
}

/// @nodoc

class _$SaveRawatJalanDokterImpl implements SaveRawatJalanDokter {
  const _$SaveRawatJalanDokterImpl({required this.assementRawatJalanModel});

  @override
  final AssementRawatJalanModel assementRawatJalanModel;

  @override
  String toString() {
    return 'PasienEvent.saveRawatJalanDokter(assementRawatJalanModel: $assementRawatJalanModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveRawatJalanDokterImpl &&
            (identical(
                    other.assementRawatJalanModel, assementRawatJalanModel) ||
                other.assementRawatJalanModel == assementRawatJalanModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, assementRawatJalanModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveRawatJalanDokterImplCopyWith<_$SaveRawatJalanDokterImpl>
      get copyWith =>
          __$$SaveRawatJalanDokterImplCopyWithImpl<_$SaveRawatJalanDokterImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)
        saveSkrining,
    required TResult Function(String noRM) riwayatPasien,
    required TResult Function(List<DetailProfilPasienModel> detailProfilePasien)
        addRiwayatPasien,
    required TResult Function(AntreanPasienModel pasien) selectedPasien,
    required TResult Function(SkirningModel skrining) saveStateSkrining,
    required TResult Function(String noReg) getOdontogram,
    required TResult Function(AssementRawatJalanModel assementRawatJalanModel)
        saveRawatJalanDokter,
    required TResult Function(String noReg) uploadOdontogram,
    required TResult Function(String noReg, String picturePath, String kdBagian)
        publishOdontogram,
    required TResult Function(String noReg) getAssmentRawatjalanDokter,
    required TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)
        saveAssesKebEdukasi,
    required TResult Function(String noReg) getKebEdukasi,
    required TResult Function(String noReg) getAssesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi, String keterangan)
        saveOdontogram,
    required TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)
        saveAsesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi) deleteOdontogram,
    required TResult Function(String noReg) getSkrining,
    required TResult Function() started,
    required TResult Function(String norm) selectedNorm,
    required TResult Function(bool enable) addLoadingAnatomi,
    required TResult Function(String keterangan) addKeterangan,
    required TResult Function(
            String nama, String norm, String keterangan, File picturePath)
        simpanAnatomi,
    required TResult Function(
            String nama, String norm, String keterangan, String picturePath)
        saveAnatomi,
    required TResult Function() getAntreanPasien,
    required TResult Function() getKVitalSign,
    required TResult Function(String noRM) getDetailPasien,
    required TResult Function(List<AntreanPasienModel> antreanPasien) addPasien,
  }) {
    return saveRawatJalanDokter(assementRawatJalanModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult? Function(String noRM)? riwayatPasien,
    TResult? Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult? Function(AntreanPasienModel pasien)? selectedPasien,
    TResult? Function(SkirningModel skrining)? saveStateSkrining,
    TResult? Function(String noReg)? getOdontogram,
    TResult? Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult? Function(String noReg)? uploadOdontogram,
    TResult? Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult? Function(String noReg)? getAssmentRawatjalanDokter,
    TResult? Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult? Function(String noReg)? getKebEdukasi,
    TResult? Function(String noReg)? getAssesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult? Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi)? deleteOdontogram,
    TResult? Function(String noReg)? getSkrining,
    TResult? Function()? started,
    TResult? Function(String norm)? selectedNorm,
    TResult? Function(bool enable)? addLoadingAnatomi,
    TResult? Function(String keterangan)? addKeterangan,
    TResult? Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult? Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult? Function()? getAntreanPasien,
    TResult? Function()? getKVitalSign,
    TResult? Function(String noRM)? getDetailPasien,
    TResult? Function(List<AntreanPasienModel> antreanPasien)? addPasien,
  }) {
    return saveRawatJalanDokter?.call(assementRawatJalanModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult Function(String noRM)? riwayatPasien,
    TResult Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult Function(AntreanPasienModel pasien)? selectedPasien,
    TResult Function(SkirningModel skrining)? saveStateSkrining,
    TResult Function(String noReg)? getOdontogram,
    TResult Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult Function(String noReg)? uploadOdontogram,
    TResult Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult Function(String noReg)? getAssmentRawatjalanDokter,
    TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult Function(String noReg)? getKebEdukasi,
    TResult Function(String noReg)? getAssesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi)? deleteOdontogram,
    TResult Function(String noReg)? getSkrining,
    TResult Function()? started,
    TResult Function(String norm)? selectedNorm,
    TResult Function(bool enable)? addLoadingAnatomi,
    TResult Function(String keterangan)? addKeterangan,
    TResult Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult Function()? getAntreanPasien,
    TResult Function()? getKVitalSign,
    TResult Function(String noRM)? getDetailPasien,
    TResult Function(List<AntreanPasienModel> antreanPasien)? addPasien,
    required TResult orElse(),
  }) {
    if (saveRawatJalanDokter != null) {
      return saveRawatJalanDokter(assementRawatJalanModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveSkrining value) saveSkrining,
    required TResult Function(RiwayatPasien value) riwayatPasien,
    required TResult Function(addRiwayatPasien value) addRiwayatPasien,
    required TResult Function(SelectedPasien value) selectedPasien,
    required TResult Function(SaveStateSkrining value) saveStateSkrining,
    required TResult Function(GetOdontogram value) getOdontogram,
    required TResult Function(SaveRawatJalanDokter value) saveRawatJalanDokter,
    required TResult Function(UploadOdontogram value) uploadOdontogram,
    required TResult Function(PublishOdontogram value) publishOdontogram,
    required TResult Function(GetAssmentRawatjalanDokter value)
        getAssmentRawatjalanDokter,
    required TResult Function(SaveAssesKebEdukasi value) saveAssesKebEdukasi,
    required TResult Function(GetKebEdukasi value) getKebEdukasi,
    required TResult Function(GetAssesRawatJalanPerawat value)
        getAssesRawatJalanPerawat,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_SaveAsesRawatJalanPerawat value)
        saveAsesRawatJalanPerawat,
    required TResult Function(_DeleteOdontogram value) deleteOdontogram,
    required TResult Function(_GetSkrining value) getSkrining,
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedNorm value) selectedNorm,
    required TResult Function(_AddLoadingAnatomi value) addLoadingAnatomi,
    required TResult Function(_AddKeterangan value) addKeterangan,
    required TResult Function(_SimpanAnatomi value) simpanAnatomi,
    required TResult Function(_SaveAnatomi value) saveAnatomi,
    required TResult Function(_GetAntreanPasien value) getAntreanPasien,
    required TResult Function(_GetKVitalSign value) getKVitalSign,
    required TResult Function(_GetDetailPasien value) getDetailPasien,
    required TResult Function(_AddPasien value) addPasien,
  }) {
    return saveRawatJalanDokter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveSkrining value)? saveSkrining,
    TResult? Function(RiwayatPasien value)? riwayatPasien,
    TResult? Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult? Function(SelectedPasien value)? selectedPasien,
    TResult? Function(SaveStateSkrining value)? saveStateSkrining,
    TResult? Function(GetOdontogram value)? getOdontogram,
    TResult? Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult? Function(UploadOdontogram value)? uploadOdontogram,
    TResult? Function(PublishOdontogram value)? publishOdontogram,
    TResult? Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult? Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult? Function(GetKebEdukasi value)? getKebEdukasi,
    TResult? Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult? Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult? Function(_GetSkrining value)? getSkrining,
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedNorm value)? selectedNorm,
    TResult? Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult? Function(_AddKeterangan value)? addKeterangan,
    TResult? Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult? Function(_SaveAnatomi value)? saveAnatomi,
    TResult? Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult? Function(_GetKVitalSign value)? getKVitalSign,
    TResult? Function(_GetDetailPasien value)? getDetailPasien,
    TResult? Function(_AddPasien value)? addPasien,
  }) {
    return saveRawatJalanDokter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveSkrining value)? saveSkrining,
    TResult Function(RiwayatPasien value)? riwayatPasien,
    TResult Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult Function(SelectedPasien value)? selectedPasien,
    TResult Function(SaveStateSkrining value)? saveStateSkrining,
    TResult Function(GetOdontogram value)? getOdontogram,
    TResult Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult Function(UploadOdontogram value)? uploadOdontogram,
    TResult Function(PublishOdontogram value)? publishOdontogram,
    TResult Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult Function(GetKebEdukasi value)? getKebEdukasi,
    TResult Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult Function(_GetSkrining value)? getSkrining,
    TResult Function(_Started value)? started,
    TResult Function(_SelectedNorm value)? selectedNorm,
    TResult Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult Function(_AddKeterangan value)? addKeterangan,
    TResult Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult Function(_SaveAnatomi value)? saveAnatomi,
    TResult Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult Function(_GetKVitalSign value)? getKVitalSign,
    TResult Function(_GetDetailPasien value)? getDetailPasien,
    TResult Function(_AddPasien value)? addPasien,
    required TResult orElse(),
  }) {
    if (saveRawatJalanDokter != null) {
      return saveRawatJalanDokter(this);
    }
    return orElse();
  }
}

abstract class SaveRawatJalanDokter implements PasienEvent {
  const factory SaveRawatJalanDokter(
          {required final AssementRawatJalanModel assementRawatJalanModel}) =
      _$SaveRawatJalanDokterImpl;

  AssementRawatJalanModel get assementRawatJalanModel;
  @JsonKey(ignore: true)
  _$$SaveRawatJalanDokterImplCopyWith<_$SaveRawatJalanDokterImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UploadOdontogramImplCopyWith<$Res> {
  factory _$$UploadOdontogramImplCopyWith(_$UploadOdontogramImpl value,
          $Res Function(_$UploadOdontogramImpl) then) =
      __$$UploadOdontogramImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String noReg});
}

/// @nodoc
class __$$UploadOdontogramImplCopyWithImpl<$Res>
    extends _$PasienEventCopyWithImpl<$Res, _$UploadOdontogramImpl>
    implements _$$UploadOdontogramImplCopyWith<$Res> {
  __$$UploadOdontogramImplCopyWithImpl(_$UploadOdontogramImpl _value,
      $Res Function(_$UploadOdontogramImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noReg = null,
  }) {
    return _then(_$UploadOdontogramImpl(
      noReg: null == noReg
          ? _value.noReg
          : noReg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UploadOdontogramImpl implements UploadOdontogram {
  const _$UploadOdontogramImpl({required this.noReg});

  @override
  final String noReg;

  @override
  String toString() {
    return 'PasienEvent.uploadOdontogram(noReg: $noReg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadOdontogramImpl &&
            (identical(other.noReg, noReg) || other.noReg == noReg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, noReg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadOdontogramImplCopyWith<_$UploadOdontogramImpl> get copyWith =>
      __$$UploadOdontogramImplCopyWithImpl<_$UploadOdontogramImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)
        saveSkrining,
    required TResult Function(String noRM) riwayatPasien,
    required TResult Function(List<DetailProfilPasienModel> detailProfilePasien)
        addRiwayatPasien,
    required TResult Function(AntreanPasienModel pasien) selectedPasien,
    required TResult Function(SkirningModel skrining) saveStateSkrining,
    required TResult Function(String noReg) getOdontogram,
    required TResult Function(AssementRawatJalanModel assementRawatJalanModel)
        saveRawatJalanDokter,
    required TResult Function(String noReg) uploadOdontogram,
    required TResult Function(String noReg, String picturePath, String kdBagian)
        publishOdontogram,
    required TResult Function(String noReg) getAssmentRawatjalanDokter,
    required TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)
        saveAssesKebEdukasi,
    required TResult Function(String noReg) getKebEdukasi,
    required TResult Function(String noReg) getAssesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi, String keterangan)
        saveOdontogram,
    required TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)
        saveAsesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi) deleteOdontogram,
    required TResult Function(String noReg) getSkrining,
    required TResult Function() started,
    required TResult Function(String norm) selectedNorm,
    required TResult Function(bool enable) addLoadingAnatomi,
    required TResult Function(String keterangan) addKeterangan,
    required TResult Function(
            String nama, String norm, String keterangan, File picturePath)
        simpanAnatomi,
    required TResult Function(
            String nama, String norm, String keterangan, String picturePath)
        saveAnatomi,
    required TResult Function() getAntreanPasien,
    required TResult Function() getKVitalSign,
    required TResult Function(String noRM) getDetailPasien,
    required TResult Function(List<AntreanPasienModel> antreanPasien) addPasien,
  }) {
    return uploadOdontogram(noReg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult? Function(String noRM)? riwayatPasien,
    TResult? Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult? Function(AntreanPasienModel pasien)? selectedPasien,
    TResult? Function(SkirningModel skrining)? saveStateSkrining,
    TResult? Function(String noReg)? getOdontogram,
    TResult? Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult? Function(String noReg)? uploadOdontogram,
    TResult? Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult? Function(String noReg)? getAssmentRawatjalanDokter,
    TResult? Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult? Function(String noReg)? getKebEdukasi,
    TResult? Function(String noReg)? getAssesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult? Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi)? deleteOdontogram,
    TResult? Function(String noReg)? getSkrining,
    TResult? Function()? started,
    TResult? Function(String norm)? selectedNorm,
    TResult? Function(bool enable)? addLoadingAnatomi,
    TResult? Function(String keterangan)? addKeterangan,
    TResult? Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult? Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult? Function()? getAntreanPasien,
    TResult? Function()? getKVitalSign,
    TResult? Function(String noRM)? getDetailPasien,
    TResult? Function(List<AntreanPasienModel> antreanPasien)? addPasien,
  }) {
    return uploadOdontogram?.call(noReg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult Function(String noRM)? riwayatPasien,
    TResult Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult Function(AntreanPasienModel pasien)? selectedPasien,
    TResult Function(SkirningModel skrining)? saveStateSkrining,
    TResult Function(String noReg)? getOdontogram,
    TResult Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult Function(String noReg)? uploadOdontogram,
    TResult Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult Function(String noReg)? getAssmentRawatjalanDokter,
    TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult Function(String noReg)? getKebEdukasi,
    TResult Function(String noReg)? getAssesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi)? deleteOdontogram,
    TResult Function(String noReg)? getSkrining,
    TResult Function()? started,
    TResult Function(String norm)? selectedNorm,
    TResult Function(bool enable)? addLoadingAnatomi,
    TResult Function(String keterangan)? addKeterangan,
    TResult Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult Function()? getAntreanPasien,
    TResult Function()? getKVitalSign,
    TResult Function(String noRM)? getDetailPasien,
    TResult Function(List<AntreanPasienModel> antreanPasien)? addPasien,
    required TResult orElse(),
  }) {
    if (uploadOdontogram != null) {
      return uploadOdontogram(noReg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveSkrining value) saveSkrining,
    required TResult Function(RiwayatPasien value) riwayatPasien,
    required TResult Function(addRiwayatPasien value) addRiwayatPasien,
    required TResult Function(SelectedPasien value) selectedPasien,
    required TResult Function(SaveStateSkrining value) saveStateSkrining,
    required TResult Function(GetOdontogram value) getOdontogram,
    required TResult Function(SaveRawatJalanDokter value) saveRawatJalanDokter,
    required TResult Function(UploadOdontogram value) uploadOdontogram,
    required TResult Function(PublishOdontogram value) publishOdontogram,
    required TResult Function(GetAssmentRawatjalanDokter value)
        getAssmentRawatjalanDokter,
    required TResult Function(SaveAssesKebEdukasi value) saveAssesKebEdukasi,
    required TResult Function(GetKebEdukasi value) getKebEdukasi,
    required TResult Function(GetAssesRawatJalanPerawat value)
        getAssesRawatJalanPerawat,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_SaveAsesRawatJalanPerawat value)
        saveAsesRawatJalanPerawat,
    required TResult Function(_DeleteOdontogram value) deleteOdontogram,
    required TResult Function(_GetSkrining value) getSkrining,
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedNorm value) selectedNorm,
    required TResult Function(_AddLoadingAnatomi value) addLoadingAnatomi,
    required TResult Function(_AddKeterangan value) addKeterangan,
    required TResult Function(_SimpanAnatomi value) simpanAnatomi,
    required TResult Function(_SaveAnatomi value) saveAnatomi,
    required TResult Function(_GetAntreanPasien value) getAntreanPasien,
    required TResult Function(_GetKVitalSign value) getKVitalSign,
    required TResult Function(_GetDetailPasien value) getDetailPasien,
    required TResult Function(_AddPasien value) addPasien,
  }) {
    return uploadOdontogram(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveSkrining value)? saveSkrining,
    TResult? Function(RiwayatPasien value)? riwayatPasien,
    TResult? Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult? Function(SelectedPasien value)? selectedPasien,
    TResult? Function(SaveStateSkrining value)? saveStateSkrining,
    TResult? Function(GetOdontogram value)? getOdontogram,
    TResult? Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult? Function(UploadOdontogram value)? uploadOdontogram,
    TResult? Function(PublishOdontogram value)? publishOdontogram,
    TResult? Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult? Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult? Function(GetKebEdukasi value)? getKebEdukasi,
    TResult? Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult? Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult? Function(_GetSkrining value)? getSkrining,
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedNorm value)? selectedNorm,
    TResult? Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult? Function(_AddKeterangan value)? addKeterangan,
    TResult? Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult? Function(_SaveAnatomi value)? saveAnatomi,
    TResult? Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult? Function(_GetKVitalSign value)? getKVitalSign,
    TResult? Function(_GetDetailPasien value)? getDetailPasien,
    TResult? Function(_AddPasien value)? addPasien,
  }) {
    return uploadOdontogram?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveSkrining value)? saveSkrining,
    TResult Function(RiwayatPasien value)? riwayatPasien,
    TResult Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult Function(SelectedPasien value)? selectedPasien,
    TResult Function(SaveStateSkrining value)? saveStateSkrining,
    TResult Function(GetOdontogram value)? getOdontogram,
    TResult Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult Function(UploadOdontogram value)? uploadOdontogram,
    TResult Function(PublishOdontogram value)? publishOdontogram,
    TResult Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult Function(GetKebEdukasi value)? getKebEdukasi,
    TResult Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult Function(_GetSkrining value)? getSkrining,
    TResult Function(_Started value)? started,
    TResult Function(_SelectedNorm value)? selectedNorm,
    TResult Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult Function(_AddKeterangan value)? addKeterangan,
    TResult Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult Function(_SaveAnatomi value)? saveAnatomi,
    TResult Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult Function(_GetKVitalSign value)? getKVitalSign,
    TResult Function(_GetDetailPasien value)? getDetailPasien,
    TResult Function(_AddPasien value)? addPasien,
    required TResult orElse(),
  }) {
    if (uploadOdontogram != null) {
      return uploadOdontogram(this);
    }
    return orElse();
  }
}

abstract class UploadOdontogram implements PasienEvent {
  const factory UploadOdontogram({required final String noReg}) =
      _$UploadOdontogramImpl;

  String get noReg;
  @JsonKey(ignore: true)
  _$$UploadOdontogramImplCopyWith<_$UploadOdontogramImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PublishOdontogramImplCopyWith<$Res> {
  factory _$$PublishOdontogramImplCopyWith(_$PublishOdontogramImpl value,
          $Res Function(_$PublishOdontogramImpl) then) =
      __$$PublishOdontogramImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String noReg, String picturePath, String kdBagian});
}

/// @nodoc
class __$$PublishOdontogramImplCopyWithImpl<$Res>
    extends _$PasienEventCopyWithImpl<$Res, _$PublishOdontogramImpl>
    implements _$$PublishOdontogramImplCopyWith<$Res> {
  __$$PublishOdontogramImplCopyWithImpl(_$PublishOdontogramImpl _value,
      $Res Function(_$PublishOdontogramImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noReg = null,
    Object? picturePath = null,
    Object? kdBagian = null,
  }) {
    return _then(_$PublishOdontogramImpl(
      noReg: null == noReg
          ? _value.noReg
          : noReg // ignore: cast_nullable_to_non_nullable
              as String,
      picturePath: null == picturePath
          ? _value.picturePath
          : picturePath // ignore: cast_nullable_to_non_nullable
              as String,
      kdBagian: null == kdBagian
          ? _value.kdBagian
          : kdBagian // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PublishOdontogramImpl implements PublishOdontogram {
  const _$PublishOdontogramImpl(
      {required this.noReg, required this.picturePath, required this.kdBagian});

  @override
  final String noReg;
  @override
  final String picturePath;
  @override
  final String kdBagian;

  @override
  String toString() {
    return 'PasienEvent.publishOdontogram(noReg: $noReg, picturePath: $picturePath, kdBagian: $kdBagian)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublishOdontogramImpl &&
            (identical(other.noReg, noReg) || other.noReg == noReg) &&
            (identical(other.picturePath, picturePath) ||
                other.picturePath == picturePath) &&
            (identical(other.kdBagian, kdBagian) ||
                other.kdBagian == kdBagian));
  }

  @override
  int get hashCode => Object.hash(runtimeType, noReg, picturePath, kdBagian);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PublishOdontogramImplCopyWith<_$PublishOdontogramImpl> get copyWith =>
      __$$PublishOdontogramImplCopyWithImpl<_$PublishOdontogramImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)
        saveSkrining,
    required TResult Function(String noRM) riwayatPasien,
    required TResult Function(List<DetailProfilPasienModel> detailProfilePasien)
        addRiwayatPasien,
    required TResult Function(AntreanPasienModel pasien) selectedPasien,
    required TResult Function(SkirningModel skrining) saveStateSkrining,
    required TResult Function(String noReg) getOdontogram,
    required TResult Function(AssementRawatJalanModel assementRawatJalanModel)
        saveRawatJalanDokter,
    required TResult Function(String noReg) uploadOdontogram,
    required TResult Function(String noReg, String picturePath, String kdBagian)
        publishOdontogram,
    required TResult Function(String noReg) getAssmentRawatjalanDokter,
    required TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)
        saveAssesKebEdukasi,
    required TResult Function(String noReg) getKebEdukasi,
    required TResult Function(String noReg) getAssesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi, String keterangan)
        saveOdontogram,
    required TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)
        saveAsesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi) deleteOdontogram,
    required TResult Function(String noReg) getSkrining,
    required TResult Function() started,
    required TResult Function(String norm) selectedNorm,
    required TResult Function(bool enable) addLoadingAnatomi,
    required TResult Function(String keterangan) addKeterangan,
    required TResult Function(
            String nama, String norm, String keterangan, File picturePath)
        simpanAnatomi,
    required TResult Function(
            String nama, String norm, String keterangan, String picturePath)
        saveAnatomi,
    required TResult Function() getAntreanPasien,
    required TResult Function() getKVitalSign,
    required TResult Function(String noRM) getDetailPasien,
    required TResult Function(List<AntreanPasienModel> antreanPasien) addPasien,
  }) {
    return publishOdontogram(noReg, picturePath, kdBagian);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult? Function(String noRM)? riwayatPasien,
    TResult? Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult? Function(AntreanPasienModel pasien)? selectedPasien,
    TResult? Function(SkirningModel skrining)? saveStateSkrining,
    TResult? Function(String noReg)? getOdontogram,
    TResult? Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult? Function(String noReg)? uploadOdontogram,
    TResult? Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult? Function(String noReg)? getAssmentRawatjalanDokter,
    TResult? Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult? Function(String noReg)? getKebEdukasi,
    TResult? Function(String noReg)? getAssesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult? Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi)? deleteOdontogram,
    TResult? Function(String noReg)? getSkrining,
    TResult? Function()? started,
    TResult? Function(String norm)? selectedNorm,
    TResult? Function(bool enable)? addLoadingAnatomi,
    TResult? Function(String keterangan)? addKeterangan,
    TResult? Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult? Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult? Function()? getAntreanPasien,
    TResult? Function()? getKVitalSign,
    TResult? Function(String noRM)? getDetailPasien,
    TResult? Function(List<AntreanPasienModel> antreanPasien)? addPasien,
  }) {
    return publishOdontogram?.call(noReg, picturePath, kdBagian);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult Function(String noRM)? riwayatPasien,
    TResult Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult Function(AntreanPasienModel pasien)? selectedPasien,
    TResult Function(SkirningModel skrining)? saveStateSkrining,
    TResult Function(String noReg)? getOdontogram,
    TResult Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult Function(String noReg)? uploadOdontogram,
    TResult Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult Function(String noReg)? getAssmentRawatjalanDokter,
    TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult Function(String noReg)? getKebEdukasi,
    TResult Function(String noReg)? getAssesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi)? deleteOdontogram,
    TResult Function(String noReg)? getSkrining,
    TResult Function()? started,
    TResult Function(String norm)? selectedNorm,
    TResult Function(bool enable)? addLoadingAnatomi,
    TResult Function(String keterangan)? addKeterangan,
    TResult Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult Function()? getAntreanPasien,
    TResult Function()? getKVitalSign,
    TResult Function(String noRM)? getDetailPasien,
    TResult Function(List<AntreanPasienModel> antreanPasien)? addPasien,
    required TResult orElse(),
  }) {
    if (publishOdontogram != null) {
      return publishOdontogram(noReg, picturePath, kdBagian);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveSkrining value) saveSkrining,
    required TResult Function(RiwayatPasien value) riwayatPasien,
    required TResult Function(addRiwayatPasien value) addRiwayatPasien,
    required TResult Function(SelectedPasien value) selectedPasien,
    required TResult Function(SaveStateSkrining value) saveStateSkrining,
    required TResult Function(GetOdontogram value) getOdontogram,
    required TResult Function(SaveRawatJalanDokter value) saveRawatJalanDokter,
    required TResult Function(UploadOdontogram value) uploadOdontogram,
    required TResult Function(PublishOdontogram value) publishOdontogram,
    required TResult Function(GetAssmentRawatjalanDokter value)
        getAssmentRawatjalanDokter,
    required TResult Function(SaveAssesKebEdukasi value) saveAssesKebEdukasi,
    required TResult Function(GetKebEdukasi value) getKebEdukasi,
    required TResult Function(GetAssesRawatJalanPerawat value)
        getAssesRawatJalanPerawat,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_SaveAsesRawatJalanPerawat value)
        saveAsesRawatJalanPerawat,
    required TResult Function(_DeleteOdontogram value) deleteOdontogram,
    required TResult Function(_GetSkrining value) getSkrining,
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedNorm value) selectedNorm,
    required TResult Function(_AddLoadingAnatomi value) addLoadingAnatomi,
    required TResult Function(_AddKeterangan value) addKeterangan,
    required TResult Function(_SimpanAnatomi value) simpanAnatomi,
    required TResult Function(_SaveAnatomi value) saveAnatomi,
    required TResult Function(_GetAntreanPasien value) getAntreanPasien,
    required TResult Function(_GetKVitalSign value) getKVitalSign,
    required TResult Function(_GetDetailPasien value) getDetailPasien,
    required TResult Function(_AddPasien value) addPasien,
  }) {
    return publishOdontogram(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveSkrining value)? saveSkrining,
    TResult? Function(RiwayatPasien value)? riwayatPasien,
    TResult? Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult? Function(SelectedPasien value)? selectedPasien,
    TResult? Function(SaveStateSkrining value)? saveStateSkrining,
    TResult? Function(GetOdontogram value)? getOdontogram,
    TResult? Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult? Function(UploadOdontogram value)? uploadOdontogram,
    TResult? Function(PublishOdontogram value)? publishOdontogram,
    TResult? Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult? Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult? Function(GetKebEdukasi value)? getKebEdukasi,
    TResult? Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult? Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult? Function(_GetSkrining value)? getSkrining,
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedNorm value)? selectedNorm,
    TResult? Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult? Function(_AddKeterangan value)? addKeterangan,
    TResult? Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult? Function(_SaveAnatomi value)? saveAnatomi,
    TResult? Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult? Function(_GetKVitalSign value)? getKVitalSign,
    TResult? Function(_GetDetailPasien value)? getDetailPasien,
    TResult? Function(_AddPasien value)? addPasien,
  }) {
    return publishOdontogram?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveSkrining value)? saveSkrining,
    TResult Function(RiwayatPasien value)? riwayatPasien,
    TResult Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult Function(SelectedPasien value)? selectedPasien,
    TResult Function(SaveStateSkrining value)? saveStateSkrining,
    TResult Function(GetOdontogram value)? getOdontogram,
    TResult Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult Function(UploadOdontogram value)? uploadOdontogram,
    TResult Function(PublishOdontogram value)? publishOdontogram,
    TResult Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult Function(GetKebEdukasi value)? getKebEdukasi,
    TResult Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult Function(_GetSkrining value)? getSkrining,
    TResult Function(_Started value)? started,
    TResult Function(_SelectedNorm value)? selectedNorm,
    TResult Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult Function(_AddKeterangan value)? addKeterangan,
    TResult Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult Function(_SaveAnatomi value)? saveAnatomi,
    TResult Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult Function(_GetKVitalSign value)? getKVitalSign,
    TResult Function(_GetDetailPasien value)? getDetailPasien,
    TResult Function(_AddPasien value)? addPasien,
    required TResult orElse(),
  }) {
    if (publishOdontogram != null) {
      return publishOdontogram(this);
    }
    return orElse();
  }
}

abstract class PublishOdontogram implements PasienEvent {
  const factory PublishOdontogram(
      {required final String noReg,
      required final String picturePath,
      required final String kdBagian}) = _$PublishOdontogramImpl;

  String get noReg;
  String get picturePath;
  String get kdBagian;
  @JsonKey(ignore: true)
  _$$PublishOdontogramImplCopyWith<_$PublishOdontogramImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetAssmentRawatjalanDokterImplCopyWith<$Res> {
  factory _$$GetAssmentRawatjalanDokterImplCopyWith(
          _$GetAssmentRawatjalanDokterImpl value,
          $Res Function(_$GetAssmentRawatjalanDokterImpl) then) =
      __$$GetAssmentRawatjalanDokterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String noReg});
}

/// @nodoc
class __$$GetAssmentRawatjalanDokterImplCopyWithImpl<$Res>
    extends _$PasienEventCopyWithImpl<$Res, _$GetAssmentRawatjalanDokterImpl>
    implements _$$GetAssmentRawatjalanDokterImplCopyWith<$Res> {
  __$$GetAssmentRawatjalanDokterImplCopyWithImpl(
      _$GetAssmentRawatjalanDokterImpl _value,
      $Res Function(_$GetAssmentRawatjalanDokterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noReg = null,
  }) {
    return _then(_$GetAssmentRawatjalanDokterImpl(
      noReg: null == noReg
          ? _value.noReg
          : noReg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetAssmentRawatjalanDokterImpl implements GetAssmentRawatjalanDokter {
  const _$GetAssmentRawatjalanDokterImpl({required this.noReg});

  @override
  final String noReg;

  @override
  String toString() {
    return 'PasienEvent.getAssmentRawatjalanDokter(noReg: $noReg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAssmentRawatjalanDokterImpl &&
            (identical(other.noReg, noReg) || other.noReg == noReg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, noReg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAssmentRawatjalanDokterImplCopyWith<_$GetAssmentRawatjalanDokterImpl>
      get copyWith => __$$GetAssmentRawatjalanDokterImplCopyWithImpl<
          _$GetAssmentRawatjalanDokterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)
        saveSkrining,
    required TResult Function(String noRM) riwayatPasien,
    required TResult Function(List<DetailProfilPasienModel> detailProfilePasien)
        addRiwayatPasien,
    required TResult Function(AntreanPasienModel pasien) selectedPasien,
    required TResult Function(SkirningModel skrining) saveStateSkrining,
    required TResult Function(String noReg) getOdontogram,
    required TResult Function(AssementRawatJalanModel assementRawatJalanModel)
        saveRawatJalanDokter,
    required TResult Function(String noReg) uploadOdontogram,
    required TResult Function(String noReg, String picturePath, String kdBagian)
        publishOdontogram,
    required TResult Function(String noReg) getAssmentRawatjalanDokter,
    required TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)
        saveAssesKebEdukasi,
    required TResult Function(String noReg) getKebEdukasi,
    required TResult Function(String noReg) getAssesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi, String keterangan)
        saveOdontogram,
    required TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)
        saveAsesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi) deleteOdontogram,
    required TResult Function(String noReg) getSkrining,
    required TResult Function() started,
    required TResult Function(String norm) selectedNorm,
    required TResult Function(bool enable) addLoadingAnatomi,
    required TResult Function(String keterangan) addKeterangan,
    required TResult Function(
            String nama, String norm, String keterangan, File picturePath)
        simpanAnatomi,
    required TResult Function(
            String nama, String norm, String keterangan, String picturePath)
        saveAnatomi,
    required TResult Function() getAntreanPasien,
    required TResult Function() getKVitalSign,
    required TResult Function(String noRM) getDetailPasien,
    required TResult Function(List<AntreanPasienModel> antreanPasien) addPasien,
  }) {
    return getAssmentRawatjalanDokter(noReg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult? Function(String noRM)? riwayatPasien,
    TResult? Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult? Function(AntreanPasienModel pasien)? selectedPasien,
    TResult? Function(SkirningModel skrining)? saveStateSkrining,
    TResult? Function(String noReg)? getOdontogram,
    TResult? Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult? Function(String noReg)? uploadOdontogram,
    TResult? Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult? Function(String noReg)? getAssmentRawatjalanDokter,
    TResult? Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult? Function(String noReg)? getKebEdukasi,
    TResult? Function(String noReg)? getAssesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult? Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi)? deleteOdontogram,
    TResult? Function(String noReg)? getSkrining,
    TResult? Function()? started,
    TResult? Function(String norm)? selectedNorm,
    TResult? Function(bool enable)? addLoadingAnatomi,
    TResult? Function(String keterangan)? addKeterangan,
    TResult? Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult? Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult? Function()? getAntreanPasien,
    TResult? Function()? getKVitalSign,
    TResult? Function(String noRM)? getDetailPasien,
    TResult? Function(List<AntreanPasienModel> antreanPasien)? addPasien,
  }) {
    return getAssmentRawatjalanDokter?.call(noReg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult Function(String noRM)? riwayatPasien,
    TResult Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult Function(AntreanPasienModel pasien)? selectedPasien,
    TResult Function(SkirningModel skrining)? saveStateSkrining,
    TResult Function(String noReg)? getOdontogram,
    TResult Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult Function(String noReg)? uploadOdontogram,
    TResult Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult Function(String noReg)? getAssmentRawatjalanDokter,
    TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult Function(String noReg)? getKebEdukasi,
    TResult Function(String noReg)? getAssesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi)? deleteOdontogram,
    TResult Function(String noReg)? getSkrining,
    TResult Function()? started,
    TResult Function(String norm)? selectedNorm,
    TResult Function(bool enable)? addLoadingAnatomi,
    TResult Function(String keterangan)? addKeterangan,
    TResult Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult Function()? getAntreanPasien,
    TResult Function()? getKVitalSign,
    TResult Function(String noRM)? getDetailPasien,
    TResult Function(List<AntreanPasienModel> antreanPasien)? addPasien,
    required TResult orElse(),
  }) {
    if (getAssmentRawatjalanDokter != null) {
      return getAssmentRawatjalanDokter(noReg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveSkrining value) saveSkrining,
    required TResult Function(RiwayatPasien value) riwayatPasien,
    required TResult Function(addRiwayatPasien value) addRiwayatPasien,
    required TResult Function(SelectedPasien value) selectedPasien,
    required TResult Function(SaveStateSkrining value) saveStateSkrining,
    required TResult Function(GetOdontogram value) getOdontogram,
    required TResult Function(SaveRawatJalanDokter value) saveRawatJalanDokter,
    required TResult Function(UploadOdontogram value) uploadOdontogram,
    required TResult Function(PublishOdontogram value) publishOdontogram,
    required TResult Function(GetAssmentRawatjalanDokter value)
        getAssmentRawatjalanDokter,
    required TResult Function(SaveAssesKebEdukasi value) saveAssesKebEdukasi,
    required TResult Function(GetKebEdukasi value) getKebEdukasi,
    required TResult Function(GetAssesRawatJalanPerawat value)
        getAssesRawatJalanPerawat,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_SaveAsesRawatJalanPerawat value)
        saveAsesRawatJalanPerawat,
    required TResult Function(_DeleteOdontogram value) deleteOdontogram,
    required TResult Function(_GetSkrining value) getSkrining,
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedNorm value) selectedNorm,
    required TResult Function(_AddLoadingAnatomi value) addLoadingAnatomi,
    required TResult Function(_AddKeterangan value) addKeterangan,
    required TResult Function(_SimpanAnatomi value) simpanAnatomi,
    required TResult Function(_SaveAnatomi value) saveAnatomi,
    required TResult Function(_GetAntreanPasien value) getAntreanPasien,
    required TResult Function(_GetKVitalSign value) getKVitalSign,
    required TResult Function(_GetDetailPasien value) getDetailPasien,
    required TResult Function(_AddPasien value) addPasien,
  }) {
    return getAssmentRawatjalanDokter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveSkrining value)? saveSkrining,
    TResult? Function(RiwayatPasien value)? riwayatPasien,
    TResult? Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult? Function(SelectedPasien value)? selectedPasien,
    TResult? Function(SaveStateSkrining value)? saveStateSkrining,
    TResult? Function(GetOdontogram value)? getOdontogram,
    TResult? Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult? Function(UploadOdontogram value)? uploadOdontogram,
    TResult? Function(PublishOdontogram value)? publishOdontogram,
    TResult? Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult? Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult? Function(GetKebEdukasi value)? getKebEdukasi,
    TResult? Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult? Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult? Function(_GetSkrining value)? getSkrining,
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedNorm value)? selectedNorm,
    TResult? Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult? Function(_AddKeterangan value)? addKeterangan,
    TResult? Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult? Function(_SaveAnatomi value)? saveAnatomi,
    TResult? Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult? Function(_GetKVitalSign value)? getKVitalSign,
    TResult? Function(_GetDetailPasien value)? getDetailPasien,
    TResult? Function(_AddPasien value)? addPasien,
  }) {
    return getAssmentRawatjalanDokter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveSkrining value)? saveSkrining,
    TResult Function(RiwayatPasien value)? riwayatPasien,
    TResult Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult Function(SelectedPasien value)? selectedPasien,
    TResult Function(SaveStateSkrining value)? saveStateSkrining,
    TResult Function(GetOdontogram value)? getOdontogram,
    TResult Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult Function(UploadOdontogram value)? uploadOdontogram,
    TResult Function(PublishOdontogram value)? publishOdontogram,
    TResult Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult Function(GetKebEdukasi value)? getKebEdukasi,
    TResult Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult Function(_GetSkrining value)? getSkrining,
    TResult Function(_Started value)? started,
    TResult Function(_SelectedNorm value)? selectedNorm,
    TResult Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult Function(_AddKeterangan value)? addKeterangan,
    TResult Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult Function(_SaveAnatomi value)? saveAnatomi,
    TResult Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult Function(_GetKVitalSign value)? getKVitalSign,
    TResult Function(_GetDetailPasien value)? getDetailPasien,
    TResult Function(_AddPasien value)? addPasien,
    required TResult orElse(),
  }) {
    if (getAssmentRawatjalanDokter != null) {
      return getAssmentRawatjalanDokter(this);
    }
    return orElse();
  }
}

abstract class GetAssmentRawatjalanDokter implements PasienEvent {
  const factory GetAssmentRawatjalanDokter({required final String noReg}) =
      _$GetAssmentRawatjalanDokterImpl;

  String get noReg;
  @JsonKey(ignore: true)
  _$$GetAssmentRawatjalanDokterImplCopyWith<_$GetAssmentRawatjalanDokterImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveAssesKebEdukasiImplCopyWith<$Res> {
  factory _$$SaveAssesKebEdukasiImplCopyWith(_$SaveAssesKebEdukasiImpl value,
          $Res Function(_$SaveAssesKebEdukasiImpl) then) =
      __$$SaveAssesKebEdukasiImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AssementKebEdukasiModel assementKebEdukasiModel});
}

/// @nodoc
class __$$SaveAssesKebEdukasiImplCopyWithImpl<$Res>
    extends _$PasienEventCopyWithImpl<$Res, _$SaveAssesKebEdukasiImpl>
    implements _$$SaveAssesKebEdukasiImplCopyWith<$Res> {
  __$$SaveAssesKebEdukasiImplCopyWithImpl(_$SaveAssesKebEdukasiImpl _value,
      $Res Function(_$SaveAssesKebEdukasiImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assementKebEdukasiModel = null,
  }) {
    return _then(_$SaveAssesKebEdukasiImpl(
      assementKebEdukasiModel: null == assementKebEdukasiModel
          ? _value.assementKebEdukasiModel
          : assementKebEdukasiModel // ignore: cast_nullable_to_non_nullable
              as AssementKebEdukasiModel,
    ));
  }
}

/// @nodoc

class _$SaveAssesKebEdukasiImpl implements SaveAssesKebEdukasi {
  const _$SaveAssesKebEdukasiImpl({required this.assementKebEdukasiModel});

  @override
  final AssementKebEdukasiModel assementKebEdukasiModel;

  @override
  String toString() {
    return 'PasienEvent.saveAssesKebEdukasi(assementKebEdukasiModel: $assementKebEdukasiModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveAssesKebEdukasiImpl &&
            (identical(
                    other.assementKebEdukasiModel, assementKebEdukasiModel) ||
                other.assementKebEdukasiModel == assementKebEdukasiModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, assementKebEdukasiModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveAssesKebEdukasiImplCopyWith<_$SaveAssesKebEdukasiImpl> get copyWith =>
      __$$SaveAssesKebEdukasiImplCopyWithImpl<_$SaveAssesKebEdukasiImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)
        saveSkrining,
    required TResult Function(String noRM) riwayatPasien,
    required TResult Function(List<DetailProfilPasienModel> detailProfilePasien)
        addRiwayatPasien,
    required TResult Function(AntreanPasienModel pasien) selectedPasien,
    required TResult Function(SkirningModel skrining) saveStateSkrining,
    required TResult Function(String noReg) getOdontogram,
    required TResult Function(AssementRawatJalanModel assementRawatJalanModel)
        saveRawatJalanDokter,
    required TResult Function(String noReg) uploadOdontogram,
    required TResult Function(String noReg, String picturePath, String kdBagian)
        publishOdontogram,
    required TResult Function(String noReg) getAssmentRawatjalanDokter,
    required TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)
        saveAssesKebEdukasi,
    required TResult Function(String noReg) getKebEdukasi,
    required TResult Function(String noReg) getAssesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi, String keterangan)
        saveOdontogram,
    required TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)
        saveAsesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi) deleteOdontogram,
    required TResult Function(String noReg) getSkrining,
    required TResult Function() started,
    required TResult Function(String norm) selectedNorm,
    required TResult Function(bool enable) addLoadingAnatomi,
    required TResult Function(String keterangan) addKeterangan,
    required TResult Function(
            String nama, String norm, String keterangan, File picturePath)
        simpanAnatomi,
    required TResult Function(
            String nama, String norm, String keterangan, String picturePath)
        saveAnatomi,
    required TResult Function() getAntreanPasien,
    required TResult Function() getKVitalSign,
    required TResult Function(String noRM) getDetailPasien,
    required TResult Function(List<AntreanPasienModel> antreanPasien) addPasien,
  }) {
    return saveAssesKebEdukasi(assementKebEdukasiModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult? Function(String noRM)? riwayatPasien,
    TResult? Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult? Function(AntreanPasienModel pasien)? selectedPasien,
    TResult? Function(SkirningModel skrining)? saveStateSkrining,
    TResult? Function(String noReg)? getOdontogram,
    TResult? Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult? Function(String noReg)? uploadOdontogram,
    TResult? Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult? Function(String noReg)? getAssmentRawatjalanDokter,
    TResult? Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult? Function(String noReg)? getKebEdukasi,
    TResult? Function(String noReg)? getAssesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult? Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi)? deleteOdontogram,
    TResult? Function(String noReg)? getSkrining,
    TResult? Function()? started,
    TResult? Function(String norm)? selectedNorm,
    TResult? Function(bool enable)? addLoadingAnatomi,
    TResult? Function(String keterangan)? addKeterangan,
    TResult? Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult? Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult? Function()? getAntreanPasien,
    TResult? Function()? getKVitalSign,
    TResult? Function(String noRM)? getDetailPasien,
    TResult? Function(List<AntreanPasienModel> antreanPasien)? addPasien,
  }) {
    return saveAssesKebEdukasi?.call(assementKebEdukasiModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult Function(String noRM)? riwayatPasien,
    TResult Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult Function(AntreanPasienModel pasien)? selectedPasien,
    TResult Function(SkirningModel skrining)? saveStateSkrining,
    TResult Function(String noReg)? getOdontogram,
    TResult Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult Function(String noReg)? uploadOdontogram,
    TResult Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult Function(String noReg)? getAssmentRawatjalanDokter,
    TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult Function(String noReg)? getKebEdukasi,
    TResult Function(String noReg)? getAssesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi)? deleteOdontogram,
    TResult Function(String noReg)? getSkrining,
    TResult Function()? started,
    TResult Function(String norm)? selectedNorm,
    TResult Function(bool enable)? addLoadingAnatomi,
    TResult Function(String keterangan)? addKeterangan,
    TResult Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult Function()? getAntreanPasien,
    TResult Function()? getKVitalSign,
    TResult Function(String noRM)? getDetailPasien,
    TResult Function(List<AntreanPasienModel> antreanPasien)? addPasien,
    required TResult orElse(),
  }) {
    if (saveAssesKebEdukasi != null) {
      return saveAssesKebEdukasi(assementKebEdukasiModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveSkrining value) saveSkrining,
    required TResult Function(RiwayatPasien value) riwayatPasien,
    required TResult Function(addRiwayatPasien value) addRiwayatPasien,
    required TResult Function(SelectedPasien value) selectedPasien,
    required TResult Function(SaveStateSkrining value) saveStateSkrining,
    required TResult Function(GetOdontogram value) getOdontogram,
    required TResult Function(SaveRawatJalanDokter value) saveRawatJalanDokter,
    required TResult Function(UploadOdontogram value) uploadOdontogram,
    required TResult Function(PublishOdontogram value) publishOdontogram,
    required TResult Function(GetAssmentRawatjalanDokter value)
        getAssmentRawatjalanDokter,
    required TResult Function(SaveAssesKebEdukasi value) saveAssesKebEdukasi,
    required TResult Function(GetKebEdukasi value) getKebEdukasi,
    required TResult Function(GetAssesRawatJalanPerawat value)
        getAssesRawatJalanPerawat,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_SaveAsesRawatJalanPerawat value)
        saveAsesRawatJalanPerawat,
    required TResult Function(_DeleteOdontogram value) deleteOdontogram,
    required TResult Function(_GetSkrining value) getSkrining,
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedNorm value) selectedNorm,
    required TResult Function(_AddLoadingAnatomi value) addLoadingAnatomi,
    required TResult Function(_AddKeterangan value) addKeterangan,
    required TResult Function(_SimpanAnatomi value) simpanAnatomi,
    required TResult Function(_SaveAnatomi value) saveAnatomi,
    required TResult Function(_GetAntreanPasien value) getAntreanPasien,
    required TResult Function(_GetKVitalSign value) getKVitalSign,
    required TResult Function(_GetDetailPasien value) getDetailPasien,
    required TResult Function(_AddPasien value) addPasien,
  }) {
    return saveAssesKebEdukasi(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveSkrining value)? saveSkrining,
    TResult? Function(RiwayatPasien value)? riwayatPasien,
    TResult? Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult? Function(SelectedPasien value)? selectedPasien,
    TResult? Function(SaveStateSkrining value)? saveStateSkrining,
    TResult? Function(GetOdontogram value)? getOdontogram,
    TResult? Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult? Function(UploadOdontogram value)? uploadOdontogram,
    TResult? Function(PublishOdontogram value)? publishOdontogram,
    TResult? Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult? Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult? Function(GetKebEdukasi value)? getKebEdukasi,
    TResult? Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult? Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult? Function(_GetSkrining value)? getSkrining,
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedNorm value)? selectedNorm,
    TResult? Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult? Function(_AddKeterangan value)? addKeterangan,
    TResult? Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult? Function(_SaveAnatomi value)? saveAnatomi,
    TResult? Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult? Function(_GetKVitalSign value)? getKVitalSign,
    TResult? Function(_GetDetailPasien value)? getDetailPasien,
    TResult? Function(_AddPasien value)? addPasien,
  }) {
    return saveAssesKebEdukasi?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveSkrining value)? saveSkrining,
    TResult Function(RiwayatPasien value)? riwayatPasien,
    TResult Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult Function(SelectedPasien value)? selectedPasien,
    TResult Function(SaveStateSkrining value)? saveStateSkrining,
    TResult Function(GetOdontogram value)? getOdontogram,
    TResult Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult Function(UploadOdontogram value)? uploadOdontogram,
    TResult Function(PublishOdontogram value)? publishOdontogram,
    TResult Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult Function(GetKebEdukasi value)? getKebEdukasi,
    TResult Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult Function(_GetSkrining value)? getSkrining,
    TResult Function(_Started value)? started,
    TResult Function(_SelectedNorm value)? selectedNorm,
    TResult Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult Function(_AddKeterangan value)? addKeterangan,
    TResult Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult Function(_SaveAnatomi value)? saveAnatomi,
    TResult Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult Function(_GetKVitalSign value)? getKVitalSign,
    TResult Function(_GetDetailPasien value)? getDetailPasien,
    TResult Function(_AddPasien value)? addPasien,
    required TResult orElse(),
  }) {
    if (saveAssesKebEdukasi != null) {
      return saveAssesKebEdukasi(this);
    }
    return orElse();
  }
}

abstract class SaveAssesKebEdukasi implements PasienEvent {
  const factory SaveAssesKebEdukasi(
          {required final AssementKebEdukasiModel assementKebEdukasiModel}) =
      _$SaveAssesKebEdukasiImpl;

  AssementKebEdukasiModel get assementKebEdukasiModel;
  @JsonKey(ignore: true)
  _$$SaveAssesKebEdukasiImplCopyWith<_$SaveAssesKebEdukasiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetKebEdukasiImplCopyWith<$Res> {
  factory _$$GetKebEdukasiImplCopyWith(
          _$GetKebEdukasiImpl value, $Res Function(_$GetKebEdukasiImpl) then) =
      __$$GetKebEdukasiImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String noReg});
}

/// @nodoc
class __$$GetKebEdukasiImplCopyWithImpl<$Res>
    extends _$PasienEventCopyWithImpl<$Res, _$GetKebEdukasiImpl>
    implements _$$GetKebEdukasiImplCopyWith<$Res> {
  __$$GetKebEdukasiImplCopyWithImpl(
      _$GetKebEdukasiImpl _value, $Res Function(_$GetKebEdukasiImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noReg = null,
  }) {
    return _then(_$GetKebEdukasiImpl(
      noReg: null == noReg
          ? _value.noReg
          : noReg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetKebEdukasiImpl implements GetKebEdukasi {
  const _$GetKebEdukasiImpl({required this.noReg});

  @override
  final String noReg;

  @override
  String toString() {
    return 'PasienEvent.getKebEdukasi(noReg: $noReg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetKebEdukasiImpl &&
            (identical(other.noReg, noReg) || other.noReg == noReg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, noReg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetKebEdukasiImplCopyWith<_$GetKebEdukasiImpl> get copyWith =>
      __$$GetKebEdukasiImplCopyWithImpl<_$GetKebEdukasiImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)
        saveSkrining,
    required TResult Function(String noRM) riwayatPasien,
    required TResult Function(List<DetailProfilPasienModel> detailProfilePasien)
        addRiwayatPasien,
    required TResult Function(AntreanPasienModel pasien) selectedPasien,
    required TResult Function(SkirningModel skrining) saveStateSkrining,
    required TResult Function(String noReg) getOdontogram,
    required TResult Function(AssementRawatJalanModel assementRawatJalanModel)
        saveRawatJalanDokter,
    required TResult Function(String noReg) uploadOdontogram,
    required TResult Function(String noReg, String picturePath, String kdBagian)
        publishOdontogram,
    required TResult Function(String noReg) getAssmentRawatjalanDokter,
    required TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)
        saveAssesKebEdukasi,
    required TResult Function(String noReg) getKebEdukasi,
    required TResult Function(String noReg) getAssesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi, String keterangan)
        saveOdontogram,
    required TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)
        saveAsesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi) deleteOdontogram,
    required TResult Function(String noReg) getSkrining,
    required TResult Function() started,
    required TResult Function(String norm) selectedNorm,
    required TResult Function(bool enable) addLoadingAnatomi,
    required TResult Function(String keterangan) addKeterangan,
    required TResult Function(
            String nama, String norm, String keterangan, File picturePath)
        simpanAnatomi,
    required TResult Function(
            String nama, String norm, String keterangan, String picturePath)
        saveAnatomi,
    required TResult Function() getAntreanPasien,
    required TResult Function() getKVitalSign,
    required TResult Function(String noRM) getDetailPasien,
    required TResult Function(List<AntreanPasienModel> antreanPasien) addPasien,
  }) {
    return getKebEdukasi(noReg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult? Function(String noRM)? riwayatPasien,
    TResult? Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult? Function(AntreanPasienModel pasien)? selectedPasien,
    TResult? Function(SkirningModel skrining)? saveStateSkrining,
    TResult? Function(String noReg)? getOdontogram,
    TResult? Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult? Function(String noReg)? uploadOdontogram,
    TResult? Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult? Function(String noReg)? getAssmentRawatjalanDokter,
    TResult? Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult? Function(String noReg)? getKebEdukasi,
    TResult? Function(String noReg)? getAssesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult? Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi)? deleteOdontogram,
    TResult? Function(String noReg)? getSkrining,
    TResult? Function()? started,
    TResult? Function(String norm)? selectedNorm,
    TResult? Function(bool enable)? addLoadingAnatomi,
    TResult? Function(String keterangan)? addKeterangan,
    TResult? Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult? Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult? Function()? getAntreanPasien,
    TResult? Function()? getKVitalSign,
    TResult? Function(String noRM)? getDetailPasien,
    TResult? Function(List<AntreanPasienModel> antreanPasien)? addPasien,
  }) {
    return getKebEdukasi?.call(noReg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult Function(String noRM)? riwayatPasien,
    TResult Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult Function(AntreanPasienModel pasien)? selectedPasien,
    TResult Function(SkirningModel skrining)? saveStateSkrining,
    TResult Function(String noReg)? getOdontogram,
    TResult Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult Function(String noReg)? uploadOdontogram,
    TResult Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult Function(String noReg)? getAssmentRawatjalanDokter,
    TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult Function(String noReg)? getKebEdukasi,
    TResult Function(String noReg)? getAssesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi)? deleteOdontogram,
    TResult Function(String noReg)? getSkrining,
    TResult Function()? started,
    TResult Function(String norm)? selectedNorm,
    TResult Function(bool enable)? addLoadingAnatomi,
    TResult Function(String keterangan)? addKeterangan,
    TResult Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult Function()? getAntreanPasien,
    TResult Function()? getKVitalSign,
    TResult Function(String noRM)? getDetailPasien,
    TResult Function(List<AntreanPasienModel> antreanPasien)? addPasien,
    required TResult orElse(),
  }) {
    if (getKebEdukasi != null) {
      return getKebEdukasi(noReg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveSkrining value) saveSkrining,
    required TResult Function(RiwayatPasien value) riwayatPasien,
    required TResult Function(addRiwayatPasien value) addRiwayatPasien,
    required TResult Function(SelectedPasien value) selectedPasien,
    required TResult Function(SaveStateSkrining value) saveStateSkrining,
    required TResult Function(GetOdontogram value) getOdontogram,
    required TResult Function(SaveRawatJalanDokter value) saveRawatJalanDokter,
    required TResult Function(UploadOdontogram value) uploadOdontogram,
    required TResult Function(PublishOdontogram value) publishOdontogram,
    required TResult Function(GetAssmentRawatjalanDokter value)
        getAssmentRawatjalanDokter,
    required TResult Function(SaveAssesKebEdukasi value) saveAssesKebEdukasi,
    required TResult Function(GetKebEdukasi value) getKebEdukasi,
    required TResult Function(GetAssesRawatJalanPerawat value)
        getAssesRawatJalanPerawat,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_SaveAsesRawatJalanPerawat value)
        saveAsesRawatJalanPerawat,
    required TResult Function(_DeleteOdontogram value) deleteOdontogram,
    required TResult Function(_GetSkrining value) getSkrining,
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedNorm value) selectedNorm,
    required TResult Function(_AddLoadingAnatomi value) addLoadingAnatomi,
    required TResult Function(_AddKeterangan value) addKeterangan,
    required TResult Function(_SimpanAnatomi value) simpanAnatomi,
    required TResult Function(_SaveAnatomi value) saveAnatomi,
    required TResult Function(_GetAntreanPasien value) getAntreanPasien,
    required TResult Function(_GetKVitalSign value) getKVitalSign,
    required TResult Function(_GetDetailPasien value) getDetailPasien,
    required TResult Function(_AddPasien value) addPasien,
  }) {
    return getKebEdukasi(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveSkrining value)? saveSkrining,
    TResult? Function(RiwayatPasien value)? riwayatPasien,
    TResult? Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult? Function(SelectedPasien value)? selectedPasien,
    TResult? Function(SaveStateSkrining value)? saveStateSkrining,
    TResult? Function(GetOdontogram value)? getOdontogram,
    TResult? Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult? Function(UploadOdontogram value)? uploadOdontogram,
    TResult? Function(PublishOdontogram value)? publishOdontogram,
    TResult? Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult? Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult? Function(GetKebEdukasi value)? getKebEdukasi,
    TResult? Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult? Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult? Function(_GetSkrining value)? getSkrining,
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedNorm value)? selectedNorm,
    TResult? Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult? Function(_AddKeterangan value)? addKeterangan,
    TResult? Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult? Function(_SaveAnatomi value)? saveAnatomi,
    TResult? Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult? Function(_GetKVitalSign value)? getKVitalSign,
    TResult? Function(_GetDetailPasien value)? getDetailPasien,
    TResult? Function(_AddPasien value)? addPasien,
  }) {
    return getKebEdukasi?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveSkrining value)? saveSkrining,
    TResult Function(RiwayatPasien value)? riwayatPasien,
    TResult Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult Function(SelectedPasien value)? selectedPasien,
    TResult Function(SaveStateSkrining value)? saveStateSkrining,
    TResult Function(GetOdontogram value)? getOdontogram,
    TResult Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult Function(UploadOdontogram value)? uploadOdontogram,
    TResult Function(PublishOdontogram value)? publishOdontogram,
    TResult Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult Function(GetKebEdukasi value)? getKebEdukasi,
    TResult Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult Function(_GetSkrining value)? getSkrining,
    TResult Function(_Started value)? started,
    TResult Function(_SelectedNorm value)? selectedNorm,
    TResult Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult Function(_AddKeterangan value)? addKeterangan,
    TResult Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult Function(_SaveAnatomi value)? saveAnatomi,
    TResult Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult Function(_GetKVitalSign value)? getKVitalSign,
    TResult Function(_GetDetailPasien value)? getDetailPasien,
    TResult Function(_AddPasien value)? addPasien,
    required TResult orElse(),
  }) {
    if (getKebEdukasi != null) {
      return getKebEdukasi(this);
    }
    return orElse();
  }
}

abstract class GetKebEdukasi implements PasienEvent {
  const factory GetKebEdukasi({required final String noReg}) =
      _$GetKebEdukasiImpl;

  String get noReg;
  @JsonKey(ignore: true)
  _$$GetKebEdukasiImplCopyWith<_$GetKebEdukasiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetAssesRawatJalanPerawatImplCopyWith<$Res> {
  factory _$$GetAssesRawatJalanPerawatImplCopyWith(
          _$GetAssesRawatJalanPerawatImpl value,
          $Res Function(_$GetAssesRawatJalanPerawatImpl) then) =
      __$$GetAssesRawatJalanPerawatImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String noReg});
}

/// @nodoc
class __$$GetAssesRawatJalanPerawatImplCopyWithImpl<$Res>
    extends _$PasienEventCopyWithImpl<$Res, _$GetAssesRawatJalanPerawatImpl>
    implements _$$GetAssesRawatJalanPerawatImplCopyWith<$Res> {
  __$$GetAssesRawatJalanPerawatImplCopyWithImpl(
      _$GetAssesRawatJalanPerawatImpl _value,
      $Res Function(_$GetAssesRawatJalanPerawatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noReg = null,
  }) {
    return _then(_$GetAssesRawatJalanPerawatImpl(
      noReg: null == noReg
          ? _value.noReg
          : noReg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetAssesRawatJalanPerawatImpl implements GetAssesRawatJalanPerawat {
  const _$GetAssesRawatJalanPerawatImpl({required this.noReg});

  @override
  final String noReg;

  @override
  String toString() {
    return 'PasienEvent.getAssesRawatJalanPerawat(noReg: $noReg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAssesRawatJalanPerawatImpl &&
            (identical(other.noReg, noReg) || other.noReg == noReg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, noReg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAssesRawatJalanPerawatImplCopyWith<_$GetAssesRawatJalanPerawatImpl>
      get copyWith => __$$GetAssesRawatJalanPerawatImplCopyWithImpl<
          _$GetAssesRawatJalanPerawatImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)
        saveSkrining,
    required TResult Function(String noRM) riwayatPasien,
    required TResult Function(List<DetailProfilPasienModel> detailProfilePasien)
        addRiwayatPasien,
    required TResult Function(AntreanPasienModel pasien) selectedPasien,
    required TResult Function(SkirningModel skrining) saveStateSkrining,
    required TResult Function(String noReg) getOdontogram,
    required TResult Function(AssementRawatJalanModel assementRawatJalanModel)
        saveRawatJalanDokter,
    required TResult Function(String noReg) uploadOdontogram,
    required TResult Function(String noReg, String picturePath, String kdBagian)
        publishOdontogram,
    required TResult Function(String noReg) getAssmentRawatjalanDokter,
    required TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)
        saveAssesKebEdukasi,
    required TResult Function(String noReg) getKebEdukasi,
    required TResult Function(String noReg) getAssesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi, String keterangan)
        saveOdontogram,
    required TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)
        saveAsesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi) deleteOdontogram,
    required TResult Function(String noReg) getSkrining,
    required TResult Function() started,
    required TResult Function(String norm) selectedNorm,
    required TResult Function(bool enable) addLoadingAnatomi,
    required TResult Function(String keterangan) addKeterangan,
    required TResult Function(
            String nama, String norm, String keterangan, File picturePath)
        simpanAnatomi,
    required TResult Function(
            String nama, String norm, String keterangan, String picturePath)
        saveAnatomi,
    required TResult Function() getAntreanPasien,
    required TResult Function() getKVitalSign,
    required TResult Function(String noRM) getDetailPasien,
    required TResult Function(List<AntreanPasienModel> antreanPasien) addPasien,
  }) {
    return getAssesRawatJalanPerawat(noReg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult? Function(String noRM)? riwayatPasien,
    TResult? Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult? Function(AntreanPasienModel pasien)? selectedPasien,
    TResult? Function(SkirningModel skrining)? saveStateSkrining,
    TResult? Function(String noReg)? getOdontogram,
    TResult? Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult? Function(String noReg)? uploadOdontogram,
    TResult? Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult? Function(String noReg)? getAssmentRawatjalanDokter,
    TResult? Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult? Function(String noReg)? getKebEdukasi,
    TResult? Function(String noReg)? getAssesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult? Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi)? deleteOdontogram,
    TResult? Function(String noReg)? getSkrining,
    TResult? Function()? started,
    TResult? Function(String norm)? selectedNorm,
    TResult? Function(bool enable)? addLoadingAnatomi,
    TResult? Function(String keterangan)? addKeterangan,
    TResult? Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult? Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult? Function()? getAntreanPasien,
    TResult? Function()? getKVitalSign,
    TResult? Function(String noRM)? getDetailPasien,
    TResult? Function(List<AntreanPasienModel> antreanPasien)? addPasien,
  }) {
    return getAssesRawatJalanPerawat?.call(noReg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult Function(String noRM)? riwayatPasien,
    TResult Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult Function(AntreanPasienModel pasien)? selectedPasien,
    TResult Function(SkirningModel skrining)? saveStateSkrining,
    TResult Function(String noReg)? getOdontogram,
    TResult Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult Function(String noReg)? uploadOdontogram,
    TResult Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult Function(String noReg)? getAssmentRawatjalanDokter,
    TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult Function(String noReg)? getKebEdukasi,
    TResult Function(String noReg)? getAssesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi)? deleteOdontogram,
    TResult Function(String noReg)? getSkrining,
    TResult Function()? started,
    TResult Function(String norm)? selectedNorm,
    TResult Function(bool enable)? addLoadingAnatomi,
    TResult Function(String keterangan)? addKeterangan,
    TResult Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult Function()? getAntreanPasien,
    TResult Function()? getKVitalSign,
    TResult Function(String noRM)? getDetailPasien,
    TResult Function(List<AntreanPasienModel> antreanPasien)? addPasien,
    required TResult orElse(),
  }) {
    if (getAssesRawatJalanPerawat != null) {
      return getAssesRawatJalanPerawat(noReg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveSkrining value) saveSkrining,
    required TResult Function(RiwayatPasien value) riwayatPasien,
    required TResult Function(addRiwayatPasien value) addRiwayatPasien,
    required TResult Function(SelectedPasien value) selectedPasien,
    required TResult Function(SaveStateSkrining value) saveStateSkrining,
    required TResult Function(GetOdontogram value) getOdontogram,
    required TResult Function(SaveRawatJalanDokter value) saveRawatJalanDokter,
    required TResult Function(UploadOdontogram value) uploadOdontogram,
    required TResult Function(PublishOdontogram value) publishOdontogram,
    required TResult Function(GetAssmentRawatjalanDokter value)
        getAssmentRawatjalanDokter,
    required TResult Function(SaveAssesKebEdukasi value) saveAssesKebEdukasi,
    required TResult Function(GetKebEdukasi value) getKebEdukasi,
    required TResult Function(GetAssesRawatJalanPerawat value)
        getAssesRawatJalanPerawat,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_SaveAsesRawatJalanPerawat value)
        saveAsesRawatJalanPerawat,
    required TResult Function(_DeleteOdontogram value) deleteOdontogram,
    required TResult Function(_GetSkrining value) getSkrining,
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedNorm value) selectedNorm,
    required TResult Function(_AddLoadingAnatomi value) addLoadingAnatomi,
    required TResult Function(_AddKeterangan value) addKeterangan,
    required TResult Function(_SimpanAnatomi value) simpanAnatomi,
    required TResult Function(_SaveAnatomi value) saveAnatomi,
    required TResult Function(_GetAntreanPasien value) getAntreanPasien,
    required TResult Function(_GetKVitalSign value) getKVitalSign,
    required TResult Function(_GetDetailPasien value) getDetailPasien,
    required TResult Function(_AddPasien value) addPasien,
  }) {
    return getAssesRawatJalanPerawat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveSkrining value)? saveSkrining,
    TResult? Function(RiwayatPasien value)? riwayatPasien,
    TResult? Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult? Function(SelectedPasien value)? selectedPasien,
    TResult? Function(SaveStateSkrining value)? saveStateSkrining,
    TResult? Function(GetOdontogram value)? getOdontogram,
    TResult? Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult? Function(UploadOdontogram value)? uploadOdontogram,
    TResult? Function(PublishOdontogram value)? publishOdontogram,
    TResult? Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult? Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult? Function(GetKebEdukasi value)? getKebEdukasi,
    TResult? Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult? Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult? Function(_GetSkrining value)? getSkrining,
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedNorm value)? selectedNorm,
    TResult? Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult? Function(_AddKeterangan value)? addKeterangan,
    TResult? Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult? Function(_SaveAnatomi value)? saveAnatomi,
    TResult? Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult? Function(_GetKVitalSign value)? getKVitalSign,
    TResult? Function(_GetDetailPasien value)? getDetailPasien,
    TResult? Function(_AddPasien value)? addPasien,
  }) {
    return getAssesRawatJalanPerawat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveSkrining value)? saveSkrining,
    TResult Function(RiwayatPasien value)? riwayatPasien,
    TResult Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult Function(SelectedPasien value)? selectedPasien,
    TResult Function(SaveStateSkrining value)? saveStateSkrining,
    TResult Function(GetOdontogram value)? getOdontogram,
    TResult Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult Function(UploadOdontogram value)? uploadOdontogram,
    TResult Function(PublishOdontogram value)? publishOdontogram,
    TResult Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult Function(GetKebEdukasi value)? getKebEdukasi,
    TResult Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult Function(_GetSkrining value)? getSkrining,
    TResult Function(_Started value)? started,
    TResult Function(_SelectedNorm value)? selectedNorm,
    TResult Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult Function(_AddKeterangan value)? addKeterangan,
    TResult Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult Function(_SaveAnatomi value)? saveAnatomi,
    TResult Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult Function(_GetKVitalSign value)? getKVitalSign,
    TResult Function(_GetDetailPasien value)? getDetailPasien,
    TResult Function(_AddPasien value)? addPasien,
    required TResult orElse(),
  }) {
    if (getAssesRawatJalanPerawat != null) {
      return getAssesRawatJalanPerawat(this);
    }
    return orElse();
  }
}

abstract class GetAssesRawatJalanPerawat implements PasienEvent {
  const factory GetAssesRawatJalanPerawat({required final String noReg}) =
      _$GetAssesRawatJalanPerawatImpl;

  String get noReg;
  @JsonKey(ignore: true)
  _$$GetAssesRawatJalanPerawatImplCopyWith<_$GetAssesRawatJalanPerawatImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveOdontogramImplCopyWith<$Res> {
  factory _$$SaveOdontogramImplCopyWith(_$SaveOdontogramImpl value,
          $Res Function(_$SaveOdontogramImpl) then) =
      __$$SaveOdontogramImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String noReg, String noGigi, String keterangan});
}

/// @nodoc
class __$$SaveOdontogramImplCopyWithImpl<$Res>
    extends _$PasienEventCopyWithImpl<$Res, _$SaveOdontogramImpl>
    implements _$$SaveOdontogramImplCopyWith<$Res> {
  __$$SaveOdontogramImplCopyWithImpl(
      _$SaveOdontogramImpl _value, $Res Function(_$SaveOdontogramImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noReg = null,
    Object? noGigi = null,
    Object? keterangan = null,
  }) {
    return _then(_$SaveOdontogramImpl(
      noReg: null == noReg
          ? _value.noReg
          : noReg // ignore: cast_nullable_to_non_nullable
              as String,
      noGigi: null == noGigi
          ? _value.noGigi
          : noGigi // ignore: cast_nullable_to_non_nullable
              as String,
      keterangan: null == keterangan
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SaveOdontogramImpl implements _SaveOdontogram {
  const _$SaveOdontogramImpl(
      {required this.noReg, required this.noGigi, required this.keterangan});

  @override
  final String noReg;
  @override
  final String noGigi;
  @override
  final String keterangan;

  @override
  String toString() {
    return 'PasienEvent.saveOdontogram(noReg: $noReg, noGigi: $noGigi, keterangan: $keterangan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveOdontogramImpl &&
            (identical(other.noReg, noReg) || other.noReg == noReg) &&
            (identical(other.noGigi, noGigi) || other.noGigi == noGigi) &&
            (identical(other.keterangan, keterangan) ||
                other.keterangan == keterangan));
  }

  @override
  int get hashCode => Object.hash(runtimeType, noReg, noGigi, keterangan);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveOdontogramImplCopyWith<_$SaveOdontogramImpl> get copyWith =>
      __$$SaveOdontogramImplCopyWithImpl<_$SaveOdontogramImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)
        saveSkrining,
    required TResult Function(String noRM) riwayatPasien,
    required TResult Function(List<DetailProfilPasienModel> detailProfilePasien)
        addRiwayatPasien,
    required TResult Function(AntreanPasienModel pasien) selectedPasien,
    required TResult Function(SkirningModel skrining) saveStateSkrining,
    required TResult Function(String noReg) getOdontogram,
    required TResult Function(AssementRawatJalanModel assementRawatJalanModel)
        saveRawatJalanDokter,
    required TResult Function(String noReg) uploadOdontogram,
    required TResult Function(String noReg, String picturePath, String kdBagian)
        publishOdontogram,
    required TResult Function(String noReg) getAssmentRawatjalanDokter,
    required TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)
        saveAssesKebEdukasi,
    required TResult Function(String noReg) getKebEdukasi,
    required TResult Function(String noReg) getAssesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi, String keterangan)
        saveOdontogram,
    required TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)
        saveAsesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi) deleteOdontogram,
    required TResult Function(String noReg) getSkrining,
    required TResult Function() started,
    required TResult Function(String norm) selectedNorm,
    required TResult Function(bool enable) addLoadingAnatomi,
    required TResult Function(String keterangan) addKeterangan,
    required TResult Function(
            String nama, String norm, String keterangan, File picturePath)
        simpanAnatomi,
    required TResult Function(
            String nama, String norm, String keterangan, String picturePath)
        saveAnatomi,
    required TResult Function() getAntreanPasien,
    required TResult Function() getKVitalSign,
    required TResult Function(String noRM) getDetailPasien,
    required TResult Function(List<AntreanPasienModel> antreanPasien) addPasien,
  }) {
    return saveOdontogram(noReg, noGigi, keterangan);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult? Function(String noRM)? riwayatPasien,
    TResult? Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult? Function(AntreanPasienModel pasien)? selectedPasien,
    TResult? Function(SkirningModel skrining)? saveStateSkrining,
    TResult? Function(String noReg)? getOdontogram,
    TResult? Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult? Function(String noReg)? uploadOdontogram,
    TResult? Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult? Function(String noReg)? getAssmentRawatjalanDokter,
    TResult? Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult? Function(String noReg)? getKebEdukasi,
    TResult? Function(String noReg)? getAssesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult? Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi)? deleteOdontogram,
    TResult? Function(String noReg)? getSkrining,
    TResult? Function()? started,
    TResult? Function(String norm)? selectedNorm,
    TResult? Function(bool enable)? addLoadingAnatomi,
    TResult? Function(String keterangan)? addKeterangan,
    TResult? Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult? Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult? Function()? getAntreanPasien,
    TResult? Function()? getKVitalSign,
    TResult? Function(String noRM)? getDetailPasien,
    TResult? Function(List<AntreanPasienModel> antreanPasien)? addPasien,
  }) {
    return saveOdontogram?.call(noReg, noGigi, keterangan);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult Function(String noRM)? riwayatPasien,
    TResult Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult Function(AntreanPasienModel pasien)? selectedPasien,
    TResult Function(SkirningModel skrining)? saveStateSkrining,
    TResult Function(String noReg)? getOdontogram,
    TResult Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult Function(String noReg)? uploadOdontogram,
    TResult Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult Function(String noReg)? getAssmentRawatjalanDokter,
    TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult Function(String noReg)? getKebEdukasi,
    TResult Function(String noReg)? getAssesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi)? deleteOdontogram,
    TResult Function(String noReg)? getSkrining,
    TResult Function()? started,
    TResult Function(String norm)? selectedNorm,
    TResult Function(bool enable)? addLoadingAnatomi,
    TResult Function(String keterangan)? addKeterangan,
    TResult Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult Function()? getAntreanPasien,
    TResult Function()? getKVitalSign,
    TResult Function(String noRM)? getDetailPasien,
    TResult Function(List<AntreanPasienModel> antreanPasien)? addPasien,
    required TResult orElse(),
  }) {
    if (saveOdontogram != null) {
      return saveOdontogram(noReg, noGigi, keterangan);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveSkrining value) saveSkrining,
    required TResult Function(RiwayatPasien value) riwayatPasien,
    required TResult Function(addRiwayatPasien value) addRiwayatPasien,
    required TResult Function(SelectedPasien value) selectedPasien,
    required TResult Function(SaveStateSkrining value) saveStateSkrining,
    required TResult Function(GetOdontogram value) getOdontogram,
    required TResult Function(SaveRawatJalanDokter value) saveRawatJalanDokter,
    required TResult Function(UploadOdontogram value) uploadOdontogram,
    required TResult Function(PublishOdontogram value) publishOdontogram,
    required TResult Function(GetAssmentRawatjalanDokter value)
        getAssmentRawatjalanDokter,
    required TResult Function(SaveAssesKebEdukasi value) saveAssesKebEdukasi,
    required TResult Function(GetKebEdukasi value) getKebEdukasi,
    required TResult Function(GetAssesRawatJalanPerawat value)
        getAssesRawatJalanPerawat,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_SaveAsesRawatJalanPerawat value)
        saveAsesRawatJalanPerawat,
    required TResult Function(_DeleteOdontogram value) deleteOdontogram,
    required TResult Function(_GetSkrining value) getSkrining,
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedNorm value) selectedNorm,
    required TResult Function(_AddLoadingAnatomi value) addLoadingAnatomi,
    required TResult Function(_AddKeterangan value) addKeterangan,
    required TResult Function(_SimpanAnatomi value) simpanAnatomi,
    required TResult Function(_SaveAnatomi value) saveAnatomi,
    required TResult Function(_GetAntreanPasien value) getAntreanPasien,
    required TResult Function(_GetKVitalSign value) getKVitalSign,
    required TResult Function(_GetDetailPasien value) getDetailPasien,
    required TResult Function(_AddPasien value) addPasien,
  }) {
    return saveOdontogram(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveSkrining value)? saveSkrining,
    TResult? Function(RiwayatPasien value)? riwayatPasien,
    TResult? Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult? Function(SelectedPasien value)? selectedPasien,
    TResult? Function(SaveStateSkrining value)? saveStateSkrining,
    TResult? Function(GetOdontogram value)? getOdontogram,
    TResult? Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult? Function(UploadOdontogram value)? uploadOdontogram,
    TResult? Function(PublishOdontogram value)? publishOdontogram,
    TResult? Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult? Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult? Function(GetKebEdukasi value)? getKebEdukasi,
    TResult? Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult? Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult? Function(_GetSkrining value)? getSkrining,
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedNorm value)? selectedNorm,
    TResult? Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult? Function(_AddKeterangan value)? addKeterangan,
    TResult? Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult? Function(_SaveAnatomi value)? saveAnatomi,
    TResult? Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult? Function(_GetKVitalSign value)? getKVitalSign,
    TResult? Function(_GetDetailPasien value)? getDetailPasien,
    TResult? Function(_AddPasien value)? addPasien,
  }) {
    return saveOdontogram?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveSkrining value)? saveSkrining,
    TResult Function(RiwayatPasien value)? riwayatPasien,
    TResult Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult Function(SelectedPasien value)? selectedPasien,
    TResult Function(SaveStateSkrining value)? saveStateSkrining,
    TResult Function(GetOdontogram value)? getOdontogram,
    TResult Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult Function(UploadOdontogram value)? uploadOdontogram,
    TResult Function(PublishOdontogram value)? publishOdontogram,
    TResult Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult Function(GetKebEdukasi value)? getKebEdukasi,
    TResult Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult Function(_GetSkrining value)? getSkrining,
    TResult Function(_Started value)? started,
    TResult Function(_SelectedNorm value)? selectedNorm,
    TResult Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult Function(_AddKeterangan value)? addKeterangan,
    TResult Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult Function(_SaveAnatomi value)? saveAnatomi,
    TResult Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult Function(_GetKVitalSign value)? getKVitalSign,
    TResult Function(_GetDetailPasien value)? getDetailPasien,
    TResult Function(_AddPasien value)? addPasien,
    required TResult orElse(),
  }) {
    if (saveOdontogram != null) {
      return saveOdontogram(this);
    }
    return orElse();
  }
}

abstract class _SaveOdontogram implements PasienEvent {
  const factory _SaveOdontogram(
      {required final String noReg,
      required final String noGigi,
      required final String keterangan}) = _$SaveOdontogramImpl;

  String get noReg;
  String get noGigi;
  String get keterangan;
  @JsonKey(ignore: true)
  _$$SaveOdontogramImplCopyWith<_$SaveOdontogramImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveAsesRawatJalanPerawatImplCopyWith<$Res> {
  factory _$$SaveAsesRawatJalanPerawatImplCopyWith(
          _$SaveAsesRawatJalanPerawatImpl value,
          $Res Function(_$SaveAsesRawatJalanPerawatImpl) then) =
      __$$SaveAsesRawatJalanPerawatImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String kdBagian,
      String noReg,
      String kelUtama,
      String riwayatPenyakit,
      String riwayatObat,
      String riwayatObatDetail,
      String riwayatPenyakitDetail,
      String riwayatSaatDirumah,
      String tekananDarah,
      String nadi,
      String suhu,
      String pernapasan,
      String beratBadan,
      String tinggiBadan,
      String skriningNyeri,
      String psikologis,
      String fungsional,
      String perencanaanPemulangan,
      String masalahKeperawatan,
      String rencanaKeperawatan,
      String aseskepHasilKajiRj,
      String aseskepHasilKajiRjDetail,
      String aseskepHasilKajiRjTindakan,
      String aseskepNyeri,
      String aseskepPulang1,
      String aseskepPulang1Detail,
      String aseskepPulang2,
      String aseskepPulang2Detail,
      String aseskepPulang3,
      String aseskepPulang3Detail,
      String aseskepRj1,
      String aseskepRj2,
      String fungsionalDetail,
      String psikologisDetail});
}

/// @nodoc
class __$$SaveAsesRawatJalanPerawatImplCopyWithImpl<$Res>
    extends _$PasienEventCopyWithImpl<$Res, _$SaveAsesRawatJalanPerawatImpl>
    implements _$$SaveAsesRawatJalanPerawatImplCopyWith<$Res> {
  __$$SaveAsesRawatJalanPerawatImplCopyWithImpl(
      _$SaveAsesRawatJalanPerawatImpl _value,
      $Res Function(_$SaveAsesRawatJalanPerawatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kdBagian = null,
    Object? noReg = null,
    Object? kelUtama = null,
    Object? riwayatPenyakit = null,
    Object? riwayatObat = null,
    Object? riwayatObatDetail = null,
    Object? riwayatPenyakitDetail = null,
    Object? riwayatSaatDirumah = null,
    Object? tekananDarah = null,
    Object? nadi = null,
    Object? suhu = null,
    Object? pernapasan = null,
    Object? beratBadan = null,
    Object? tinggiBadan = null,
    Object? skriningNyeri = null,
    Object? psikologis = null,
    Object? fungsional = null,
    Object? perencanaanPemulangan = null,
    Object? masalahKeperawatan = null,
    Object? rencanaKeperawatan = null,
    Object? aseskepHasilKajiRj = null,
    Object? aseskepHasilKajiRjDetail = null,
    Object? aseskepHasilKajiRjTindakan = null,
    Object? aseskepNyeri = null,
    Object? aseskepPulang1 = null,
    Object? aseskepPulang1Detail = null,
    Object? aseskepPulang2 = null,
    Object? aseskepPulang2Detail = null,
    Object? aseskepPulang3 = null,
    Object? aseskepPulang3Detail = null,
    Object? aseskepRj1 = null,
    Object? aseskepRj2 = null,
    Object? fungsionalDetail = null,
    Object? psikologisDetail = null,
  }) {
    return _then(_$SaveAsesRawatJalanPerawatImpl(
      kdBagian: null == kdBagian
          ? _value.kdBagian
          : kdBagian // ignore: cast_nullable_to_non_nullable
              as String,
      noReg: null == noReg
          ? _value.noReg
          : noReg // ignore: cast_nullable_to_non_nullable
              as String,
      kelUtama: null == kelUtama
          ? _value.kelUtama
          : kelUtama // ignore: cast_nullable_to_non_nullable
              as String,
      riwayatPenyakit: null == riwayatPenyakit
          ? _value.riwayatPenyakit
          : riwayatPenyakit // ignore: cast_nullable_to_non_nullable
              as String,
      riwayatObat: null == riwayatObat
          ? _value.riwayatObat
          : riwayatObat // ignore: cast_nullable_to_non_nullable
              as String,
      riwayatObatDetail: null == riwayatObatDetail
          ? _value.riwayatObatDetail
          : riwayatObatDetail // ignore: cast_nullable_to_non_nullable
              as String,
      riwayatPenyakitDetail: null == riwayatPenyakitDetail
          ? _value.riwayatPenyakitDetail
          : riwayatPenyakitDetail // ignore: cast_nullable_to_non_nullable
              as String,
      riwayatSaatDirumah: null == riwayatSaatDirumah
          ? _value.riwayatSaatDirumah
          : riwayatSaatDirumah // ignore: cast_nullable_to_non_nullable
              as String,
      tekananDarah: null == tekananDarah
          ? _value.tekananDarah
          : tekananDarah // ignore: cast_nullable_to_non_nullable
              as String,
      nadi: null == nadi
          ? _value.nadi
          : nadi // ignore: cast_nullable_to_non_nullable
              as String,
      suhu: null == suhu
          ? _value.suhu
          : suhu // ignore: cast_nullable_to_non_nullable
              as String,
      pernapasan: null == pernapasan
          ? _value.pernapasan
          : pernapasan // ignore: cast_nullable_to_non_nullable
              as String,
      beratBadan: null == beratBadan
          ? _value.beratBadan
          : beratBadan // ignore: cast_nullable_to_non_nullable
              as String,
      tinggiBadan: null == tinggiBadan
          ? _value.tinggiBadan
          : tinggiBadan // ignore: cast_nullable_to_non_nullable
              as String,
      skriningNyeri: null == skriningNyeri
          ? _value.skriningNyeri
          : skriningNyeri // ignore: cast_nullable_to_non_nullable
              as String,
      psikologis: null == psikologis
          ? _value.psikologis
          : psikologis // ignore: cast_nullable_to_non_nullable
              as String,
      fungsional: null == fungsional
          ? _value.fungsional
          : fungsional // ignore: cast_nullable_to_non_nullable
              as String,
      perencanaanPemulangan: null == perencanaanPemulangan
          ? _value.perencanaanPemulangan
          : perencanaanPemulangan // ignore: cast_nullable_to_non_nullable
              as String,
      masalahKeperawatan: null == masalahKeperawatan
          ? _value.masalahKeperawatan
          : masalahKeperawatan // ignore: cast_nullable_to_non_nullable
              as String,
      rencanaKeperawatan: null == rencanaKeperawatan
          ? _value.rencanaKeperawatan
          : rencanaKeperawatan // ignore: cast_nullable_to_non_nullable
              as String,
      aseskepHasilKajiRj: null == aseskepHasilKajiRj
          ? _value.aseskepHasilKajiRj
          : aseskepHasilKajiRj // ignore: cast_nullable_to_non_nullable
              as String,
      aseskepHasilKajiRjDetail: null == aseskepHasilKajiRjDetail
          ? _value.aseskepHasilKajiRjDetail
          : aseskepHasilKajiRjDetail // ignore: cast_nullable_to_non_nullable
              as String,
      aseskepHasilKajiRjTindakan: null == aseskepHasilKajiRjTindakan
          ? _value.aseskepHasilKajiRjTindakan
          : aseskepHasilKajiRjTindakan // ignore: cast_nullable_to_non_nullable
              as String,
      aseskepNyeri: null == aseskepNyeri
          ? _value.aseskepNyeri
          : aseskepNyeri // ignore: cast_nullable_to_non_nullable
              as String,
      aseskepPulang1: null == aseskepPulang1
          ? _value.aseskepPulang1
          : aseskepPulang1 // ignore: cast_nullable_to_non_nullable
              as String,
      aseskepPulang1Detail: null == aseskepPulang1Detail
          ? _value.aseskepPulang1Detail
          : aseskepPulang1Detail // ignore: cast_nullable_to_non_nullable
              as String,
      aseskepPulang2: null == aseskepPulang2
          ? _value.aseskepPulang2
          : aseskepPulang2 // ignore: cast_nullable_to_non_nullable
              as String,
      aseskepPulang2Detail: null == aseskepPulang2Detail
          ? _value.aseskepPulang2Detail
          : aseskepPulang2Detail // ignore: cast_nullable_to_non_nullable
              as String,
      aseskepPulang3: null == aseskepPulang3
          ? _value.aseskepPulang3
          : aseskepPulang3 // ignore: cast_nullable_to_non_nullable
              as String,
      aseskepPulang3Detail: null == aseskepPulang3Detail
          ? _value.aseskepPulang3Detail
          : aseskepPulang3Detail // ignore: cast_nullable_to_non_nullable
              as String,
      aseskepRj1: null == aseskepRj1
          ? _value.aseskepRj1
          : aseskepRj1 // ignore: cast_nullable_to_non_nullable
              as String,
      aseskepRj2: null == aseskepRj2
          ? _value.aseskepRj2
          : aseskepRj2 // ignore: cast_nullable_to_non_nullable
              as String,
      fungsionalDetail: null == fungsionalDetail
          ? _value.fungsionalDetail
          : fungsionalDetail // ignore: cast_nullable_to_non_nullable
              as String,
      psikologisDetail: null == psikologisDetail
          ? _value.psikologisDetail
          : psikologisDetail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SaveAsesRawatJalanPerawatImpl implements _SaveAsesRawatJalanPerawat {
  const _$SaveAsesRawatJalanPerawatImpl(
      {required this.kdBagian,
      required this.noReg,
      required this.kelUtama,
      required this.riwayatPenyakit,
      required this.riwayatObat,
      required this.riwayatObatDetail,
      required this.riwayatPenyakitDetail,
      required this.riwayatSaatDirumah,
      required this.tekananDarah,
      required this.nadi,
      required this.suhu,
      required this.pernapasan,
      required this.beratBadan,
      required this.tinggiBadan,
      required this.skriningNyeri,
      required this.psikologis,
      required this.fungsional,
      required this.perencanaanPemulangan,
      required this.masalahKeperawatan,
      required this.rencanaKeperawatan,
      required this.aseskepHasilKajiRj,
      required this.aseskepHasilKajiRjDetail,
      required this.aseskepHasilKajiRjTindakan,
      required this.aseskepNyeri,
      required this.aseskepPulang1,
      required this.aseskepPulang1Detail,
      required this.aseskepPulang2,
      required this.aseskepPulang2Detail,
      required this.aseskepPulang3,
      required this.aseskepPulang3Detail,
      required this.aseskepRj1,
      required this.aseskepRj2,
      required this.fungsionalDetail,
      required this.psikologisDetail});

  @override
  final String kdBagian;
  @override
  final String noReg;
  @override
  final String kelUtama;
  @override
  final String riwayatPenyakit;
  @override
  final String riwayatObat;
  @override
  final String riwayatObatDetail;
  @override
  final String riwayatPenyakitDetail;
  @override
  final String riwayatSaatDirumah;
  @override
  final String tekananDarah;
  @override
  final String nadi;
  @override
  final String suhu;
  @override
  final String pernapasan;
  @override
  final String beratBadan;
  @override
  final String tinggiBadan;
  @override
  final String skriningNyeri;
  @override
  final String psikologis;
  @override
  final String fungsional;
  @override
  final String perencanaanPemulangan;
  @override
  final String masalahKeperawatan;
  @override
  final String rencanaKeperawatan;
  @override
  final String aseskepHasilKajiRj;
  @override
  final String aseskepHasilKajiRjDetail;
  @override
  final String aseskepHasilKajiRjTindakan;
  @override
  final String aseskepNyeri;
  @override
  final String aseskepPulang1;
  @override
  final String aseskepPulang1Detail;
  @override
  final String aseskepPulang2;
  @override
  final String aseskepPulang2Detail;
  @override
  final String aseskepPulang3;
  @override
  final String aseskepPulang3Detail;
  @override
  final String aseskepRj1;
  @override
  final String aseskepRj2;
  @override
  final String fungsionalDetail;
  @override
  final String psikologisDetail;

  @override
  String toString() {
    return 'PasienEvent.saveAsesRawatJalanPerawat(kdBagian: $kdBagian, noReg: $noReg, kelUtama: $kelUtama, riwayatPenyakit: $riwayatPenyakit, riwayatObat: $riwayatObat, riwayatObatDetail: $riwayatObatDetail, riwayatPenyakitDetail: $riwayatPenyakitDetail, riwayatSaatDirumah: $riwayatSaatDirumah, tekananDarah: $tekananDarah, nadi: $nadi, suhu: $suhu, pernapasan: $pernapasan, beratBadan: $beratBadan, tinggiBadan: $tinggiBadan, skriningNyeri: $skriningNyeri, psikologis: $psikologis, fungsional: $fungsional, perencanaanPemulangan: $perencanaanPemulangan, masalahKeperawatan: $masalahKeperawatan, rencanaKeperawatan: $rencanaKeperawatan, aseskepHasilKajiRj: $aseskepHasilKajiRj, aseskepHasilKajiRjDetail: $aseskepHasilKajiRjDetail, aseskepHasilKajiRjTindakan: $aseskepHasilKajiRjTindakan, aseskepNyeri: $aseskepNyeri, aseskepPulang1: $aseskepPulang1, aseskepPulang1Detail: $aseskepPulang1Detail, aseskepPulang2: $aseskepPulang2, aseskepPulang2Detail: $aseskepPulang2Detail, aseskepPulang3: $aseskepPulang3, aseskepPulang3Detail: $aseskepPulang3Detail, aseskepRj1: $aseskepRj1, aseskepRj2: $aseskepRj2, fungsionalDetail: $fungsionalDetail, psikologisDetail: $psikologisDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveAsesRawatJalanPerawatImpl &&
            (identical(other.kdBagian, kdBagian) ||
                other.kdBagian == kdBagian) &&
            (identical(other.noReg, noReg) || other.noReg == noReg) &&
            (identical(other.kelUtama, kelUtama) ||
                other.kelUtama == kelUtama) &&
            (identical(other.riwayatPenyakit, riwayatPenyakit) ||
                other.riwayatPenyakit == riwayatPenyakit) &&
            (identical(other.riwayatObat, riwayatObat) ||
                other.riwayatObat == riwayatObat) &&
            (identical(other.riwayatObatDetail, riwayatObatDetail) ||
                other.riwayatObatDetail == riwayatObatDetail) &&
            (identical(other.riwayatPenyakitDetail, riwayatPenyakitDetail) ||
                other.riwayatPenyakitDetail == riwayatPenyakitDetail) &&
            (identical(other.riwayatSaatDirumah, riwayatSaatDirumah) ||
                other.riwayatSaatDirumah == riwayatSaatDirumah) &&
            (identical(other.tekananDarah, tekananDarah) ||
                other.tekananDarah == tekananDarah) &&
            (identical(other.nadi, nadi) || other.nadi == nadi) &&
            (identical(other.suhu, suhu) || other.suhu == suhu) &&
            (identical(other.pernapasan, pernapasan) ||
                other.pernapasan == pernapasan) &&
            (identical(other.beratBadan, beratBadan) ||
                other.beratBadan == beratBadan) &&
            (identical(other.tinggiBadan, tinggiBadan) ||
                other.tinggiBadan == tinggiBadan) &&
            (identical(other.skriningNyeri, skriningNyeri) ||
                other.skriningNyeri == skriningNyeri) &&
            (identical(other.psikologis, psikologis) ||
                other.psikologis == psikologis) &&
            (identical(other.fungsional, fungsional) ||
                other.fungsional == fungsional) &&
            (identical(other.perencanaanPemulangan, perencanaanPemulangan) ||
                other.perencanaanPemulangan == perencanaanPemulangan) &&
            (identical(other.masalahKeperawatan, masalahKeperawatan) ||
                other.masalahKeperawatan == masalahKeperawatan) &&
            (identical(other.rencanaKeperawatan, rencanaKeperawatan) ||
                other.rencanaKeperawatan == rencanaKeperawatan) &&
            (identical(other.aseskepHasilKajiRj, aseskepHasilKajiRj) ||
                other.aseskepHasilKajiRj == aseskepHasilKajiRj) &&
            (identical(
                    other.aseskepHasilKajiRjDetail, aseskepHasilKajiRjDetail) ||
                other.aseskepHasilKajiRjDetail == aseskepHasilKajiRjDetail) &&
            (identical(other.aseskepHasilKajiRjTindakan,
                    aseskepHasilKajiRjTindakan) ||
                other.aseskepHasilKajiRjTindakan ==
                    aseskepHasilKajiRjTindakan) &&
            (identical(other.aseskepNyeri, aseskepNyeri) ||
                other.aseskepNyeri == aseskepNyeri) &&
            (identical(other.aseskepPulang1, aseskepPulang1) ||
                other.aseskepPulang1 == aseskepPulang1) &&
            (identical(other.aseskepPulang1Detail, aseskepPulang1Detail) ||
                other.aseskepPulang1Detail == aseskepPulang1Detail) &&
            (identical(other.aseskepPulang2, aseskepPulang2) ||
                other.aseskepPulang2 == aseskepPulang2) &&
            (identical(other.aseskepPulang2Detail, aseskepPulang2Detail) ||
                other.aseskepPulang2Detail == aseskepPulang2Detail) &&
            (identical(other.aseskepPulang3, aseskepPulang3) ||
                other.aseskepPulang3 == aseskepPulang3) &&
            (identical(other.aseskepPulang3Detail, aseskepPulang3Detail) ||
                other.aseskepPulang3Detail == aseskepPulang3Detail) &&
            (identical(other.aseskepRj1, aseskepRj1) ||
                other.aseskepRj1 == aseskepRj1) &&
            (identical(other.aseskepRj2, aseskepRj2) ||
                other.aseskepRj2 == aseskepRj2) &&
            (identical(other.fungsionalDetail, fungsionalDetail) ||
                other.fungsionalDetail == fungsionalDetail) &&
            (identical(other.psikologisDetail, psikologisDetail) ||
                other.psikologisDetail == psikologisDetail));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        kdBagian,
        noReg,
        kelUtama,
        riwayatPenyakit,
        riwayatObat,
        riwayatObatDetail,
        riwayatPenyakitDetail,
        riwayatSaatDirumah,
        tekananDarah,
        nadi,
        suhu,
        pernapasan,
        beratBadan,
        tinggiBadan,
        skriningNyeri,
        psikologis,
        fungsional,
        perencanaanPemulangan,
        masalahKeperawatan,
        rencanaKeperawatan,
        aseskepHasilKajiRj,
        aseskepHasilKajiRjDetail,
        aseskepHasilKajiRjTindakan,
        aseskepNyeri,
        aseskepPulang1,
        aseskepPulang1Detail,
        aseskepPulang2,
        aseskepPulang2Detail,
        aseskepPulang3,
        aseskepPulang3Detail,
        aseskepRj1,
        aseskepRj2,
        fungsionalDetail,
        psikologisDetail
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveAsesRawatJalanPerawatImplCopyWith<_$SaveAsesRawatJalanPerawatImpl>
      get copyWith => __$$SaveAsesRawatJalanPerawatImplCopyWithImpl<
          _$SaveAsesRawatJalanPerawatImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)
        saveSkrining,
    required TResult Function(String noRM) riwayatPasien,
    required TResult Function(List<DetailProfilPasienModel> detailProfilePasien)
        addRiwayatPasien,
    required TResult Function(AntreanPasienModel pasien) selectedPasien,
    required TResult Function(SkirningModel skrining) saveStateSkrining,
    required TResult Function(String noReg) getOdontogram,
    required TResult Function(AssementRawatJalanModel assementRawatJalanModel)
        saveRawatJalanDokter,
    required TResult Function(String noReg) uploadOdontogram,
    required TResult Function(String noReg, String picturePath, String kdBagian)
        publishOdontogram,
    required TResult Function(String noReg) getAssmentRawatjalanDokter,
    required TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)
        saveAssesKebEdukasi,
    required TResult Function(String noReg) getKebEdukasi,
    required TResult Function(String noReg) getAssesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi, String keterangan)
        saveOdontogram,
    required TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)
        saveAsesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi) deleteOdontogram,
    required TResult Function(String noReg) getSkrining,
    required TResult Function() started,
    required TResult Function(String norm) selectedNorm,
    required TResult Function(bool enable) addLoadingAnatomi,
    required TResult Function(String keterangan) addKeterangan,
    required TResult Function(
            String nama, String norm, String keterangan, File picturePath)
        simpanAnatomi,
    required TResult Function(
            String nama, String norm, String keterangan, String picturePath)
        saveAnatomi,
    required TResult Function() getAntreanPasien,
    required TResult Function() getKVitalSign,
    required TResult Function(String noRM) getDetailPasien,
    required TResult Function(List<AntreanPasienModel> antreanPasien) addPasien,
  }) {
    return saveAsesRawatJalanPerawat(
        kdBagian,
        noReg,
        kelUtama,
        riwayatPenyakit,
        riwayatObat,
        riwayatObatDetail,
        riwayatPenyakitDetail,
        riwayatSaatDirumah,
        tekananDarah,
        nadi,
        suhu,
        pernapasan,
        beratBadan,
        tinggiBadan,
        skriningNyeri,
        psikologis,
        fungsional,
        perencanaanPemulangan,
        masalahKeperawatan,
        rencanaKeperawatan,
        aseskepHasilKajiRj,
        aseskepHasilKajiRjDetail,
        aseskepHasilKajiRjTindakan,
        aseskepNyeri,
        aseskepPulang1,
        aseskepPulang1Detail,
        aseskepPulang2,
        aseskepPulang2Detail,
        aseskepPulang3,
        aseskepPulang3Detail,
        aseskepRj1,
        aseskepRj2,
        fungsionalDetail,
        psikologisDetail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult? Function(String noRM)? riwayatPasien,
    TResult? Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult? Function(AntreanPasienModel pasien)? selectedPasien,
    TResult? Function(SkirningModel skrining)? saveStateSkrining,
    TResult? Function(String noReg)? getOdontogram,
    TResult? Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult? Function(String noReg)? uploadOdontogram,
    TResult? Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult? Function(String noReg)? getAssmentRawatjalanDokter,
    TResult? Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult? Function(String noReg)? getKebEdukasi,
    TResult? Function(String noReg)? getAssesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult? Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi)? deleteOdontogram,
    TResult? Function(String noReg)? getSkrining,
    TResult? Function()? started,
    TResult? Function(String norm)? selectedNorm,
    TResult? Function(bool enable)? addLoadingAnatomi,
    TResult? Function(String keterangan)? addKeterangan,
    TResult? Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult? Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult? Function()? getAntreanPasien,
    TResult? Function()? getKVitalSign,
    TResult? Function(String noRM)? getDetailPasien,
    TResult? Function(List<AntreanPasienModel> antreanPasien)? addPasien,
  }) {
    return saveAsesRawatJalanPerawat?.call(
        kdBagian,
        noReg,
        kelUtama,
        riwayatPenyakit,
        riwayatObat,
        riwayatObatDetail,
        riwayatPenyakitDetail,
        riwayatSaatDirumah,
        tekananDarah,
        nadi,
        suhu,
        pernapasan,
        beratBadan,
        tinggiBadan,
        skriningNyeri,
        psikologis,
        fungsional,
        perencanaanPemulangan,
        masalahKeperawatan,
        rencanaKeperawatan,
        aseskepHasilKajiRj,
        aseskepHasilKajiRjDetail,
        aseskepHasilKajiRjTindakan,
        aseskepNyeri,
        aseskepPulang1,
        aseskepPulang1Detail,
        aseskepPulang2,
        aseskepPulang2Detail,
        aseskepPulang3,
        aseskepPulang3Detail,
        aseskepRj1,
        aseskepRj2,
        fungsionalDetail,
        psikologisDetail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult Function(String noRM)? riwayatPasien,
    TResult Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult Function(AntreanPasienModel pasien)? selectedPasien,
    TResult Function(SkirningModel skrining)? saveStateSkrining,
    TResult Function(String noReg)? getOdontogram,
    TResult Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult Function(String noReg)? uploadOdontogram,
    TResult Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult Function(String noReg)? getAssmentRawatjalanDokter,
    TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult Function(String noReg)? getKebEdukasi,
    TResult Function(String noReg)? getAssesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi)? deleteOdontogram,
    TResult Function(String noReg)? getSkrining,
    TResult Function()? started,
    TResult Function(String norm)? selectedNorm,
    TResult Function(bool enable)? addLoadingAnatomi,
    TResult Function(String keterangan)? addKeterangan,
    TResult Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult Function()? getAntreanPasien,
    TResult Function()? getKVitalSign,
    TResult Function(String noRM)? getDetailPasien,
    TResult Function(List<AntreanPasienModel> antreanPasien)? addPasien,
    required TResult orElse(),
  }) {
    if (saveAsesRawatJalanPerawat != null) {
      return saveAsesRawatJalanPerawat(
          kdBagian,
          noReg,
          kelUtama,
          riwayatPenyakit,
          riwayatObat,
          riwayatObatDetail,
          riwayatPenyakitDetail,
          riwayatSaatDirumah,
          tekananDarah,
          nadi,
          suhu,
          pernapasan,
          beratBadan,
          tinggiBadan,
          skriningNyeri,
          psikologis,
          fungsional,
          perencanaanPemulangan,
          masalahKeperawatan,
          rencanaKeperawatan,
          aseskepHasilKajiRj,
          aseskepHasilKajiRjDetail,
          aseskepHasilKajiRjTindakan,
          aseskepNyeri,
          aseskepPulang1,
          aseskepPulang1Detail,
          aseskepPulang2,
          aseskepPulang2Detail,
          aseskepPulang3,
          aseskepPulang3Detail,
          aseskepRj1,
          aseskepRj2,
          fungsionalDetail,
          psikologisDetail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveSkrining value) saveSkrining,
    required TResult Function(RiwayatPasien value) riwayatPasien,
    required TResult Function(addRiwayatPasien value) addRiwayatPasien,
    required TResult Function(SelectedPasien value) selectedPasien,
    required TResult Function(SaveStateSkrining value) saveStateSkrining,
    required TResult Function(GetOdontogram value) getOdontogram,
    required TResult Function(SaveRawatJalanDokter value) saveRawatJalanDokter,
    required TResult Function(UploadOdontogram value) uploadOdontogram,
    required TResult Function(PublishOdontogram value) publishOdontogram,
    required TResult Function(GetAssmentRawatjalanDokter value)
        getAssmentRawatjalanDokter,
    required TResult Function(SaveAssesKebEdukasi value) saveAssesKebEdukasi,
    required TResult Function(GetKebEdukasi value) getKebEdukasi,
    required TResult Function(GetAssesRawatJalanPerawat value)
        getAssesRawatJalanPerawat,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_SaveAsesRawatJalanPerawat value)
        saveAsesRawatJalanPerawat,
    required TResult Function(_DeleteOdontogram value) deleteOdontogram,
    required TResult Function(_GetSkrining value) getSkrining,
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedNorm value) selectedNorm,
    required TResult Function(_AddLoadingAnatomi value) addLoadingAnatomi,
    required TResult Function(_AddKeterangan value) addKeterangan,
    required TResult Function(_SimpanAnatomi value) simpanAnatomi,
    required TResult Function(_SaveAnatomi value) saveAnatomi,
    required TResult Function(_GetAntreanPasien value) getAntreanPasien,
    required TResult Function(_GetKVitalSign value) getKVitalSign,
    required TResult Function(_GetDetailPasien value) getDetailPasien,
    required TResult Function(_AddPasien value) addPasien,
  }) {
    return saveAsesRawatJalanPerawat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveSkrining value)? saveSkrining,
    TResult? Function(RiwayatPasien value)? riwayatPasien,
    TResult? Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult? Function(SelectedPasien value)? selectedPasien,
    TResult? Function(SaveStateSkrining value)? saveStateSkrining,
    TResult? Function(GetOdontogram value)? getOdontogram,
    TResult? Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult? Function(UploadOdontogram value)? uploadOdontogram,
    TResult? Function(PublishOdontogram value)? publishOdontogram,
    TResult? Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult? Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult? Function(GetKebEdukasi value)? getKebEdukasi,
    TResult? Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult? Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult? Function(_GetSkrining value)? getSkrining,
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedNorm value)? selectedNorm,
    TResult? Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult? Function(_AddKeterangan value)? addKeterangan,
    TResult? Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult? Function(_SaveAnatomi value)? saveAnatomi,
    TResult? Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult? Function(_GetKVitalSign value)? getKVitalSign,
    TResult? Function(_GetDetailPasien value)? getDetailPasien,
    TResult? Function(_AddPasien value)? addPasien,
  }) {
    return saveAsesRawatJalanPerawat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveSkrining value)? saveSkrining,
    TResult Function(RiwayatPasien value)? riwayatPasien,
    TResult Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult Function(SelectedPasien value)? selectedPasien,
    TResult Function(SaveStateSkrining value)? saveStateSkrining,
    TResult Function(GetOdontogram value)? getOdontogram,
    TResult Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult Function(UploadOdontogram value)? uploadOdontogram,
    TResult Function(PublishOdontogram value)? publishOdontogram,
    TResult Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult Function(GetKebEdukasi value)? getKebEdukasi,
    TResult Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult Function(_GetSkrining value)? getSkrining,
    TResult Function(_Started value)? started,
    TResult Function(_SelectedNorm value)? selectedNorm,
    TResult Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult Function(_AddKeterangan value)? addKeterangan,
    TResult Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult Function(_SaveAnatomi value)? saveAnatomi,
    TResult Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult Function(_GetKVitalSign value)? getKVitalSign,
    TResult Function(_GetDetailPasien value)? getDetailPasien,
    TResult Function(_AddPasien value)? addPasien,
    required TResult orElse(),
  }) {
    if (saveAsesRawatJalanPerawat != null) {
      return saveAsesRawatJalanPerawat(this);
    }
    return orElse();
  }
}

abstract class _SaveAsesRawatJalanPerawat implements PasienEvent {
  const factory _SaveAsesRawatJalanPerawat(
          {required final String kdBagian,
          required final String noReg,
          required final String kelUtama,
          required final String riwayatPenyakit,
          required final String riwayatObat,
          required final String riwayatObatDetail,
          required final String riwayatPenyakitDetail,
          required final String riwayatSaatDirumah,
          required final String tekananDarah,
          required final String nadi,
          required final String suhu,
          required final String pernapasan,
          required final String beratBadan,
          required final String tinggiBadan,
          required final String skriningNyeri,
          required final String psikologis,
          required final String fungsional,
          required final String perencanaanPemulangan,
          required final String masalahKeperawatan,
          required final String rencanaKeperawatan,
          required final String aseskepHasilKajiRj,
          required final String aseskepHasilKajiRjDetail,
          required final String aseskepHasilKajiRjTindakan,
          required final String aseskepNyeri,
          required final String aseskepPulang1,
          required final String aseskepPulang1Detail,
          required final String aseskepPulang2,
          required final String aseskepPulang2Detail,
          required final String aseskepPulang3,
          required final String aseskepPulang3Detail,
          required final String aseskepRj1,
          required final String aseskepRj2,
          required final String fungsionalDetail,
          required final String psikologisDetail}) =
      _$SaveAsesRawatJalanPerawatImpl;

  String get kdBagian;
  String get noReg;
  String get kelUtama;
  String get riwayatPenyakit;
  String get riwayatObat;
  String get riwayatObatDetail;
  String get riwayatPenyakitDetail;
  String get riwayatSaatDirumah;
  String get tekananDarah;
  String get nadi;
  String get suhu;
  String get pernapasan;
  String get beratBadan;
  String get tinggiBadan;
  String get skriningNyeri;
  String get psikologis;
  String get fungsional;
  String get perencanaanPemulangan;
  String get masalahKeperawatan;
  String get rencanaKeperawatan;
  String get aseskepHasilKajiRj;
  String get aseskepHasilKajiRjDetail;
  String get aseskepHasilKajiRjTindakan;
  String get aseskepNyeri;
  String get aseskepPulang1;
  String get aseskepPulang1Detail;
  String get aseskepPulang2;
  String get aseskepPulang2Detail;
  String get aseskepPulang3;
  String get aseskepPulang3Detail;
  String get aseskepRj1;
  String get aseskepRj2;
  String get fungsionalDetail;
  String get psikologisDetail;
  @JsonKey(ignore: true)
  _$$SaveAsesRawatJalanPerawatImplCopyWith<_$SaveAsesRawatJalanPerawatImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteOdontogramImplCopyWith<$Res> {
  factory _$$DeleteOdontogramImplCopyWith(_$DeleteOdontogramImpl value,
          $Res Function(_$DeleteOdontogramImpl) then) =
      __$$DeleteOdontogramImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String noReg, String noGigi});
}

/// @nodoc
class __$$DeleteOdontogramImplCopyWithImpl<$Res>
    extends _$PasienEventCopyWithImpl<$Res, _$DeleteOdontogramImpl>
    implements _$$DeleteOdontogramImplCopyWith<$Res> {
  __$$DeleteOdontogramImplCopyWithImpl(_$DeleteOdontogramImpl _value,
      $Res Function(_$DeleteOdontogramImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noReg = null,
    Object? noGigi = null,
  }) {
    return _then(_$DeleteOdontogramImpl(
      noReg: null == noReg
          ? _value.noReg
          : noReg // ignore: cast_nullable_to_non_nullable
              as String,
      noGigi: null == noGigi
          ? _value.noGigi
          : noGigi // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteOdontogramImpl implements _DeleteOdontogram {
  const _$DeleteOdontogramImpl({required this.noReg, required this.noGigi});

  @override
  final String noReg;
  @override
  final String noGigi;

  @override
  String toString() {
    return 'PasienEvent.deleteOdontogram(noReg: $noReg, noGigi: $noGigi)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteOdontogramImpl &&
            (identical(other.noReg, noReg) || other.noReg == noReg) &&
            (identical(other.noGigi, noGigi) || other.noGigi == noGigi));
  }

  @override
  int get hashCode => Object.hash(runtimeType, noReg, noGigi);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteOdontogramImplCopyWith<_$DeleteOdontogramImpl> get copyWith =>
      __$$DeleteOdontogramImplCopyWithImpl<_$DeleteOdontogramImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)
        saveSkrining,
    required TResult Function(String noRM) riwayatPasien,
    required TResult Function(List<DetailProfilPasienModel> detailProfilePasien)
        addRiwayatPasien,
    required TResult Function(AntreanPasienModel pasien) selectedPasien,
    required TResult Function(SkirningModel skrining) saveStateSkrining,
    required TResult Function(String noReg) getOdontogram,
    required TResult Function(AssementRawatJalanModel assementRawatJalanModel)
        saveRawatJalanDokter,
    required TResult Function(String noReg) uploadOdontogram,
    required TResult Function(String noReg, String picturePath, String kdBagian)
        publishOdontogram,
    required TResult Function(String noReg) getAssmentRawatjalanDokter,
    required TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)
        saveAssesKebEdukasi,
    required TResult Function(String noReg) getKebEdukasi,
    required TResult Function(String noReg) getAssesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi, String keterangan)
        saveOdontogram,
    required TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)
        saveAsesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi) deleteOdontogram,
    required TResult Function(String noReg) getSkrining,
    required TResult Function() started,
    required TResult Function(String norm) selectedNorm,
    required TResult Function(bool enable) addLoadingAnatomi,
    required TResult Function(String keterangan) addKeterangan,
    required TResult Function(
            String nama, String norm, String keterangan, File picturePath)
        simpanAnatomi,
    required TResult Function(
            String nama, String norm, String keterangan, String picturePath)
        saveAnatomi,
    required TResult Function() getAntreanPasien,
    required TResult Function() getKVitalSign,
    required TResult Function(String noRM) getDetailPasien,
    required TResult Function(List<AntreanPasienModel> antreanPasien) addPasien,
  }) {
    return deleteOdontogram(noReg, noGigi);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult? Function(String noRM)? riwayatPasien,
    TResult? Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult? Function(AntreanPasienModel pasien)? selectedPasien,
    TResult? Function(SkirningModel skrining)? saveStateSkrining,
    TResult? Function(String noReg)? getOdontogram,
    TResult? Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult? Function(String noReg)? uploadOdontogram,
    TResult? Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult? Function(String noReg)? getAssmentRawatjalanDokter,
    TResult? Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult? Function(String noReg)? getKebEdukasi,
    TResult? Function(String noReg)? getAssesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult? Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi)? deleteOdontogram,
    TResult? Function(String noReg)? getSkrining,
    TResult? Function()? started,
    TResult? Function(String norm)? selectedNorm,
    TResult? Function(bool enable)? addLoadingAnatomi,
    TResult? Function(String keterangan)? addKeterangan,
    TResult? Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult? Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult? Function()? getAntreanPasien,
    TResult? Function()? getKVitalSign,
    TResult? Function(String noRM)? getDetailPasien,
    TResult? Function(List<AntreanPasienModel> antreanPasien)? addPasien,
  }) {
    return deleteOdontogram?.call(noReg, noGigi);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult Function(String noRM)? riwayatPasien,
    TResult Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult Function(AntreanPasienModel pasien)? selectedPasien,
    TResult Function(SkirningModel skrining)? saveStateSkrining,
    TResult Function(String noReg)? getOdontogram,
    TResult Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult Function(String noReg)? uploadOdontogram,
    TResult Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult Function(String noReg)? getAssmentRawatjalanDokter,
    TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult Function(String noReg)? getKebEdukasi,
    TResult Function(String noReg)? getAssesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi)? deleteOdontogram,
    TResult Function(String noReg)? getSkrining,
    TResult Function()? started,
    TResult Function(String norm)? selectedNorm,
    TResult Function(bool enable)? addLoadingAnatomi,
    TResult Function(String keterangan)? addKeterangan,
    TResult Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult Function()? getAntreanPasien,
    TResult Function()? getKVitalSign,
    TResult Function(String noRM)? getDetailPasien,
    TResult Function(List<AntreanPasienModel> antreanPasien)? addPasien,
    required TResult orElse(),
  }) {
    if (deleteOdontogram != null) {
      return deleteOdontogram(noReg, noGigi);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveSkrining value) saveSkrining,
    required TResult Function(RiwayatPasien value) riwayatPasien,
    required TResult Function(addRiwayatPasien value) addRiwayatPasien,
    required TResult Function(SelectedPasien value) selectedPasien,
    required TResult Function(SaveStateSkrining value) saveStateSkrining,
    required TResult Function(GetOdontogram value) getOdontogram,
    required TResult Function(SaveRawatJalanDokter value) saveRawatJalanDokter,
    required TResult Function(UploadOdontogram value) uploadOdontogram,
    required TResult Function(PublishOdontogram value) publishOdontogram,
    required TResult Function(GetAssmentRawatjalanDokter value)
        getAssmentRawatjalanDokter,
    required TResult Function(SaveAssesKebEdukasi value) saveAssesKebEdukasi,
    required TResult Function(GetKebEdukasi value) getKebEdukasi,
    required TResult Function(GetAssesRawatJalanPerawat value)
        getAssesRawatJalanPerawat,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_SaveAsesRawatJalanPerawat value)
        saveAsesRawatJalanPerawat,
    required TResult Function(_DeleteOdontogram value) deleteOdontogram,
    required TResult Function(_GetSkrining value) getSkrining,
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedNorm value) selectedNorm,
    required TResult Function(_AddLoadingAnatomi value) addLoadingAnatomi,
    required TResult Function(_AddKeterangan value) addKeterangan,
    required TResult Function(_SimpanAnatomi value) simpanAnatomi,
    required TResult Function(_SaveAnatomi value) saveAnatomi,
    required TResult Function(_GetAntreanPasien value) getAntreanPasien,
    required TResult Function(_GetKVitalSign value) getKVitalSign,
    required TResult Function(_GetDetailPasien value) getDetailPasien,
    required TResult Function(_AddPasien value) addPasien,
  }) {
    return deleteOdontogram(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveSkrining value)? saveSkrining,
    TResult? Function(RiwayatPasien value)? riwayatPasien,
    TResult? Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult? Function(SelectedPasien value)? selectedPasien,
    TResult? Function(SaveStateSkrining value)? saveStateSkrining,
    TResult? Function(GetOdontogram value)? getOdontogram,
    TResult? Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult? Function(UploadOdontogram value)? uploadOdontogram,
    TResult? Function(PublishOdontogram value)? publishOdontogram,
    TResult? Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult? Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult? Function(GetKebEdukasi value)? getKebEdukasi,
    TResult? Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult? Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult? Function(_GetSkrining value)? getSkrining,
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedNorm value)? selectedNorm,
    TResult? Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult? Function(_AddKeterangan value)? addKeterangan,
    TResult? Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult? Function(_SaveAnatomi value)? saveAnatomi,
    TResult? Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult? Function(_GetKVitalSign value)? getKVitalSign,
    TResult? Function(_GetDetailPasien value)? getDetailPasien,
    TResult? Function(_AddPasien value)? addPasien,
  }) {
    return deleteOdontogram?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveSkrining value)? saveSkrining,
    TResult Function(RiwayatPasien value)? riwayatPasien,
    TResult Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult Function(SelectedPasien value)? selectedPasien,
    TResult Function(SaveStateSkrining value)? saveStateSkrining,
    TResult Function(GetOdontogram value)? getOdontogram,
    TResult Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult Function(UploadOdontogram value)? uploadOdontogram,
    TResult Function(PublishOdontogram value)? publishOdontogram,
    TResult Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult Function(GetKebEdukasi value)? getKebEdukasi,
    TResult Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult Function(_GetSkrining value)? getSkrining,
    TResult Function(_Started value)? started,
    TResult Function(_SelectedNorm value)? selectedNorm,
    TResult Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult Function(_AddKeterangan value)? addKeterangan,
    TResult Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult Function(_SaveAnatomi value)? saveAnatomi,
    TResult Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult Function(_GetKVitalSign value)? getKVitalSign,
    TResult Function(_GetDetailPasien value)? getDetailPasien,
    TResult Function(_AddPasien value)? addPasien,
    required TResult orElse(),
  }) {
    if (deleteOdontogram != null) {
      return deleteOdontogram(this);
    }
    return orElse();
  }
}

abstract class _DeleteOdontogram implements PasienEvent {
  const factory _DeleteOdontogram(
      {required final String noReg,
      required final String noGigi}) = _$DeleteOdontogramImpl;

  String get noReg;
  String get noGigi;
  @JsonKey(ignore: true)
  _$$DeleteOdontogramImplCopyWith<_$DeleteOdontogramImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetSkriningImplCopyWith<$Res> {
  factory _$$GetSkriningImplCopyWith(
          _$GetSkriningImpl value, $Res Function(_$GetSkriningImpl) then) =
      __$$GetSkriningImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String noReg});
}

/// @nodoc
class __$$GetSkriningImplCopyWithImpl<$Res>
    extends _$PasienEventCopyWithImpl<$Res, _$GetSkriningImpl>
    implements _$$GetSkriningImplCopyWith<$Res> {
  __$$GetSkriningImplCopyWithImpl(
      _$GetSkriningImpl _value, $Res Function(_$GetSkriningImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noReg = null,
  }) {
    return _then(_$GetSkriningImpl(
      noReg: null == noReg
          ? _value.noReg
          : noReg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetSkriningImpl implements _GetSkrining {
  const _$GetSkriningImpl({required this.noReg});

  @override
  final String noReg;

  @override
  String toString() {
    return 'PasienEvent.getSkrining(noReg: $noReg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSkriningImpl &&
            (identical(other.noReg, noReg) || other.noReg == noReg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, noReg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSkriningImplCopyWith<_$GetSkriningImpl> get copyWith =>
      __$$GetSkriningImplCopyWithImpl<_$GetSkriningImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)
        saveSkrining,
    required TResult Function(String noRM) riwayatPasien,
    required TResult Function(List<DetailProfilPasienModel> detailProfilePasien)
        addRiwayatPasien,
    required TResult Function(AntreanPasienModel pasien) selectedPasien,
    required TResult Function(SkirningModel skrining) saveStateSkrining,
    required TResult Function(String noReg) getOdontogram,
    required TResult Function(AssementRawatJalanModel assementRawatJalanModel)
        saveRawatJalanDokter,
    required TResult Function(String noReg) uploadOdontogram,
    required TResult Function(String noReg, String picturePath, String kdBagian)
        publishOdontogram,
    required TResult Function(String noReg) getAssmentRawatjalanDokter,
    required TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)
        saveAssesKebEdukasi,
    required TResult Function(String noReg) getKebEdukasi,
    required TResult Function(String noReg) getAssesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi, String keterangan)
        saveOdontogram,
    required TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)
        saveAsesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi) deleteOdontogram,
    required TResult Function(String noReg) getSkrining,
    required TResult Function() started,
    required TResult Function(String norm) selectedNorm,
    required TResult Function(bool enable) addLoadingAnatomi,
    required TResult Function(String keterangan) addKeterangan,
    required TResult Function(
            String nama, String norm, String keterangan, File picturePath)
        simpanAnatomi,
    required TResult Function(
            String nama, String norm, String keterangan, String picturePath)
        saveAnatomi,
    required TResult Function() getAntreanPasien,
    required TResult Function() getKVitalSign,
    required TResult Function(String noRM) getDetailPasien,
    required TResult Function(List<AntreanPasienModel> antreanPasien) addPasien,
  }) {
    return getSkrining(noReg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult? Function(String noRM)? riwayatPasien,
    TResult? Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult? Function(AntreanPasienModel pasien)? selectedPasien,
    TResult? Function(SkirningModel skrining)? saveStateSkrining,
    TResult? Function(String noReg)? getOdontogram,
    TResult? Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult? Function(String noReg)? uploadOdontogram,
    TResult? Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult? Function(String noReg)? getAssmentRawatjalanDokter,
    TResult? Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult? Function(String noReg)? getKebEdukasi,
    TResult? Function(String noReg)? getAssesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult? Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi)? deleteOdontogram,
    TResult? Function(String noReg)? getSkrining,
    TResult? Function()? started,
    TResult? Function(String norm)? selectedNorm,
    TResult? Function(bool enable)? addLoadingAnatomi,
    TResult? Function(String keterangan)? addKeterangan,
    TResult? Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult? Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult? Function()? getAntreanPasien,
    TResult? Function()? getKVitalSign,
    TResult? Function(String noRM)? getDetailPasien,
    TResult? Function(List<AntreanPasienModel> antreanPasien)? addPasien,
  }) {
    return getSkrining?.call(noReg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult Function(String noRM)? riwayatPasien,
    TResult Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult Function(AntreanPasienModel pasien)? selectedPasien,
    TResult Function(SkirningModel skrining)? saveStateSkrining,
    TResult Function(String noReg)? getOdontogram,
    TResult Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult Function(String noReg)? uploadOdontogram,
    TResult Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult Function(String noReg)? getAssmentRawatjalanDokter,
    TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult Function(String noReg)? getKebEdukasi,
    TResult Function(String noReg)? getAssesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi)? deleteOdontogram,
    TResult Function(String noReg)? getSkrining,
    TResult Function()? started,
    TResult Function(String norm)? selectedNorm,
    TResult Function(bool enable)? addLoadingAnatomi,
    TResult Function(String keterangan)? addKeterangan,
    TResult Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult Function()? getAntreanPasien,
    TResult Function()? getKVitalSign,
    TResult Function(String noRM)? getDetailPasien,
    TResult Function(List<AntreanPasienModel> antreanPasien)? addPasien,
    required TResult orElse(),
  }) {
    if (getSkrining != null) {
      return getSkrining(noReg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveSkrining value) saveSkrining,
    required TResult Function(RiwayatPasien value) riwayatPasien,
    required TResult Function(addRiwayatPasien value) addRiwayatPasien,
    required TResult Function(SelectedPasien value) selectedPasien,
    required TResult Function(SaveStateSkrining value) saveStateSkrining,
    required TResult Function(GetOdontogram value) getOdontogram,
    required TResult Function(SaveRawatJalanDokter value) saveRawatJalanDokter,
    required TResult Function(UploadOdontogram value) uploadOdontogram,
    required TResult Function(PublishOdontogram value) publishOdontogram,
    required TResult Function(GetAssmentRawatjalanDokter value)
        getAssmentRawatjalanDokter,
    required TResult Function(SaveAssesKebEdukasi value) saveAssesKebEdukasi,
    required TResult Function(GetKebEdukasi value) getKebEdukasi,
    required TResult Function(GetAssesRawatJalanPerawat value)
        getAssesRawatJalanPerawat,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_SaveAsesRawatJalanPerawat value)
        saveAsesRawatJalanPerawat,
    required TResult Function(_DeleteOdontogram value) deleteOdontogram,
    required TResult Function(_GetSkrining value) getSkrining,
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedNorm value) selectedNorm,
    required TResult Function(_AddLoadingAnatomi value) addLoadingAnatomi,
    required TResult Function(_AddKeterangan value) addKeterangan,
    required TResult Function(_SimpanAnatomi value) simpanAnatomi,
    required TResult Function(_SaveAnatomi value) saveAnatomi,
    required TResult Function(_GetAntreanPasien value) getAntreanPasien,
    required TResult Function(_GetKVitalSign value) getKVitalSign,
    required TResult Function(_GetDetailPasien value) getDetailPasien,
    required TResult Function(_AddPasien value) addPasien,
  }) {
    return getSkrining(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveSkrining value)? saveSkrining,
    TResult? Function(RiwayatPasien value)? riwayatPasien,
    TResult? Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult? Function(SelectedPasien value)? selectedPasien,
    TResult? Function(SaveStateSkrining value)? saveStateSkrining,
    TResult? Function(GetOdontogram value)? getOdontogram,
    TResult? Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult? Function(UploadOdontogram value)? uploadOdontogram,
    TResult? Function(PublishOdontogram value)? publishOdontogram,
    TResult? Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult? Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult? Function(GetKebEdukasi value)? getKebEdukasi,
    TResult? Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult? Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult? Function(_GetSkrining value)? getSkrining,
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedNorm value)? selectedNorm,
    TResult? Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult? Function(_AddKeterangan value)? addKeterangan,
    TResult? Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult? Function(_SaveAnatomi value)? saveAnatomi,
    TResult? Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult? Function(_GetKVitalSign value)? getKVitalSign,
    TResult? Function(_GetDetailPasien value)? getDetailPasien,
    TResult? Function(_AddPasien value)? addPasien,
  }) {
    return getSkrining?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveSkrining value)? saveSkrining,
    TResult Function(RiwayatPasien value)? riwayatPasien,
    TResult Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult Function(SelectedPasien value)? selectedPasien,
    TResult Function(SaveStateSkrining value)? saveStateSkrining,
    TResult Function(GetOdontogram value)? getOdontogram,
    TResult Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult Function(UploadOdontogram value)? uploadOdontogram,
    TResult Function(PublishOdontogram value)? publishOdontogram,
    TResult Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult Function(GetKebEdukasi value)? getKebEdukasi,
    TResult Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult Function(_GetSkrining value)? getSkrining,
    TResult Function(_Started value)? started,
    TResult Function(_SelectedNorm value)? selectedNorm,
    TResult Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult Function(_AddKeterangan value)? addKeterangan,
    TResult Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult Function(_SaveAnatomi value)? saveAnatomi,
    TResult Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult Function(_GetKVitalSign value)? getKVitalSign,
    TResult Function(_GetDetailPasien value)? getDetailPasien,
    TResult Function(_AddPasien value)? addPasien,
    required TResult orElse(),
  }) {
    if (getSkrining != null) {
      return getSkrining(this);
    }
    return orElse();
  }
}

abstract class _GetSkrining implements PasienEvent {
  const factory _GetSkrining({required final String noReg}) = _$GetSkriningImpl;

  String get noReg;
  @JsonKey(ignore: true)
  _$$GetSkriningImplCopyWith<_$GetSkriningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$PasienEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'PasienEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)
        saveSkrining,
    required TResult Function(String noRM) riwayatPasien,
    required TResult Function(List<DetailProfilPasienModel> detailProfilePasien)
        addRiwayatPasien,
    required TResult Function(AntreanPasienModel pasien) selectedPasien,
    required TResult Function(SkirningModel skrining) saveStateSkrining,
    required TResult Function(String noReg) getOdontogram,
    required TResult Function(AssementRawatJalanModel assementRawatJalanModel)
        saveRawatJalanDokter,
    required TResult Function(String noReg) uploadOdontogram,
    required TResult Function(String noReg, String picturePath, String kdBagian)
        publishOdontogram,
    required TResult Function(String noReg) getAssmentRawatjalanDokter,
    required TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)
        saveAssesKebEdukasi,
    required TResult Function(String noReg) getKebEdukasi,
    required TResult Function(String noReg) getAssesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi, String keterangan)
        saveOdontogram,
    required TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)
        saveAsesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi) deleteOdontogram,
    required TResult Function(String noReg) getSkrining,
    required TResult Function() started,
    required TResult Function(String norm) selectedNorm,
    required TResult Function(bool enable) addLoadingAnatomi,
    required TResult Function(String keterangan) addKeterangan,
    required TResult Function(
            String nama, String norm, String keterangan, File picturePath)
        simpanAnatomi,
    required TResult Function(
            String nama, String norm, String keterangan, String picturePath)
        saveAnatomi,
    required TResult Function() getAntreanPasien,
    required TResult Function() getKVitalSign,
    required TResult Function(String noRM) getDetailPasien,
    required TResult Function(List<AntreanPasienModel> antreanPasien) addPasien,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult? Function(String noRM)? riwayatPasien,
    TResult? Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult? Function(AntreanPasienModel pasien)? selectedPasien,
    TResult? Function(SkirningModel skrining)? saveStateSkrining,
    TResult? Function(String noReg)? getOdontogram,
    TResult? Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult? Function(String noReg)? uploadOdontogram,
    TResult? Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult? Function(String noReg)? getAssmentRawatjalanDokter,
    TResult? Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult? Function(String noReg)? getKebEdukasi,
    TResult? Function(String noReg)? getAssesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult? Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi)? deleteOdontogram,
    TResult? Function(String noReg)? getSkrining,
    TResult? Function()? started,
    TResult? Function(String norm)? selectedNorm,
    TResult? Function(bool enable)? addLoadingAnatomi,
    TResult? Function(String keterangan)? addKeterangan,
    TResult? Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult? Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult? Function()? getAntreanPasien,
    TResult? Function()? getKVitalSign,
    TResult? Function(String noRM)? getDetailPasien,
    TResult? Function(List<AntreanPasienModel> antreanPasien)? addPasien,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult Function(String noRM)? riwayatPasien,
    TResult Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult Function(AntreanPasienModel pasien)? selectedPasien,
    TResult Function(SkirningModel skrining)? saveStateSkrining,
    TResult Function(String noReg)? getOdontogram,
    TResult Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult Function(String noReg)? uploadOdontogram,
    TResult Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult Function(String noReg)? getAssmentRawatjalanDokter,
    TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult Function(String noReg)? getKebEdukasi,
    TResult Function(String noReg)? getAssesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi)? deleteOdontogram,
    TResult Function(String noReg)? getSkrining,
    TResult Function()? started,
    TResult Function(String norm)? selectedNorm,
    TResult Function(bool enable)? addLoadingAnatomi,
    TResult Function(String keterangan)? addKeterangan,
    TResult Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult Function()? getAntreanPasien,
    TResult Function()? getKVitalSign,
    TResult Function(String noRM)? getDetailPasien,
    TResult Function(List<AntreanPasienModel> antreanPasien)? addPasien,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveSkrining value) saveSkrining,
    required TResult Function(RiwayatPasien value) riwayatPasien,
    required TResult Function(addRiwayatPasien value) addRiwayatPasien,
    required TResult Function(SelectedPasien value) selectedPasien,
    required TResult Function(SaveStateSkrining value) saveStateSkrining,
    required TResult Function(GetOdontogram value) getOdontogram,
    required TResult Function(SaveRawatJalanDokter value) saveRawatJalanDokter,
    required TResult Function(UploadOdontogram value) uploadOdontogram,
    required TResult Function(PublishOdontogram value) publishOdontogram,
    required TResult Function(GetAssmentRawatjalanDokter value)
        getAssmentRawatjalanDokter,
    required TResult Function(SaveAssesKebEdukasi value) saveAssesKebEdukasi,
    required TResult Function(GetKebEdukasi value) getKebEdukasi,
    required TResult Function(GetAssesRawatJalanPerawat value)
        getAssesRawatJalanPerawat,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_SaveAsesRawatJalanPerawat value)
        saveAsesRawatJalanPerawat,
    required TResult Function(_DeleteOdontogram value) deleteOdontogram,
    required TResult Function(_GetSkrining value) getSkrining,
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedNorm value) selectedNorm,
    required TResult Function(_AddLoadingAnatomi value) addLoadingAnatomi,
    required TResult Function(_AddKeterangan value) addKeterangan,
    required TResult Function(_SimpanAnatomi value) simpanAnatomi,
    required TResult Function(_SaveAnatomi value) saveAnatomi,
    required TResult Function(_GetAntreanPasien value) getAntreanPasien,
    required TResult Function(_GetKVitalSign value) getKVitalSign,
    required TResult Function(_GetDetailPasien value) getDetailPasien,
    required TResult Function(_AddPasien value) addPasien,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveSkrining value)? saveSkrining,
    TResult? Function(RiwayatPasien value)? riwayatPasien,
    TResult? Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult? Function(SelectedPasien value)? selectedPasien,
    TResult? Function(SaveStateSkrining value)? saveStateSkrining,
    TResult? Function(GetOdontogram value)? getOdontogram,
    TResult? Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult? Function(UploadOdontogram value)? uploadOdontogram,
    TResult? Function(PublishOdontogram value)? publishOdontogram,
    TResult? Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult? Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult? Function(GetKebEdukasi value)? getKebEdukasi,
    TResult? Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult? Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult? Function(_GetSkrining value)? getSkrining,
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedNorm value)? selectedNorm,
    TResult? Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult? Function(_AddKeterangan value)? addKeterangan,
    TResult? Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult? Function(_SaveAnatomi value)? saveAnatomi,
    TResult? Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult? Function(_GetKVitalSign value)? getKVitalSign,
    TResult? Function(_GetDetailPasien value)? getDetailPasien,
    TResult? Function(_AddPasien value)? addPasien,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveSkrining value)? saveSkrining,
    TResult Function(RiwayatPasien value)? riwayatPasien,
    TResult Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult Function(SelectedPasien value)? selectedPasien,
    TResult Function(SaveStateSkrining value)? saveStateSkrining,
    TResult Function(GetOdontogram value)? getOdontogram,
    TResult Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult Function(UploadOdontogram value)? uploadOdontogram,
    TResult Function(PublishOdontogram value)? publishOdontogram,
    TResult Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult Function(GetKebEdukasi value)? getKebEdukasi,
    TResult Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult Function(_GetSkrining value)? getSkrining,
    TResult Function(_Started value)? started,
    TResult Function(_SelectedNorm value)? selectedNorm,
    TResult Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult Function(_AddKeterangan value)? addKeterangan,
    TResult Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult Function(_SaveAnatomi value)? saveAnatomi,
    TResult Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult Function(_GetKVitalSign value)? getKVitalSign,
    TResult Function(_GetDetailPasien value)? getDetailPasien,
    TResult Function(_AddPasien value)? addPasien,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements PasienEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$SelectedNormImplCopyWith<$Res> {
  factory _$$SelectedNormImplCopyWith(
          _$SelectedNormImpl value, $Res Function(_$SelectedNormImpl) then) =
      __$$SelectedNormImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String norm});
}

/// @nodoc
class __$$SelectedNormImplCopyWithImpl<$Res>
    extends _$PasienEventCopyWithImpl<$Res, _$SelectedNormImpl>
    implements _$$SelectedNormImplCopyWith<$Res> {
  __$$SelectedNormImplCopyWithImpl(
      _$SelectedNormImpl _value, $Res Function(_$SelectedNormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? norm = null,
  }) {
    return _then(_$SelectedNormImpl(
      norm: null == norm
          ? _value.norm
          : norm // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelectedNormImpl implements _SelectedNorm {
  const _$SelectedNormImpl({required this.norm});

  @override
  final String norm;

  @override
  String toString() {
    return 'PasienEvent.selectedNorm(norm: $norm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedNormImpl &&
            (identical(other.norm, norm) || other.norm == norm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, norm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedNormImplCopyWith<_$SelectedNormImpl> get copyWith =>
      __$$SelectedNormImplCopyWithImpl<_$SelectedNormImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)
        saveSkrining,
    required TResult Function(String noRM) riwayatPasien,
    required TResult Function(List<DetailProfilPasienModel> detailProfilePasien)
        addRiwayatPasien,
    required TResult Function(AntreanPasienModel pasien) selectedPasien,
    required TResult Function(SkirningModel skrining) saveStateSkrining,
    required TResult Function(String noReg) getOdontogram,
    required TResult Function(AssementRawatJalanModel assementRawatJalanModel)
        saveRawatJalanDokter,
    required TResult Function(String noReg) uploadOdontogram,
    required TResult Function(String noReg, String picturePath, String kdBagian)
        publishOdontogram,
    required TResult Function(String noReg) getAssmentRawatjalanDokter,
    required TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)
        saveAssesKebEdukasi,
    required TResult Function(String noReg) getKebEdukasi,
    required TResult Function(String noReg) getAssesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi, String keterangan)
        saveOdontogram,
    required TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)
        saveAsesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi) deleteOdontogram,
    required TResult Function(String noReg) getSkrining,
    required TResult Function() started,
    required TResult Function(String norm) selectedNorm,
    required TResult Function(bool enable) addLoadingAnatomi,
    required TResult Function(String keterangan) addKeterangan,
    required TResult Function(
            String nama, String norm, String keterangan, File picturePath)
        simpanAnatomi,
    required TResult Function(
            String nama, String norm, String keterangan, String picturePath)
        saveAnatomi,
    required TResult Function() getAntreanPasien,
    required TResult Function() getKVitalSign,
    required TResult Function(String noRM) getDetailPasien,
    required TResult Function(List<AntreanPasienModel> antreanPasien) addPasien,
  }) {
    return selectedNorm(norm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult? Function(String noRM)? riwayatPasien,
    TResult? Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult? Function(AntreanPasienModel pasien)? selectedPasien,
    TResult? Function(SkirningModel skrining)? saveStateSkrining,
    TResult? Function(String noReg)? getOdontogram,
    TResult? Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult? Function(String noReg)? uploadOdontogram,
    TResult? Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult? Function(String noReg)? getAssmentRawatjalanDokter,
    TResult? Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult? Function(String noReg)? getKebEdukasi,
    TResult? Function(String noReg)? getAssesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult? Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi)? deleteOdontogram,
    TResult? Function(String noReg)? getSkrining,
    TResult? Function()? started,
    TResult? Function(String norm)? selectedNorm,
    TResult? Function(bool enable)? addLoadingAnatomi,
    TResult? Function(String keterangan)? addKeterangan,
    TResult? Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult? Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult? Function()? getAntreanPasien,
    TResult? Function()? getKVitalSign,
    TResult? Function(String noRM)? getDetailPasien,
    TResult? Function(List<AntreanPasienModel> antreanPasien)? addPasien,
  }) {
    return selectedNorm?.call(norm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult Function(String noRM)? riwayatPasien,
    TResult Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult Function(AntreanPasienModel pasien)? selectedPasien,
    TResult Function(SkirningModel skrining)? saveStateSkrining,
    TResult Function(String noReg)? getOdontogram,
    TResult Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult Function(String noReg)? uploadOdontogram,
    TResult Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult Function(String noReg)? getAssmentRawatjalanDokter,
    TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult Function(String noReg)? getKebEdukasi,
    TResult Function(String noReg)? getAssesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi)? deleteOdontogram,
    TResult Function(String noReg)? getSkrining,
    TResult Function()? started,
    TResult Function(String norm)? selectedNorm,
    TResult Function(bool enable)? addLoadingAnatomi,
    TResult Function(String keterangan)? addKeterangan,
    TResult Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult Function()? getAntreanPasien,
    TResult Function()? getKVitalSign,
    TResult Function(String noRM)? getDetailPasien,
    TResult Function(List<AntreanPasienModel> antreanPasien)? addPasien,
    required TResult orElse(),
  }) {
    if (selectedNorm != null) {
      return selectedNorm(norm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveSkrining value) saveSkrining,
    required TResult Function(RiwayatPasien value) riwayatPasien,
    required TResult Function(addRiwayatPasien value) addRiwayatPasien,
    required TResult Function(SelectedPasien value) selectedPasien,
    required TResult Function(SaveStateSkrining value) saveStateSkrining,
    required TResult Function(GetOdontogram value) getOdontogram,
    required TResult Function(SaveRawatJalanDokter value) saveRawatJalanDokter,
    required TResult Function(UploadOdontogram value) uploadOdontogram,
    required TResult Function(PublishOdontogram value) publishOdontogram,
    required TResult Function(GetAssmentRawatjalanDokter value)
        getAssmentRawatjalanDokter,
    required TResult Function(SaveAssesKebEdukasi value) saveAssesKebEdukasi,
    required TResult Function(GetKebEdukasi value) getKebEdukasi,
    required TResult Function(GetAssesRawatJalanPerawat value)
        getAssesRawatJalanPerawat,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_SaveAsesRawatJalanPerawat value)
        saveAsesRawatJalanPerawat,
    required TResult Function(_DeleteOdontogram value) deleteOdontogram,
    required TResult Function(_GetSkrining value) getSkrining,
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedNorm value) selectedNorm,
    required TResult Function(_AddLoadingAnatomi value) addLoadingAnatomi,
    required TResult Function(_AddKeterangan value) addKeterangan,
    required TResult Function(_SimpanAnatomi value) simpanAnatomi,
    required TResult Function(_SaveAnatomi value) saveAnatomi,
    required TResult Function(_GetAntreanPasien value) getAntreanPasien,
    required TResult Function(_GetKVitalSign value) getKVitalSign,
    required TResult Function(_GetDetailPasien value) getDetailPasien,
    required TResult Function(_AddPasien value) addPasien,
  }) {
    return selectedNorm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveSkrining value)? saveSkrining,
    TResult? Function(RiwayatPasien value)? riwayatPasien,
    TResult? Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult? Function(SelectedPasien value)? selectedPasien,
    TResult? Function(SaveStateSkrining value)? saveStateSkrining,
    TResult? Function(GetOdontogram value)? getOdontogram,
    TResult? Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult? Function(UploadOdontogram value)? uploadOdontogram,
    TResult? Function(PublishOdontogram value)? publishOdontogram,
    TResult? Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult? Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult? Function(GetKebEdukasi value)? getKebEdukasi,
    TResult? Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult? Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult? Function(_GetSkrining value)? getSkrining,
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedNorm value)? selectedNorm,
    TResult? Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult? Function(_AddKeterangan value)? addKeterangan,
    TResult? Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult? Function(_SaveAnatomi value)? saveAnatomi,
    TResult? Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult? Function(_GetKVitalSign value)? getKVitalSign,
    TResult? Function(_GetDetailPasien value)? getDetailPasien,
    TResult? Function(_AddPasien value)? addPasien,
  }) {
    return selectedNorm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveSkrining value)? saveSkrining,
    TResult Function(RiwayatPasien value)? riwayatPasien,
    TResult Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult Function(SelectedPasien value)? selectedPasien,
    TResult Function(SaveStateSkrining value)? saveStateSkrining,
    TResult Function(GetOdontogram value)? getOdontogram,
    TResult Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult Function(UploadOdontogram value)? uploadOdontogram,
    TResult Function(PublishOdontogram value)? publishOdontogram,
    TResult Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult Function(GetKebEdukasi value)? getKebEdukasi,
    TResult Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult Function(_GetSkrining value)? getSkrining,
    TResult Function(_Started value)? started,
    TResult Function(_SelectedNorm value)? selectedNorm,
    TResult Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult Function(_AddKeterangan value)? addKeterangan,
    TResult Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult Function(_SaveAnatomi value)? saveAnatomi,
    TResult Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult Function(_GetKVitalSign value)? getKVitalSign,
    TResult Function(_GetDetailPasien value)? getDetailPasien,
    TResult Function(_AddPasien value)? addPasien,
    required TResult orElse(),
  }) {
    if (selectedNorm != null) {
      return selectedNorm(this);
    }
    return orElse();
  }
}

abstract class _SelectedNorm implements PasienEvent {
  const factory _SelectedNorm({required final String norm}) =
      _$SelectedNormImpl;

  String get norm;
  @JsonKey(ignore: true)
  _$$SelectedNormImplCopyWith<_$SelectedNormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddLoadingAnatomiImplCopyWith<$Res> {
  factory _$$AddLoadingAnatomiImplCopyWith(_$AddLoadingAnatomiImpl value,
          $Res Function(_$AddLoadingAnatomiImpl) then) =
      __$$AddLoadingAnatomiImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool enable});
}

/// @nodoc
class __$$AddLoadingAnatomiImplCopyWithImpl<$Res>
    extends _$PasienEventCopyWithImpl<$Res, _$AddLoadingAnatomiImpl>
    implements _$$AddLoadingAnatomiImplCopyWith<$Res> {
  __$$AddLoadingAnatomiImplCopyWithImpl(_$AddLoadingAnatomiImpl _value,
      $Res Function(_$AddLoadingAnatomiImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enable = null,
  }) {
    return _then(_$AddLoadingAnatomiImpl(
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AddLoadingAnatomiImpl implements _AddLoadingAnatomi {
  const _$AddLoadingAnatomiImpl({required this.enable});

  @override
  final bool enable;

  @override
  String toString() {
    return 'PasienEvent.addLoadingAnatomi(enable: $enable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddLoadingAnatomiImpl &&
            (identical(other.enable, enable) || other.enable == enable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddLoadingAnatomiImplCopyWith<_$AddLoadingAnatomiImpl> get copyWith =>
      __$$AddLoadingAnatomiImplCopyWithImpl<_$AddLoadingAnatomiImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)
        saveSkrining,
    required TResult Function(String noRM) riwayatPasien,
    required TResult Function(List<DetailProfilPasienModel> detailProfilePasien)
        addRiwayatPasien,
    required TResult Function(AntreanPasienModel pasien) selectedPasien,
    required TResult Function(SkirningModel skrining) saveStateSkrining,
    required TResult Function(String noReg) getOdontogram,
    required TResult Function(AssementRawatJalanModel assementRawatJalanModel)
        saveRawatJalanDokter,
    required TResult Function(String noReg) uploadOdontogram,
    required TResult Function(String noReg, String picturePath, String kdBagian)
        publishOdontogram,
    required TResult Function(String noReg) getAssmentRawatjalanDokter,
    required TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)
        saveAssesKebEdukasi,
    required TResult Function(String noReg) getKebEdukasi,
    required TResult Function(String noReg) getAssesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi, String keterangan)
        saveOdontogram,
    required TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)
        saveAsesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi) deleteOdontogram,
    required TResult Function(String noReg) getSkrining,
    required TResult Function() started,
    required TResult Function(String norm) selectedNorm,
    required TResult Function(bool enable) addLoadingAnatomi,
    required TResult Function(String keterangan) addKeterangan,
    required TResult Function(
            String nama, String norm, String keterangan, File picturePath)
        simpanAnatomi,
    required TResult Function(
            String nama, String norm, String keterangan, String picturePath)
        saveAnatomi,
    required TResult Function() getAntreanPasien,
    required TResult Function() getKVitalSign,
    required TResult Function(String noRM) getDetailPasien,
    required TResult Function(List<AntreanPasienModel> antreanPasien) addPasien,
  }) {
    return addLoadingAnatomi(enable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult? Function(String noRM)? riwayatPasien,
    TResult? Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult? Function(AntreanPasienModel pasien)? selectedPasien,
    TResult? Function(SkirningModel skrining)? saveStateSkrining,
    TResult? Function(String noReg)? getOdontogram,
    TResult? Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult? Function(String noReg)? uploadOdontogram,
    TResult? Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult? Function(String noReg)? getAssmentRawatjalanDokter,
    TResult? Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult? Function(String noReg)? getKebEdukasi,
    TResult? Function(String noReg)? getAssesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult? Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi)? deleteOdontogram,
    TResult? Function(String noReg)? getSkrining,
    TResult? Function()? started,
    TResult? Function(String norm)? selectedNorm,
    TResult? Function(bool enable)? addLoadingAnatomi,
    TResult? Function(String keterangan)? addKeterangan,
    TResult? Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult? Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult? Function()? getAntreanPasien,
    TResult? Function()? getKVitalSign,
    TResult? Function(String noRM)? getDetailPasien,
    TResult? Function(List<AntreanPasienModel> antreanPasien)? addPasien,
  }) {
    return addLoadingAnatomi?.call(enable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult Function(String noRM)? riwayatPasien,
    TResult Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult Function(AntreanPasienModel pasien)? selectedPasien,
    TResult Function(SkirningModel skrining)? saveStateSkrining,
    TResult Function(String noReg)? getOdontogram,
    TResult Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult Function(String noReg)? uploadOdontogram,
    TResult Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult Function(String noReg)? getAssmentRawatjalanDokter,
    TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult Function(String noReg)? getKebEdukasi,
    TResult Function(String noReg)? getAssesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi)? deleteOdontogram,
    TResult Function(String noReg)? getSkrining,
    TResult Function()? started,
    TResult Function(String norm)? selectedNorm,
    TResult Function(bool enable)? addLoadingAnatomi,
    TResult Function(String keterangan)? addKeterangan,
    TResult Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult Function()? getAntreanPasien,
    TResult Function()? getKVitalSign,
    TResult Function(String noRM)? getDetailPasien,
    TResult Function(List<AntreanPasienModel> antreanPasien)? addPasien,
    required TResult orElse(),
  }) {
    if (addLoadingAnatomi != null) {
      return addLoadingAnatomi(enable);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveSkrining value) saveSkrining,
    required TResult Function(RiwayatPasien value) riwayatPasien,
    required TResult Function(addRiwayatPasien value) addRiwayatPasien,
    required TResult Function(SelectedPasien value) selectedPasien,
    required TResult Function(SaveStateSkrining value) saveStateSkrining,
    required TResult Function(GetOdontogram value) getOdontogram,
    required TResult Function(SaveRawatJalanDokter value) saveRawatJalanDokter,
    required TResult Function(UploadOdontogram value) uploadOdontogram,
    required TResult Function(PublishOdontogram value) publishOdontogram,
    required TResult Function(GetAssmentRawatjalanDokter value)
        getAssmentRawatjalanDokter,
    required TResult Function(SaveAssesKebEdukasi value) saveAssesKebEdukasi,
    required TResult Function(GetKebEdukasi value) getKebEdukasi,
    required TResult Function(GetAssesRawatJalanPerawat value)
        getAssesRawatJalanPerawat,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_SaveAsesRawatJalanPerawat value)
        saveAsesRawatJalanPerawat,
    required TResult Function(_DeleteOdontogram value) deleteOdontogram,
    required TResult Function(_GetSkrining value) getSkrining,
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedNorm value) selectedNorm,
    required TResult Function(_AddLoadingAnatomi value) addLoadingAnatomi,
    required TResult Function(_AddKeterangan value) addKeterangan,
    required TResult Function(_SimpanAnatomi value) simpanAnatomi,
    required TResult Function(_SaveAnatomi value) saveAnatomi,
    required TResult Function(_GetAntreanPasien value) getAntreanPasien,
    required TResult Function(_GetKVitalSign value) getKVitalSign,
    required TResult Function(_GetDetailPasien value) getDetailPasien,
    required TResult Function(_AddPasien value) addPasien,
  }) {
    return addLoadingAnatomi(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveSkrining value)? saveSkrining,
    TResult? Function(RiwayatPasien value)? riwayatPasien,
    TResult? Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult? Function(SelectedPasien value)? selectedPasien,
    TResult? Function(SaveStateSkrining value)? saveStateSkrining,
    TResult? Function(GetOdontogram value)? getOdontogram,
    TResult? Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult? Function(UploadOdontogram value)? uploadOdontogram,
    TResult? Function(PublishOdontogram value)? publishOdontogram,
    TResult? Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult? Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult? Function(GetKebEdukasi value)? getKebEdukasi,
    TResult? Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult? Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult? Function(_GetSkrining value)? getSkrining,
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedNorm value)? selectedNorm,
    TResult? Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult? Function(_AddKeterangan value)? addKeterangan,
    TResult? Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult? Function(_SaveAnatomi value)? saveAnatomi,
    TResult? Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult? Function(_GetKVitalSign value)? getKVitalSign,
    TResult? Function(_GetDetailPasien value)? getDetailPasien,
    TResult? Function(_AddPasien value)? addPasien,
  }) {
    return addLoadingAnatomi?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveSkrining value)? saveSkrining,
    TResult Function(RiwayatPasien value)? riwayatPasien,
    TResult Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult Function(SelectedPasien value)? selectedPasien,
    TResult Function(SaveStateSkrining value)? saveStateSkrining,
    TResult Function(GetOdontogram value)? getOdontogram,
    TResult Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult Function(UploadOdontogram value)? uploadOdontogram,
    TResult Function(PublishOdontogram value)? publishOdontogram,
    TResult Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult Function(GetKebEdukasi value)? getKebEdukasi,
    TResult Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult Function(_GetSkrining value)? getSkrining,
    TResult Function(_Started value)? started,
    TResult Function(_SelectedNorm value)? selectedNorm,
    TResult Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult Function(_AddKeterangan value)? addKeterangan,
    TResult Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult Function(_SaveAnatomi value)? saveAnatomi,
    TResult Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult Function(_GetKVitalSign value)? getKVitalSign,
    TResult Function(_GetDetailPasien value)? getDetailPasien,
    TResult Function(_AddPasien value)? addPasien,
    required TResult orElse(),
  }) {
    if (addLoadingAnatomi != null) {
      return addLoadingAnatomi(this);
    }
    return orElse();
  }
}

abstract class _AddLoadingAnatomi implements PasienEvent {
  const factory _AddLoadingAnatomi({required final bool enable}) =
      _$AddLoadingAnatomiImpl;

  bool get enable;
  @JsonKey(ignore: true)
  _$$AddLoadingAnatomiImplCopyWith<_$AddLoadingAnatomiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddKeteranganImplCopyWith<$Res> {
  factory _$$AddKeteranganImplCopyWith(
          _$AddKeteranganImpl value, $Res Function(_$AddKeteranganImpl) then) =
      __$$AddKeteranganImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String keterangan});
}

/// @nodoc
class __$$AddKeteranganImplCopyWithImpl<$Res>
    extends _$PasienEventCopyWithImpl<$Res, _$AddKeteranganImpl>
    implements _$$AddKeteranganImplCopyWith<$Res> {
  __$$AddKeteranganImplCopyWithImpl(
      _$AddKeteranganImpl _value, $Res Function(_$AddKeteranganImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keterangan = null,
  }) {
    return _then(_$AddKeteranganImpl(
      keterangan: null == keterangan
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddKeteranganImpl implements _AddKeterangan {
  const _$AddKeteranganImpl({required this.keterangan});

  @override
  final String keterangan;

  @override
  String toString() {
    return 'PasienEvent.addKeterangan(keterangan: $keterangan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddKeteranganImpl &&
            (identical(other.keterangan, keterangan) ||
                other.keterangan == keterangan));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keterangan);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddKeteranganImplCopyWith<_$AddKeteranganImpl> get copyWith =>
      __$$AddKeteranganImplCopyWithImpl<_$AddKeteranganImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)
        saveSkrining,
    required TResult Function(String noRM) riwayatPasien,
    required TResult Function(List<DetailProfilPasienModel> detailProfilePasien)
        addRiwayatPasien,
    required TResult Function(AntreanPasienModel pasien) selectedPasien,
    required TResult Function(SkirningModel skrining) saveStateSkrining,
    required TResult Function(String noReg) getOdontogram,
    required TResult Function(AssementRawatJalanModel assementRawatJalanModel)
        saveRawatJalanDokter,
    required TResult Function(String noReg) uploadOdontogram,
    required TResult Function(String noReg, String picturePath, String kdBagian)
        publishOdontogram,
    required TResult Function(String noReg) getAssmentRawatjalanDokter,
    required TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)
        saveAssesKebEdukasi,
    required TResult Function(String noReg) getKebEdukasi,
    required TResult Function(String noReg) getAssesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi, String keterangan)
        saveOdontogram,
    required TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)
        saveAsesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi) deleteOdontogram,
    required TResult Function(String noReg) getSkrining,
    required TResult Function() started,
    required TResult Function(String norm) selectedNorm,
    required TResult Function(bool enable) addLoadingAnatomi,
    required TResult Function(String keterangan) addKeterangan,
    required TResult Function(
            String nama, String norm, String keterangan, File picturePath)
        simpanAnatomi,
    required TResult Function(
            String nama, String norm, String keterangan, String picturePath)
        saveAnatomi,
    required TResult Function() getAntreanPasien,
    required TResult Function() getKVitalSign,
    required TResult Function(String noRM) getDetailPasien,
    required TResult Function(List<AntreanPasienModel> antreanPasien) addPasien,
  }) {
    return addKeterangan(keterangan);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult? Function(String noRM)? riwayatPasien,
    TResult? Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult? Function(AntreanPasienModel pasien)? selectedPasien,
    TResult? Function(SkirningModel skrining)? saveStateSkrining,
    TResult? Function(String noReg)? getOdontogram,
    TResult? Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult? Function(String noReg)? uploadOdontogram,
    TResult? Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult? Function(String noReg)? getAssmentRawatjalanDokter,
    TResult? Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult? Function(String noReg)? getKebEdukasi,
    TResult? Function(String noReg)? getAssesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult? Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi)? deleteOdontogram,
    TResult? Function(String noReg)? getSkrining,
    TResult? Function()? started,
    TResult? Function(String norm)? selectedNorm,
    TResult? Function(bool enable)? addLoadingAnatomi,
    TResult? Function(String keterangan)? addKeterangan,
    TResult? Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult? Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult? Function()? getAntreanPasien,
    TResult? Function()? getKVitalSign,
    TResult? Function(String noRM)? getDetailPasien,
    TResult? Function(List<AntreanPasienModel> antreanPasien)? addPasien,
  }) {
    return addKeterangan?.call(keterangan);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult Function(String noRM)? riwayatPasien,
    TResult Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult Function(AntreanPasienModel pasien)? selectedPasien,
    TResult Function(SkirningModel skrining)? saveStateSkrining,
    TResult Function(String noReg)? getOdontogram,
    TResult Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult Function(String noReg)? uploadOdontogram,
    TResult Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult Function(String noReg)? getAssmentRawatjalanDokter,
    TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult Function(String noReg)? getKebEdukasi,
    TResult Function(String noReg)? getAssesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi)? deleteOdontogram,
    TResult Function(String noReg)? getSkrining,
    TResult Function()? started,
    TResult Function(String norm)? selectedNorm,
    TResult Function(bool enable)? addLoadingAnatomi,
    TResult Function(String keterangan)? addKeterangan,
    TResult Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult Function()? getAntreanPasien,
    TResult Function()? getKVitalSign,
    TResult Function(String noRM)? getDetailPasien,
    TResult Function(List<AntreanPasienModel> antreanPasien)? addPasien,
    required TResult orElse(),
  }) {
    if (addKeterangan != null) {
      return addKeterangan(keterangan);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveSkrining value) saveSkrining,
    required TResult Function(RiwayatPasien value) riwayatPasien,
    required TResult Function(addRiwayatPasien value) addRiwayatPasien,
    required TResult Function(SelectedPasien value) selectedPasien,
    required TResult Function(SaveStateSkrining value) saveStateSkrining,
    required TResult Function(GetOdontogram value) getOdontogram,
    required TResult Function(SaveRawatJalanDokter value) saveRawatJalanDokter,
    required TResult Function(UploadOdontogram value) uploadOdontogram,
    required TResult Function(PublishOdontogram value) publishOdontogram,
    required TResult Function(GetAssmentRawatjalanDokter value)
        getAssmentRawatjalanDokter,
    required TResult Function(SaveAssesKebEdukasi value) saveAssesKebEdukasi,
    required TResult Function(GetKebEdukasi value) getKebEdukasi,
    required TResult Function(GetAssesRawatJalanPerawat value)
        getAssesRawatJalanPerawat,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_SaveAsesRawatJalanPerawat value)
        saveAsesRawatJalanPerawat,
    required TResult Function(_DeleteOdontogram value) deleteOdontogram,
    required TResult Function(_GetSkrining value) getSkrining,
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedNorm value) selectedNorm,
    required TResult Function(_AddLoadingAnatomi value) addLoadingAnatomi,
    required TResult Function(_AddKeterangan value) addKeterangan,
    required TResult Function(_SimpanAnatomi value) simpanAnatomi,
    required TResult Function(_SaveAnatomi value) saveAnatomi,
    required TResult Function(_GetAntreanPasien value) getAntreanPasien,
    required TResult Function(_GetKVitalSign value) getKVitalSign,
    required TResult Function(_GetDetailPasien value) getDetailPasien,
    required TResult Function(_AddPasien value) addPasien,
  }) {
    return addKeterangan(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveSkrining value)? saveSkrining,
    TResult? Function(RiwayatPasien value)? riwayatPasien,
    TResult? Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult? Function(SelectedPasien value)? selectedPasien,
    TResult? Function(SaveStateSkrining value)? saveStateSkrining,
    TResult? Function(GetOdontogram value)? getOdontogram,
    TResult? Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult? Function(UploadOdontogram value)? uploadOdontogram,
    TResult? Function(PublishOdontogram value)? publishOdontogram,
    TResult? Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult? Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult? Function(GetKebEdukasi value)? getKebEdukasi,
    TResult? Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult? Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult? Function(_GetSkrining value)? getSkrining,
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedNorm value)? selectedNorm,
    TResult? Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult? Function(_AddKeterangan value)? addKeterangan,
    TResult? Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult? Function(_SaveAnatomi value)? saveAnatomi,
    TResult? Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult? Function(_GetKVitalSign value)? getKVitalSign,
    TResult? Function(_GetDetailPasien value)? getDetailPasien,
    TResult? Function(_AddPasien value)? addPasien,
  }) {
    return addKeterangan?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveSkrining value)? saveSkrining,
    TResult Function(RiwayatPasien value)? riwayatPasien,
    TResult Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult Function(SelectedPasien value)? selectedPasien,
    TResult Function(SaveStateSkrining value)? saveStateSkrining,
    TResult Function(GetOdontogram value)? getOdontogram,
    TResult Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult Function(UploadOdontogram value)? uploadOdontogram,
    TResult Function(PublishOdontogram value)? publishOdontogram,
    TResult Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult Function(GetKebEdukasi value)? getKebEdukasi,
    TResult Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult Function(_GetSkrining value)? getSkrining,
    TResult Function(_Started value)? started,
    TResult Function(_SelectedNorm value)? selectedNorm,
    TResult Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult Function(_AddKeterangan value)? addKeterangan,
    TResult Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult Function(_SaveAnatomi value)? saveAnatomi,
    TResult Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult Function(_GetKVitalSign value)? getKVitalSign,
    TResult Function(_GetDetailPasien value)? getDetailPasien,
    TResult Function(_AddPasien value)? addPasien,
    required TResult orElse(),
  }) {
    if (addKeterangan != null) {
      return addKeterangan(this);
    }
    return orElse();
  }
}

abstract class _AddKeterangan implements PasienEvent {
  const factory _AddKeterangan({required final String keterangan}) =
      _$AddKeteranganImpl;

  String get keterangan;
  @JsonKey(ignore: true)
  _$$AddKeteranganImplCopyWith<_$AddKeteranganImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SimpanAnatomiImplCopyWith<$Res> {
  factory _$$SimpanAnatomiImplCopyWith(
          _$SimpanAnatomiImpl value, $Res Function(_$SimpanAnatomiImpl) then) =
      __$$SimpanAnatomiImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String nama, String norm, String keterangan, File picturePath});
}

/// @nodoc
class __$$SimpanAnatomiImplCopyWithImpl<$Res>
    extends _$PasienEventCopyWithImpl<$Res, _$SimpanAnatomiImpl>
    implements _$$SimpanAnatomiImplCopyWith<$Res> {
  __$$SimpanAnatomiImplCopyWithImpl(
      _$SimpanAnatomiImpl _value, $Res Function(_$SimpanAnatomiImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nama = null,
    Object? norm = null,
    Object? keterangan = null,
    Object? picturePath = null,
  }) {
    return _then(_$SimpanAnatomiImpl(
      nama: null == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      norm: null == norm
          ? _value.norm
          : norm // ignore: cast_nullable_to_non_nullable
              as String,
      keterangan: null == keterangan
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String,
      picturePath: null == picturePath
          ? _value.picturePath
          : picturePath // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$SimpanAnatomiImpl implements _SimpanAnatomi {
  const _$SimpanAnatomiImpl(
      {required this.nama,
      required this.norm,
      required this.keterangan,
      required this.picturePath});

  @override
  final String nama;
  @override
  final String norm;
  @override
  final String keterangan;
  @override
  final File picturePath;

  @override
  String toString() {
    return 'PasienEvent.simpanAnatomi(nama: $nama, norm: $norm, keterangan: $keterangan, picturePath: $picturePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimpanAnatomiImpl &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.norm, norm) || other.norm == norm) &&
            (identical(other.keterangan, keterangan) ||
                other.keterangan == keterangan) &&
            (identical(other.picturePath, picturePath) ||
                other.picturePath == picturePath));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, nama, norm, keterangan, picturePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SimpanAnatomiImplCopyWith<_$SimpanAnatomiImpl> get copyWith =>
      __$$SimpanAnatomiImplCopyWithImpl<_$SimpanAnatomiImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)
        saveSkrining,
    required TResult Function(String noRM) riwayatPasien,
    required TResult Function(List<DetailProfilPasienModel> detailProfilePasien)
        addRiwayatPasien,
    required TResult Function(AntreanPasienModel pasien) selectedPasien,
    required TResult Function(SkirningModel skrining) saveStateSkrining,
    required TResult Function(String noReg) getOdontogram,
    required TResult Function(AssementRawatJalanModel assementRawatJalanModel)
        saveRawatJalanDokter,
    required TResult Function(String noReg) uploadOdontogram,
    required TResult Function(String noReg, String picturePath, String kdBagian)
        publishOdontogram,
    required TResult Function(String noReg) getAssmentRawatjalanDokter,
    required TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)
        saveAssesKebEdukasi,
    required TResult Function(String noReg) getKebEdukasi,
    required TResult Function(String noReg) getAssesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi, String keterangan)
        saveOdontogram,
    required TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)
        saveAsesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi) deleteOdontogram,
    required TResult Function(String noReg) getSkrining,
    required TResult Function() started,
    required TResult Function(String norm) selectedNorm,
    required TResult Function(bool enable) addLoadingAnatomi,
    required TResult Function(String keterangan) addKeterangan,
    required TResult Function(
            String nama, String norm, String keterangan, File picturePath)
        simpanAnatomi,
    required TResult Function(
            String nama, String norm, String keterangan, String picturePath)
        saveAnatomi,
    required TResult Function() getAntreanPasien,
    required TResult Function() getKVitalSign,
    required TResult Function(String noRM) getDetailPasien,
    required TResult Function(List<AntreanPasienModel> antreanPasien) addPasien,
  }) {
    return simpanAnatomi(nama, norm, keterangan, picturePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult? Function(String noRM)? riwayatPasien,
    TResult? Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult? Function(AntreanPasienModel pasien)? selectedPasien,
    TResult? Function(SkirningModel skrining)? saveStateSkrining,
    TResult? Function(String noReg)? getOdontogram,
    TResult? Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult? Function(String noReg)? uploadOdontogram,
    TResult? Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult? Function(String noReg)? getAssmentRawatjalanDokter,
    TResult? Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult? Function(String noReg)? getKebEdukasi,
    TResult? Function(String noReg)? getAssesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult? Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi)? deleteOdontogram,
    TResult? Function(String noReg)? getSkrining,
    TResult? Function()? started,
    TResult? Function(String norm)? selectedNorm,
    TResult? Function(bool enable)? addLoadingAnatomi,
    TResult? Function(String keterangan)? addKeterangan,
    TResult? Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult? Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult? Function()? getAntreanPasien,
    TResult? Function()? getKVitalSign,
    TResult? Function(String noRM)? getDetailPasien,
    TResult? Function(List<AntreanPasienModel> antreanPasien)? addPasien,
  }) {
    return simpanAnatomi?.call(nama, norm, keterangan, picturePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult Function(String noRM)? riwayatPasien,
    TResult Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult Function(AntreanPasienModel pasien)? selectedPasien,
    TResult Function(SkirningModel skrining)? saveStateSkrining,
    TResult Function(String noReg)? getOdontogram,
    TResult Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult Function(String noReg)? uploadOdontogram,
    TResult Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult Function(String noReg)? getAssmentRawatjalanDokter,
    TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult Function(String noReg)? getKebEdukasi,
    TResult Function(String noReg)? getAssesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi)? deleteOdontogram,
    TResult Function(String noReg)? getSkrining,
    TResult Function()? started,
    TResult Function(String norm)? selectedNorm,
    TResult Function(bool enable)? addLoadingAnatomi,
    TResult Function(String keterangan)? addKeterangan,
    TResult Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult Function()? getAntreanPasien,
    TResult Function()? getKVitalSign,
    TResult Function(String noRM)? getDetailPasien,
    TResult Function(List<AntreanPasienModel> antreanPasien)? addPasien,
    required TResult orElse(),
  }) {
    if (simpanAnatomi != null) {
      return simpanAnatomi(nama, norm, keterangan, picturePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveSkrining value) saveSkrining,
    required TResult Function(RiwayatPasien value) riwayatPasien,
    required TResult Function(addRiwayatPasien value) addRiwayatPasien,
    required TResult Function(SelectedPasien value) selectedPasien,
    required TResult Function(SaveStateSkrining value) saveStateSkrining,
    required TResult Function(GetOdontogram value) getOdontogram,
    required TResult Function(SaveRawatJalanDokter value) saveRawatJalanDokter,
    required TResult Function(UploadOdontogram value) uploadOdontogram,
    required TResult Function(PublishOdontogram value) publishOdontogram,
    required TResult Function(GetAssmentRawatjalanDokter value)
        getAssmentRawatjalanDokter,
    required TResult Function(SaveAssesKebEdukasi value) saveAssesKebEdukasi,
    required TResult Function(GetKebEdukasi value) getKebEdukasi,
    required TResult Function(GetAssesRawatJalanPerawat value)
        getAssesRawatJalanPerawat,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_SaveAsesRawatJalanPerawat value)
        saveAsesRawatJalanPerawat,
    required TResult Function(_DeleteOdontogram value) deleteOdontogram,
    required TResult Function(_GetSkrining value) getSkrining,
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedNorm value) selectedNorm,
    required TResult Function(_AddLoadingAnatomi value) addLoadingAnatomi,
    required TResult Function(_AddKeterangan value) addKeterangan,
    required TResult Function(_SimpanAnatomi value) simpanAnatomi,
    required TResult Function(_SaveAnatomi value) saveAnatomi,
    required TResult Function(_GetAntreanPasien value) getAntreanPasien,
    required TResult Function(_GetKVitalSign value) getKVitalSign,
    required TResult Function(_GetDetailPasien value) getDetailPasien,
    required TResult Function(_AddPasien value) addPasien,
  }) {
    return simpanAnatomi(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveSkrining value)? saveSkrining,
    TResult? Function(RiwayatPasien value)? riwayatPasien,
    TResult? Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult? Function(SelectedPasien value)? selectedPasien,
    TResult? Function(SaveStateSkrining value)? saveStateSkrining,
    TResult? Function(GetOdontogram value)? getOdontogram,
    TResult? Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult? Function(UploadOdontogram value)? uploadOdontogram,
    TResult? Function(PublishOdontogram value)? publishOdontogram,
    TResult? Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult? Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult? Function(GetKebEdukasi value)? getKebEdukasi,
    TResult? Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult? Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult? Function(_GetSkrining value)? getSkrining,
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedNorm value)? selectedNorm,
    TResult? Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult? Function(_AddKeterangan value)? addKeterangan,
    TResult? Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult? Function(_SaveAnatomi value)? saveAnatomi,
    TResult? Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult? Function(_GetKVitalSign value)? getKVitalSign,
    TResult? Function(_GetDetailPasien value)? getDetailPasien,
    TResult? Function(_AddPasien value)? addPasien,
  }) {
    return simpanAnatomi?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveSkrining value)? saveSkrining,
    TResult Function(RiwayatPasien value)? riwayatPasien,
    TResult Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult Function(SelectedPasien value)? selectedPasien,
    TResult Function(SaveStateSkrining value)? saveStateSkrining,
    TResult Function(GetOdontogram value)? getOdontogram,
    TResult Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult Function(UploadOdontogram value)? uploadOdontogram,
    TResult Function(PublishOdontogram value)? publishOdontogram,
    TResult Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult Function(GetKebEdukasi value)? getKebEdukasi,
    TResult Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult Function(_GetSkrining value)? getSkrining,
    TResult Function(_Started value)? started,
    TResult Function(_SelectedNorm value)? selectedNorm,
    TResult Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult Function(_AddKeterangan value)? addKeterangan,
    TResult Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult Function(_SaveAnatomi value)? saveAnatomi,
    TResult Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult Function(_GetKVitalSign value)? getKVitalSign,
    TResult Function(_GetDetailPasien value)? getDetailPasien,
    TResult Function(_AddPasien value)? addPasien,
    required TResult orElse(),
  }) {
    if (simpanAnatomi != null) {
      return simpanAnatomi(this);
    }
    return orElse();
  }
}

abstract class _SimpanAnatomi implements PasienEvent {
  const factory _SimpanAnatomi(
      {required final String nama,
      required final String norm,
      required final String keterangan,
      required final File picturePath}) = _$SimpanAnatomiImpl;

  String get nama;
  String get norm;
  String get keterangan;
  File get picturePath;
  @JsonKey(ignore: true)
  _$$SimpanAnatomiImplCopyWith<_$SimpanAnatomiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveAnatomiImplCopyWith<$Res> {
  factory _$$SaveAnatomiImplCopyWith(
          _$SaveAnatomiImpl value, $Res Function(_$SaveAnatomiImpl) then) =
      __$$SaveAnatomiImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String nama, String norm, String keterangan, String picturePath});
}

/// @nodoc
class __$$SaveAnatomiImplCopyWithImpl<$Res>
    extends _$PasienEventCopyWithImpl<$Res, _$SaveAnatomiImpl>
    implements _$$SaveAnatomiImplCopyWith<$Res> {
  __$$SaveAnatomiImplCopyWithImpl(
      _$SaveAnatomiImpl _value, $Res Function(_$SaveAnatomiImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nama = null,
    Object? norm = null,
    Object? keterangan = null,
    Object? picturePath = null,
  }) {
    return _then(_$SaveAnatomiImpl(
      nama: null == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String,
      norm: null == norm
          ? _value.norm
          : norm // ignore: cast_nullable_to_non_nullable
              as String,
      keterangan: null == keterangan
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String,
      picturePath: null == picturePath
          ? _value.picturePath
          : picturePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SaveAnatomiImpl implements _SaveAnatomi {
  const _$SaveAnatomiImpl(
      {required this.nama,
      required this.norm,
      required this.keterangan,
      required this.picturePath});

  @override
  final String nama;
  @override
  final String norm;
  @override
  final String keterangan;
  @override
  final String picturePath;

  @override
  String toString() {
    return 'PasienEvent.saveAnatomi(nama: $nama, norm: $norm, keterangan: $keterangan, picturePath: $picturePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveAnatomiImpl &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.norm, norm) || other.norm == norm) &&
            (identical(other.keterangan, keterangan) ||
                other.keterangan == keterangan) &&
            (identical(other.picturePath, picturePath) ||
                other.picturePath == picturePath));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, nama, norm, keterangan, picturePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveAnatomiImplCopyWith<_$SaveAnatomiImpl> get copyWith =>
      __$$SaveAnatomiImplCopyWithImpl<_$SaveAnatomiImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)
        saveSkrining,
    required TResult Function(String noRM) riwayatPasien,
    required TResult Function(List<DetailProfilPasienModel> detailProfilePasien)
        addRiwayatPasien,
    required TResult Function(AntreanPasienModel pasien) selectedPasien,
    required TResult Function(SkirningModel skrining) saveStateSkrining,
    required TResult Function(String noReg) getOdontogram,
    required TResult Function(AssementRawatJalanModel assementRawatJalanModel)
        saveRawatJalanDokter,
    required TResult Function(String noReg) uploadOdontogram,
    required TResult Function(String noReg, String picturePath, String kdBagian)
        publishOdontogram,
    required TResult Function(String noReg) getAssmentRawatjalanDokter,
    required TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)
        saveAssesKebEdukasi,
    required TResult Function(String noReg) getKebEdukasi,
    required TResult Function(String noReg) getAssesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi, String keterangan)
        saveOdontogram,
    required TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)
        saveAsesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi) deleteOdontogram,
    required TResult Function(String noReg) getSkrining,
    required TResult Function() started,
    required TResult Function(String norm) selectedNorm,
    required TResult Function(bool enable) addLoadingAnatomi,
    required TResult Function(String keterangan) addKeterangan,
    required TResult Function(
            String nama, String norm, String keterangan, File picturePath)
        simpanAnatomi,
    required TResult Function(
            String nama, String norm, String keterangan, String picturePath)
        saveAnatomi,
    required TResult Function() getAntreanPasien,
    required TResult Function() getKVitalSign,
    required TResult Function(String noRM) getDetailPasien,
    required TResult Function(List<AntreanPasienModel> antreanPasien) addPasien,
  }) {
    return saveAnatomi(nama, norm, keterangan, picturePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult? Function(String noRM)? riwayatPasien,
    TResult? Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult? Function(AntreanPasienModel pasien)? selectedPasien,
    TResult? Function(SkirningModel skrining)? saveStateSkrining,
    TResult? Function(String noReg)? getOdontogram,
    TResult? Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult? Function(String noReg)? uploadOdontogram,
    TResult? Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult? Function(String noReg)? getAssmentRawatjalanDokter,
    TResult? Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult? Function(String noReg)? getKebEdukasi,
    TResult? Function(String noReg)? getAssesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult? Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi)? deleteOdontogram,
    TResult? Function(String noReg)? getSkrining,
    TResult? Function()? started,
    TResult? Function(String norm)? selectedNorm,
    TResult? Function(bool enable)? addLoadingAnatomi,
    TResult? Function(String keterangan)? addKeterangan,
    TResult? Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult? Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult? Function()? getAntreanPasien,
    TResult? Function()? getKVitalSign,
    TResult? Function(String noRM)? getDetailPasien,
    TResult? Function(List<AntreanPasienModel> antreanPasien)? addPasien,
  }) {
    return saveAnatomi?.call(nama, norm, keterangan, picturePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult Function(String noRM)? riwayatPasien,
    TResult Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult Function(AntreanPasienModel pasien)? selectedPasien,
    TResult Function(SkirningModel skrining)? saveStateSkrining,
    TResult Function(String noReg)? getOdontogram,
    TResult Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult Function(String noReg)? uploadOdontogram,
    TResult Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult Function(String noReg)? getAssmentRawatjalanDokter,
    TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult Function(String noReg)? getKebEdukasi,
    TResult Function(String noReg)? getAssesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi)? deleteOdontogram,
    TResult Function(String noReg)? getSkrining,
    TResult Function()? started,
    TResult Function(String norm)? selectedNorm,
    TResult Function(bool enable)? addLoadingAnatomi,
    TResult Function(String keterangan)? addKeterangan,
    TResult Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult Function()? getAntreanPasien,
    TResult Function()? getKVitalSign,
    TResult Function(String noRM)? getDetailPasien,
    TResult Function(List<AntreanPasienModel> antreanPasien)? addPasien,
    required TResult orElse(),
  }) {
    if (saveAnatomi != null) {
      return saveAnatomi(nama, norm, keterangan, picturePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveSkrining value) saveSkrining,
    required TResult Function(RiwayatPasien value) riwayatPasien,
    required TResult Function(addRiwayatPasien value) addRiwayatPasien,
    required TResult Function(SelectedPasien value) selectedPasien,
    required TResult Function(SaveStateSkrining value) saveStateSkrining,
    required TResult Function(GetOdontogram value) getOdontogram,
    required TResult Function(SaveRawatJalanDokter value) saveRawatJalanDokter,
    required TResult Function(UploadOdontogram value) uploadOdontogram,
    required TResult Function(PublishOdontogram value) publishOdontogram,
    required TResult Function(GetAssmentRawatjalanDokter value)
        getAssmentRawatjalanDokter,
    required TResult Function(SaveAssesKebEdukasi value) saveAssesKebEdukasi,
    required TResult Function(GetKebEdukasi value) getKebEdukasi,
    required TResult Function(GetAssesRawatJalanPerawat value)
        getAssesRawatJalanPerawat,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_SaveAsesRawatJalanPerawat value)
        saveAsesRawatJalanPerawat,
    required TResult Function(_DeleteOdontogram value) deleteOdontogram,
    required TResult Function(_GetSkrining value) getSkrining,
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedNorm value) selectedNorm,
    required TResult Function(_AddLoadingAnatomi value) addLoadingAnatomi,
    required TResult Function(_AddKeterangan value) addKeterangan,
    required TResult Function(_SimpanAnatomi value) simpanAnatomi,
    required TResult Function(_SaveAnatomi value) saveAnatomi,
    required TResult Function(_GetAntreanPasien value) getAntreanPasien,
    required TResult Function(_GetKVitalSign value) getKVitalSign,
    required TResult Function(_GetDetailPasien value) getDetailPasien,
    required TResult Function(_AddPasien value) addPasien,
  }) {
    return saveAnatomi(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveSkrining value)? saveSkrining,
    TResult? Function(RiwayatPasien value)? riwayatPasien,
    TResult? Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult? Function(SelectedPasien value)? selectedPasien,
    TResult? Function(SaveStateSkrining value)? saveStateSkrining,
    TResult? Function(GetOdontogram value)? getOdontogram,
    TResult? Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult? Function(UploadOdontogram value)? uploadOdontogram,
    TResult? Function(PublishOdontogram value)? publishOdontogram,
    TResult? Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult? Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult? Function(GetKebEdukasi value)? getKebEdukasi,
    TResult? Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult? Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult? Function(_GetSkrining value)? getSkrining,
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedNorm value)? selectedNorm,
    TResult? Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult? Function(_AddKeterangan value)? addKeterangan,
    TResult? Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult? Function(_SaveAnatomi value)? saveAnatomi,
    TResult? Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult? Function(_GetKVitalSign value)? getKVitalSign,
    TResult? Function(_GetDetailPasien value)? getDetailPasien,
    TResult? Function(_AddPasien value)? addPasien,
  }) {
    return saveAnatomi?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveSkrining value)? saveSkrining,
    TResult Function(RiwayatPasien value)? riwayatPasien,
    TResult Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult Function(SelectedPasien value)? selectedPasien,
    TResult Function(SaveStateSkrining value)? saveStateSkrining,
    TResult Function(GetOdontogram value)? getOdontogram,
    TResult Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult Function(UploadOdontogram value)? uploadOdontogram,
    TResult Function(PublishOdontogram value)? publishOdontogram,
    TResult Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult Function(GetKebEdukasi value)? getKebEdukasi,
    TResult Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult Function(_GetSkrining value)? getSkrining,
    TResult Function(_Started value)? started,
    TResult Function(_SelectedNorm value)? selectedNorm,
    TResult Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult Function(_AddKeterangan value)? addKeterangan,
    TResult Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult Function(_SaveAnatomi value)? saveAnatomi,
    TResult Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult Function(_GetKVitalSign value)? getKVitalSign,
    TResult Function(_GetDetailPasien value)? getDetailPasien,
    TResult Function(_AddPasien value)? addPasien,
    required TResult orElse(),
  }) {
    if (saveAnatomi != null) {
      return saveAnatomi(this);
    }
    return orElse();
  }
}

abstract class _SaveAnatomi implements PasienEvent {
  const factory _SaveAnatomi(
      {required final String nama,
      required final String norm,
      required final String keterangan,
      required final String picturePath}) = _$SaveAnatomiImpl;

  String get nama;
  String get norm;
  String get keterangan;
  String get picturePath;
  @JsonKey(ignore: true)
  _$$SaveAnatomiImplCopyWith<_$SaveAnatomiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetAntreanPasienImplCopyWith<$Res> {
  factory _$$GetAntreanPasienImplCopyWith(_$GetAntreanPasienImpl value,
          $Res Function(_$GetAntreanPasienImpl) then) =
      __$$GetAntreanPasienImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAntreanPasienImplCopyWithImpl<$Res>
    extends _$PasienEventCopyWithImpl<$Res, _$GetAntreanPasienImpl>
    implements _$$GetAntreanPasienImplCopyWith<$Res> {
  __$$GetAntreanPasienImplCopyWithImpl(_$GetAntreanPasienImpl _value,
      $Res Function(_$GetAntreanPasienImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAntreanPasienImpl implements _GetAntreanPasien {
  const _$GetAntreanPasienImpl();

  @override
  String toString() {
    return 'PasienEvent.getAntreanPasien()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAntreanPasienImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)
        saveSkrining,
    required TResult Function(String noRM) riwayatPasien,
    required TResult Function(List<DetailProfilPasienModel> detailProfilePasien)
        addRiwayatPasien,
    required TResult Function(AntreanPasienModel pasien) selectedPasien,
    required TResult Function(SkirningModel skrining) saveStateSkrining,
    required TResult Function(String noReg) getOdontogram,
    required TResult Function(AssementRawatJalanModel assementRawatJalanModel)
        saveRawatJalanDokter,
    required TResult Function(String noReg) uploadOdontogram,
    required TResult Function(String noReg, String picturePath, String kdBagian)
        publishOdontogram,
    required TResult Function(String noReg) getAssmentRawatjalanDokter,
    required TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)
        saveAssesKebEdukasi,
    required TResult Function(String noReg) getKebEdukasi,
    required TResult Function(String noReg) getAssesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi, String keterangan)
        saveOdontogram,
    required TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)
        saveAsesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi) deleteOdontogram,
    required TResult Function(String noReg) getSkrining,
    required TResult Function() started,
    required TResult Function(String norm) selectedNorm,
    required TResult Function(bool enable) addLoadingAnatomi,
    required TResult Function(String keterangan) addKeterangan,
    required TResult Function(
            String nama, String norm, String keterangan, File picturePath)
        simpanAnatomi,
    required TResult Function(
            String nama, String norm, String keterangan, String picturePath)
        saveAnatomi,
    required TResult Function() getAntreanPasien,
    required TResult Function() getKVitalSign,
    required TResult Function(String noRM) getDetailPasien,
    required TResult Function(List<AntreanPasienModel> antreanPasien) addPasien,
  }) {
    return getAntreanPasien();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult? Function(String noRM)? riwayatPasien,
    TResult? Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult? Function(AntreanPasienModel pasien)? selectedPasien,
    TResult? Function(SkirningModel skrining)? saveStateSkrining,
    TResult? Function(String noReg)? getOdontogram,
    TResult? Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult? Function(String noReg)? uploadOdontogram,
    TResult? Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult? Function(String noReg)? getAssmentRawatjalanDokter,
    TResult? Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult? Function(String noReg)? getKebEdukasi,
    TResult? Function(String noReg)? getAssesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult? Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi)? deleteOdontogram,
    TResult? Function(String noReg)? getSkrining,
    TResult? Function()? started,
    TResult? Function(String norm)? selectedNorm,
    TResult? Function(bool enable)? addLoadingAnatomi,
    TResult? Function(String keterangan)? addKeterangan,
    TResult? Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult? Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult? Function()? getAntreanPasien,
    TResult? Function()? getKVitalSign,
    TResult? Function(String noRM)? getDetailPasien,
    TResult? Function(List<AntreanPasienModel> antreanPasien)? addPasien,
  }) {
    return getAntreanPasien?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult Function(String noRM)? riwayatPasien,
    TResult Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult Function(AntreanPasienModel pasien)? selectedPasien,
    TResult Function(SkirningModel skrining)? saveStateSkrining,
    TResult Function(String noReg)? getOdontogram,
    TResult Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult Function(String noReg)? uploadOdontogram,
    TResult Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult Function(String noReg)? getAssmentRawatjalanDokter,
    TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult Function(String noReg)? getKebEdukasi,
    TResult Function(String noReg)? getAssesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi)? deleteOdontogram,
    TResult Function(String noReg)? getSkrining,
    TResult Function()? started,
    TResult Function(String norm)? selectedNorm,
    TResult Function(bool enable)? addLoadingAnatomi,
    TResult Function(String keterangan)? addKeterangan,
    TResult Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult Function()? getAntreanPasien,
    TResult Function()? getKVitalSign,
    TResult Function(String noRM)? getDetailPasien,
    TResult Function(List<AntreanPasienModel> antreanPasien)? addPasien,
    required TResult orElse(),
  }) {
    if (getAntreanPasien != null) {
      return getAntreanPasien();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveSkrining value) saveSkrining,
    required TResult Function(RiwayatPasien value) riwayatPasien,
    required TResult Function(addRiwayatPasien value) addRiwayatPasien,
    required TResult Function(SelectedPasien value) selectedPasien,
    required TResult Function(SaveStateSkrining value) saveStateSkrining,
    required TResult Function(GetOdontogram value) getOdontogram,
    required TResult Function(SaveRawatJalanDokter value) saveRawatJalanDokter,
    required TResult Function(UploadOdontogram value) uploadOdontogram,
    required TResult Function(PublishOdontogram value) publishOdontogram,
    required TResult Function(GetAssmentRawatjalanDokter value)
        getAssmentRawatjalanDokter,
    required TResult Function(SaveAssesKebEdukasi value) saveAssesKebEdukasi,
    required TResult Function(GetKebEdukasi value) getKebEdukasi,
    required TResult Function(GetAssesRawatJalanPerawat value)
        getAssesRawatJalanPerawat,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_SaveAsesRawatJalanPerawat value)
        saveAsesRawatJalanPerawat,
    required TResult Function(_DeleteOdontogram value) deleteOdontogram,
    required TResult Function(_GetSkrining value) getSkrining,
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedNorm value) selectedNorm,
    required TResult Function(_AddLoadingAnatomi value) addLoadingAnatomi,
    required TResult Function(_AddKeterangan value) addKeterangan,
    required TResult Function(_SimpanAnatomi value) simpanAnatomi,
    required TResult Function(_SaveAnatomi value) saveAnatomi,
    required TResult Function(_GetAntreanPasien value) getAntreanPasien,
    required TResult Function(_GetKVitalSign value) getKVitalSign,
    required TResult Function(_GetDetailPasien value) getDetailPasien,
    required TResult Function(_AddPasien value) addPasien,
  }) {
    return getAntreanPasien(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveSkrining value)? saveSkrining,
    TResult? Function(RiwayatPasien value)? riwayatPasien,
    TResult? Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult? Function(SelectedPasien value)? selectedPasien,
    TResult? Function(SaveStateSkrining value)? saveStateSkrining,
    TResult? Function(GetOdontogram value)? getOdontogram,
    TResult? Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult? Function(UploadOdontogram value)? uploadOdontogram,
    TResult? Function(PublishOdontogram value)? publishOdontogram,
    TResult? Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult? Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult? Function(GetKebEdukasi value)? getKebEdukasi,
    TResult? Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult? Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult? Function(_GetSkrining value)? getSkrining,
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedNorm value)? selectedNorm,
    TResult? Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult? Function(_AddKeterangan value)? addKeterangan,
    TResult? Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult? Function(_SaveAnatomi value)? saveAnatomi,
    TResult? Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult? Function(_GetKVitalSign value)? getKVitalSign,
    TResult? Function(_GetDetailPasien value)? getDetailPasien,
    TResult? Function(_AddPasien value)? addPasien,
  }) {
    return getAntreanPasien?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveSkrining value)? saveSkrining,
    TResult Function(RiwayatPasien value)? riwayatPasien,
    TResult Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult Function(SelectedPasien value)? selectedPasien,
    TResult Function(SaveStateSkrining value)? saveStateSkrining,
    TResult Function(GetOdontogram value)? getOdontogram,
    TResult Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult Function(UploadOdontogram value)? uploadOdontogram,
    TResult Function(PublishOdontogram value)? publishOdontogram,
    TResult Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult Function(GetKebEdukasi value)? getKebEdukasi,
    TResult Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult Function(_GetSkrining value)? getSkrining,
    TResult Function(_Started value)? started,
    TResult Function(_SelectedNorm value)? selectedNorm,
    TResult Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult Function(_AddKeterangan value)? addKeterangan,
    TResult Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult Function(_SaveAnatomi value)? saveAnatomi,
    TResult Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult Function(_GetKVitalSign value)? getKVitalSign,
    TResult Function(_GetDetailPasien value)? getDetailPasien,
    TResult Function(_AddPasien value)? addPasien,
    required TResult orElse(),
  }) {
    if (getAntreanPasien != null) {
      return getAntreanPasien(this);
    }
    return orElse();
  }
}

abstract class _GetAntreanPasien implements PasienEvent {
  const factory _GetAntreanPasien() = _$GetAntreanPasienImpl;
}

/// @nodoc
abstract class _$$GetKVitalSignImplCopyWith<$Res> {
  factory _$$GetKVitalSignImplCopyWith(
          _$GetKVitalSignImpl value, $Res Function(_$GetKVitalSignImpl) then) =
      __$$GetKVitalSignImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetKVitalSignImplCopyWithImpl<$Res>
    extends _$PasienEventCopyWithImpl<$Res, _$GetKVitalSignImpl>
    implements _$$GetKVitalSignImplCopyWith<$Res> {
  __$$GetKVitalSignImplCopyWithImpl(
      _$GetKVitalSignImpl _value, $Res Function(_$GetKVitalSignImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetKVitalSignImpl implements _GetKVitalSign {
  const _$GetKVitalSignImpl();

  @override
  String toString() {
    return 'PasienEvent.getKVitalSign()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetKVitalSignImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)
        saveSkrining,
    required TResult Function(String noRM) riwayatPasien,
    required TResult Function(List<DetailProfilPasienModel> detailProfilePasien)
        addRiwayatPasien,
    required TResult Function(AntreanPasienModel pasien) selectedPasien,
    required TResult Function(SkirningModel skrining) saveStateSkrining,
    required TResult Function(String noReg) getOdontogram,
    required TResult Function(AssementRawatJalanModel assementRawatJalanModel)
        saveRawatJalanDokter,
    required TResult Function(String noReg) uploadOdontogram,
    required TResult Function(String noReg, String picturePath, String kdBagian)
        publishOdontogram,
    required TResult Function(String noReg) getAssmentRawatjalanDokter,
    required TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)
        saveAssesKebEdukasi,
    required TResult Function(String noReg) getKebEdukasi,
    required TResult Function(String noReg) getAssesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi, String keterangan)
        saveOdontogram,
    required TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)
        saveAsesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi) deleteOdontogram,
    required TResult Function(String noReg) getSkrining,
    required TResult Function() started,
    required TResult Function(String norm) selectedNorm,
    required TResult Function(bool enable) addLoadingAnatomi,
    required TResult Function(String keterangan) addKeterangan,
    required TResult Function(
            String nama, String norm, String keterangan, File picturePath)
        simpanAnatomi,
    required TResult Function(
            String nama, String norm, String keterangan, String picturePath)
        saveAnatomi,
    required TResult Function() getAntreanPasien,
    required TResult Function() getKVitalSign,
    required TResult Function(String noRM) getDetailPasien,
    required TResult Function(List<AntreanPasienModel> antreanPasien) addPasien,
  }) {
    return getKVitalSign();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult? Function(String noRM)? riwayatPasien,
    TResult? Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult? Function(AntreanPasienModel pasien)? selectedPasien,
    TResult? Function(SkirningModel skrining)? saveStateSkrining,
    TResult? Function(String noReg)? getOdontogram,
    TResult? Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult? Function(String noReg)? uploadOdontogram,
    TResult? Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult? Function(String noReg)? getAssmentRawatjalanDokter,
    TResult? Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult? Function(String noReg)? getKebEdukasi,
    TResult? Function(String noReg)? getAssesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult? Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi)? deleteOdontogram,
    TResult? Function(String noReg)? getSkrining,
    TResult? Function()? started,
    TResult? Function(String norm)? selectedNorm,
    TResult? Function(bool enable)? addLoadingAnatomi,
    TResult? Function(String keterangan)? addKeterangan,
    TResult? Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult? Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult? Function()? getAntreanPasien,
    TResult? Function()? getKVitalSign,
    TResult? Function(String noRM)? getDetailPasien,
    TResult? Function(List<AntreanPasienModel> antreanPasien)? addPasien,
  }) {
    return getKVitalSign?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult Function(String noRM)? riwayatPasien,
    TResult Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult Function(AntreanPasienModel pasien)? selectedPasien,
    TResult Function(SkirningModel skrining)? saveStateSkrining,
    TResult Function(String noReg)? getOdontogram,
    TResult Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult Function(String noReg)? uploadOdontogram,
    TResult Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult Function(String noReg)? getAssmentRawatjalanDokter,
    TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult Function(String noReg)? getKebEdukasi,
    TResult Function(String noReg)? getAssesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi)? deleteOdontogram,
    TResult Function(String noReg)? getSkrining,
    TResult Function()? started,
    TResult Function(String norm)? selectedNorm,
    TResult Function(bool enable)? addLoadingAnatomi,
    TResult Function(String keterangan)? addKeterangan,
    TResult Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult Function()? getAntreanPasien,
    TResult Function()? getKVitalSign,
    TResult Function(String noRM)? getDetailPasien,
    TResult Function(List<AntreanPasienModel> antreanPasien)? addPasien,
    required TResult orElse(),
  }) {
    if (getKVitalSign != null) {
      return getKVitalSign();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveSkrining value) saveSkrining,
    required TResult Function(RiwayatPasien value) riwayatPasien,
    required TResult Function(addRiwayatPasien value) addRiwayatPasien,
    required TResult Function(SelectedPasien value) selectedPasien,
    required TResult Function(SaveStateSkrining value) saveStateSkrining,
    required TResult Function(GetOdontogram value) getOdontogram,
    required TResult Function(SaveRawatJalanDokter value) saveRawatJalanDokter,
    required TResult Function(UploadOdontogram value) uploadOdontogram,
    required TResult Function(PublishOdontogram value) publishOdontogram,
    required TResult Function(GetAssmentRawatjalanDokter value)
        getAssmentRawatjalanDokter,
    required TResult Function(SaveAssesKebEdukasi value) saveAssesKebEdukasi,
    required TResult Function(GetKebEdukasi value) getKebEdukasi,
    required TResult Function(GetAssesRawatJalanPerawat value)
        getAssesRawatJalanPerawat,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_SaveAsesRawatJalanPerawat value)
        saveAsesRawatJalanPerawat,
    required TResult Function(_DeleteOdontogram value) deleteOdontogram,
    required TResult Function(_GetSkrining value) getSkrining,
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedNorm value) selectedNorm,
    required TResult Function(_AddLoadingAnatomi value) addLoadingAnatomi,
    required TResult Function(_AddKeterangan value) addKeterangan,
    required TResult Function(_SimpanAnatomi value) simpanAnatomi,
    required TResult Function(_SaveAnatomi value) saveAnatomi,
    required TResult Function(_GetAntreanPasien value) getAntreanPasien,
    required TResult Function(_GetKVitalSign value) getKVitalSign,
    required TResult Function(_GetDetailPasien value) getDetailPasien,
    required TResult Function(_AddPasien value) addPasien,
  }) {
    return getKVitalSign(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveSkrining value)? saveSkrining,
    TResult? Function(RiwayatPasien value)? riwayatPasien,
    TResult? Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult? Function(SelectedPasien value)? selectedPasien,
    TResult? Function(SaveStateSkrining value)? saveStateSkrining,
    TResult? Function(GetOdontogram value)? getOdontogram,
    TResult? Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult? Function(UploadOdontogram value)? uploadOdontogram,
    TResult? Function(PublishOdontogram value)? publishOdontogram,
    TResult? Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult? Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult? Function(GetKebEdukasi value)? getKebEdukasi,
    TResult? Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult? Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult? Function(_GetSkrining value)? getSkrining,
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedNorm value)? selectedNorm,
    TResult? Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult? Function(_AddKeterangan value)? addKeterangan,
    TResult? Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult? Function(_SaveAnatomi value)? saveAnatomi,
    TResult? Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult? Function(_GetKVitalSign value)? getKVitalSign,
    TResult? Function(_GetDetailPasien value)? getDetailPasien,
    TResult? Function(_AddPasien value)? addPasien,
  }) {
    return getKVitalSign?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveSkrining value)? saveSkrining,
    TResult Function(RiwayatPasien value)? riwayatPasien,
    TResult Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult Function(SelectedPasien value)? selectedPasien,
    TResult Function(SaveStateSkrining value)? saveStateSkrining,
    TResult Function(GetOdontogram value)? getOdontogram,
    TResult Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult Function(UploadOdontogram value)? uploadOdontogram,
    TResult Function(PublishOdontogram value)? publishOdontogram,
    TResult Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult Function(GetKebEdukasi value)? getKebEdukasi,
    TResult Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult Function(_GetSkrining value)? getSkrining,
    TResult Function(_Started value)? started,
    TResult Function(_SelectedNorm value)? selectedNorm,
    TResult Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult Function(_AddKeterangan value)? addKeterangan,
    TResult Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult Function(_SaveAnatomi value)? saveAnatomi,
    TResult Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult Function(_GetKVitalSign value)? getKVitalSign,
    TResult Function(_GetDetailPasien value)? getDetailPasien,
    TResult Function(_AddPasien value)? addPasien,
    required TResult orElse(),
  }) {
    if (getKVitalSign != null) {
      return getKVitalSign(this);
    }
    return orElse();
  }
}

abstract class _GetKVitalSign implements PasienEvent {
  const factory _GetKVitalSign() = _$GetKVitalSignImpl;
}

/// @nodoc
abstract class _$$GetDetailPasienImplCopyWith<$Res> {
  factory _$$GetDetailPasienImplCopyWith(_$GetDetailPasienImpl value,
          $Res Function(_$GetDetailPasienImpl) then) =
      __$$GetDetailPasienImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String noRM});
}

/// @nodoc
class __$$GetDetailPasienImplCopyWithImpl<$Res>
    extends _$PasienEventCopyWithImpl<$Res, _$GetDetailPasienImpl>
    implements _$$GetDetailPasienImplCopyWith<$Res> {
  __$$GetDetailPasienImplCopyWithImpl(
      _$GetDetailPasienImpl _value, $Res Function(_$GetDetailPasienImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noRM = null,
  }) {
    return _then(_$GetDetailPasienImpl(
      noRM: null == noRM
          ? _value.noRM
          : noRM // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetDetailPasienImpl implements _GetDetailPasien {
  const _$GetDetailPasienImpl({required this.noRM});

  @override
  final String noRM;

  @override
  String toString() {
    return 'PasienEvent.getDetailPasien(noRM: $noRM)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetDetailPasienImpl &&
            (identical(other.noRM, noRM) || other.noRM == noRM));
  }

  @override
  int get hashCode => Object.hash(runtimeType, noRM);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetDetailPasienImplCopyWith<_$GetDetailPasienImpl> get copyWith =>
      __$$GetDetailPasienImplCopyWithImpl<_$GetDetailPasienImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)
        saveSkrining,
    required TResult Function(String noRM) riwayatPasien,
    required TResult Function(List<DetailProfilPasienModel> detailProfilePasien)
        addRiwayatPasien,
    required TResult Function(AntreanPasienModel pasien) selectedPasien,
    required TResult Function(SkirningModel skrining) saveStateSkrining,
    required TResult Function(String noReg) getOdontogram,
    required TResult Function(AssementRawatJalanModel assementRawatJalanModel)
        saveRawatJalanDokter,
    required TResult Function(String noReg) uploadOdontogram,
    required TResult Function(String noReg, String picturePath, String kdBagian)
        publishOdontogram,
    required TResult Function(String noReg) getAssmentRawatjalanDokter,
    required TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)
        saveAssesKebEdukasi,
    required TResult Function(String noReg) getKebEdukasi,
    required TResult Function(String noReg) getAssesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi, String keterangan)
        saveOdontogram,
    required TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)
        saveAsesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi) deleteOdontogram,
    required TResult Function(String noReg) getSkrining,
    required TResult Function() started,
    required TResult Function(String norm) selectedNorm,
    required TResult Function(bool enable) addLoadingAnatomi,
    required TResult Function(String keterangan) addKeterangan,
    required TResult Function(
            String nama, String norm, String keterangan, File picturePath)
        simpanAnatomi,
    required TResult Function(
            String nama, String norm, String keterangan, String picturePath)
        saveAnatomi,
    required TResult Function() getAntreanPasien,
    required TResult Function() getKVitalSign,
    required TResult Function(String noRM) getDetailPasien,
    required TResult Function(List<AntreanPasienModel> antreanPasien) addPasien,
  }) {
    return getDetailPasien(noRM);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult? Function(String noRM)? riwayatPasien,
    TResult? Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult? Function(AntreanPasienModel pasien)? selectedPasien,
    TResult? Function(SkirningModel skrining)? saveStateSkrining,
    TResult? Function(String noReg)? getOdontogram,
    TResult? Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult? Function(String noReg)? uploadOdontogram,
    TResult? Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult? Function(String noReg)? getAssmentRawatjalanDokter,
    TResult? Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult? Function(String noReg)? getKebEdukasi,
    TResult? Function(String noReg)? getAssesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult? Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi)? deleteOdontogram,
    TResult? Function(String noReg)? getSkrining,
    TResult? Function()? started,
    TResult? Function(String norm)? selectedNorm,
    TResult? Function(bool enable)? addLoadingAnatomi,
    TResult? Function(String keterangan)? addKeterangan,
    TResult? Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult? Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult? Function()? getAntreanPasien,
    TResult? Function()? getKVitalSign,
    TResult? Function(String noRM)? getDetailPasien,
    TResult? Function(List<AntreanPasienModel> antreanPasien)? addPasien,
  }) {
    return getDetailPasien?.call(noRM);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult Function(String noRM)? riwayatPasien,
    TResult Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult Function(AntreanPasienModel pasien)? selectedPasien,
    TResult Function(SkirningModel skrining)? saveStateSkrining,
    TResult Function(String noReg)? getOdontogram,
    TResult Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult Function(String noReg)? uploadOdontogram,
    TResult Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult Function(String noReg)? getAssmentRawatjalanDokter,
    TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult Function(String noReg)? getKebEdukasi,
    TResult Function(String noReg)? getAssesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi)? deleteOdontogram,
    TResult Function(String noReg)? getSkrining,
    TResult Function()? started,
    TResult Function(String norm)? selectedNorm,
    TResult Function(bool enable)? addLoadingAnatomi,
    TResult Function(String keterangan)? addKeterangan,
    TResult Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult Function()? getAntreanPasien,
    TResult Function()? getKVitalSign,
    TResult Function(String noRM)? getDetailPasien,
    TResult Function(List<AntreanPasienModel> antreanPasien)? addPasien,
    required TResult orElse(),
  }) {
    if (getDetailPasien != null) {
      return getDetailPasien(noRM);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveSkrining value) saveSkrining,
    required TResult Function(RiwayatPasien value) riwayatPasien,
    required TResult Function(addRiwayatPasien value) addRiwayatPasien,
    required TResult Function(SelectedPasien value) selectedPasien,
    required TResult Function(SaveStateSkrining value) saveStateSkrining,
    required TResult Function(GetOdontogram value) getOdontogram,
    required TResult Function(SaveRawatJalanDokter value) saveRawatJalanDokter,
    required TResult Function(UploadOdontogram value) uploadOdontogram,
    required TResult Function(PublishOdontogram value) publishOdontogram,
    required TResult Function(GetAssmentRawatjalanDokter value)
        getAssmentRawatjalanDokter,
    required TResult Function(SaveAssesKebEdukasi value) saveAssesKebEdukasi,
    required TResult Function(GetKebEdukasi value) getKebEdukasi,
    required TResult Function(GetAssesRawatJalanPerawat value)
        getAssesRawatJalanPerawat,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_SaveAsesRawatJalanPerawat value)
        saveAsesRawatJalanPerawat,
    required TResult Function(_DeleteOdontogram value) deleteOdontogram,
    required TResult Function(_GetSkrining value) getSkrining,
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedNorm value) selectedNorm,
    required TResult Function(_AddLoadingAnatomi value) addLoadingAnatomi,
    required TResult Function(_AddKeterangan value) addKeterangan,
    required TResult Function(_SimpanAnatomi value) simpanAnatomi,
    required TResult Function(_SaveAnatomi value) saveAnatomi,
    required TResult Function(_GetAntreanPasien value) getAntreanPasien,
    required TResult Function(_GetKVitalSign value) getKVitalSign,
    required TResult Function(_GetDetailPasien value) getDetailPasien,
    required TResult Function(_AddPasien value) addPasien,
  }) {
    return getDetailPasien(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveSkrining value)? saveSkrining,
    TResult? Function(RiwayatPasien value)? riwayatPasien,
    TResult? Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult? Function(SelectedPasien value)? selectedPasien,
    TResult? Function(SaveStateSkrining value)? saveStateSkrining,
    TResult? Function(GetOdontogram value)? getOdontogram,
    TResult? Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult? Function(UploadOdontogram value)? uploadOdontogram,
    TResult? Function(PublishOdontogram value)? publishOdontogram,
    TResult? Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult? Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult? Function(GetKebEdukasi value)? getKebEdukasi,
    TResult? Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult? Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult? Function(_GetSkrining value)? getSkrining,
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedNorm value)? selectedNorm,
    TResult? Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult? Function(_AddKeterangan value)? addKeterangan,
    TResult? Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult? Function(_SaveAnatomi value)? saveAnatomi,
    TResult? Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult? Function(_GetKVitalSign value)? getKVitalSign,
    TResult? Function(_GetDetailPasien value)? getDetailPasien,
    TResult? Function(_AddPasien value)? addPasien,
  }) {
    return getDetailPasien?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveSkrining value)? saveSkrining,
    TResult Function(RiwayatPasien value)? riwayatPasien,
    TResult Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult Function(SelectedPasien value)? selectedPasien,
    TResult Function(SaveStateSkrining value)? saveStateSkrining,
    TResult Function(GetOdontogram value)? getOdontogram,
    TResult Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult Function(UploadOdontogram value)? uploadOdontogram,
    TResult Function(PublishOdontogram value)? publishOdontogram,
    TResult Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult Function(GetKebEdukasi value)? getKebEdukasi,
    TResult Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult Function(_GetSkrining value)? getSkrining,
    TResult Function(_Started value)? started,
    TResult Function(_SelectedNorm value)? selectedNorm,
    TResult Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult Function(_AddKeterangan value)? addKeterangan,
    TResult Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult Function(_SaveAnatomi value)? saveAnatomi,
    TResult Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult Function(_GetKVitalSign value)? getKVitalSign,
    TResult Function(_GetDetailPasien value)? getDetailPasien,
    TResult Function(_AddPasien value)? addPasien,
    required TResult orElse(),
  }) {
    if (getDetailPasien != null) {
      return getDetailPasien(this);
    }
    return orElse();
  }
}

abstract class _GetDetailPasien implements PasienEvent {
  const factory _GetDetailPasien({required final String noRM}) =
      _$GetDetailPasienImpl;

  String get noRM;
  @JsonKey(ignore: true)
  _$$GetDetailPasienImplCopyWith<_$GetDetailPasienImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddPasienImplCopyWith<$Res> {
  factory _$$AddPasienImplCopyWith(
          _$AddPasienImpl value, $Res Function(_$AddPasienImpl) then) =
      __$$AddPasienImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<AntreanPasienModel> antreanPasien});
}

/// @nodoc
class __$$AddPasienImplCopyWithImpl<$Res>
    extends _$PasienEventCopyWithImpl<$Res, _$AddPasienImpl>
    implements _$$AddPasienImplCopyWith<$Res> {
  __$$AddPasienImplCopyWithImpl(
      _$AddPasienImpl _value, $Res Function(_$AddPasienImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? antreanPasien = null,
  }) {
    return _then(_$AddPasienImpl(
      antreanPasien: null == antreanPasien
          ? _value._antreanPasien
          : antreanPasien // ignore: cast_nullable_to_non_nullable
              as List<AntreanPasienModel>,
    ));
  }
}

/// @nodoc

class _$AddPasienImpl implements _AddPasien {
  const _$AddPasienImpl({required final List<AntreanPasienModel> antreanPasien})
      : _antreanPasien = antreanPasien;

  final List<AntreanPasienModel> _antreanPasien;
  @override
  List<AntreanPasienModel> get antreanPasien {
    if (_antreanPasien is EqualUnmodifiableListView) return _antreanPasien;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_antreanPasien);
  }

  @override
  String toString() {
    return 'PasienEvent.addPasien(antreanPasien: $antreanPasien)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPasienImpl &&
            const DeepCollectionEquality()
                .equals(other._antreanPasien, _antreanPasien));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_antreanPasien));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPasienImplCopyWith<_$AddPasienImpl> get copyWith =>
      __$$AddPasienImplCopyWithImpl<_$AddPasienImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)
        saveSkrining,
    required TResult Function(String noRM) riwayatPasien,
    required TResult Function(List<DetailProfilPasienModel> detailProfilePasien)
        addRiwayatPasien,
    required TResult Function(AntreanPasienModel pasien) selectedPasien,
    required TResult Function(SkirningModel skrining) saveStateSkrining,
    required TResult Function(String noReg) getOdontogram,
    required TResult Function(AssementRawatJalanModel assementRawatJalanModel)
        saveRawatJalanDokter,
    required TResult Function(String noReg) uploadOdontogram,
    required TResult Function(String noReg, String picturePath, String kdBagian)
        publishOdontogram,
    required TResult Function(String noReg) getAssmentRawatjalanDokter,
    required TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)
        saveAssesKebEdukasi,
    required TResult Function(String noReg) getKebEdukasi,
    required TResult Function(String noReg) getAssesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi, String keterangan)
        saveOdontogram,
    required TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)
        saveAsesRawatJalanPerawat,
    required TResult Function(String noReg, String noGigi) deleteOdontogram,
    required TResult Function(String noReg) getSkrining,
    required TResult Function() started,
    required TResult Function(String norm) selectedNorm,
    required TResult Function(bool enable) addLoadingAnatomi,
    required TResult Function(String keterangan) addKeterangan,
    required TResult Function(
            String nama, String norm, String keterangan, File picturePath)
        simpanAnatomi,
    required TResult Function(
            String nama, String norm, String keterangan, String picturePath)
        saveAnatomi,
    required TResult Function() getAntreanPasien,
    required TResult Function() getKVitalSign,
    required TResult Function(String noRM) getDetailPasien,
    required TResult Function(List<AntreanPasienModel> antreanPasien) addPasien,
  }) {
    return addPasien(antreanPasien);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult? Function(String noRM)? riwayatPasien,
    TResult? Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult? Function(AntreanPasienModel pasien)? selectedPasien,
    TResult? Function(SkirningModel skrining)? saveStateSkrining,
    TResult? Function(String noReg)? getOdontogram,
    TResult? Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult? Function(String noReg)? uploadOdontogram,
    TResult? Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult? Function(String noReg)? getAssmentRawatjalanDokter,
    TResult? Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult? Function(String noReg)? getKebEdukasi,
    TResult? Function(String noReg)? getAssesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult? Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult? Function(String noReg, String noGigi)? deleteOdontogram,
    TResult? Function(String noReg)? getSkrining,
    TResult? Function()? started,
    TResult? Function(String norm)? selectedNorm,
    TResult? Function(bool enable)? addLoadingAnatomi,
    TResult? Function(String keterangan)? addKeterangan,
    TResult? Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult? Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult? Function()? getAntreanPasien,
    TResult? Function()? getKVitalSign,
    TResult? Function(String noRM)? getDetailPasien,
    TResult? Function(List<AntreanPasienModel> antreanPasien)? addPasien,
  }) {
    return addPasien?.call(antreanPasien);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String kdBagian,
            String noReg,
            String k1,
            String k2,
            String k3,
            String k4,
            String k5,
            String k6,
            String kF1,
            String kF2,
            String kF3,
            String kF4,
            String b1,
            String b2,
            String rJ,
            String iV1,
            String iV2,
            String iV3,
            String iV4,
            String tanggal,
            String jam,
            String user)?
        saveSkrining,
    TResult Function(String noRM)? riwayatPasien,
    TResult Function(List<DetailProfilPasienModel> detailProfilePasien)?
        addRiwayatPasien,
    TResult Function(AntreanPasienModel pasien)? selectedPasien,
    TResult Function(SkirningModel skrining)? saveStateSkrining,
    TResult Function(String noReg)? getOdontogram,
    TResult Function(AssementRawatJalanModel assementRawatJalanModel)?
        saveRawatJalanDokter,
    TResult Function(String noReg)? uploadOdontogram,
    TResult Function(String noReg, String picturePath, String kdBagian)?
        publishOdontogram,
    TResult Function(String noReg)? getAssmentRawatjalanDokter,
    TResult Function(AssementKebEdukasiModel assementKebEdukasiModel)?
        saveAssesKebEdukasi,
    TResult Function(String noReg)? getKebEdukasi,
    TResult Function(String noReg)? getAssesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi, String keterangan)?
        saveOdontogram,
    TResult Function(
            String kdBagian,
            String noReg,
            String kelUtama,
            String riwayatPenyakit,
            String riwayatObat,
            String riwayatObatDetail,
            String riwayatPenyakitDetail,
            String riwayatSaatDirumah,
            String tekananDarah,
            String nadi,
            String suhu,
            String pernapasan,
            String beratBadan,
            String tinggiBadan,
            String skriningNyeri,
            String psikologis,
            String fungsional,
            String perencanaanPemulangan,
            String masalahKeperawatan,
            String rencanaKeperawatan,
            String aseskepHasilKajiRj,
            String aseskepHasilKajiRjDetail,
            String aseskepHasilKajiRjTindakan,
            String aseskepNyeri,
            String aseskepPulang1,
            String aseskepPulang1Detail,
            String aseskepPulang2,
            String aseskepPulang2Detail,
            String aseskepPulang3,
            String aseskepPulang3Detail,
            String aseskepRj1,
            String aseskepRj2,
            String fungsionalDetail,
            String psikologisDetail)?
        saveAsesRawatJalanPerawat,
    TResult Function(String noReg, String noGigi)? deleteOdontogram,
    TResult Function(String noReg)? getSkrining,
    TResult Function()? started,
    TResult Function(String norm)? selectedNorm,
    TResult Function(bool enable)? addLoadingAnatomi,
    TResult Function(String keterangan)? addKeterangan,
    TResult Function(
            String nama, String norm, String keterangan, File picturePath)?
        simpanAnatomi,
    TResult Function(
            String nama, String norm, String keterangan, String picturePath)?
        saveAnatomi,
    TResult Function()? getAntreanPasien,
    TResult Function()? getKVitalSign,
    TResult Function(String noRM)? getDetailPasien,
    TResult Function(List<AntreanPasienModel> antreanPasien)? addPasien,
    required TResult orElse(),
  }) {
    if (addPasien != null) {
      return addPasien(antreanPasien);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveSkrining value) saveSkrining,
    required TResult Function(RiwayatPasien value) riwayatPasien,
    required TResult Function(addRiwayatPasien value) addRiwayatPasien,
    required TResult Function(SelectedPasien value) selectedPasien,
    required TResult Function(SaveStateSkrining value) saveStateSkrining,
    required TResult Function(GetOdontogram value) getOdontogram,
    required TResult Function(SaveRawatJalanDokter value) saveRawatJalanDokter,
    required TResult Function(UploadOdontogram value) uploadOdontogram,
    required TResult Function(PublishOdontogram value) publishOdontogram,
    required TResult Function(GetAssmentRawatjalanDokter value)
        getAssmentRawatjalanDokter,
    required TResult Function(SaveAssesKebEdukasi value) saveAssesKebEdukasi,
    required TResult Function(GetKebEdukasi value) getKebEdukasi,
    required TResult Function(GetAssesRawatJalanPerawat value)
        getAssesRawatJalanPerawat,
    required TResult Function(_SaveOdontogram value) saveOdontogram,
    required TResult Function(_SaveAsesRawatJalanPerawat value)
        saveAsesRawatJalanPerawat,
    required TResult Function(_DeleteOdontogram value) deleteOdontogram,
    required TResult Function(_GetSkrining value) getSkrining,
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedNorm value) selectedNorm,
    required TResult Function(_AddLoadingAnatomi value) addLoadingAnatomi,
    required TResult Function(_AddKeterangan value) addKeterangan,
    required TResult Function(_SimpanAnatomi value) simpanAnatomi,
    required TResult Function(_SaveAnatomi value) saveAnatomi,
    required TResult Function(_GetAntreanPasien value) getAntreanPasien,
    required TResult Function(_GetKVitalSign value) getKVitalSign,
    required TResult Function(_GetDetailPasien value) getDetailPasien,
    required TResult Function(_AddPasien value) addPasien,
  }) {
    return addPasien(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveSkrining value)? saveSkrining,
    TResult? Function(RiwayatPasien value)? riwayatPasien,
    TResult? Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult? Function(SelectedPasien value)? selectedPasien,
    TResult? Function(SaveStateSkrining value)? saveStateSkrining,
    TResult? Function(GetOdontogram value)? getOdontogram,
    TResult? Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult? Function(UploadOdontogram value)? uploadOdontogram,
    TResult? Function(PublishOdontogram value)? publishOdontogram,
    TResult? Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult? Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult? Function(GetKebEdukasi value)? getKebEdukasi,
    TResult? Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult? Function(_SaveOdontogram value)? saveOdontogram,
    TResult? Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult? Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult? Function(_GetSkrining value)? getSkrining,
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedNorm value)? selectedNorm,
    TResult? Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult? Function(_AddKeterangan value)? addKeterangan,
    TResult? Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult? Function(_SaveAnatomi value)? saveAnatomi,
    TResult? Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult? Function(_GetKVitalSign value)? getKVitalSign,
    TResult? Function(_GetDetailPasien value)? getDetailPasien,
    TResult? Function(_AddPasien value)? addPasien,
  }) {
    return addPasien?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveSkrining value)? saveSkrining,
    TResult Function(RiwayatPasien value)? riwayatPasien,
    TResult Function(addRiwayatPasien value)? addRiwayatPasien,
    TResult Function(SelectedPasien value)? selectedPasien,
    TResult Function(SaveStateSkrining value)? saveStateSkrining,
    TResult Function(GetOdontogram value)? getOdontogram,
    TResult Function(SaveRawatJalanDokter value)? saveRawatJalanDokter,
    TResult Function(UploadOdontogram value)? uploadOdontogram,
    TResult Function(PublishOdontogram value)? publishOdontogram,
    TResult Function(GetAssmentRawatjalanDokter value)?
        getAssmentRawatjalanDokter,
    TResult Function(SaveAssesKebEdukasi value)? saveAssesKebEdukasi,
    TResult Function(GetKebEdukasi value)? getKebEdukasi,
    TResult Function(GetAssesRawatJalanPerawat value)?
        getAssesRawatJalanPerawat,
    TResult Function(_SaveOdontogram value)? saveOdontogram,
    TResult Function(_SaveAsesRawatJalanPerawat value)?
        saveAsesRawatJalanPerawat,
    TResult Function(_DeleteOdontogram value)? deleteOdontogram,
    TResult Function(_GetSkrining value)? getSkrining,
    TResult Function(_Started value)? started,
    TResult Function(_SelectedNorm value)? selectedNorm,
    TResult Function(_AddLoadingAnatomi value)? addLoadingAnatomi,
    TResult Function(_AddKeterangan value)? addKeterangan,
    TResult Function(_SimpanAnatomi value)? simpanAnatomi,
    TResult Function(_SaveAnatomi value)? saveAnatomi,
    TResult Function(_GetAntreanPasien value)? getAntreanPasien,
    TResult Function(_GetKVitalSign value)? getKVitalSign,
    TResult Function(_GetDetailPasien value)? getDetailPasien,
    TResult Function(_AddPasien value)? addPasien,
    required TResult orElse(),
  }) {
    if (addPasien != null) {
      return addPasien(this);
    }
    return orElse();
  }
}

abstract class _AddPasien implements PasienEvent {
  const factory _AddPasien(
          {required final List<AntreanPasienModel> antreanPasien}) =
      _$AddPasienImpl;

  List<AntreanPasienModel> get antreanPasien;
  @JsonKey(ignore: true)
  _$$AddPasienImplCopyWith<_$AddPasienImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PasienState {
  AntreanPasienModel? get selectedPasien => throw _privateConstructorUsedError;
  bool get loadingPasien => throw _privateConstructorUsedError;
  bool get loadingDetailPasien => throw _privateConstructorUsedError;
  bool get loadigSaveAnatomi => throw _privateConstructorUsedError;
  bool get loadingSkrining => throw _privateConstructorUsedError;
  bool get loadingGetSkrining => throw _privateConstructorUsedError;
  String get normSelected => throw _privateConstructorUsedError;
  String get keterangan => throw _privateConstructorUsedError;
  bool get loadingGetData => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get loadingDetailRiwayatPasien => throw _privateConstructorUsedError;
  List<DetailProfilPasienModel> get detailRiwayatPasien =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailureResult, ApiSuccessResult>> get failOrSuccessResult =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailureResult, ApiSuccessResult>>
      get failOrSuccessResultAnatomi => throw _privateConstructorUsedError;
  Option<Either<ApiFailureResult, ApiSuccessResult>> get detailPasienResult =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailureResult, ApiSuccessResult>> get kVitalSignResult =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailureResult, ApiSuccessResult>> get skriningResult =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailureResult, ApiSuccessResult>> get getSkriningResult =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailureResult, ApiSuccessResult>> get getResult =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailureResult, ApiSuccessResult>> get getDetailPasien =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailureResult, ApiSuccessResult>> get saveResult =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailureResult, ApiSuccessResult>> get saveOdontogram =>
      throw _privateConstructorUsedError;
  List<AntreanPasienModel> get listPasienModel =>
      throw _privateConstructorUsedError;
  List<DetailProfilPasienModel> get detailProfilPasienModel =>
      throw _privateConstructorUsedError;
  SkirningModel? get skriningModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PasienStateCopyWith<PasienState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasienStateCopyWith<$Res> {
  factory $PasienStateCopyWith(
          PasienState value, $Res Function(PasienState) then) =
      _$PasienStateCopyWithImpl<$Res, PasienState>;
  @useResult
  $Res call(
      {AntreanPasienModel? selectedPasien,
      bool loadingPasien,
      bool loadingDetailPasien,
      bool loadigSaveAnatomi,
      bool loadingSkrining,
      bool loadingGetSkrining,
      String normSelected,
      String keterangan,
      bool loadingGetData,
      bool loading,
      bool loadingDetailRiwayatPasien,
      List<DetailProfilPasienModel> detailRiwayatPasien,
      Option<Either<ApiFailureResult, ApiSuccessResult>> failOrSuccessResult,
      Option<Either<ApiFailureResult, ApiSuccessResult>>
          failOrSuccessResultAnatomi,
      Option<Either<ApiFailureResult, ApiSuccessResult>> detailPasienResult,
      Option<Either<ApiFailureResult, ApiSuccessResult>> kVitalSignResult,
      Option<Either<ApiFailureResult, ApiSuccessResult>> skriningResult,
      Option<Either<ApiFailureResult, ApiSuccessResult>> getSkriningResult,
      Option<Either<ApiFailureResult, ApiSuccessResult>> getResult,
      Option<Either<ApiFailureResult, ApiSuccessResult>> getDetailPasien,
      Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult,
      Option<Either<ApiFailureResult, ApiSuccessResult>> saveOdontogram,
      List<AntreanPasienModel> listPasienModel,
      List<DetailProfilPasienModel> detailProfilPasienModel,
      SkirningModel? skriningModel});
}

/// @nodoc
class _$PasienStateCopyWithImpl<$Res, $Val extends PasienState>
    implements $PasienStateCopyWith<$Res> {
  _$PasienStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedPasien = freezed,
    Object? loadingPasien = null,
    Object? loadingDetailPasien = null,
    Object? loadigSaveAnatomi = null,
    Object? loadingSkrining = null,
    Object? loadingGetSkrining = null,
    Object? normSelected = null,
    Object? keterangan = null,
    Object? loadingGetData = null,
    Object? loading = null,
    Object? loadingDetailRiwayatPasien = null,
    Object? detailRiwayatPasien = null,
    Object? failOrSuccessResult = null,
    Object? failOrSuccessResultAnatomi = null,
    Object? detailPasienResult = null,
    Object? kVitalSignResult = null,
    Object? skriningResult = null,
    Object? getSkriningResult = null,
    Object? getResult = null,
    Object? getDetailPasien = null,
    Object? saveResult = null,
    Object? saveOdontogram = null,
    Object? listPasienModel = null,
    Object? detailProfilPasienModel = null,
    Object? skriningModel = freezed,
  }) {
    return _then(_value.copyWith(
      selectedPasien: freezed == selectedPasien
          ? _value.selectedPasien
          : selectedPasien // ignore: cast_nullable_to_non_nullable
              as AntreanPasienModel?,
      loadingPasien: null == loadingPasien
          ? _value.loadingPasien
          : loadingPasien // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingDetailPasien: null == loadingDetailPasien
          ? _value.loadingDetailPasien
          : loadingDetailPasien // ignore: cast_nullable_to_non_nullable
              as bool,
      loadigSaveAnatomi: null == loadigSaveAnatomi
          ? _value.loadigSaveAnatomi
          : loadigSaveAnatomi // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingSkrining: null == loadingSkrining
          ? _value.loadingSkrining
          : loadingSkrining // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingGetSkrining: null == loadingGetSkrining
          ? _value.loadingGetSkrining
          : loadingGetSkrining // ignore: cast_nullable_to_non_nullable
              as bool,
      normSelected: null == normSelected
          ? _value.normSelected
          : normSelected // ignore: cast_nullable_to_non_nullable
              as String,
      keterangan: null == keterangan
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String,
      loadingGetData: null == loadingGetData
          ? _value.loadingGetData
          : loadingGetData // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingDetailRiwayatPasien: null == loadingDetailRiwayatPasien
          ? _value.loadingDetailRiwayatPasien
          : loadingDetailRiwayatPasien // ignore: cast_nullable_to_non_nullable
              as bool,
      detailRiwayatPasien: null == detailRiwayatPasien
          ? _value.detailRiwayatPasien
          : detailRiwayatPasien // ignore: cast_nullable_to_non_nullable
              as List<DetailProfilPasienModel>,
      failOrSuccessResult: null == failOrSuccessResult
          ? _value.failOrSuccessResult
          : failOrSuccessResult // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      failOrSuccessResultAnatomi: null == failOrSuccessResultAnatomi
          ? _value.failOrSuccessResultAnatomi
          : failOrSuccessResultAnatomi // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      detailPasienResult: null == detailPasienResult
          ? _value.detailPasienResult
          : detailPasienResult // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      kVitalSignResult: null == kVitalSignResult
          ? _value.kVitalSignResult
          : kVitalSignResult // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      skriningResult: null == skriningResult
          ? _value.skriningResult
          : skriningResult // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      getSkriningResult: null == getSkriningResult
          ? _value.getSkriningResult
          : getSkriningResult // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      getResult: null == getResult
          ? _value.getResult
          : getResult // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      getDetailPasien: null == getDetailPasien
          ? _value.getDetailPasien
          : getDetailPasien // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      saveResult: null == saveResult
          ? _value.saveResult
          : saveResult // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      saveOdontogram: null == saveOdontogram
          ? _value.saveOdontogram
          : saveOdontogram // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      listPasienModel: null == listPasienModel
          ? _value.listPasienModel
          : listPasienModel // ignore: cast_nullable_to_non_nullable
              as List<AntreanPasienModel>,
      detailProfilPasienModel: null == detailProfilPasienModel
          ? _value.detailProfilPasienModel
          : detailProfilPasienModel // ignore: cast_nullable_to_non_nullable
              as List<DetailProfilPasienModel>,
      skriningModel: freezed == skriningModel
          ? _value.skriningModel
          : skriningModel // ignore: cast_nullable_to_non_nullable
              as SkirningModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PasienStateImplCopyWith<$Res>
    implements $PasienStateCopyWith<$Res> {
  factory _$$PasienStateImplCopyWith(
          _$PasienStateImpl value, $Res Function(_$PasienStateImpl) then) =
      __$$PasienStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AntreanPasienModel? selectedPasien,
      bool loadingPasien,
      bool loadingDetailPasien,
      bool loadigSaveAnatomi,
      bool loadingSkrining,
      bool loadingGetSkrining,
      String normSelected,
      String keterangan,
      bool loadingGetData,
      bool loading,
      bool loadingDetailRiwayatPasien,
      List<DetailProfilPasienModel> detailRiwayatPasien,
      Option<Either<ApiFailureResult, ApiSuccessResult>> failOrSuccessResult,
      Option<Either<ApiFailureResult, ApiSuccessResult>>
          failOrSuccessResultAnatomi,
      Option<Either<ApiFailureResult, ApiSuccessResult>> detailPasienResult,
      Option<Either<ApiFailureResult, ApiSuccessResult>> kVitalSignResult,
      Option<Either<ApiFailureResult, ApiSuccessResult>> skriningResult,
      Option<Either<ApiFailureResult, ApiSuccessResult>> getSkriningResult,
      Option<Either<ApiFailureResult, ApiSuccessResult>> getResult,
      Option<Either<ApiFailureResult, ApiSuccessResult>> getDetailPasien,
      Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult,
      Option<Either<ApiFailureResult, ApiSuccessResult>> saveOdontogram,
      List<AntreanPasienModel> listPasienModel,
      List<DetailProfilPasienModel> detailProfilPasienModel,
      SkirningModel? skriningModel});
}

/// @nodoc
class __$$PasienStateImplCopyWithImpl<$Res>
    extends _$PasienStateCopyWithImpl<$Res, _$PasienStateImpl>
    implements _$$PasienStateImplCopyWith<$Res> {
  __$$PasienStateImplCopyWithImpl(
      _$PasienStateImpl _value, $Res Function(_$PasienStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedPasien = freezed,
    Object? loadingPasien = null,
    Object? loadingDetailPasien = null,
    Object? loadigSaveAnatomi = null,
    Object? loadingSkrining = null,
    Object? loadingGetSkrining = null,
    Object? normSelected = null,
    Object? keterangan = null,
    Object? loadingGetData = null,
    Object? loading = null,
    Object? loadingDetailRiwayatPasien = null,
    Object? detailRiwayatPasien = null,
    Object? failOrSuccessResult = null,
    Object? failOrSuccessResultAnatomi = null,
    Object? detailPasienResult = null,
    Object? kVitalSignResult = null,
    Object? skriningResult = null,
    Object? getSkriningResult = null,
    Object? getResult = null,
    Object? getDetailPasien = null,
    Object? saveResult = null,
    Object? saveOdontogram = null,
    Object? listPasienModel = null,
    Object? detailProfilPasienModel = null,
    Object? skriningModel = freezed,
  }) {
    return _then(_$PasienStateImpl(
      selectedPasien: freezed == selectedPasien
          ? _value.selectedPasien
          : selectedPasien // ignore: cast_nullable_to_non_nullable
              as AntreanPasienModel?,
      loadingPasien: null == loadingPasien
          ? _value.loadingPasien
          : loadingPasien // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingDetailPasien: null == loadingDetailPasien
          ? _value.loadingDetailPasien
          : loadingDetailPasien // ignore: cast_nullable_to_non_nullable
              as bool,
      loadigSaveAnatomi: null == loadigSaveAnatomi
          ? _value.loadigSaveAnatomi
          : loadigSaveAnatomi // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingSkrining: null == loadingSkrining
          ? _value.loadingSkrining
          : loadingSkrining // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingGetSkrining: null == loadingGetSkrining
          ? _value.loadingGetSkrining
          : loadingGetSkrining // ignore: cast_nullable_to_non_nullable
              as bool,
      normSelected: null == normSelected
          ? _value.normSelected
          : normSelected // ignore: cast_nullable_to_non_nullable
              as String,
      keterangan: null == keterangan
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String,
      loadingGetData: null == loadingGetData
          ? _value.loadingGetData
          : loadingGetData // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      loadingDetailRiwayatPasien: null == loadingDetailRiwayatPasien
          ? _value.loadingDetailRiwayatPasien
          : loadingDetailRiwayatPasien // ignore: cast_nullable_to_non_nullable
              as bool,
      detailRiwayatPasien: null == detailRiwayatPasien
          ? _value._detailRiwayatPasien
          : detailRiwayatPasien // ignore: cast_nullable_to_non_nullable
              as List<DetailProfilPasienModel>,
      failOrSuccessResult: null == failOrSuccessResult
          ? _value.failOrSuccessResult
          : failOrSuccessResult // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      failOrSuccessResultAnatomi: null == failOrSuccessResultAnatomi
          ? _value.failOrSuccessResultAnatomi
          : failOrSuccessResultAnatomi // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      detailPasienResult: null == detailPasienResult
          ? _value.detailPasienResult
          : detailPasienResult // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      kVitalSignResult: null == kVitalSignResult
          ? _value.kVitalSignResult
          : kVitalSignResult // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      skriningResult: null == skriningResult
          ? _value.skriningResult
          : skriningResult // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      getSkriningResult: null == getSkriningResult
          ? _value.getSkriningResult
          : getSkriningResult // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      getResult: null == getResult
          ? _value.getResult
          : getResult // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      getDetailPasien: null == getDetailPasien
          ? _value.getDetailPasien
          : getDetailPasien // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      saveResult: null == saveResult
          ? _value.saveResult
          : saveResult // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      saveOdontogram: null == saveOdontogram
          ? _value.saveOdontogram
          : saveOdontogram // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailureResult, ApiSuccessResult>>,
      listPasienModel: null == listPasienModel
          ? _value._listPasienModel
          : listPasienModel // ignore: cast_nullable_to_non_nullable
              as List<AntreanPasienModel>,
      detailProfilPasienModel: null == detailProfilPasienModel
          ? _value._detailProfilPasienModel
          : detailProfilPasienModel // ignore: cast_nullable_to_non_nullable
              as List<DetailProfilPasienModel>,
      skriningModel: freezed == skriningModel
          ? _value.skriningModel
          : skriningModel // ignore: cast_nullable_to_non_nullable
              as SkirningModel?,
    ));
  }
}

/// @nodoc

class _$PasienStateImpl implements _PasienState {
  const _$PasienStateImpl(
      {this.selectedPasien,
      required this.loadingPasien,
      required this.loadingDetailPasien,
      required this.loadigSaveAnatomi,
      required this.loadingSkrining,
      required this.loadingGetSkrining,
      required this.normSelected,
      required this.keterangan,
      required this.loadingGetData,
      required this.loading,
      required this.loadingDetailRiwayatPasien,
      required final List<DetailProfilPasienModel> detailRiwayatPasien,
      required this.failOrSuccessResult,
      required this.failOrSuccessResultAnatomi,
      required this.detailPasienResult,
      required this.kVitalSignResult,
      required this.skriningResult,
      required this.getSkriningResult,
      required this.getResult,
      required this.getDetailPasien,
      required this.saveResult,
      required this.saveOdontogram,
      required final List<AntreanPasienModel> listPasienModel,
      required final List<DetailProfilPasienModel> detailProfilPasienModel,
      this.skriningModel})
      : _detailRiwayatPasien = detailRiwayatPasien,
        _listPasienModel = listPasienModel,
        _detailProfilPasienModel = detailProfilPasienModel;

  @override
  final AntreanPasienModel? selectedPasien;
  @override
  final bool loadingPasien;
  @override
  final bool loadingDetailPasien;
  @override
  final bool loadigSaveAnatomi;
  @override
  final bool loadingSkrining;
  @override
  final bool loadingGetSkrining;
  @override
  final String normSelected;
  @override
  final String keterangan;
  @override
  final bool loadingGetData;
  @override
  final bool loading;
  @override
  final bool loadingDetailRiwayatPasien;
  final List<DetailProfilPasienModel> _detailRiwayatPasien;
  @override
  List<DetailProfilPasienModel> get detailRiwayatPasien {
    if (_detailRiwayatPasien is EqualUnmodifiableListView)
      return _detailRiwayatPasien;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_detailRiwayatPasien);
  }

  @override
  final Option<Either<ApiFailureResult, ApiSuccessResult>> failOrSuccessResult;
  @override
  final Option<Either<ApiFailureResult, ApiSuccessResult>>
      failOrSuccessResultAnatomi;
  @override
  final Option<Either<ApiFailureResult, ApiSuccessResult>> detailPasienResult;
  @override
  final Option<Either<ApiFailureResult, ApiSuccessResult>> kVitalSignResult;
  @override
  final Option<Either<ApiFailureResult, ApiSuccessResult>> skriningResult;
  @override
  final Option<Either<ApiFailureResult, ApiSuccessResult>> getSkriningResult;
  @override
  final Option<Either<ApiFailureResult, ApiSuccessResult>> getResult;
  @override
  final Option<Either<ApiFailureResult, ApiSuccessResult>> getDetailPasien;
  @override
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveResult;
  @override
  final Option<Either<ApiFailureResult, ApiSuccessResult>> saveOdontogram;
  final List<AntreanPasienModel> _listPasienModel;
  @override
  List<AntreanPasienModel> get listPasienModel {
    if (_listPasienModel is EqualUnmodifiableListView) return _listPasienModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listPasienModel);
  }

  final List<DetailProfilPasienModel> _detailProfilPasienModel;
  @override
  List<DetailProfilPasienModel> get detailProfilPasienModel {
    if (_detailProfilPasienModel is EqualUnmodifiableListView)
      return _detailProfilPasienModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_detailProfilPasienModel);
  }

  @override
  final SkirningModel? skriningModel;

  @override
  String toString() {
    return 'PasienState(selectedPasien: $selectedPasien, loadingPasien: $loadingPasien, loadingDetailPasien: $loadingDetailPasien, loadigSaveAnatomi: $loadigSaveAnatomi, loadingSkrining: $loadingSkrining, loadingGetSkrining: $loadingGetSkrining, normSelected: $normSelected, keterangan: $keterangan, loadingGetData: $loadingGetData, loading: $loading, loadingDetailRiwayatPasien: $loadingDetailRiwayatPasien, detailRiwayatPasien: $detailRiwayatPasien, failOrSuccessResult: $failOrSuccessResult, failOrSuccessResultAnatomi: $failOrSuccessResultAnatomi, detailPasienResult: $detailPasienResult, kVitalSignResult: $kVitalSignResult, skriningResult: $skriningResult, getSkriningResult: $getSkriningResult, getResult: $getResult, getDetailPasien: $getDetailPasien, saveResult: $saveResult, saveOdontogram: $saveOdontogram, listPasienModel: $listPasienModel, detailProfilPasienModel: $detailProfilPasienModel, skriningModel: $skriningModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasienStateImpl &&
            (identical(other.selectedPasien, selectedPasien) ||
                other.selectedPasien == selectedPasien) &&
            (identical(other.loadingPasien, loadingPasien) ||
                other.loadingPasien == loadingPasien) &&
            (identical(other.loadingDetailPasien, loadingDetailPasien) ||
                other.loadingDetailPasien == loadingDetailPasien) &&
            (identical(other.loadigSaveAnatomi, loadigSaveAnatomi) ||
                other.loadigSaveAnatomi == loadigSaveAnatomi) &&
            (identical(other.loadingSkrining, loadingSkrining) ||
                other.loadingSkrining == loadingSkrining) &&
            (identical(other.loadingGetSkrining, loadingGetSkrining) ||
                other.loadingGetSkrining == loadingGetSkrining) &&
            (identical(other.normSelected, normSelected) ||
                other.normSelected == normSelected) &&
            (identical(other.keterangan, keterangan) ||
                other.keterangan == keterangan) &&
            (identical(other.loadingGetData, loadingGetData) ||
                other.loadingGetData == loadingGetData) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.loadingDetailRiwayatPasien,
                    loadingDetailRiwayatPasien) ||
                other.loadingDetailRiwayatPasien ==
                    loadingDetailRiwayatPasien) &&
            const DeepCollectionEquality()
                .equals(other._detailRiwayatPasien, _detailRiwayatPasien) &&
            (identical(other.failOrSuccessResult, failOrSuccessResult) ||
                other.failOrSuccessResult == failOrSuccessResult) &&
            (identical(other.failOrSuccessResultAnatomi,
                    failOrSuccessResultAnatomi) ||
                other.failOrSuccessResultAnatomi ==
                    failOrSuccessResultAnatomi) &&
            (identical(other.detailPasienResult, detailPasienResult) ||
                other.detailPasienResult == detailPasienResult) &&
            (identical(other.kVitalSignResult, kVitalSignResult) ||
                other.kVitalSignResult == kVitalSignResult) &&
            (identical(other.skriningResult, skriningResult) ||
                other.skriningResult == skriningResult) &&
            (identical(other.getSkriningResult, getSkriningResult) ||
                other.getSkriningResult == getSkriningResult) &&
            (identical(other.getResult, getResult) ||
                other.getResult == getResult) &&
            (identical(other.getDetailPasien, getDetailPasien) ||
                other.getDetailPasien == getDetailPasien) &&
            (identical(other.saveResult, saveResult) ||
                other.saveResult == saveResult) &&
            (identical(other.saveOdontogram, saveOdontogram) ||
                other.saveOdontogram == saveOdontogram) &&
            const DeepCollectionEquality()
                .equals(other._listPasienModel, _listPasienModel) &&
            const DeepCollectionEquality().equals(
                other._detailProfilPasienModel, _detailProfilPasienModel) &&
            (identical(other.skriningModel, skriningModel) ||
                other.skriningModel == skriningModel));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        selectedPasien,
        loadingPasien,
        loadingDetailPasien,
        loadigSaveAnatomi,
        loadingSkrining,
        loadingGetSkrining,
        normSelected,
        keterangan,
        loadingGetData,
        loading,
        loadingDetailRiwayatPasien,
        const DeepCollectionEquality().hash(_detailRiwayatPasien),
        failOrSuccessResult,
        failOrSuccessResultAnatomi,
        detailPasienResult,
        kVitalSignResult,
        skriningResult,
        getSkriningResult,
        getResult,
        getDetailPasien,
        saveResult,
        saveOdontogram,
        const DeepCollectionEquality().hash(_listPasienModel),
        const DeepCollectionEquality().hash(_detailProfilPasienModel),
        skriningModel
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PasienStateImplCopyWith<_$PasienStateImpl> get copyWith =>
      __$$PasienStateImplCopyWithImpl<_$PasienStateImpl>(this, _$identity);
}

abstract class _PasienState implements PasienState {
  const factory _PasienState(
      {final AntreanPasienModel? selectedPasien,
      required final bool loadingPasien,
      required final bool loadingDetailPasien,
      required final bool loadigSaveAnatomi,
      required final bool loadingSkrining,
      required final bool loadingGetSkrining,
      required final String normSelected,
      required final String keterangan,
      required final bool loadingGetData,
      required final bool loading,
      required final bool loadingDetailRiwayatPasien,
      required final List<DetailProfilPasienModel> detailRiwayatPasien,
      required final Option<Either<ApiFailureResult, ApiSuccessResult>>
          failOrSuccessResult,
      required final Option<Either<ApiFailureResult, ApiSuccessResult>>
          failOrSuccessResultAnatomi,
      required final Option<Either<ApiFailureResult, ApiSuccessResult>>
          detailPasienResult,
      required final Option<Either<ApiFailureResult, ApiSuccessResult>>
          kVitalSignResult,
      required final Option<Either<ApiFailureResult, ApiSuccessResult>>
          skriningResult,
      required final Option<Either<ApiFailureResult, ApiSuccessResult>>
          getSkriningResult,
      required final Option<Either<ApiFailureResult, ApiSuccessResult>>
          getResult,
      required final Option<Either<ApiFailureResult, ApiSuccessResult>>
          getDetailPasien,
      required final Option<Either<ApiFailureResult, ApiSuccessResult>>
          saveResult,
      required final Option<Either<ApiFailureResult, ApiSuccessResult>>
          saveOdontogram,
      required final List<AntreanPasienModel> listPasienModel,
      required final List<DetailProfilPasienModel> detailProfilPasienModel,
      final SkirningModel? skriningModel}) = _$PasienStateImpl;

  @override
  AntreanPasienModel? get selectedPasien;
  @override
  bool get loadingPasien;
  @override
  bool get loadingDetailPasien;
  @override
  bool get loadigSaveAnatomi;
  @override
  bool get loadingSkrining;
  @override
  bool get loadingGetSkrining;
  @override
  String get normSelected;
  @override
  String get keterangan;
  @override
  bool get loadingGetData;
  @override
  bool get loading;
  @override
  bool get loadingDetailRiwayatPasien;
  @override
  List<DetailProfilPasienModel> get detailRiwayatPasien;
  @override
  Option<Either<ApiFailureResult, ApiSuccessResult>> get failOrSuccessResult;
  @override
  Option<Either<ApiFailureResult, ApiSuccessResult>>
      get failOrSuccessResultAnatomi;
  @override
  Option<Either<ApiFailureResult, ApiSuccessResult>> get detailPasienResult;
  @override
  Option<Either<ApiFailureResult, ApiSuccessResult>> get kVitalSignResult;
  @override
  Option<Either<ApiFailureResult, ApiSuccessResult>> get skriningResult;
  @override
  Option<Either<ApiFailureResult, ApiSuccessResult>> get getSkriningResult;
  @override
  Option<Either<ApiFailureResult, ApiSuccessResult>> get getResult;
  @override
  Option<Either<ApiFailureResult, ApiSuccessResult>> get getDetailPasien;
  @override
  Option<Either<ApiFailureResult, ApiSuccessResult>> get saveResult;
  @override
  Option<Either<ApiFailureResult, ApiSuccessResult>> get saveOdontogram;
  @override
  List<AntreanPasienModel> get listPasienModel;
  @override
  List<DetailProfilPasienModel> get detailProfilPasienModel;
  @override
  SkirningModel? get skriningModel;
  @override
  @JsonKey(ignore: true)
  _$$PasienStateImplCopyWith<_$PasienStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
