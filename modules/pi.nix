# Raspberry pi 5 running NixOS
{ nixos-raspberrypi, lib, modulesPath, ... }:
{
  imports = with nixos-raspberrypi.nixosModules; [
    raspberry-pi-5.base
    sd-image
  ];

  # Disable unneeded things
  disabledModules = [ (modulesPath + "/profiles/base.nix") ];
  hardware.enableAllHardware = lib.mkForce false;

  networking.hostName = "pi";
  time.timeZone = "America/Los_Angeles";

  # Users only come from this file
  users.mutableUsers = false;
  users.users.ernest = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # wheel = can use sudo
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKrU7TJ32q1bBvK6gSNXS0WacYnlqzlAhzWXlNBZ4e1c"
    ];
  };

  # check ssh key
  security.pam.sshAgentAuth.enable = true;
  security.pam.services.sudo.sshAgentAuth = true;

  # SSH: keys only, no passwords, no root login
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  # Tailscale
  services.tailscale.enable = true;

  # Wi-Fi
  networking.networkmanager = {
    enable = true;
    ensureProfiles = {
      environmentFiles = [ "/boot/firmware/wifi.env" ];
      profiles.home-wifi = {
        connection = {
          id = "home-wifi";
          type = "wifi";
        };
        wifi.ssid = "$WIFI_SSID";
        wifi-security = {
          key-mgmt = "wpa-psk";
          psk = "$WIFI_PSK";
        };
      };
    };
  };
  # Firmware partition mounts on demand, make sure it gets mounted first
  systemd.services.NetworkManager-ensure-profiles.unitConfig.RequiresMountsFor = "/boot/firmware";

  # rebuild alias
  environment.shellAliases.rebuild = "~/dev/nix-dotfiles/scripts/utils/switch.sh pi";

  system.stateVersion = "26.05";
}
