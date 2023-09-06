{ config, pkgs, lib, ... }: rec {
  imports = [ 
    ../common.nix
    ../../modules/neovim
    ../../modules/doom-emacs
  ];

  programs.zsh = {
    enable = true;
    shellAliases = {
        ls = "ls -FB --color=auto";
        la = "ls -FA";
        ll = "ls -Flah";
	ga = "git add";
	gaa = "git add --all";
	gc = "git commit --verbose";
	gco = "git checkout";
	gd = "git diff";
	gdc = "git diff --cached";
	gp = "git push";
	gl = "git pull";
        gst = "git status";
    };
    enableAutosuggestions = true;
    syntaxHighlighting = {
      enable = true;
    };
    enableVteIntegration = true;
    autocd = true;
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      character = {
        success_symbol = "[>](bold green)";
        error_symbol = "[x](bold red)";
        vimcmd_symbol = "[<](bold green)";
      };
    };
  };

  programs.git.enable = true;
  programs.git.extraConfig = {
    init = {
      defaultBranch = "main";
    };
  };
}
