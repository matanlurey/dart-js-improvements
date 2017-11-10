// Copyright 2017, Google Inc.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@JS()
library dart_js_improvements.benchmark.json.js_json;

import 'package:dart_js_improvements/src/runtime/json.dart' as json;
import 'package:js/js.dart';

/// We write to this to avoid tree-shaking removing everything.
@JS()
external set $externalVar(dynamic externalVar);

void main() {
  // Use the Node API for loading string files.
  final json.FS fs = json.require('fs');
  final jsonText = fs.readFileSync('lib/benchmark.json', 'utf8');

  // Decode using JavaScript.
  final result = json.JSON.parse(jsonText);
  $externalVar = json.JSON.stringify(result);
}
