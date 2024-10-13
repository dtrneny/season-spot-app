import 'dart:async';
import 'package:flutter/material.dart';
import 'package:season_spot/config/locator.dart';
import 'package:season_spot/shared/toast/index.dart';
import 'package:season_spot/core/theming/index.dart';

class ToastWrapper extends StatefulWidget {
  final Widget child;

  const ToastWrapper({super.key, required this.child});

  @override
  State<ToastWrapper> createState() => _ToastWrapperState();
}

class _ToastWrapperState extends State<ToastWrapper> {
  late final StreamSubscription<ToastMessage> _subscription;
  final _toastController = getIt.get<ToastController>();

  @override
  void initState() {
    super.initState();

    _subscription = _toastController.snackBarStream.listen((toast) {
      if (!mounted) return;
      final snackBar = _getSnackBar(toast);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  (Color, Color) _getColorsBasedOnToastType(ToastType type) {
    return switch (type) {
      ToastType.info => (context.theme.base.info600, Colors.white),
      ToastType.warning => (context.theme.base.warning600, Colors.white),
      ToastType.error => (context.theme.base.error600, Colors.white),
      ToastType.success => (context.theme.base.success600, Colors.white),
      ToastType.secondary => (
          context.theme.base.neutral250,
          context.theme.base.secondaryColor
        ),
    };
  }

  SnackBar _getSnackBar(ToastMessage toast) {
    final colors = _getColorsBasedOnToastType(toast.type);

    return SnackBar(
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRounding.base),
          color: colors.$1,
        ),
        child: Text(toast.message, style: TextStyle(color: colors.$2)),
      ),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.up,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 175,
        left: 10,
        right: 10,
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
