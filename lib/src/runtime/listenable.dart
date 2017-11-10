// Copyright 2017, Google Inc.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

typedef void Callback<T>(T event);

/// Represents a base-line for lightweight event listening.
class Listenable<T> {
  final _callbacks = <Callback>[];

  void listen(Callback callback) => _callbacks.add(callback);
}

/// Represents base-line w/ Zone support for event listening.
class ZonedListenable<T> {
  final _callbacks = <Callback>[];

  void listen(Callback callback) {
    _callbacks.add(Zone.current.bindUnaryCallback(callback));
  }
}
