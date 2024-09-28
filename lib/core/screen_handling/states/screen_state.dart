import 'package:season_spot/core/screen_handling/screen_state_type.dart';

abstract class ScreenState {
  final ScreenStateType type;

  ScreenState(this.type);
}
