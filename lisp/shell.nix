{ pkgs }:
with pkgs;
let
    lispDeps = list: list ++ [ emacs sbcl cl-launch which rlwrap file getopt less curl git glib libfixposix ];
    librP = lib.strings.makeLibraryPath [ openssl sqlite ];
in {
    lisp = mkShell {
        buildInputs = lispDeps []; # add a temporary placeholder of libraries for future cases.
        LD_LIBRARY_PATH = librP;
    };
}
