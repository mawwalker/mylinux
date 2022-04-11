# See https://github.com/flatpak/flatpak/issues/3109

# Flatpak directories don't get picked up anymore, so we'll mimic /etc/profile.d/flatpak*.sh
set -ga fish_user_paths ~/.local/share/flatpak/exports/bin /var/lib/flatpak/exports/bin
set -gx --path XDG_DATA_DIRS ~/.local/share/flatpak/exports/share
for install_dir in (flatpak --installations)
    set -gxa XDG_DATA_DIRS $install_dir/exports/share
end

# These should also be here
set -gxa XDG_DATA_DIRS /usr/local/share /usr/share
