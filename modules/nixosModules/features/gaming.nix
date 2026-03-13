{
  flake.nixosModules.gaming = {pkgs, ...}: {
    
    programs.modrinth-app.enable = true;

  };
}
