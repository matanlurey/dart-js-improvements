// Copyright 2017, Google Inc.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@JS()
library dart_js_improvements.benchmark.rtti.without_runtime_type;

import 'package:dart_js_improvements/benchmark.dart';
import 'package:dart_js_improvements/src/generated/classes.dart';
import 'package:js/js.dart';

/// We write to this to avoid tree-shaking removing everything.
external set $externalVar(dynamic externalVar);

void main() {
  print(runSyncTimed(() {
    $externalVar = instantiate();
  }));
}
