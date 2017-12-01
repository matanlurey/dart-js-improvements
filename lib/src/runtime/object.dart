// Copyright 2017, Google Inc.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@JS()
library dart_js_improvements.src.runtime.object;

import 'package:js/js.dart';
import 'package:js/js_util.dart' as js;

@JS('Object')
@anonymous
abstract class JSObject {
  external static JSObject create([dynamic arg]);
}

T jsGet<T>(JSObject o, String name) => js.getProperty(o, name);

void jsSet(JSObject o, String name, dynamic value) {
  js.setProperty(o, name, value);
}
