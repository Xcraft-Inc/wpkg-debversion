# WPKG Debian versions comparer

See [npm/README.md](npm/README.md) for an example with Javascript.

## How to build

For native:

```
make
```

For WASM:

```
make wasm-build
```

## How to test

For native:

```
make tests
./tests
```

For WASM:

```
make wasm-tests
node tests
bun tests
```
