import 'package:freezed_annotation/freezed_annotation.dart';

part 'autocomplete_prediction.freezed.dart';
part 'autocomplete_prediction.g.dart';

@freezed
class AutocompletePrediction with _$AutocompletePrediction {
  const AutocompletePrediction._();

  const factory AutocompletePrediction({
    required String description,
    @JsonKey(name: 'place_id') required String placeId,
  }) = _AutocompletePrediction;

  factory AutocompletePrediction.fromJson(Map<String, dynamic> json) =>
      _$AutocompletePredictionFromJson(json);
}
