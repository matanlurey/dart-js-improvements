// Copyright 2017, Google Inc.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Copied from
// https://github.com/dart-lang/protobuf/blob/master/lib/src/protobuf/protobuf_enum.dart.

class ProtobufEnum {
  /// This enum's integer value, as specified in the .proto file.
  final int value;

  /// This enum's name, as specified in the .proto file.
  final String name;

  /// Returns a new constant ProtobufEnum using [value] and [name].
  const ProtobufEnum(this.value, this.name);

  /// Returns a Map for all of the [ProtobufEnum]s in [byIndex], mapping each
  /// [ProtobufEnum]'s [value] to the [ProtobufEnum].

  // Cannot type return type as Map<int, ProtobufEnum> as it will be
  // assigned to Map<int, subtype of ProtobufEnum>.
  static Map<int, dynamic> initByValue(List<ProtobufEnum> byIndex) {
    var byValue = new Map<int, dynamic>();
    for (ProtobufEnum v in byIndex) {
      byValue[v.value] = v;
    }
    return byValue;
  }

  int get hashCode => value;

  /// Returns this enum's [name].
  String toString() => name;
}
