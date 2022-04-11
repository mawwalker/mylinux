# Set path by host

if test "$hostname" = "osz" 
    set -x fish_user_paths $HOME/bin $HOME/go/bin $HOME/.gem/ruby/2.7.0/bin
end

set -gx LIBVA_DRIVER_NAME 'iHD'
set -x VAGRANT_DEFAULT_PROVIDER 'libvirt'
