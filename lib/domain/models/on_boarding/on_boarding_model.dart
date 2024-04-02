import '../../entity/on_boarding/on_boarding_entity.dart';

class OnBoardingModel extends OnBoardingEntity {
  const OnBoardingModel({
    required super.isActive,
  });

  factory OnBoardingModel.fromJson(Map<String, dynamic> json) {
    return OnBoardingModel(
      isActive: json['isActive'] ?? json['isActive'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {'isActive': isActive};
  }
}
