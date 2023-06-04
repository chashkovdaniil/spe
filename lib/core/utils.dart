import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

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

extension BuildContextX on BuildContext {
  bool get isPhone => MediaQuery.of(this).size.width < 900;
}
