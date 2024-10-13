import 'package:season_spot/core/helpers/index.dart';
import 'package:season_spot/core/screen_handling/screen_state_type.dart';
import 'package:season_spot/core/screen_handling/states/screen_state.dart';

class LoadingState extends ScreenState {
  final PresentationType presentationType;

  LoadingState(this.presentationType) : super(ScreenStateType.loading);
}
