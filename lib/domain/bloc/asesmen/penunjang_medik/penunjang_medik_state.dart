// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'penunjang_medik_bloc.dart';

@immutable
class PenunjangMedikState {
  final List<PenunjangMedikModel> penunjangMedik;
  final bool isLoading;
  const PenunjangMedikState({
    this.penunjangMedik = const [],
    this.isLoading = false,
  });

  PenunjangMedikState copyWith({
    List<PenunjangMedikModel>? penunjangMedik,
    bool? isLoading,
  }) {
    return PenunjangMedikState(
      penunjangMedik: penunjangMedik ?? this.penunjangMedik,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class LoadingState extends PenunjangMedikState {}

class SuccessState extends PenunjangMedikState {}

class FailureState extends PenunjangMedikState {}

class EmtyState extends PenunjangMedikState {}
