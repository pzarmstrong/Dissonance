SHELL = /bin/sh
AR = ar
CXX = g++
ECHO = echo
RM = rm -f

main = src
test = test
demo = demo

targets = $(main) $(test) $(demo)

.PHONY: all
all: $(targets)

.PHONY: clean
clean:
	-@$(MAKE) -C $(main) clean
	-@$(MAKE) -C $(test) clean
	-@$(MAKE) -C $(demo) clean

.PHONY: $(targets)
$(targets):
	@$(MAKE) -C $@

$(demo): $(main) $(test)
$(test): $(main)
