import 'package:equatable/equatable.dart';

import 'auth_user.dart';

class AuthSession extends Equatable {
  const AuthSession({
    required this.user,
    required this.accessToken,
    required this.signedInAt,
  });

  final AuthUser user;
  final String accessToken;
  final DateTime signedInAt;

  @override
  List<Object?> get props => [user, accessToken, signedInAt];
}
