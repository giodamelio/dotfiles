# Set our editor
set -U EDITOR vim

# Append our bin path
set -Ux PATH ~/.dotfiles/bin $PATH

# Use the fortune command as a greeting
function fish_greeting
    fortune -as
end

