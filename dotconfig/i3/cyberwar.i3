include /home/kleo/.config/i3/common-config.i3

set $mod Mod4

# start rofi
bindsym $mod+space exec "rofi -modi combi -show combi -show-icons -matching prefix -config ~/.config/rofi/cyberwar.rasi"

### COLORS
# class                 border  backgr. text    indicator child_border
client.focused          #000000 #000000 #32CD32 #000000 #32CD32
client.unfocused        #000000 #000000 #32CD32 #000000 #1E1E2E
client.focused_inactive #000000 #000000 #32CD32 #000000 #1E1E2E

# Remove title bars
for_window [class="^.*"] border pixel 2
for_window [class="^.*"] title_format " "

# Lock screen
bindsym $mod+Control+l exec --no-startup-id /home/kleo/.config/i3/lock-cyberwar.sh

exec --no-startup-id nitrogen --restore
exec --no-startup-id polybar --reload -c ~/.config/polybar/cyberwar.ini
