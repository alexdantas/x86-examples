# x86-examples

[![emacs banner](http://badges.alexdantas.net/emacs.png)](http://badges.alexdantas.net/)

Examples from learning x86/IA-32 Assembly.

Lots of small programs I've made during college. They're ordered
by difficulty level.

All examples are targeted at Linux, using the NASM Assembler. Expect a lot of
Linux-specific syscalls!

## Usage

To build an example, run `make` along with the filename **without extensions**:

    $ make (filename)

This will assemble `(filename).asm` and link `(filename).o` into the
`(filename)` executable.

Then, simply:

    $ ./(filename)

