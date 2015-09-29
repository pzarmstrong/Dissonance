##==========##
## Settings ##
##==========##

SHELL = /bin/sh
CXX = g++

main = dissonance
srcdir = ./src
cxxflags ?= -g -W -Wall -Wextra -std=c++11
ldflags ?=
libs ?=
includes ?=
source := ${shell find ${srcdir} -regex ".*\.cpp$$"}
objects := ${source:.cpp=.o}
dependencies := ${source:.cpp=.d}

##===============##
## Build Targets ##
##===============##

.PHONY: all
all: ${main}
	@echo ===================================
	@echo Project has been built successfully
	@echo ===================================

#.PHONY: install
#install: ${main}

.PHONY: clean
clean:
	-@rm -f ${main}
	-@find -regex ".*\.[do]$$" -delete

.PHONY: linecount
linecount:
	-@find ${srcdir} ${test_srcdir} -regex ".*\.[hc]pp$$" -print0 | sort -z | xargs -0 wc -l

${main}: ${objects}
	${CXX} ${ld_flags} ${includes} -o ${main} ${objects} ${libs}

${srcdir}/%.o: ${srcdir}/%.cpp
	${CXX} -c ${cxxflags} ${includes} -MMD -o $@ $<

ifneq ($(MAKECMDGOALS),clean)
-include ${dependencies}
endif
