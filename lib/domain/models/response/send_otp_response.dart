// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class SendOtpResponse extends Equatable {
  const SendOtpResponse({
    required this.email,
    required this.kodeOtp,
    required this.nik,
    required this.idKaryawan,
    required this.exp,
  });

  final String email;
  final String kodeOtp;
  final String nik;
  final String idKaryawan;
  final int exp;

  factory SendOtpResponse.fromMap(Map<String, dynamic> json) => SendOtpResponse(
        idKaryawan: json["idKaryawan"].toString(),
        nik: json["nik"].toString(),
        email: json["email"].toString(),
        kodeOtp: json["kodeOtp"].toString(),
        exp: json["exp"] as int,
      );

  Map<String, dynamic> toMap() => {
        "idKaryawan": idKaryawan,
        "nik": nik,
        "email": email,
        "kodeOtp": kodeOtp,
        "exp": exp,
      };

  @override
  List<Object?> get props => [email, kodeOtp, exp, nik, idKaryawan];
}
