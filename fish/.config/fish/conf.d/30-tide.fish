# Keep Tide's two-line prompt deliberately minimal: no Git, user, host, or
# right-side modules. The current directory is always shown in full

set -g tide_left_prompt_items pwd newline character
set -g tide_right_prompt_items
set -g tide_pwd_truncate_margin 0

# Only the current prompt on screen
set -g tide_prompt_transient_enabled true

# A root shell keeps the same layout but makes its elevated privileges obvious
# without adding a root@host context item.
if fish_is_root_user
    set -g tide_character_icon '#'
    set -g tide_character_color red
    set -g tide_pwd_color_anchors red
    set -g tide_pwd_color_dirs red
    set -g tide_pwd_color_truncated_dirs red
end
