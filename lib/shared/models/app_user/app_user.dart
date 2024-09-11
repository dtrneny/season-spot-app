import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required String id,
    required String email,
  }) = _AppUser;

  factory AppUser.fromUser(User user) {
    return AppUser(id: user.uid, email: user.email!);
  }
}
