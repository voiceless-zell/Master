{ inputs
, pkgs
, config
, lib
, ...
}: 
  
  with lib;
    let
      cfg = config.modules.packages;
      star-citizen = pkgs.star-citizen.override (prev: {
          wineDllOverrides = prev.wineDllOverrides ++ [ "dxgi=n" ];
        });
    in {
      
    options.modules.packages = { enable = mkEnableOption "packages"; };
    config = mkIf cfg.enable {
        home.packages = with pkgs; [
      # others
      firefox
      bitwarden
      p7zip
      neofetch
      openssl
      libnotify
      pamixer
      xfce.thunar
      pavucontrol
      wget
      unzip
      gparted
      mpv
      playerctl
      qalculate-gtk
      htop
      fzf
      ffmpeg
    #  discord
      eza
      obsidian
      cmatrix
      glib
      #programming
      nix-prefetch-github
      #Tmux things stdin/write to file
      moreutils
      libcxxStdenv
# security
    x11_ssh_askpass
#lazyvim
      fd
      gcc
      tree-sitter
      ruby
      nodejs
      nvtopPackages.full
    #  inputs.nix-citizen.packages.${system}.star-citizen
    #  inputs.nix-citizen.packages.${system}.star-citizen-helper
    #  inputs.nix-citizen.packages.${system}.lug-helper
    #  lutris
    # wineWowPackages.waylandFull
    #  winetricks
   #  wine
   #   wineWowPackages.stable
      python312Packages.huggingface-hub
];
    };
}
