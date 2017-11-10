// Copyright 2017, Google Inc.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@JS()
library dart_js_improvements.src.runtime.array;

import 'package:js/js.dart';

@JS()
external dynamic require(String lib);

@JS()
abstract class FS {
  external String readFileSync(String path, String encoding);
}

@JS()
abstract class JSON {
  external static String stringify(String json);
  external static dynamic parse(String json);
}
