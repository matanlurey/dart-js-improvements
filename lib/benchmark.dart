// Copyright 2017, Google Inc.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@JS()
library dart_js_improvements;

import 'package:js/js.dart';

@JS('Process')
abstract class Process {
  external dynamic hrtime([List<num> previous]);
}

@JS('process')
external Process get process;

dynamic highResTime([List<num> previous]) {
  if (previous == null) {
    return process.hrtime();
  }
  final List<num> time = process.hrtime(previous);
  return time[0] * 1000000 + time[1] / 1000;
}

/// Run [callback] and return the time taken.
String runSyncTimed(void Function() callback) {
  final start = highResTime();
  callback();
  final num taken = highResTime(start);
  return '${(taken / 1000).toStringAsFixed(2)}ms';
}
