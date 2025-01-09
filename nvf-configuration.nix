{pkgs, lib, ...}:

{
vim = {
theme = {
enable = true;
name = "dracula";

};
stautsline.lualine.enable = true;
telescope.enable = true;
autocomplete.nvim-cmp.enable = true;

languages = {
enableLSP = true;
enableTreesitter = true;
nix.enable = true;
rust.enable = true;
python = { enable = true; format.enable = true; };
};
};
}
