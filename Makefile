AR?=ar
CXX?=g++
RM=rm -f
CP=cp -f
CPPFLAGS+=
CXXFLAGS+=-fPIC
LDFLAGS+=
LIBS+=

SRCS=$(wildcard src/*.cpp)
OBJS=$(SRCS:.cpp=.o)

LIBOBJS := $(filter-out src/debversion.o, $(OBJS))

ifeq ($(WASM),1)
	SRCS+=$(wildcard src/emscripten/*.cpp)
	OBJS=$(SRCS:.cpp=.o)
else
	LDFLAGS+=-shared
endif

all: libdebversion.a libdebversion.so debversion

libdebversion.a: $(LIBOBJS)
	$(AR) $(ARFLAGS) $@ $^

libdebversion.so: $(LIBOBJS)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $@ $^

libdebversion.js: $(LIBOBJS)
	$(CXX) --bind $(CXXFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)

debversion: $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

depend: .depend

.depend: $(SRCS)
	$(RM) ./.depend
	$(CXX) $(CPPFLAGS) -MM $^>>./.depend;

clean:
	$(RM) $(OBJS) src/emscripten/*.o debversion libdebversion.a libdebversion.so libdebversion.js libdebversion.wasm

distclean: clean
	$(RM) *~ .depend

wasm:
	./make_wasm.sh

wasm-build:
	./make_wasm.sh release
	$(CP) libdebversion.js npm/lib
	$(CP) libdebversion.wasm npm/lib

include .depend
