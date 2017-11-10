// Copyright 2017, Google Inc.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:math';

/// Creates an [amount] number of arrays, and uses methods in them.
///
/// For example, `1`, might generate:
/// ```dart
/// List runListOperations() {
///   var results = <dynamic>[];
///   var list = new List<String>();
///   list.add('abc123');
///   list.map((s) => s.toUppercase())..forEach(results.add);
///   results.add(list.join(','));
///   return results;
/// }
///
/// List runArrayOperations() {
///   var results = <dynamic>[];
///   var array = new JSArray<String>();
///   array.push('abc123');
///   array.map((s) => s.toUppercase())..forEach(results.add);
///   results.add(array.join(','));
///   return results;
/// }
/// ```
String generate(int amount, {int seed: 0}) {
  final random = new Random(seed);
  final classes = new StringBuffer();
  final body = new StringBuffer('return <dynamic>[\n');
  for (var i = 0; i < amount; i++) {
    classes..writeln('class Generic$i {}')..writeln('class Class$i<T> {}');
    body.writeln('new Class$i<Generic$i>(),');
  }
  body.writeln('];');
  return ''
      '// Copyright 2017, Google Inc.  Please see the AUTHORS file\n'
      '// for details. All rights reserved. Use of this source code is governed by a\n'
      '// BSD-style license that can be found in the LICENSE file.\n\n'
      'import \'package:dart_js_improvements/src/runtime/array.dart\';\n\n'
      '${_generateList(amount, random)}\n'
      '${_generateArray(amount, random)}\n';
}

String _generateList(int amount, Random random) {
  final output = new StringBuffer('List runListOperations() {\n');
  output.writeln('var results = <dynamic>[];');
  for (var i = 0; i < amount; i++) {
    output
      ..writeln('var list$i = new List<String>();')
      ..writeln('list$i.add(\'${_randomString(random)}\');')
      ..writeln('list$i.add(\'${_randomString(random)}\');')
      ..writeln('list$i.add(\'${_randomString(random)}\');')
      ..writeln('list$i.map((s) => s.toUpperCase()).forEach(results.add);')
      ..writeln('results.add(list$i.join(\',\'));');
  }
  output.writeln('return results;\n}');
  return output.toString();
}

String _generateArray(int amount, Random random) {
  final output = new StringBuffer('List runArrayOperations() {\n');
  output.writeln('var dartResults = eval(r"""(function(){');
  output.writeln('var results = [];');
  for (var i = 0; i < amount; i++) {
    output
      ..writeln('var a$i = [];')
      ..writeln('a$i.push(\'${_randomString(random)}\');')
      ..writeln('a$i.push(\'${_randomString(random)}\');')
      ..writeln('a$i.push(\'${_randomString(random)}\');')
      ..writeln(
          'a$i.map(function(s) { return s.toUpperCase(); }).forEach(function(s) { results.push(s); });')
      ..writeln('results.push(a$i.join(\',\'));');
  }
  output.writeln('return results;})();');
  output.writeln('""");\nreturn dartResults;\n}');
  return output.toString();
}

String _randomString(Random rng, [int length = 20]) {
  var codeUnits = new List.generate(length, (index) {
    return rng.nextInt(26) + 60;
  });
  return new String.fromCharCodes(codeUnits);
}
