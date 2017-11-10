// Copyright 2017, Google Inc.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Creates an [amount] number of `class`es that use generic types.
///
/// For example, `1`, might generate:
/// ```dart
/// class Generic1 {}
/// class Class1<T> {}
///
/// List instantiate() {
///   var i1 = new Class1<Generic1>();
///   return [i1];
/// }
/// ```
String generate(int amount) {
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
      '$classes\n'
      'List instantiate() {\n'
      '$body'
      '}';
}
