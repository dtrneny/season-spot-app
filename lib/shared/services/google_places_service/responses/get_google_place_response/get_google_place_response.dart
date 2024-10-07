import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:season_spot/shared/services/google_places_service/models/google_place/google_place.dart';

part 'get_google_place_response.freezed.dart';
part 'get_google_place_response.g.dart';

@freezed
class GetGooglePlaceResponse with _$GetGooglePlaceResponse {
  const GetGooglePlaceResponse._();
  const factory GetGooglePlaceResponse({
    required GooglePlace result,
  }) = _GetGooglePlaceResponse;

  factory GetGooglePlaceResponse.fromJson(Map<String, dynamic> json) =>
      _$GetGooglePlaceResponseFromJson(json);
}
