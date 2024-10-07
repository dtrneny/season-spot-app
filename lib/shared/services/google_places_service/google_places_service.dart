import 'package:season_spot/shared/services/google_places_service/models/autocomplete_prediction/autocomplete_prediction.dart';
import 'package:season_spot/shared/services/google_places_service/models/google_place/google_place.dart';

abstract class GooglePlacesService {
  Future<List<AutocompletePrediction>> getPredictions(String query);
  Future<GooglePlace?> getGooglePlace(String placeId);
}
