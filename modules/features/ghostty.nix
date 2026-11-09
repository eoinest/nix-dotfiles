# Ghostty terminal settings (written to ~/.config/ghostty/config).
# Modeled on Cyan's modules/features/gui/ghostty.nix.
# Options: https://ghostty.org/docs/config/reference
{
  programs.ghostty = {
    enable = true;
    package = null; # the app is installed normally; Nix only manages its config
    systemd.enable = false; # linux only (dont start a ghostty background service
    settings = {
      # Over SSH, other machines don't know Ghostty's terminal type, which
      # breaks Backspace and colors. ssh-terminfo copies it to the remote
      # machine on first connect; ssh-env falls back to xterm-256color.
      shell-integration-features = "ssh-terminfo,ssh-env";
    };
  };
}
