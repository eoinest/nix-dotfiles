# Yazi terminal file manager: run `yazi`, press q to quit.
# Modeled on Cyan's modules/features/cli/yazi/default.nix.
# Settings: https://yazi-rs.github.io/docs/configuration/yazi
{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;

    plugins = {
      # Git status signs on files, and on folders that contain changes.
      git = pkgs.yaziPlugins.git;
    };

    initLua = ''
      require("git"):setup()
    '';

    # Ask git.yazi for the status of every file ("*") and folder ("*/").
    settings.plugin.prepend_fetchers = [
      { url = "*"; run = "git"; group = "git"; }
      { url = "*/"; run = "git"; group = "git"; }
    ];
  };
}
