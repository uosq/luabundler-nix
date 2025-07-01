{
  description = "Dev shell with luabundler installed locally via npm";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };

        nodejs = pkgs.nodejs_20;

        # Create a temporary .npm prefix for local installations
        npmPrefix = ".npm-global";
        shellHook = ''
          export NPM_CONFIG_PREFIX=$PWD/${npmPrefix}
          export PATH=$NPM_CONFIG_PREFIX/bin:$PATH

          if ! command -v luabundler >/dev/null; then
            echo "Installing luabundler locally via npm..."
            npm install luabundler
            mkdir -p ${npmPrefix}/bin
            ln -sf $PWD/node_modules/.bin/luabundler ${npmPrefix}/bin/luabundler
          fi
        '';
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [ nodejs ];
          inherit shellHook;
        };
      }
    );
}
