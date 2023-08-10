## Copyright 2018 Brian Swetland <swetland@frotz.net>
##
## Licensed under the Apache License, Version 2.0 
## http://www.apache.org/licenses/LICENSE-2.0


#### Projects ####

include build/init.mk

help: list-all-targets

all: build-all-buildable

test: run-all-tests

$(foreach p,$(wildcard project/*.def),$(call project,$p))

clean::
	rm -rf out

ALL_TARGETS := $(sort $(ALL_TARGETS)) all
TARGET_all_DESC := build all 'build' targets
TARGET_tools_DESC := build tools: out/{a16,d16,icetool}
TARGET_cpu16-tests_DESC := run cpu16 test suite

list-all-targets::
	@true
	$(info All Possible Targets)
	$(info --------------------)
	$(foreach x,$(ALL_TARGETS),$(info $(shell printf "%-25s %s\n" "$(x)" "$(TARGET_$(x)_DESC)")))

build-all-buildable:: $(ALL_BUILDS)

run-all-tests:: $(patsubst %,%-vsim,$(filter test-%,$(ALL_BUILDS)))

