{self, ...}: {
  flake.nixosModules.virtualisation = {...}: {

    programs.virt-manager.enable = true;

    users.groups.libvirtd.members = ["cachekitty"];

    virtualisation.libvirtd.enable = true;

    virtualisation.spiceUSBRedirection.enable = true;

  };
}
