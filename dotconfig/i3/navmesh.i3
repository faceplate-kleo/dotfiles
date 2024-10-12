# ==================================================================
#
#   ███╗   ██╗ █████╗ ██╗   ██╗███╗   ███╗███████╗███████╗██╗  ██╗
#   ████╗  ██║██╔══██╗██║   ██║████╗ ████║██╔════╝██╔════╝██║  ██║
#   ██╔██╗ ██║███████║██║   ██║██╔████╔██║█████╗  ███████╗███████║
#   ██║╚██╗██║██╔══██║╚██╗ ██╔╝██║╚██╔╝██║██╔══╝  ╚════██║██╔══██║
#   ██║ ╚████║██║  ██║ ╚████╔╝ ██║ ╚═╝ ██║███████╗███████║██║  ██║
#   ╚═╝  ╚═══╝╚═╝  ╚═╝  ╚═══╝  ╚═╝     ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝
#
# ==================================================================

include /home/kleo/.config/i3/common-config.i3

set $mod Mod4

font pango:JetbrainsMono Nerd Font Mono:style=Light Italic 7
# start rofi
bindsym $mod+space exec "rofi -modi combi -show combi -show-icons -matching prefix -config ~/.config/rofi/navmesh.rasi"

### COLORS
# class                 border  backgr. text    indicator child_border
client.focused          #313244 #313244 #cdd6f4 #313244 #685480
client.unfocused        #313244 #313244 #cdd6f4 #313244 #1E1E2E
client.focused_inactive #313244 #313244 #cdd6f4 #313244 #1E1E2E

exec --no-startup-id picom --config ~/.config/picom.conf

# Lock screen
# bindsym $mod+Control+l exec --no-startup-id light-locker-command -l
bindsym $mod+Control+l exec --no-startup-id /home/kleo/.config/i3/lock.sh

gaps inner 20px
gaps outer 20px

bindsym $mod+Shift+minus gaps outer all plus 5, gaps inner all plus 5
bindsym $mod+Shift+plus gaps outer all minus 5, gaps inner all minus 5

# Squish down to single-monitor aspect ratio when using a monstrous 49" monitor 
# Meant to reduce eye movement when you just don't need ALL that screen
bindsym $mod+Control+bar gaps horizontal all set 1024

# Reset gapping
bindsym $mod+Shift+bar gaps outer all set 20px, gaps inner all set 20px

# Go into super hyper ultra efficiency mode (gapless)
bindsym $mod+Control+Shift+bar gaps outer all set 0, gaps inner all set 0

# Remove title bars
for_window [class="^.*"] border pixel 2
for_window [class="^.*"] title_format " "

# Start i3bar to display a workspace bar

exec --no-startup-id nitrogen --restore
exec --no-startup-id polybar --reload -c ~/.config/polybar/config.ini
