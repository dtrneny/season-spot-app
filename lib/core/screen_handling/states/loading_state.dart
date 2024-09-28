import 'package:season_spot/core/screen_handling/loading_type.dart';
import 'package:season_spot/core/screen_handling/screen_state_type.dart';
import 'package:season_spot/core/screen_handling/states/screen_state.dart';

class LoadingState extends ScreenState {
  final LoadingType loadingType;

  LoadingState(this.loadingType) : super(ScreenStateType.loading);
}
