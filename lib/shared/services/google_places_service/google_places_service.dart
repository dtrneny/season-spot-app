import 'package:season_spot/shared/services/google_places_service/models/autocomplete_prediction/autocomplete_prediction.dart';

abstract class GooglePlacesService {
  Future<List<AutocompletePrediction>> getPredictions(String query);
}
