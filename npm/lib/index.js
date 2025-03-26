"use strict";

const libdebversion = require("./libdebversion.js");

module.exports = async (left, right) => {
  const deb = await libdebversion();
  return deb.string_debian_versions_compare(left, right);
};
