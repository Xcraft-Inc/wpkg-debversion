#include <emscripten.h>
#include <emscripten/bind.h>
#include <stdio.h>

#include "debian_version.h"

using namespace emscripten;

int string_debian_versions_compare(const std::string &left, const std::string &right)
{
    char error_string[256];
    debian_version_handle_t l(string_to_debian_version(left.c_str(), error_string, sizeof(error_string)));
    debian_version_handle_t r(string_to_debian_version(right.c_str(), error_string, sizeof(error_string)));
    int result =  debian_versions_compare(l, r);
    delete_debian_version(l);
    delete_debian_version(r);
    return result;
}

EMSCRIPTEN_BINDINGS(my_module) {
   function("string_debian_versions_compare", &string_debian_versions_compare);
}
