"use strict";

let libdebversion;

module.exports = async (left, right) => {
  if (!libdebversion) {
    libdebversion = await require("./libdebversion.js")();
  }
  return libdebversion.string_debian_versions_compare(left, right);
};
