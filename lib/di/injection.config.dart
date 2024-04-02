// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hms_app/di/module/dio_module.dart' as _i43;
import 'package:hms_app/di/module/shared_preferences_module.dart' as _i44;
import 'package:hms_app/domain/bloc/app/app_bloc.dart' as _i30;
import 'package:hms_app/domain/bloc/asesmen/medis/intra_oral/intra_oral_bloc.dart'
    as _i38;
import 'package:hms_app/domain/bloc/asesmen/medis/odontogram/odontogram_bloc.dart'
    as _i39;
import 'package:hms_app/domain/bloc/content_manager/content_manager_bloc.dart'
    as _i5;
import 'package:hms_app/domain/bloc/dashboard/asesmen_dokter/asesmen_dokter_bloc.dart'
    as _i13;
import 'package:hms_app/domain/bloc/dashboard/asesmen_igd/asesmen_igd_bloc.dart'
    as _i35;
import 'package:hms_app/domain/bloc/dashboard/asesmen_keperawatan_bidan/asesmen_keperawatan_bidan_bloc.dart'
    as _i42;
import 'package:hms_app/domain/bloc/dashboard/cppt/cppt_bloc.dart' as _i14;
import 'package:hms_app/domain/bloc/dashboard/hasil_penunjang/hasil_penunjang_bloc.dart'
    as _i15;
import 'package:hms_app/domain/bloc/dashboard/informasi_medis/informasi_medis_bloc.dart'
    as _i40;
import 'package:hms_app/domain/bloc/dashboard/pasien/pasien_bloc.dart' as _i41;
import 'package:hms_app/domain/bloc/dashboard/pemeriksaan_fisik/pemeriksaan_fisik_bloc.dart'
    as _i16;
import 'package:hms_app/domain/bloc/dashboard/rawat_jalan/rawat_jalan_bloc.dart'
    as _i17;
import 'package:hms_app/domain/bloc/dashboard/resiko_jatuh/reassesmen_resiko_jatuh/reassesmen_resiko_jatuh_bloc.dart'
    as _i18;
import 'package:hms_app/domain/bloc/dashboard/resiko_jatuh/resiko_jatuh_anak/resiko_jatuh_anak_bloc.dart'
    as _i19;
import 'package:hms_app/domain/bloc/dashboard/resiko_jatuh/resiko_jatuh_dewasa/resiko_jatuh_dewasa_bloc.dart'
    as _i20;
import 'package:hms_app/domain/bloc/dashboard/resiko_jatuh/resiko_jatuh_intervensi/resiko_jatuh_bloc.dart'
    as _i21;
import 'package:hms_app/domain/bloc/dashboard/rincian_informasi/rincian_informasi_bloc.dart'
    as _i22;
import 'package:hms_app/domain/bloc/dashboard/triase/triase_bloc.dart' as _i36;
import 'package:hms_app/domain/bloc/theme/theme_bloc.dart' as _i37;
import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart' as _i31;
import 'package:hms_app/domain/bloc/user/create_user/create_user_bloc.dart'
    as _i25;
import 'package:hms_app/domain/bloc/user/sign_in_form/sign_in_form_bloc.dart'
    as _i32;
import 'package:hms_app/domain/network/my_dio.dart' as _i6;
import 'package:hms_app/domain/repository/asesmen/asesmen_repository.dart'
    as _i28;
import 'package:hms_app/domain/repository/asesmen/asesmen_repository_impl.dart'
    as _i29;
import 'package:hms_app/domain/repository/auth/auth_repository.dart' as _i11;
import 'package:hms_app/domain/repository/auth/auth_repository_impl.dart'
    as _i12;
import 'package:hms_app/domain/repository/librari/librari_reposirory_impl.dart'
    as _i8;
import 'package:hms_app/domain/repository/librari/librari_repository.dart'
    as _i7;
import 'package:hms_app/domain/repository/odontogram/odontogram_repository.dart'
    as _i33;
import 'package:hms_app/domain/repository/odontogram/odontogram_repository_imple.dart'
    as _i34;
import 'package:hms_app/domain/repository/report/report_repository.dart'
    as _i23;
import 'package:hms_app/domain/repository/report/report_repository_imple.dart'
    as _i24;
import 'package:hms_app/domain/repository/settings/settings_repository.dart'
    as _i26;
import 'package:hms_app/domain/repository/settings/settings_repository_impl.dart'
    as _i27;
import 'package:hms_app/domain/repository/soap/soap_repository.dart' as _i9;
import 'package:hms_app/domain/repository/soap/soap_repository_impl.dart'
    as _i10;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    final sharedPreferencesModule = _$SharedPreferencesModule();
    gh.factory<_i3.Dio>(() => dioModule.dio);
    gh.factoryAsync<_i4.SharedPreferences>(
        () => sharedPreferencesModule.sharedPreferences);
    gh.factory<_i5.ContentManagerBloc>(() => _i5.ContentManagerBloc());
    gh.lazySingleton<_i6.MyDio>(() => _i6.MyDio());
    gh.lazySingleton<_i7.LibrariRepositori>(() => _i8.LibrariRepositoriImpl());
    gh.lazySingleton<_i9.SoapRepository>(() => _i10.SoapRepositoryImpl());
    gh.lazySingleton<_i11.AuthRepository>(() => _i12.AuthRepositoryImpl());
    gh.factory<_i13.AsesmenDokterBloc>(
        () => _i13.AsesmenDokterBloc(gh<_i7.LibrariRepositori>()));
    gh.factory<_i14.CpptBloc>(() => _i14.CpptBloc(gh<_i7.LibrariRepositori>()));
    gh.factory<_i15.HasilPenunjangBloc>(
        () => _i15.HasilPenunjangBloc(gh<_i7.LibrariRepositori>()));
    gh.factory<_i16.PemeriksaanFisikBloc>(
        () => _i16.PemeriksaanFisikBloc(gh<_i7.LibrariRepositori>()));
    gh.factory<_i17.RawatJalanBloc>(
        () => _i17.RawatJalanBloc(gh<_i7.LibrariRepositori>()));
    gh.factory<_i18.ReassesmenResikoJatuhBloc>(
        () => _i18.ReassesmenResikoJatuhBloc(gh<_i7.LibrariRepositori>()));
    gh.factory<_i19.ResikoJatuhAnakBloc>(
        () => _i19.ResikoJatuhAnakBloc(gh<_i7.LibrariRepositori>()));
    gh.factory<_i20.ResikoJatuhDewasaBloc>(
        () => _i20.ResikoJatuhDewasaBloc(gh<_i7.LibrariRepositori>()));
    gh.factory<_i21.ResikoJatuhBloc>(
        () => _i21.ResikoJatuhBloc(gh<_i7.LibrariRepositori>()));
    gh.factory<_i22.RincianInformasiBloc>(
        () => _i22.RincianInformasiBloc(gh<_i7.LibrariRepositori>()));
    gh.lazySingleton<_i23.ReportRepositori>(() => _i24.ReportRepositoriImple());
    gh.factory<_i25.CreateUserBloc>(() => _i25.CreateUserBloc(
          gh<_i7.LibrariRepositori>(),
          gh<_i11.AuthRepository>(),
        ));
    gh.lazySingletonAsync<_i26.SettingsRepository>(() async =>
        _i27.SettingsRepositoryImpl(await getAsync<_i4.SharedPreferences>()));
    gh.lazySingleton<_i28.AsesmenRespository>(
        () => _i29.AsesmenRepositoryImpl());
    gh.factory<_i30.AppBloc>(() => _i30.AppBloc(gh<_i11.AuthRepository>()));
    gh.factory<_i31.AuthBloc>(() => _i31.AuthBloc(gh<_i11.AuthRepository>()));
    gh.factory<_i32.SignInFormBloc>(
        () => _i32.SignInFormBloc(gh<_i11.AuthRepository>()));
    gh.lazySingleton<_i33.OdontogramRepository>(
        () => _i34.OdontogramRepoImpl());
    gh.factory<_i35.AsesmenIgdBloc>(() => _i35.AsesmenIgdBloc(
          gh<_i9.SoapRepository>(),
          gh<_i7.LibrariRepositori>(),
        ));
    gh.factory<_i36.TriaseBloc>(() => _i36.TriaseBloc(
          gh<_i9.SoapRepository>(),
          gh<_i7.LibrariRepositori>(),
        ));
    gh.factoryAsync<_i37.ThemeBloc>(
        () async => _i37.ThemeBloc(await getAsync<_i26.SettingsRepository>()));
    gh.factory<_i38.IntraOralBloc>(
        () => _i38.IntraOralBloc(gh<_i9.SoapRepository>()));
    gh.factory<_i39.OdontogramBloc>(
        () => _i39.OdontogramBloc(gh<_i9.SoapRepository>()));
    gh.factory<_i40.InformasiMedisBloc>(
        () => _i40.InformasiMedisBloc(gh<_i9.SoapRepository>()));
    gh.factory<_i41.PasienBloc>(
        () => _i41.PasienBloc(gh<_i9.SoapRepository>()));
    gh.factory<_i42.AsesmenKeperawatanBidanBloc>(
        () => _i42.AsesmenKeperawatanBidanBloc(
              gh<_i9.SoapRepository>(),
              gh<_i28.AsesmenRespository>(),
            ));
    return this;
  }
}

class _$DioModule extends _i43.DioModule {}

class _$SharedPreferencesModule extends _i44.SharedPreferencesModule {}
