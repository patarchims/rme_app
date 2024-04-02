import 'package:equatable/equatable.dart';

class TokenModel extends Equatable {
  final String? token;
  final String? refreshToken;

  const TokenModel({
    this.token,
    this.refreshToken,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
        token: json['token'].toString(), refreshToken: json["refresh_token"]);
  }

  Map<String, dynamic> toJson() {
    return {'token': token, 'refresh_token': refreshToken};
  }

  static Map<String, dynamic> tokenHeaderToJson({required String token}) {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'x-token': token
    };
  }

  @override
  List<Object?> get props => [
        token,
        refreshToken,
      ];

  TokenModel copyWith({
    String? token,
    String? refreshToken,
  }) {
    return TokenModel(
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }
}
