main = demo
srcdir = .
cxxflags ?= -g -W -Wall -Wextra -std=c++11
ldflags ?=
libs ?= -L ../ -l dissonance
includes ?= -I ../include
sources := $(shell find $(srcdir) -regex ".*\.cpp$$")
objects := $(sources:.cpp=.o)
dependencies := $(sources:.cpp=.d)

.PHONY: all
all: $(main)

.PHONY: clean
clean:
	-@rm -f $(main)
	-@find -name '*.o' -delete
	-@find -name '*.d' -delete

$(main): $(objects)
	$(CXX) $(ld_flags) $(includes) -o $(main) $(objects) $(libs)

$(srcdir)/%.o: $(srcdir)/%.cpp
	$(CXX) -c -MMD $(cxxflags) $(includes) $< -o $@

ifneq ($(MAKECMDGOALS),clean)
-include $(dependencies)
endif
