# jni-test
Java native interface test code.

`LD_LIBRARY_PATH` must include the generated shared library.
```sh
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:.
```

`DYLD_LIBRARY_PATH` on OS X.
```sh
export DYLD_LIBRARY_PATH=${DYLD_LIBRARY_PATH}:.
```
