{ pkgs, lib, inputs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$terminal" = "kitty";
      "$launcher" = "ulauncher-toggle";
      "$mod" = "SUPER";

      bind = [
        "$mod, Return, exec, $terminal"
        "$mod, P, exec, $launcher"
        "$mod, C, killactive,"
        "$mod, M, exit,"
        
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
      ];
      
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s +10%"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];

      gestures = {
        workspace_swipe = false;
      };

      exec-once = "waybar & mako & ulauncher --hide-window";
    }; 
  };

  programs = {
    kitty.enable = true;
    waybar.enable = true;
    mako.enable = true;
    hyprlock.enable = true;
    wofi.enable = true;
  };

  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
