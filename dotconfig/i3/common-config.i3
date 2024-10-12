# This file contains core configurations for i3, irrespective of theme
# Including this file in a theme config allows universal core behavior, especially keybinds

# Mac-Style CMD
set $mod Mod4

# Start XDG autostart .desktop files using dex. See also
# https://wiki.archlinux.org/index.php/XDG_Autostart
exec --no-startup-id dex --autostart --environment i3

# Use pactl to adjust volume in PulseAudio.
set $refresh_i3status killall -SIGUSR1 i3status
bindsym XF86AudioRaiseVolume exec --no-startup-id "pactl set-sink-volume @DEFAULT_SINK@ +5% && volnoti-show $(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]+(?=%)' | head -1)"
bindsym XF86AudioLowerVolume exec --no-startup-id "pactl set-sink-volume @DEFAULT_SINK@ -5% && volnoti-show $(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]+(?=%)' | head -1)"
bindsym XF86AudioMute exec --no-startup-id "pactl set-sink-mute @DEFAULT_SINK@ toggle && volnoti-show -m && $refresh_i3status"
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status

bindsym XF86AudioPlay exec playerctl -p spotify play-pause

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# move tiling windows via drag & drop by left-clicking into the title bar,
# or left-clicking anywhere into the window while holding the floating modifier.
tiling_drag modifier titlebar

# start a terminal
bindsym $mod+Return exec --no-startup-id alacritty

# start a browser
bindsym $mod+apostrophe exec --no-startup-id chromium

# kill focused window
bindsym $mod+Shift+q kill

default_orientation horizontal
bindsym $mod+e layout toggle split

focus_follows_mouse no
# change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right
# rotational movement
bindsym $mod+p focus next
bindsym $mod+y focus prev

# move focused window
bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

# split in horizontal orientation
bindsym $mod+bar split h

# split in vertical orientation
bindsym $mod+minus split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed

# change focus between tiling / floating windows
bindsym $mod+d focus mode_toggle
bindcode $mod+Shift+65 floating toggle

# focus the parent container
bindsym $mod+a focus parent

# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.

# Icon management has been moved to polybar cause it's just easier

set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

# cram all workspaces onto primary monitor
# except 9 which should go to the TV when connected
workspace $ws1 output primary
workspace $ws2 output primary
workspace $ws3 output primary
workspace $ws4 output primary
workspace $ws5 output primary
workspace $ws6 output primary
workspace $ws7 output primary
workspace $ws8 output primary
workspace $ws9 output HDMI-A-0
workspace $ws10 output primary

# switch to workspace
bindsym $mod+1 workspace number $ws1
bindsym $mod+2 workspace number $ws2
bindsym $mod+3 workspace number $ws3
bindsym $mod+4 workspace number $ws4
bindsym $mod+5 workspace number $ws5
bindsym $mod+6 workspace number $ws6
bindsym $mod+7 workspace number $ws7
bindsym $mod+8 workspace number $ws8
bindsym $mod+9 workspace number $ws9
bindsym $mod+0 workspace number $ws10
bindsym $mod+grave workspace number $ws10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace number $ws1
bindsym $mod+Shift+2 move container to workspace number $ws2
bindsym $mod+Shift+3 move container to workspace number $ws3
bindsym $mod+Shift+4 move container to workspace number $ws4
bindsym $mod+Shift+5 move container to workspace number $ws5
bindsym $mod+Shift+6 move container to workspace number $ws6
bindsym $mod+Shift+7 move container to workspace number $ws7
bindsym $mod+Shift+8 move container to workspace number $ws8
bindsym $mod+Shift+9 move container to workspace number $ws9
bindsym $mod+Shift+0 move container to workspace number $ws10

# tmux quickswitch
bindsym $mod+semicolon workspace back_and_forth

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Control+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
bindsym $mod+r mode "resize"
mode "resize" {
        bindsym h resize shrink width 5 px or 5 ppt
        bindsym j resize grow height 5 px or 5 ppt
        bindsym k resize shrink height 5 px or 5 ppt
        bindsym l resize grow width 5 px or 5 ppt

        # back to normal: Enter or Escape or $mod+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+r mode "default"
}

# Copy/Paste
bindsym --release $mod+c exec --no-startup-id xdotool key --clearmodifiers ctrl+shift+c
bindsym --release $mod+v exec --no-startup-id xdotool key --clearmodifiers ctrl+shift+v

exec --no-startup-id autocutsel -s PRIMARY
exec --no-startup-id clipmenud

# Selection screenshot
exec --no-startup-id flameshot
bindsym $mod+Shift+s exec --no-startup-id flameshot gui

# Default certain windows to certain workspaces
# If you change the WS icons in polybar, these bindings may need to change as well for consistency!
assign [class="steam"] $ws2
assign [class="discord"] $ws2
assign [class="Slack"] $ws2
assign [class="Spotify"] $ws3
assign [class="Gimp-2.10"] $ws5
assign [class="jetbrains*"] $ws10
