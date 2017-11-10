// Copyright 2017, Google Inc.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io';

import 'package:dart_style/dart_style.dart';

import 'src/classes.dart' as classes;
import 'src/enums.dart' as enums;
import 'src/streams.dart' as streams;

/// Generates example programs to demonstrate costs in Dart2JS.
void main() {
  const size = 1000; // TODO: Make customizable.
  new File('lib/src/generated/classes.dart').writeAsStringSync(
    dartfmt(classes.generate(size)),
  );
  new File('lib/src/generated/enums.dart').writeAsStringSync(
    dartfmt(enums.generate(size)),
  );
  new File('lib/src/generated/streams.dart').writeAsStringSync(
    dartfmt(streams.generate(size)),
  );
}

String dartfmt(String source) {
  try {
    return _dartfmt.format(source);
  } catch (e) {
    stderr.writeln(e);
    return source;
  }
}

final _dartfmt = new DartFormatter();
