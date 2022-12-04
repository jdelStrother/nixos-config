{ pkgs, ... }:

let doomConfig = rec {
  forgeUrl = "https://github.com";
  repoUrl = "${forgeUrl}/doomemacs/doomemacs";
  configRepoUrl = "${forgeUrl}/hlissner/doom-emacs-private";
}; in
{
  # https://github.com/nix-community/home-manager/pull/2408
  environment.pathsToLink = [ "/share/fish" ];

  users.users.jon = {
    isNormalUser = true;
    home = "/home/jon";
    extraGroups = [ "docker" "wheel" ];
    shell = pkgs.fish;
    hashedPassword = "$6$QCueq3FmrVU/uhmq$olEIkmGi5oAj2twQDcr1r1YfDuesPxqLTapX89wePf7NmAfQuhLLNB46nhycJDHq8PqE7bANq3lMOIw1y/Uqj1";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCr1Qr6PBMKuGAMK4ePRbRy1hSLb3ggto3I8GFNAmvQdOyuWrv9oYOOfGLzamXdVvpGU4iWuPrx0PscZsV4fPCZhwVH/bjRMHBIpf5oMtg8nl9K1iCmcLev459mTBPgKwdKyXmWZsJSGx4ZXsbIMerZPJmV8EGunwXxCE+0QDQc8N5X8l2Ay/Mb82rcWo5+RezESQsXp00gGx55WIww8xIJoaRxGmbwpQi8cfXQqsrEj8CuCYa4oeFMj5KtrosS5+NeV2Fay1ppDQgcsdeddd9eENRGhDLmmSWYRhXdUNprt+51vzGkQBwMfu7s2p8KnRbEX7u7mm/Fw4v8cjNc1hHV jon@jons-mbp.local"
    ];
  };

  # nixpkgs.overlays = import ../../lib/overlays.nix ++ [
  #   (import ./vim.nix)
  # ];

  # system.userActivationScripts = {
  #   installDoomEmacs = ''
  #       if [ ! -d "$XDG_CONFIG_HOME/emacs" ]; then
  #          git clone --depth=1 --single-branch "${doomConfig.repoUrl}" "$XDG_CONFIG_HOME/emacs"
  #          # git clone "${doomConfig.configRepoUrl}" "$XDG_CONFIG_HOME/doom"
  #       fi
  #     '';
  #   };
}
