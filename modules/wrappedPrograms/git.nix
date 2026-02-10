{inputs, ...}: {
  perSystem = {pkgs, ...}: let
  in {
    packages.git = inputs.wrappers.lib.wrapPackage {
      inherit pkgs;
      package = pkgs.git;
      env = rec {
        GIT_AUTHOR_NAME = "cachekitty";
        GIT_AUTHOR_EMAIL = "contact@cachekitty.fyi";
        GIT_COMMITTER_NAME = GIT_AUTHOR_NAME;
        GIT_COMMITTER_EMAIL = GIT_AUTHOR_EMAIL;
      };
    };
  };
}
