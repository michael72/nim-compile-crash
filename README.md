# nim-compile-crash
*SOLVED* 
This is legal code now with the new compiler (using koch):
```nim
var x: seq[int] # was nil before - is newSeq[int] now
x.add(1)
```

Test repository to show nim compiler crashing on clean builds with travis-ci

When cloning this project and building with nim it seems to work fine.
But triggering a build in travis-ci fails with SIGSEGV.

See [build log](https://travis-ci.org/michael72/nim-compile-crash/builds/412241873)
[![Build Status](https://travis-ci.org/michael72/nim-compile-crash.svg?branch=master)](https://travis-ci.org/michael72/nim-compile-crash)

