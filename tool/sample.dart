// Copyright 2017, Google Inc.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io';

import 'package:glob/glob.dart';

/// Runs all benchmarks a number of times and returns sample results.
void main() {
  const times = 20;
  final exclude = new Glob('build/**/packages/**.dart.js');
  for (final File file in new Glob('build/**.dart.js').listSync()) {
    if (exclude.matches(file.path)) {
      continue;
    }
    final path = file.path;
    print('Sampling $path $times times...');
    final results = _sample(path, times).toList()..sort();
    print('Ran $path $times times. Results :');
    final mean = results.fold(0, (t, n) => t + n) / results.length;
    final median = results[results.length ~/ 2];
    print('  * Mean:   ${mean}ms');
    print('  * Median: ${median}ms');
  }
}

/// Executes [file] with `node <file>` a number of [times].
List<num> _sample(String file, int times) {
  final results = new List<num>(times);
  for (var i = 0; i < times; i++) {
    final stopwatch = new Stopwatch()..start();
    final result = Process.runSync('node', [file]);
    if (result.stderr != '') {
      throw result.stderr;
    }
    stopwatch.stop();
    results[i] = stopwatch.elapsedMilliseconds;
  }
  return results;
}
