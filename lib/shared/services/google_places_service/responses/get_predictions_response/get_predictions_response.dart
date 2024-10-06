import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:season_spot/shared/services/google_places_service/models/autocomplete_prediction/autocomplete_prediction.dart';

part 'get_predictions_response.freezed.dart';
part 'get_predictions_response.g.dart';

@freezed
class GetPredictionsResponse with _$GetPredictionsResponse {
  const GetPredictionsResponse._();

  const factory GetPredictionsResponse({
    required List<AutocompletePrediction> predictions,
  }) = _GetPredictionsResponse;

  factory GetPredictionsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPredictionsResponseFromJson(json);
}
