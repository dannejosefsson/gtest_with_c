cc = gcc
src_dir = ./src
obj_dir = ./obj
bin_dir = ./bin
dep_dir = .deps
df = $(dep_dir)/$(obj_dir)/$(*F)
program_name = nicke_c
sources = $(shell find $(src_dir) -name *.c)
objects = $(patsubst $(src_dir)/%.c,$(obj_dir)/%.o,$(sources))

$(program_name): $(objects) | $(bin_dir)
	$(cc) $(objects) -o $(bin_dir)/$(program_name) 

$(obj_dir)/%.o : %.c | $(obj_dir) $(dep_dir)
	@mkdir -p $(dep_dir)/$(@D)
	$(cc) -MD -o $@ -c $<
	@cp $(obj_dir)/$(*F).d $(df).P
	@sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\\$$//' \
		-e '/^$$/ d' -e 's/$$/ :/' < $(obj_dir)/$(*F).d >> $(df).P; \
	@rm -f $(obj_dir)/$(*F).d
	
-include $(sources:%.c=$(dep_dir)/%.P)

.PHONY : $(bin_dir)
$(bin_dir):
	@mkdir -p $(bin_dir)

.PHONY : $(obj_dir)
$(obj_dir):
	@mkdir -p $(obj_dir)

.PHONY : $(dep_dir)
$(dep_dir):
	@mkdir -p $(dep_dir)

.PHONY : clean
clean : 
	rm -fr $(obj_dir) $(bin_dir) $(dep_dir)
