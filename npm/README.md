# WPKG Debian versions comparer

Example:

```js
"use strict";

const path = require("node:path");
const debversion = require("wpkg-debversion");

const main = async () => {
  const compare = await debversion();
  const result = compare("1.0.0", "2.0.0");
  console.log(result);
};

main();
```
