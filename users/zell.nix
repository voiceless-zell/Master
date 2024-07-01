{ pkgs, input, config, lib, ...}:{
  
  users.users = {
    "zell" = {
    isNormalUser = true;
    description = "Pete";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "input" ];
    shell = pkgs.zsh;
    };
  };
  

  nix.settings.allowed-users = [ "zell" ];
}
