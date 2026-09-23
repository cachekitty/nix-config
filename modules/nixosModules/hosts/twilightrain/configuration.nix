{
  inputs,
  self,
  ...
}: {
  flake.nixosConfigurations.twilightrain = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.hostTwilightrain
    ];
  };

  flake.nixosModules.hostTwilightrain = {pkgs, ...}: {
    imports = [
      self.nixosModules.base
      self.nixosModules.general
      self.nixosModules.desktop
      self.nixosModules.virtualisation
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "twilightrain";

    networking.networkmanager.enable = true;

    boot.kernelPackages = pkgs.linuxPackages_latest;

    system.stateVersion = "25.11";
  };
}
