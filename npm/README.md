# Epsitec Database (EDB)

Example in order to read a whole database:

```js
"use strict";

const path = require("path");
const libedb = require("epsitec-database");

const main = async () => {
  const edb = await libedb();
  const db = edb.open("/home/user/my_database.edb");
  try {
    console.log("\n◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤ FIELDS ◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢\n");
    for (const field of db.getFields()) {
      console.dir(field);
    }

    console.log("\n◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤ RECORDS ◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢\n");
    for (const record of db.getRecords()) {
      console.dir(record);
    }
  } finally {
    edb.close(db);
  }
};

main();
```
