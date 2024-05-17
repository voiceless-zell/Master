{ hostname
, config
, pkgs
, lib
, ...
}:
with lib;
  let 
    cfg = config.modules.zsh;
in {
  options.modules.zsh = { enable = mkEnableOption "zsh";};
  config = mkIf cfg.enable {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
 #   prezto.enable = true;
 #   prezto.tmux.autoStartRemote = true;
    initExtra = ''
    if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
      tmux attach -t default || tmux new -s default
    fi
    '';
    oh-my-zsh = {
      enable = true;
      plugins = with pkgs; [ "tmux" ];

    };
    shellAliases = {
      ncg = "nix-collect-garbage && nix-collect-garbage -d && sudo nix-collect-garbage && sudo nix-collect-garbage -d && sudo rm /nix/var/nix/gcroots/auto/*";
      fl = "cd ~/non-nix-flake/ && v";
      v = "nvim";
      ls = "eza --icons --long";
      # nixos
      notes = "cd ~/notes/ && v";
      music = "ncspot";
      vm = "sudo virsh net-start default";
      startbg = " nohup ~/non-nix-flake/backgrounds/swww_randomize.sh ~/non-nix-flake/backgrounds > output.log 2>&1 &";
    };
  };
  };
}
