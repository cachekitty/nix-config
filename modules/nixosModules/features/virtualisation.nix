{self, ...}: {
  flake.nixosModules.virtualisation = {...}: {

    virtualisation.vmware.host.enable = true;

  };
}
