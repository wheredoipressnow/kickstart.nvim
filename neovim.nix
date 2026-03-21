{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      # Navigation & motion
      flash-nvim

      # Language-specific
      haskell-tools-nvim

      # Editor behavior
      guess-indent-nvim

      # Git
      gitsigns-nvim

      # UI
      which-key-nvim
      todo-comments-nvim
      gruvbox-nvim
      gruber-darker-nvim
      everforest
      nvim-web-devicons

      # Fuzzy finding
      telescope-nvim
      telescope-fzf-native-nvim
      telescope-ui-select-nvim
      plenary-nvim

      # LSP
      nvim-lspconfig
      fidget-nvim

      # Formatting
      conform-nvim

      # Completion & snippets
      blink-cmp
      luasnip

      # Utilities
      mini-nvim

      # Treesitter — with grammars compiled by Nix
      (nvim-treesitter.withPlugins (p: [
        p.bash
        p.c
        p.diff
        p.html
        p.lua
        p.luadoc
        p.markdown
        p.markdown_inline
        p.query
        p.vim
        p.vimdoc
        p.elixir
        p.haskell
        p.nix
        # Add more as needed:
        #  p.python p.rust
      ]))
    ];

    extraLuaConfig = builtins.readFile ./nvim/init.lua;
  };
}
