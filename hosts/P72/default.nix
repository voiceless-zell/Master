{pkgs, inputs, config, nixpkgs, self, ...}: 
{        
boot.loader.systemd-boot.enable = true;
boot.initrd.availableKernelModules = [  "vfio-pci"];
boot.kernelPackages = pkgs.linuxPackages_latest;
boot.kernelParams = [ "intel_iommu=on" "pcie_aspm=off" ];
boot.kernelModules = [ "kvm-intel" ];
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernel.sysctl = {
  "vm.max_map_count" = 16777216;
  "fs.file-max" = 524288;
};
#boot.initrd.preDeviceCommands = ''
#  DEVS="0000:01:00.0 0000:01:00.1"
#  for DEV in $DEVS; do
#    echo "vfio-pci" > /sys/bus/pci/devices/$DEV/driver_override
#  done
#  modprobe -i vfio-pci
#'';
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
    open = false;
    nvidiaSettings = true;
  };
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
    intel-compute-runtime
    intel-media-driver
    vaapiIntel
    vaapiVdpau
    libvdpau-va-gl
    wineWowPackages.waylandFull
  ];
  };
  powerManagement.cpuFreqGovernor = "performance";
}
