# WPKG Debian versions comparer

There is only one function that returns -1 when the left version is lower, 0
when both versions are the same and 1 when the left version is greater.

Example:

```js
"use strict";

const path = require("node:path");
const debversion = require("wpkg-debversion");

const main = async () => {
  const result = await debversion("1.0.0", "2.0.0");
  console.log(result); // -1
};

main();
```
