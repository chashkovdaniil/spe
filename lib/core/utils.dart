import 'dart:async';

import 'package:flutter/cupertino.dart';

mixin InitialDisposableMixin {
  final _subs = <StreamSubscription<Object?>>[];
  bool get isInited => _isInited;

  bool _isInited = false;

  @mustCallSuper
  Future<void> init() async {
    _isInited = true;
  }

  @mustCallSuper
  Future<void> dispose() async {
    for (final sub in _subs) {
      await sub.cancel();
    }
  }

  void addSubscription(StreamSubscription<Object?> sub) => _subs.add(sub);
}
