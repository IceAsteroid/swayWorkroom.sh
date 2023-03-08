# swayWorkroom.sh
A script to implementing more than one set of 1-10 workspaces in Sway.

Inspired from a reddit post: [link](https://old.reddit.com/r/swaywm/comments/tsvydv/workrooms_a_set_of_workspaces/), but with enhancements.

# Demo
![demoGif](https://user-images.githubusercontent.com/90975914/223832751-40b71822-d6d3-4378-85fe-b18f30c96d79.gif)

# Enhancements
- Intuitive workspace numbering, for example, 10 to 20, instead of 11 to 19, as implementing Workroom only in Sway has this limitation.
- Added container moving functionality to use with Workroom.

# Features
- Sets
  - Set 1's workspaces start at 11 up to 20.
  - Set 2's workspaces start at 21 up to 30.
  - Set 3 follows the same.
  - Possible to add more sets just by simply modifying the script a bit.
- Workflow
  - Keybindings
    - Move to set 1, 2, 3 by keybindings Ctrl+Alt+q, Ctrl+Alt+w, Ctrl+Alt+e, respectively.
  - Inherit digits
    - When moving to another set, for example, from set 1 to set 2, and you're in 13, the workspace to switch to, will be 23. And 20 will be 30, etc.
- Container moving functionality
  - Added container moving support, but it only allows containers to move only inside of the set they're in.

# How to use
1. Download the script, and put it to the directory of choice.

2. Comment out all lines related to workspace actions in sway, as belows:
```
## Workspaces:
#
#    # Switch to workspace
#    bindsym $mod+1 workspace number 1
#    bindsym $mod+2 workspace number 2
#    bindsym $mod+3 workspace number 3
#    bindsym $mod+4 workspace number 4
#    bindsym $mod+5 workspace number 5
#    bindsym $mod+6 workspace number 6
#    bindsym $mod+7 workspace number 7
#    bindsym $mod+8 workspace number 8
#    bindsym $mod+9 workspace number 9
#    bindsym $mod+0 workspace number 10
#    # Move focused container to workspace
#    bindsym $mod+Shift+1 move container to workspace number 1
#    bindsym $mod+Shift+2 move container to workspace number 2
#    bindsym $mod+Shift+3 move container to workspace number 3
#    bindsym $mod+Shift+4 move container to workspace number 4
#    bindsym $mod+Shift+5 move container to workspace number 5
#    bindsym $mod+Shift+6 move container to workspace number 6
#    bindsym $mod+Shift+7 move container to workspace number 7
#    bindsym $mod+Shift+8 move container to workspace number 8
#    bindsym $mod+Shift+9 move container to workspace number 9
#    bindsym $mod+Shift+0 move container to workspace number 10
```
2. Add following keybindings to the script. "xxx" will be the directory that the script is in.
```
## Workroom implementaton:
    #Reset workroom to 1
    # for workspace n0, as this workspace's number is set from a file and + 1 to it.
    # This is to prevent loading n0 when restarting sway from tty, while the file's been written by the "swayWorkroom.sh" script.
    set $swayScriptsTmpDir "/tmp/swayScriptsTmpDir"
    set $workroomTmpFile $swayScriptsTmpDir/swayWorkroomSwitched.txt
    exec echo 1 > $workroomTmpFile

    # switch workroom
    bindsym Alt+Shift+q exec "${HOME}/xxx/swayWorkroom.sh -q"
    bindsym Alt+Shift+w exec "${HOME}/xxx/swayWorkroom.sh -w"
    bindsym Alt+Shift+e exec "${HOME}/xxx/swayWorkroom.sh -e"

    # Navigate
    bindsym $mod+Escape exec "${HOME}/Bin/swayWorkroom.sh -x 1"
    bindsym $mod+1 exec "${HOME}/xxx/swayWorkroom.sh -x 1"
    bindsym $mod+2 exec "${HOME}/xxx/swayWorkroom.sh -x 2"
    bindsym $mod+3 exec "${HOME}/xxx/swayWorkroom.sh -x 3"
    bindsym $mod+4 exec "${HOME}/xxx/swayWorkroom.sh -x 4"
    bindsym $mod+5 exec "${HOME}/xxx/swayWorkroom.sh -x 5"
    bindsym $mod+6 exec "${HOME}/xxx/swayWorkroom.sh -x 6"
    bindsym $mod+7 exec "${HOME}/xxx/swayWorkroom.sh -x 7"
    bindsym $mod+8 exec "${HOME}/xxx/swayWorkroom.sh -x 8"
    bindsym $mod+9 exec "${HOME}/xxx/swayWorkroom.sh -x 9"
    bindsym $mod+0 exec "${HOME}/xxx/swayWorkroom.sh -x 0"

    # Move focused container to workspace
    bindsym $mod+Shift+1 exec "${HOME}/xxx/swayWorkroom.sh -x --to1"
    bindsym $mod+Shift+2 exec "${HOME}/xxx/swayWorkroom.sh -x --to2"
    bindsym $mod+Shift+3 exec "${HOME}/xxx/swayWorkroom.sh -x --to3"
    bindsym $mod+Shift+4 exec "${HOME}/xxx/swayWorkroom.sh -x --to4"
    bindsym $mod+Shift+5 exec "${HOME}/xxx/swayWorkroom.sh -x --to5"
    bindsym $mod+Shift+6 exec "${HOME}/xxx/swayWorkroom.sh -x --to6"
    bindsym $mod+Shift+7 exec "${HOME}/xxx/swayWorkroom.sh -x --to7"
    bindsym $mod+Shift+8 exec "${HOME}/xxx/swayWorkroom.sh -x --to8"
    bindsym $mod+Shift+9 exec "${HOME}/xxx/swayWorkroom.sh -x --to9"
    bindsym $mod+Shift+0 exec "${HOME}/xxx/swayWorkroom.sh -x --to0"
```
3. Refresh sway and you're good to go. :)
  
# Contribution
  Just post an issue, if you encounter any problems. I'll fix it if I can, and when I feel not bad.
