{
  flake.nixosModules.gaming = {pkgs, ...}: {
   
    environment.systemPackages = [
        pkgs.modrinth-app
    ];

  };
}
