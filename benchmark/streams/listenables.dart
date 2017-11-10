// Copyright 2017, Google Inc.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@JS()
library dart_js_improvements.benchmark.streams.zoned_listenables;

import 'dart:async';

import 'package:dart_js_improvements/src/generated/streams.dart' as streams;
import 'package:js/js.dart';

/// We write to this to avoid tree-shaking removing everything.
@JS()
external set $externalVar(dynamic externalVar);

void main() {
  // Avoid optimizations around root zone (no application usually w/o a zone).
  runZoned(() {
    streams.getListenables();
  }, onError: (_, __) {});
}
