// Copyright 2017, Google Inc.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@JS()
library dart_js_improvements.benchmark.collections.dart_object;

import 'package:dart_js_improvements/src/generated/arrays.dart' as arrays;
import 'package:dart_js_improvements/src/runtime/object.dart';
import 'package:js/js.dart';

/// We write to this to avoid tree-shaking removing everything.
@JS()
external set $externalVar(dynamic externalVar);

void main() {
  final results = <dynamic>[];
  for (final item in arrays.runListOperations()) {
    final object = JSObject.create(null);
    jsSet(object, item, item);
    results.add(object);
  }
  $externalVar = results;
}
