import 'package:season_spot/config/locator.dart';
import 'package:season_spot/core/error_handling/index.dart';
import 'package:season_spot/core/query_predicate/index.dart';
import 'package:season_spot/core/screen_handling/index.dart';
import 'package:season_spot/shared/models/index.dart';
import 'package:season_spot/shared/repositories/firestore/firestore_repository_impl.dart';
import 'package:season_spot/shared/toast/index.dart';

class VendorAdditionController extends ScreenController {
  final _vendorAccountRepository =
      getIt.get<FirestoreRepositoryImpl<VendorAccount>>();
  final toast = getIt.get<ToastController>();

  Future<bool> createVendorAccount({
    String key = 'createVendorAccount',
    required VendorAccount data,
  }) async {
    try {
      startLoading(key, LoadingType.ui);
      final matchingEmails = await _vendorAccountRepository.getAll([
        IsEqualToPredicate(data.bussinessEmail, field: 'bussinessEmail'),
      ]);

      if (matchingEmails.isNotEmpty) {
        stopLoading(key);
        emitError(EmailInUseError());
        return false;
      }

      final _ = await _vendorAccountRepository.create(data);
      stopLoading(key);
      return true;
    } on Exception {
      stopLoading(key);
      emitError(AppError());
      return false;
    }
  }
}
