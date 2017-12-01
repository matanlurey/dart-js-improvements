# dart-js-improvements

This package helps benchmark and identify areas for improvement in Dart2JS.

Specifically, we are tracking:

* Code size of the final `.dart.js` binary.
* Cold (non-JITd) startup cost of running `.dart.js` (affecting TTI).
  * Not including impact to download speed on low-end devices/networks.

## Results

The following was run as an _example_ only on the following machine:

* MacBook Pro 15-Inch 2016
* 2.9 GHz Intel Core i7
* 16 GB 2133 MHz LPDDR3

With the following tools:

* Dart VM/SDK `2.0.0-dev.6.0`
* NodeJS `v8.9.0`

None of the benchmarks instrument threading (single-threaded nodeJS).

To run the benchmarks yourself:

```bash
$ git clone https://github.com/matanlurey/dart-js-improvements.git
$ pub build benchmark 
```

And then for the code-size, run:

```bash
$ pub run jsbench
```

And for runtime speed, run:

```bash
$ dart tool/patch.dart
$ dart tool/sample.dart
```

The following used a sample-size of _100_.

### RTTI

We run benchmarks instantiating 1000 classes that _may_ store RTTI.

#### with_runtime_type.dart.js

* Size: 162kB
* Mean: 203.25ms
* Median: 199ms

#### without_runtime_type.dart.js

* Size: 49.2kB
* Mean: 132.75ms
* Median: 133ms

### Enums

We run benchmarks instantiating 1000 enums with 5 fields each.

### class_enums.dart.js

* Size: 205kB
* Mean: 134.39ms
* Median: 132ms

### int_enums.dart.js

* Size: 10.3kB
* Mean: 61.97ms
* Median: 61ms

### lang_enums.dart.js

* Size: 264kB
* Mean: 132.09ms
* Median: 131ms

### Streams

We run benchmarks creating 1000 stream-likes and listening to them.

### listenables.dart.js

* Size: 160kB
* Mean: 129.49ms
* Median: 129ms

### zoned_listenables.dart.js

* Size: 167kB
* Mean: 131.4ms
* Median: 131ms

### sdk_streams.dart.js

* Size: 204kB
* Mean: 139.23ms
* Median: 138ms

### Collections

We create 1000 lists or arrays, add items, use some common methods.

**NOTE**: Code-size is not included here, since the JS code is not minified.

### dart_array.dart.js

* Mean: 145.86ms
* Median: 121ms

### js_array.dart.js

_Using `eval()`, which has overhead on top of plain JavaScript._

* Mean: 122.94ms
* Median: 121ms

### dart_object.dart.js

* Mean: 160.8ms
* Median: 152ms

### js_object.dart.js

* Mean: 148.58ms
* Median: 147ms

### JSON

Decodes+encodes an almost 13mb representative JSON data set.

**NOTE**: Code-size is not included here as it is not significantly different.

### dart_json.dart.js

* Mean: 957.56ms
* Median: 948ms

### js_json.dart.js

* Mean: 301.96ms
* Median: 297ms
