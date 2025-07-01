# luabundler-nix

This is tested only with a Flakes-based NixOS

+ Use a Nix shell to merge Lua scripts with Luabundler
+ Dont worry about installing npm globally

This repo is not meant to replace Luabundler or Luabundle in any way, this is just a tool to automatically download and install it in a Nix shell

## How to use

Instructions:

+ Clone the repo
+ run `nix develop`
+ Thats it

```sh
git clone git@github.com:uosq/luabundler-nix.git
cd luabundler-nix
nix develop
```