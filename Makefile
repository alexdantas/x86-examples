# Common Makefie for IA-32 Assembly programs
# Using NASM and trying to automate everything.
#
# Targets:
#
# make (filename)        Assembles (filename).asm and
#                        Links (filename).o into the
#                        (filename) executable.
#
# make clean             Removes all object files

ASMFLAGS = -f elf -g -F stabs    # Debugging info
LDFLAGS  = -melf_i386            # My netbook's 64-bit

all:
	# Usage:
	#          make (filename)

%:
	# Assembling "$@.asm"...
	nasm $@.asm -o $@.o $(ASMFLAGS)
	# Linking "$@.o"...
	ld $@.o -o $@ $(LDFLAGS)

clean:
	# Cleaning...
	rm -f *.o

.PHONY: clean all

