import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:season_spot/shared/services/google_places_service/models/google_place_location/google_place_location.dart';

part 'google_place_geometry.freezed.dart';
part 'google_place_geometry.g.dart';

@freezed
class GooglePlaceGeometry with _$GooglePlaceGeometry {
  const GooglePlaceGeometry._();

  const factory GooglePlaceGeometry({
    required GooglePlaceLocation location,
  }) = _GooglePlaceGeometry;

  factory GooglePlaceGeometry.fromJson(Map<String, dynamic> json) =>
      _$GooglePlaceGeometryFromJson(json);
}
