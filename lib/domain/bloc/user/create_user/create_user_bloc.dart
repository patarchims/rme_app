import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hms_app/domain/models/kpelayanan/kpelayanan_model.dart';
import 'package:hms_app/domain/models/users/karyawan_model.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/repository/auth/auth_repository.dart';
import 'package:hms_app/domain/repository/librari/librari_repository.dart';
import 'package:injectable/injectable.dart';

part 'create_user_event.dart';
part 'create_user_state.dart';
part 'create_user_bloc.freezed.dart';

@injectable
class CreateUserBloc extends Bloc<CreateUserEvent, CreateUserState> {
  LibrariRepositori librariRepositori;
  AuthRepository authRepository;
  CreateUserBloc(this.librariRepositori, this.authRepository)
      : super(CreateUserState.initial()) {
    on<CreateUserEvent>((event, emit) => _onEventChanged(event, emit));
  }

  Future<void> _onEventChanged(
      CreateUserEvent event, Emitter<CreateUserState> emit) async {
    await event.maybeMap(
        orElse: () {},
        cariDokter: (e) async {
          // LOADING CARI DOKTER
          emit(state.copyWith(
              loadingSearchDokter: true,
              searchDokterfailOrSuccessResult: none()));

          final dokter = await librariRepositori.getDokter(params: e.idDokter);

          emit(state.copyWith(
              loadingSearchDokter: true,
              searchDokterfailOrSuccessResult: optionOf(dokter)));

          emit(state.copyWith(
              loadingSearchDokter: false,
              searchDokterfailOrSuccessResult: none()));
        },
        selectedUserLogin: (e) {
          emit(state.copyWith(selectedValue: e.selected));
        },
        verifikasiAkun: (e) async {
          emit(state.copyWith(loading: true, verifyrFailureOrSuccess: none()));
          final verify = await authRepository.verifikasiUser(
              activatedCode: e.kodeActivasi);
          emit(state.copyWith(
              loading: false, verifyrFailureOrSuccess: optionOf(verify)));
          emit(state.copyWith(loading: false, verifyrFailureOrSuccess: none()));
        },
        changeKodeModul: (e) {
          emit(state.copyWith(kodeModul: e.kodeModul));
        },
        registerUser: (e) async {
          emit(state.copyWith(loading: true, registerFailureOrSuccess: none()));

          final registerUser = await authRepository.registerUser(
              nik: e.nik, kodeModul: e.kodeModul, password: e.password);

          emit(state.copyWith(
              loading: false,
              registerFailureOrSuccess: optionOf(registerUser)));
          emit(
              state.copyWith(loading: false, registerFailureOrSuccess: none()));
        },
        clearUser: (e) {
          emit(state.copyWith(
              userModel: const KaryawanModel(
                  nik: "-",
                  idKaryawan: "-",
                  hp: "-",
                  alamat: "-",
                  photo: "-",
                  bagian: "-",
                  nama: "-",
                  jenisKelamin: "-",
                  tglLahir: "-",
                  tempatLahir: "-",
                  kota: "-",
                  usia: "-",
                  agama: "-",
                  tglMasuk: "-",
                  statusKawin: "-",
                  email: "-")));
        },
        addUser: (e) {
          emit(state.copyWith(userModel: e.userModel));
        },
        getKaryawan: (e) async {
          emit(state.copyWith(loading: true, failOrSuccessResult: none()));
          final pelayanan =
              await librariRepositori.getKaryawan(params: e.params);

          emit(state.copyWith(
              loading: true, failOrSuccessResult: optionOf(pelayanan)));

          emit(state.copyWith(loading: false, failOrSuccessResult: none()));
        },
        getKpelayanan: (e) async {
          final pelayanan = await librariRepositori.getKPelayanan();

          pelayanan.fold(
              (l) => null,
              (r) => r.maybeMap(
                  orElse: () {},
                  loaded: (e) {
                    emit(state.copyWith(pelayananLoading: true));
                    List<KPelayananModel> result =
                        (e.value['response'] as Iterable)
                            .map((e) => KPelayananModel.fromMap(e))
                            .toList();
                    emit(state.copyWith(
                        pelayanan: result, kodeModul: result[0].kdBagian));
                  }));

          emit(state.copyWith(pelayananLoading: false));
        });
  }
}
