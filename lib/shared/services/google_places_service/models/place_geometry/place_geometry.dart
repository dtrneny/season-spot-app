import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:season_spot/shared/services/google_places_service/models/google_place_location/google_place_location.dart';

part 'place_geometry.freezed.dart';
part 'place_geometry.g.dart';

@freezed
class PlaceGeometry with _$PlaceGeometry {
  const PlaceGeometry._();

  const factory PlaceGeometry({
    required GooglePlaceLocation location,
  }) = _PlaceGeometry;

  factory PlaceGeometry.fromJson(Map<String, dynamic> json) =>
      _$PlaceGeometryFromJson(json);
}
