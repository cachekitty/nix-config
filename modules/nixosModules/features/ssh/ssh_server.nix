{
  flake.nixosModules.ssh_server = {config, ...}: {
    users.users.${config.preferences.user.name}.openssh.authorizedKeys.keyFiles = [
        /home/${config.preferences.user.name}/ssh/authorized_keys
    ];
    
    services.openssh = {
        enable = true;
        settings.PasswordAuthentication = false;
        settings.KbdInteractiveAuthentication = false;
    };
  };
}
