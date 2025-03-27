AR?=ar
CXX?=g++
RM=rm -f
CP=cp -f
CPPFLAGS+=
CXXFLAGS+=-fPIC
LDFLAGS+=
LIBS+=

SRCS=$(wildcard src/*.cpp src/tests/*.cpp)
OBJS=$(SRCS:.cpp=.o)

ifeq ($(WASM),1)
	SRCS+=$(wildcard src/emscripten/*.cpp)
	LIBOBJS=$(SRCS:.cpp=.o)
else
	LDFLAGS+=-shared
endif

TESTOBJS := $(filter-out src/debversion.o, $(OBJS))
OBJS := $(filter-out src/tests/unittest_version.o, $(OBJS))
LIBOBJS := $(filter-out src/debversion.o, $(OBJS))

all: libdebversion.a libdebversion.so debversion

libdebversion.a: $(LIBOBJS)
	$(AR) $(ARFLAGS) $@ $^

libdebversion.so: $(LIBOBJS)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $@ $^

libdebversion.js: $(LIBOBJS)
	$(CXX) --bind $(CXXFLAGS) $(LDFLAGS) -o $@ $^

debversion: $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

tests: $(TESTOBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

depend: .depend

.depend: $(SRCS)
	$(RM) ./.depend
	$(CXX) $(CPPFLAGS) -MM $^>>./.depend;

clean:
	$(RM) $(OBJS) src/emscripten/*.o src/tests/*.o tests tests.wasm debversion libdebversion.a libdebversion.so libdebversion.js libdebversion.wasm

distclean: clean
	$(RM) *~ .depend

wasm:
	./make_wasm.sh

wasm-build:
	./make_wasm.sh release
	$(CP) libdebversion.js npm/lib
	$(CP) libdebversion.wasm npm/lib

wasm-tests:
	CPPFLAGS="-Isrc" LDFLAGS="-sSTANDALONE_WASM" emmake make tests

include .depend
