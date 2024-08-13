
import 'package:rxdart/subjects.dart';
import 'package:season_spot/common/toast/toast_message.dart';
import 'package:season_spot/common/toast/toast_type_enum.dart';

class ToastController {
  final _snackBarStreamController = BehaviorSubject<ToastMessage>();

  Stream<ToastMessage> get snackBarStream => _snackBarStreamController.stream;

  void showToast(String message, { ToastType type = ToastType.secondary }) {
    _snackBarStreamController.sink.add(
      ToastMessage(message: message, type: type),
    );
  }

  void dispose() {
    _snackBarStreamController.close();
  }
}