import '../../domain/entities/auth_session.dart';
import 'user_model.dart';

class AuthSessionModel {
  const AuthSessionModel({
    required this.user,
    required this.accessToken,
    required this.signedInAt,
  });

  final UserModel user;
  final String accessToken;
  final DateTime signedInAt;

  AuthSession toEntity() {
    return AuthSession(
      user: user.toEntity(),
      accessToken: accessToken,
      signedInAt: signedInAt,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user': user.toJson(),
      'access_token': accessToken,
      'signed_in_at': signedInAt.toIso8601String(),
    };
  }

  factory AuthSessionModel.fromJson(Map<String, dynamic> json) {
    return AuthSessionModel(
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['access_token'] as String,
      signedInAt: DateTime.parse(json['signed_in_at'] as String),
    );
  }
}
