// Copyright 2017, Google Inc.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io';

import 'package:dart_style/dart_style.dart';

import 'src/classes.dart' as classes;

/// Generates example programs to demonstrate costs in Dart2JS.
void main() {
  const size = 1000; // TODO: Make customizable.
  new File('lib/src/generated/classes.dart').writeAsStringSync(
    _dartfmt.format(classes.generate(size)),
  );
}

final _dartfmt = new DartFormatter();
