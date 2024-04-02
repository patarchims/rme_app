import 'package:equatable/equatable.dart';

class OnBoardingEntity extends Equatable {
  final bool? isActive;
  const OnBoardingEntity({
    this.isActive,
  });
  @override
  List<Object?> get props => [isActive];
}
