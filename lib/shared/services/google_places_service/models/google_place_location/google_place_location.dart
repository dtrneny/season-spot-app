import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_place_location.freezed.dart';
part 'google_place_location.g.dart';

@freezed
class GooglePlaceLocation with _$GooglePlaceLocation {
  const GooglePlaceLocation._();

  const factory GooglePlaceLocation({
    required double lat,
    required double lng,
  }) = _GooglePlaceLocation;

  factory GooglePlaceLocation.fromJson(Map<String, dynamic> json) =>
      _$GooglePlaceLocationFromJson(json);
}
