main = ../libdissonance.a
srcdir = .
cxxflags ?= -g -W -Wall -Wextra -std=c++11
includes ?= -I ../include
sources := $(shell find $(srcdir) -name '*.cpp')
objects := $(sources:.cpp=.o)
dependencies := $(sources:.cpp=.d)

.PHONY: all
all: $(main)

.PHONY: clean
clean:
	-@$(RM) $(main)
	-@find -name '*.o' -delete
	-@find -name '*.d' -delete

$(main): $(objects)
	$(AR) rcs $@ $<

$(srcdir)/%.o: $(srcdir)/%.cpp
	$(CXX) -c -MMD $(cxxflags) $(includes) $< -o $@

ifneq ($(MAKECMDGOALS),clean)
-include $(dependencies)
endif
