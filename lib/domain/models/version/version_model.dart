import 'package:equatable/equatable.dart';

class VersionModel extends Equatable {
  final double androidVersion;
  final double iosVersion;

  const VersionModel({
    required this.androidVersion,
    required this.iosVersion,
  });

  @override
  List<Object?> get props => [androidVersion, iosVersion];

  factory VersionModel.fromMap(Map<String, dynamic> json) => VersionModel(
        androidVersion: json["android_version"] as double,
        iosVersion: json["ios_version"] as double,
      );

  Map<String, dynamic> toMap() => {
        "android_version": androidVersion,
        "ios_version": iosVersion,
      };
}
