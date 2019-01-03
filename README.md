# Swank Client for Smalltalk [![Build Status][travis_b]][travis_url]

Allows to communicate with the Swank backend of the "Superior Lisp Interaction
Mode for Emacs", or short [SLIME](https://github.com/slime/slime). 
This way Smalltalk can interact with e.g. a running [Common Lisp](https://en.wikipedia.org/wiki/Common_Lisp) instance.

## Requires

* [Pharo](http://pharo.org/) 7.0,6.1

## Installing

To install the latest version execute the following:

```Smalltalk
Metacello new
  baseline: 'SwankClient';
  repository: 'github://charcodelimit/swankclient-smalltalk/repository';
  load.
```

## How to use

```Smalltalk
| connection promise |
connection := SwankConnection openOnHostNamed: 'localhost' port: 4005.
promise := connection send: (SlimeLispFunctionCommand function: #+ arguments: {2. 3}).
Transcript show: 'Result: ', promise wait asString.
connection close.
```

The above code evaluates the expression `(+ 2 3)` and returns a promise that
eventually returns the value `5`.

Please be aware of the discussion regarding SLIME security
[here](https://github.com/slime/slime/issues/286).

Therefore, it is possible to connect to a Swank server using a Unix domain socket
like follows:

```Smalltalk
| connection promise |
connection := SwankConnection openOnSocketPath: '/tmp/swank-socket'.
promise := connection send: (SlimeLispFunctionCommand function: #+ arguments: {2. 3}).
Transcript show: 'Result: ', promise wait asString.
connection close.
```

## License

Swank Client for Smalltalk is licensed under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0).


[travis_b]: https://travis-ci.org/charcodelimit/swankclient-smalltalk.svg?branch=master
[travis_url]: https://travis-ci.org/charcodelimit/swankclient-smalltalk
