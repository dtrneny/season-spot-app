import 'package:season_spot/config/locator.dart';
import 'package:season_spot/core/error_handling/index.dart';
import 'package:season_spot/core/helpers/index.dart';
import 'package:season_spot/core/query_predicate/index.dart';
import 'package:season_spot/core/screen_handling/index.dart';
import 'package:season_spot/shared/models/index.dart';
import 'package:season_spot/shared/repositories/firestore/firestore_repository_impl.dart';
import 'package:season_spot/shared/services/auth/auth_service.dart';
import 'package:season_spot/shared/services/google_places_service/google_places_service.dart';
import 'package:season_spot/shared/toast/index.dart';

class VendorAdditionController extends ScreenController {
  final _auth = getIt.get<AuthService>();
  final _userAccountRepository =
      getIt.get<FirestoreRepositoryImpl<UserAccount>>();
  final _vendorAccountRepository =
      getIt.get<FirestoreRepositoryImpl<VendorAccount>>();
  final toast = getIt.get<ToastController>();
  final googlePlacesService = getIt.get<GooglePlacesService>();

  Future<bool> createVendorAccount({
    String key = 'createVendorAccount',
    required VendorAccount data,
  }) async {
    bool finishWithError(AppError error) {
      stopLoading(key);
      emitError(error);
      return false;
    }

    try {
      startLoading(key, PresentationType.ui);

      final userId = _auth.getCurrentUser()?.id;
      if (userId == null) {
        return finishWithError(AppError());
      }

      final matchingEmails = await _vendorAccountRepository.getAll([
        IsEqualToPredicate(data.email, field: 'email'),
      ]);

      if (matchingEmails.isNotEmpty) {
        return finishWithError(EmailInUseError());
      }

      final accountId = await _vendorAccountRepository.create(data);
      await _userAccountRepository.update(userId, {
        'vendorAccountId': accountId,
      });

      stopLoading(key);
      return true;
    } on Exception {
      return finishWithError(AppError());
    }
  }
}
