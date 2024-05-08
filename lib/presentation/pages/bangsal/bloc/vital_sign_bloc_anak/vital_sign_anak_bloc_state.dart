// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'vital_sign_anak_bloc_bloc.dart';

enum VitalSignAnakStatus {
  initial,
  loading,
  loaded,
  error,
  isChanged,
  isLoadingGet,
  isLoadingSave,
  loadedSave,
}

class VitalSignAnakBlocState extends Equatable {
  final VitalSignAnakStatus status;
  const VitalSignAnakBlocState({
    required this.status,
  });
  @override
  List<Object?> get props => [status];

  static VitalSignAnakBlocState initial() => const VitalSignAnakBlocState(
        status: VitalSignAnakStatus.initial,
      );
}
