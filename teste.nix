let
  pkgs = import <nixpkgs> {};
  # Define a string or any value
  message = "Hello, Nix!";
  alsog = str: "hey" + str + message;
  arch = builtins.elemAt (pkgs.lib.strings.splitString "-" pkgs.system) 0;
in
  # Print the message to the consol
  #  builtins.trace (alsog "lucas") null
  builtins.trace
  arch
  null
