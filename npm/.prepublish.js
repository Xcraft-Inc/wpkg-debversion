"use strict";

const fs = require("node:fs");
const path = require("node:path");

if (!fs.existsSync(path.join(__dirname, "lib/libdebversion.js"))) {
  console.error("◤◢◤ Missing lib/libdebversion.js file ◢◤◢\n");
  process.exit(1);
}
if (!fs.existsSync(path.join(__dirname, "lib/libdebversion.wasm"))) {
  console.error("◤◢◤ Missing lib/libdebversion.wasm file ◢◤◢\n");
  process.exit(1);
}
