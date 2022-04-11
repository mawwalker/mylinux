set -x LANG 'fr_FR.UTF-8'
set -x EDITOR 'nvim'
set -x VISUAL 'nvim'
set -x PAGER 'most'
set -gx SYSTEMD_PAGER 'less'
set -U fish_greeting ""

# Remove time right prompt
function fish_right_prompt
  #intentionally left blank
end

# Start starfish prompt
starship init fish | source
