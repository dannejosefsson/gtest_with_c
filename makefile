cc = gcc
ccp = c++
src_dir = ./src/main
hdr_dir = $(src_dir)/include
tst_dir = ./src/test
lib_dir = ./lib
lib_hdr_dir = $(lib_dir)/include
obj_dir = obj
bin_dir = ./bin
dep_dir = .deps
program_name = nicke_c
sources = $(shell find $(src_dir) -name *.c)
objects = $(patsubst %,$(obj_dir)/%.o,$(sources))
test_sources = $(shell find $(tst_dir) -name *.cc)
test_objects = $(patsubst %,$(obj_dir)/%.o,$(test_sources)) $(patsubst %,$(obj_dir)/%.test.o,$(sources))
defines :=

all : $(program_name)

$(program_name) : $(objects) | $(bin_dir)
	$(cc) $(objects) -o $(bin_dir)/$@

unit_test : defines :=$(defines) -D TESTING
unit_test :$(test_objects) $(objects) | $(bin_dir)
	$(ccp) $(test_objects) -pthread -L$(lib_dir) -lgtest -o $(bin_dir)/$(program_name)_unit_test

$(obj_dir)/%.cc.o : %.cc
	@mkdir -p $(@D)
	$(ccp) -Wall -MD -I./$(lib_hdr_dir) -I$(hdr_dir) $(defines) -o $@ -c $<

$(obj_dir)/%.c.o $(obj_dir)/%.c.test.o : %.c
	@mkdir -p $(@D)
	$(cc) -Wall -MD -I$(hdr_dir) $(defines) -o $@ -c $<

.PHONY : $(bin_dir)
$(bin_dir):
	@mkdir -p $(bin_dir)

.PHONY : clean
clean :
	rm -fr $(obj_dir) $(bin_dir) $(dep_dir)

