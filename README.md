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

### RTTI

We run benchmarks instantiating 1000 classes that _may_ store RTTI.

#### with_runtime_type.dart.js

* Size: 161kB
* Mean: 203.25ms
* Median: 199ms

#### without_runtime_type.dart.js

* Size: 74.9kB
* Mean: 132.75ms
* Median: 133ms

### Enums

We run benchmarks instantiating 1000 enums with 5 fields each.

### class_enums.dart.js

* Size: 231kB
* Mean: 154.4ms
* Median: 153ms

### int_enums.dart.js

* Size: 40kB
* Mean: 72.95ms
* Median: 73ms

### lang_enums.dart.js

* Size: 320kB
* Mean: 161.9ms
* Median: 161ms
