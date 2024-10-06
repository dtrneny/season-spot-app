import 'package:flutter_config/flutter_config.dart';
import 'package:season_spot/core/api_client/api_client.dart';
import 'package:season_spot/core/api_client/api_client_impl.dart';
import 'package:season_spot/shared/services/google_places_service/models/autocomplete_prediction/autocomplete_prediction.dart';
import 'package:season_spot/shared/services/google_places_service/google_places_service.dart';
import 'package:season_spot/shared/services/google_places_service/responses/get_predictions_response/get_predictions_response.dart';

class GooglePlacesServiceImpl implements GooglePlacesService {
  final ApiClient<GetPredictionsResponse> _apiClient =
      ApiClientImpl(GetPredictionsResponse.fromJson);

  final _googleMapsApiKey = FlutterConfig.get('GOOGLE_MAPS_API_KEY');

  @override
  Future<List<AutocompletePrediction>> getPredictions(String query) async {
    final uri = Uri.https(
      'maps.googleapis.com',
      'maps/api/place/autocomplete/json',
      {
        'input': query,
        'key': _googleMapsApiKey,
      },
    );

    final result = await _apiClient.get(uri);

    return result != null ? result.predictions : [];
  }
}
