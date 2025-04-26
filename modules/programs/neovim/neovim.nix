{ config, lib, pkgs, ... }:
{
  programs.neovim = 
  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    enable = true;

    extraPackages = with pkgs; [
      lua-language-server
      nil

      xclip
      wl-clipboard
    ];

    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-lspconfig;
        config = toLuaFile ./plugins/lsp.lua;
      }

      {
        plugin = comment-nvim;
        config = toLua "require(\"Comment\").setup()";
      }

      {
        plugin = gruvbox-nvim;
        config = "colorscheme gruvbox";
      }

      neodev-nvim

      {
        plugin = nvim-cmp;
        config = toLuaFile ./plugins/cmp.lua;
      }

      {
        plugin = telescope-nvim;
        config = toLuaFile ./plugins/telescope.lua;
      }

      telescope-fzf-native-nvim
      cmp_luasnip
      cmp-nvim-lsp
      luasnip
      friendly-snippets
      lualine-nvim
      nvim-web-devicons

      {
        plugin = (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-vim
          p.tree-sitter-bash
          p.tree-sitter-lua
          p.tree-sitter-python
          p.tree-sitter-json
          p.tree-sitter-html
          p.tree-sitter-css
          p.tree-sitter-javascript
          p.tree-sitter-dockerfile
          p.tree-sitter-go
          p.tree-sitter-hlsl
          p.tree-sitter-java
          p.tree-sitter-php
          p.tree-sitter-c
          p.tree-sitter-cpp
          p.tree-sitter-rust
          p.tree-sitter-zig
        ]));
        config = toLuaFile ./plugins/treesitter.lua;
      }

      vim-nix
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./config.lua}
    '';

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
