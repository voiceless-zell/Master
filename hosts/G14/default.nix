{ pkgs, inputs, config, ... }:
{
  imports = [
  ./hardware-configuration.nix
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelModules = [ "kvm-amd" ];
  boot.kernel.sysctl = {
  "vm.max_map_count" = 20971520;
  "fs.file-max" = 524288;
};
 networking = {
    hostName = "G14";
    networkmanager.enable = true;
    firewall.enable = false;
  };
  zramSwap.enable = true;
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    videoDrivers = [  "nvidia"  ];
    desktopManager.gnome = {
        enable = true;
        };
    };
    hardware = {
      opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = true;
        extraPackages = with pkgs; [
        ];
      };
    };
  services.gvfs.enable = true;
}
