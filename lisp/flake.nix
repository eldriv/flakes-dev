{
  description = "My Lisp Development Shell ❄️";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };
  outputs = { self, nixpkgs }: 
    let
      nixosystem = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${nixosystem};
    in {
      # explicitly point to lisp providing an attribute—'.#lisp'
      devShells.${nixosystem}.lisp = (import ./shell.nix {
        inherit pkgs;
      # to point the shell derivation called lisp from shell.nix,
      # Otherwise it will signal an error 'no derivation.
      }).lisp;
    };
}
