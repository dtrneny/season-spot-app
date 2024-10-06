import 'dart:async';
import 'package:flutter/material.dart';

Function debounce(VoidCallback callback, Duration duration) {
  Timer? debounceTimer;

  return () {
    if (debounceTimer != null && debounceTimer!.isActive) {
      debounceTimer!.cancel();
    }
    debounceTimer = Timer(duration, callback);
  };
}
