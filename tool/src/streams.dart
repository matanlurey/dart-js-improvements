// Copyright 2017, Google Inc.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Creates a number of streams/stream controllers [times].
///
/// For example, `1`, might generate:
/// ```dart
/// import 'dart:async';
///
/// final stream1 = new StreamController().stream..listen((_) {});
/// final zoned1 = new ZonedListenable()..listen((_){});
/// final listenable1 = new Listenable()..listen((_){});
/// ```
String generate(int times) {
  return ''
      '// Copyright 2017, Google Inc.  Please see the AUTHORS file\n'
      '// for details. All rights reserved. Use of this source code is governed by a\n'
      '// BSD-style license that can be found in the LICENSE file.\n\n'
      'import \'dart:async\';\n'
      'import \'package:dart_js_improvements/src/runtime/listenable.dart\';\n'
      '${_generateStreams(times)}\n'
      '${_generateZoned(times)}\n'
      '${_generateListen(times)}\n';
}

String _generateStreams(int times) {
  final output = new StringBuffer('List getStreams() { return [');
  for (var i = 0; i < times; i++) {
    output.writeln('new StreamController.broadcast().stream..listen((_){}),');
  }
  output.writeln(']; }');
  return output.toString();
}

String _generateZoned(int times) {
  final output = new StringBuffer('List getZoned() { return [');
  for (var i = 0; i < times; i++) {
    output.writeln('new ZonedListenable()..listen((_){}),');
  }
  output.writeln(']; }');
  return output.toString();
}

String _generateListen(int times) {
  final output = new StringBuffer('List getListenables() { return [');
  for (var i = 0; i < times; i++) {
    output.writeln('new Listenable()..listen((_){}),');
  }
  output.writeln(']; }');
  return output.toString();
}
