// Copyright 2017, Google Inc.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Creates an [amount] number of enums of three different types:
///
/// * `class` - Uses a `class` to represent an `enum`.
/// * `lang` - Uses the built-in `enum` construct.
/// * `int` - Uses a plain int to represent an enum.
///
/// Code generated looks like this for [amount] = `1` [values] = `2`:
/// ```dart
/// class ClassEnum0 extends ProtobufEnum {
///   static const value0 = const ClassEnum0._(0);
///   static const value1 = const ClassEnum0._(1);
///   static const values = const [value0, value1];
///
///   const ClassEnum0._(int value, String name) : super(value, name);
/// }
///
/// class IntEnum0 {
///   static const value0 = 0;
///   static const value1 = 1;
///   static const values = const [value0, value1];
/// }
///
/// enum LangEnum0 {
///   value0,
///   value1,
/// }
/// ```
///
/// A `getAllEnumTypes()` getter is also exposed to be used in the program.
String generate(int amount, [int values = 5]) {
  return ''
      '// Copyright 2017, Google Inc.  Please see the AUTHORS file\n'
      '// for details. All rights reserved. Use of this source code is governed by a\n'
      '// BSD-style license that can be found in the LICENSE file.\n\n'
      'import \'package:dart_js_improvements/src/runtime/pbenum.dart\';\n'
      '${_generateClass(amount, values)}\n'
      '${_generateInt(amount, values)}\n'
      '${_generateLang(amount, values)}\n';
}

String _generateClass(int amount, int values) {
  final output = new StringBuffer();
  final getAll = new StringBuffer('List getAllClassEnumTypes() { return [');
  for (var a = 0; a < amount; a++) {
    final listAll = new StringBuffer('static const values = const [');
    output.writeln('class ClassEnum$a extends ProtobufEnum {');
    for (var v = 0; v < values; v++) {
      output.writeln(
          '  static const value$v = const ClassEnum$a._($v, \'value$v\');');
      listAll.write('value$v, ');
    }
    listAll.writeln('];');
    output
      ..writeln('$listAll')
      ..writeln('\n')
      ..writeln(
          'const ClassEnum$a._(int value, String name) : super(value, name);')
      ..writeln('}');
    getAll.writeln('ClassEnum$a.values,');
  }
  getAll.writeln(' ]; }');
  output.writeln('$getAll');
  return output.toString();
}

String _generateInt(int amount, int values) {
  final output = new StringBuffer();
  final getAll = new StringBuffer('List getAllIntEnumTypes() { return [');
  for (var a = 0; a < amount; a++) {
    final listAll = new StringBuffer('static const values = const [');
    output.writeln('class IntEnum$a {');
    for (var v = 0; v < values; v++) {
      output.writeln('  static const value$v = $v;');
      listAll.write('value$v, ');
    }
    listAll.writeln('];');
    output..writeln('$listAll')..writeln('\n')..writeln('}');
    getAll.writeln('IntEnum$a.values,');
  }
  getAll.writeln(' ]; }');
  output.writeln('$getAll');
  return output.toString();
}

String _generateLang(int amount, int values) {
  final output = new StringBuffer();
  final getAll = new StringBuffer('List getAllLangEnumTypes() { return [');
  for (var a = 0; a < amount; a++) {
    output.writeln('enum LangEnum$a {');
    for (var v = 0; v < values; v++) {
      output.writeln('value$v, ');
    }
    output..writeln('\n')..writeln('}');
    getAll.writeln('LangEnum$a.values,');
  }
  getAll.writeln(' ]; }');
  output.writeln('$getAll');
  return output.toString();
}
