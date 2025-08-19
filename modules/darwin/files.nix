{ user, config, pkgs, ... }:

let
  xdg_local     = "${config.users.users.${user}.home}/.local";
  xdg_configHome = "${config.users.users.${user}.home}/.config";
  xdg_dataHome   = "${config.users.users.${user}.home}/.local/share";
  xdg_stateHome  = "${config.users.users.${user}.home}/.local/state"; in
{

  # Raycast script so that "Run Emacs" is available and uses Emacs daemon
  "${xdg_local}/bin/cs machine.sh" = {
    executable = true;
    text = ''
      #!/bin/bash
      #
      # Required parameters:
      # @raycast.schemaVersion 1
      # @raycast.title Connect to CS Machine
      # @raycast.mode silent
      #
      # Optional parameters:
      # @raycast.packageName sauce
      # @raycast.icon 🖥️
      # @raycast.argument1 { "type": "text", "placeholder": "Machine Name" }
      # 
      # Documentation:
      # @raycast.description connect to a cs machine
      # @raycast.author suhas
      # @raycast.authorURL suhas.one

      code --remote ssh-remote+$1.cs.utexas.edu

      echo connected to $1.cs.utexas.edu
    '';
  };
}
