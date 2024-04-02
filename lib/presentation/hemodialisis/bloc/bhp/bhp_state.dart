// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bhp_bloc.dart';

enum BHPStatus {
  initial,
  loading,
  loaded,
  error,
  isLoadingGetBHP,
  isLaodedBHP,
}

class BhpState extends Equatable {
  final BHPStatus status;
  final BhpHaemodalisaModel bhpHaemodalisaModel;
  const BhpState({
    required this.status,
    required this.bhpHaemodalisaModel,
  });

  static BhpState initial() => BhpState(
      status: BHPStatus.initial,
      bhpHaemodalisaModel: BhpHaemodalisaModel(
          insertDttm: DateTime.now().toString(),
          insertPc: "",
          userId: "",
          ketPerson: "",
          kdBagian: "",
          dpjp: "",
          noreg: "",
          item1A: false,
          item1B: false,
          item1C: false,
          item2A: false,
          item2B: false,
          item3: false,
          item4: false,
          item5: false,
          item6: false));

  @override
  List<Object?> get props => [
        status,
        bhpHaemodalisaModel,
      ];

  BhpState copyWith({
    BHPStatus? status,
    BhpHaemodalisaModel? bhpHaemodalisaModel,
  }) {
    return BhpState(
      status: status ?? this.status,
      bhpHaemodalisaModel: bhpHaemodalisaModel ?? this.bhpHaemodalisaModel,
    );
  }
}
