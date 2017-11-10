// Copyright 2017, Google Inc.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io';

import 'package:glob/glob.dart';
import 'package:node_preamble/preamble.dart';

/// Patches all emitted `.dart.js` files to make runnable on NodeJS.
void main() {
  final preamble = getPreamble();
  final exclude = new Glob('build/**/packages/**.dart.js');
  for (final File file in new Glob('build/**.dart.js').listSync()) {
    if (exclude.matches(file.path)) {
      continue;
    }
    final contents = file.readAsStringSync();
    if (!contents.startsWith('\nvar self = Object.create(global);')) {
      file.writeAsStringSync('$preamble$contents');
    }
  }
}
