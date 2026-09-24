{self, ...}: {
  flake.nixosModules.desktop = {
    config,
    pkgs,
    lib,
    ...
  }: let
    inherit (lib) getExe;
    selfpkgs = self.packages."${pkgs.system}";
    # niri-config = pkgs.writeText "niri-config" ''
    #     spawn-sh-at-startup "${config.programs.regreet.package}/bin/regreet; ${config.programs.niri.package}/bin/niri msg action quit --skip-confirmation"
    # '';

  in {
    imports = [
      self.nixosModules.gtk
      self.nixosModules.wallpaper
        
      self.nixosModules.gaming
      self.nixosModules.pipewire
      self.nixosModules.firefox
      self.nixosModules.chromium
    ];

    programs.niri.enable = true;
    programs.niri.package = selfpkgs.niri;

    programs.regreet.enable = true;

    services.greetd = {
        enable = true;
        settings = {
            default_session = {
                command = "${config.programs.niri.package}/bin/niri";
            };
        };
    };

    # systemd.user.services.niri.enableDefaultPath = false;

    preferences.autostart = [selfpkgs.start-noctalia-shell];

    environment.systemPackages = [
      selfpkgs.terminal
      pkgs.pcmanfm
      selfpkgs.noctalia-bundle
      pkgs.swaylock
    ];

    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      ubuntu-sans
      cm_unicode
      corefonts
      unifont
    ];

    fonts.fontconfig.defaultFonts = {
      serif = [ "Ubuntu Sans" ];
      sansSerif = [ "Ubuntu Sans" ];
      monospace = [ "JetBrainsMono Nerd Font" ];
    };

    time.timeZone = "Australia/Sydney";
    i18n.defaultLocale = "en_AU.UTF-8";
    i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_AU.UTF-8";
      LC_IDENTIFICATION = "en_AU.UTF-8";
      LC_MEASUREMENT = "en_AU.UTF-8";
      LC_MONETARY = "en_AU.UTF-8";
      LC_NAME = "en_AU.UTF-8";
      LC_NUMERIC = "en_AU.UTF-8";
      LC_PAPER = "en_AU.UTF-8";
      LC_TELEPHONE = "en_AU.UTF-8";
      LC_TIME = "en_AU.UTF-8";
    };

    services.upower.enable = true;

    security.polkit.enable = true;

    hardware = {
      enableAllFirmware = true;

      bluetooth.enable = true;
      bluetooth.powerOnBoot = true;

      graphics = {
        enable = true;
        enable32Bit = true;
      };
    };
  };
}
