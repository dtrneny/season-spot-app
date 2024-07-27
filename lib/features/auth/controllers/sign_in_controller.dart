
import 'package:rxdart/subjects.dart';

class SignInController {
  final _counterStreamController = BehaviorSubject<int>.seeded(0);

  Stream<int> get counterStream => _counterStreamController.stream;

  void addToCounter(int addition) {
    final newValue = _counterStreamController.value + addition;
    _counterStreamController.add(newValue);
  }
}
