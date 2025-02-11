{ pkgs }:
with pkgs;
let
  gfxLibs = [ libGL libGLU meson glfw openssl sqlite ];
  addLibs = list:
    list ++ [ emacs sbcl cl-launch which rlwrap file getopt less curl git glib libfixposix ];
in {
  lisp = mkShell {
    buildInputs = addLibs [] ++ gfxLibs;
    LD_LIBRARY_PATH = lib.strings.makeLibraryPath gfxLibs;
  };
}
