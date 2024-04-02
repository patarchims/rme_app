// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pengkajian_nutrisi_bloc.dart';

enum PengkajianNutrisiStatus {
  initial,
  loading,
  loaded,
  loadedPenkajianNutrisi,
  onSelected,
  isLoadingSavePengkajian,
  isLoadingGetPengkajian,
  loadedPengkajian,
  error,
}

class PengkajianNutrisiState extends Equatable {
  final PengkajianNutrisiStatus status;
  final PengkajianNutrisiResponseModel pengkajianNutrisiResponseModel;
  final Option<Either<ApiFailureResult, ApiSuccessResult>> savePengkajianResult;
  const PengkajianNutrisiState({
    required this.status,
    required this.savePengkajianResult,
    required this.pengkajianNutrisiResponseModel,
  });
  @override
  List<Object?> get props => [status];

  static PengkajianNutrisiState initial() => PengkajianNutrisiState(
        status: PengkajianNutrisiStatus.initial,
        savePengkajianResult: const None(),
        pengkajianNutrisiResponseModel: PengkajianNutrisiResponseModel(
            noreg: "", n1: "", n2: "", nilai: 0, nilaiN1: 0, nilaiN2: 0),
      );

  PengkajianNutrisiState copyWith({
    PengkajianNutrisiStatus? status,
    PengkajianNutrisiResponseModel? pengkajianNutrisiResponseModel,
    Option<Either<ApiFailureResult, ApiSuccessResult>>? savePengkajianResult,
  }) {
    return PengkajianNutrisiState(
      status: status ?? this.status,
      savePengkajianResult: savePengkajianResult ?? this.savePengkajianResult,
      pengkajianNutrisiResponseModel:
          pengkajianNutrisiResponseModel ?? this.pengkajianNutrisiResponseModel,
    );
  }
}
