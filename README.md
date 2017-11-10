# dart-js-improvements

This package helps benchmark and identify areas for improvement in Dart2JS.

Specifically, we are tracking:

* Code size of the final `.dart.js` binary.
* Cold (non-JITd) startup cost of running `.dart.js` (affecting TTI).

## Results

The following was run as an _example_ only on the following machine:

* MacBook Pro 15-Inch 2016
* 2.9 GHz Intel Core i7
* 16 GB 2133 MHz LPDDR3

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

* Size: 406kB
* Mean: 17.96ms
* Median: 17.66ms

#### without_runtime_type.dart.js

* Size: 188kB
* Mean: 6.80ms
* Median: 6.58ms

