import 'package:season_spot/core/error_handling/index.dart';
import 'package:season_spot/core/screen_handling/screen_state_type.dart';
import 'package:season_spot/core/screen_handling/states/screen_state.dart';

class ErrorState extends ScreenState {
  final AppError error;

  ErrorState(this.error) : super(ScreenStateType.error);
}
