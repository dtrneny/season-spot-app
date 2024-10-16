import 'package:rxdart/rxdart.dart';
import 'package:season_spot/core/error_handling/index.dart';
import 'package:season_spot/core/helpers/presentation_type.dart';
import 'package:season_spot/core/screen_handling/index.dart';

class ScreenController {
  final Map<String, LoadingState> _loadingPool = {};

  final BehaviorSubject<ScreenState> _stateSubject =
      BehaviorSubject<ScreenState>.seeded(IdleState());

  Stream<ScreenState> get stateStream => _stateSubject.stream;

  ScreenState get currentState => _stateSubject.value;

  void startLoading(String key, PresentationType presentation) {
    _loadingPool[key] = LoadingState(presentation);
    _emitOverallState();
  }

  void stopLoading(String key) {
    _loadingPool.remove(key);
    _emitOverallState();
  }

  void _emitOverallState() {
    if (_loadingPool.isNotEmpty) {
      final isOverlay = _loadingPool.values
          .any((state) => state.presentationType == PresentationType.overlay);
      final loadingType =
          isOverlay ? PresentationType.overlay : PresentationType.ui;
      _stateSubject.add(LoadingState(loadingType));
    } else {
      _stateSubject.add(IdleState());
    }
  }

  void emitError(AppError error) {
    _stateSubject.add(ErrorState(error));
  }

  void clearState() {
    _stateSubject.add(IdleState());
    _loadingPool.clear();
  }

  bool loadingByKey(String key) {
    return _loadingPool.containsKey(key);
  }

  bool isLoading({PresentationType? type}) {
    return type != null
        ? _loadingPool.values.any((state) => state.presentationType == type)
        : _loadingPool.isNotEmpty;
  }

  void dispose() {
    _stateSubject.close();
  }
}
