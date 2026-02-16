{
  flake.nixosModules.ssh_client = {pkgs, ...}: {
    programs.ssh.startAgent = true;
  };
}
