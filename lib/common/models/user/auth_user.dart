
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';

@freezed
class AuthUser with _$AuthUser {
  const factory AuthUser({
    required String id,
    required String email,
  }) = _AuthUser;

  factory AuthUser.fromUser(User user) {
    return AuthUser(id: user.uid, email: user.email!);
  }
}
