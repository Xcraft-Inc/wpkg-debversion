"use strict";

let libdebversion;

module.exports = async (left, right) => {
  if (!libdebversion) {
    libdebversion = await require("./libdebversion.js")();
  }
  return libdebversion.string_debian_versions_compare(left, right);
};

module.exports.init = async () => await require("./libdebversion.js")();

module.exports.sync = (left, right) => {
  if (!libdebversion) {
    throw new Error("Missing call init");
  }
  return libdebversion.string_debian_versions_compare(left, right);
};
