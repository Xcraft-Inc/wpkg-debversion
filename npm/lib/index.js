"use strict";

const libdebversion = require("./libdebversion.js");

module.exports = async () => {
  const deb = await libdebversion();
  let result = deb.string_debian_versions_compare("1", "2");
  console.log(result);
  result = deb.string_debian_versions_compare("2", "1");
  console.log(result);
  result = deb.string_debian_versions_compare("1", "1");
  console.log(result);
};

module.exports();
