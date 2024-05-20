{ pkgs, input, config, lib, ...}:{
  
  users.users = {
    "kali" = {
    isNormalUser = true;
    description = "Pete";
    extraGroups = [ ];
    shell = pkgs.zsh;
    };
  };
  

  nix.settings.allowed-users = [ "zell" "kali" ];
}
