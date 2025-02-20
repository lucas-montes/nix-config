{ pkgs, ... }:

{
  programs.btop = {
    enable = true;
    package = pkgs.btop.override { cudaSupport = true; };  # For AMD GPUs
  };
}

