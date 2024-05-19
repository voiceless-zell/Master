{pkgs, inputs, config, nixpkgs, self, ...}: 
{        
  imports = [
  ./hardware-configuration.nix
  ./../../nixos
  ./../../nixos/common/tailscale.nix
  ];
 
boot.loader.systemd-boot.enable = true;
boot.kernelPackages = pkgs.linuxPackages_latest;
boot.kernelModules = [ "intel" ];
boot.loader.efi.canTouchEfiVariables = true;
boot.kernel.sysctl = {
  "vm.max_map_count" = 16777216;
  "fs.file-max" = 524288;
};
  networking = {
    hostName = "P72";
    networkmanager.enable = true;
    firewall.enable = false;
  };
   services.xserver = {
    enable = true;
    xkb.layout = "us";
    videoDrivers = [ "nvidia" ];
    displayManager.sddm = {
      enable = true;
      wayland = {
        enable = true;
        
        };
    };
    desktopManager.gnome = {
        enable = true;
      };
    libinput = {
      enable = true;
      mouse = {
        accelProfile = "flat";
      };
    };
  };
services.gvfs.enable = true;
services.hardware.bolt.enable = true;
 hardware.nvidia = {
     modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
     prime ={
      sync.enable = true;
      intelBusId = "PCI:1:00:0";
      nvidiaBusId = "PCI:1:00:0";
     };   
  };
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
  ];
  };
  powerManagement.cpuFreqGovernor = "performance";
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
    };

}
