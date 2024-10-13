import 'package:season_spot/config/locator.dart';
import 'package:season_spot/core/helpers/index.dart';
import 'package:season_spot/core/screen_handling/index.dart';
import 'package:season_spot/shared/services/google_places_service/google_places_service.dart';
import 'package:season_spot/shared/services/google_places_service/models/autocomplete_prediction/autocomplete_prediction.dart';

class LocationPickerOverlayController extends ScreenController {
  final _googlePlacesService = getIt.get<GooglePlacesService>();

  Future<List<AutocompletePrediction>> fetchPredictions({
    required String key,
    required String query,
  }) async {
    try {
      startLoading(key, PresentationType.ui);
      final result = await _googlePlacesService.getPredictions(query);
      stopLoading(key);
      return result;
    } catch (_) {
      stopLoading(key);
      return [];
    }
  }
}
