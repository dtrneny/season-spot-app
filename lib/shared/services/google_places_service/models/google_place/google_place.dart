import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:season_spot/shared/services/google_places_service/models/google_place_geometry/google_place_geometry.dart';

part 'google_place.freezed.dart';
part 'google_place.g.dart';

@freezed
class GooglePlace with _$GooglePlace {
  const GooglePlace._();

  const factory GooglePlace({
    @JsonKey(name: 'formatted_address') required String address,
    @JsonKey(name: 'place_id') required String placeId,
    required GooglePlaceGeometry geometry,
  }) = _GooglePlace;

  factory GooglePlace.fromJson(Map<String, dynamic> json) =>
      _$GooglePlaceFromJson(json);
}
