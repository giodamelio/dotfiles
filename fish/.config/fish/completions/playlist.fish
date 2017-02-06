# Autocomplete playlist names
function __fish_complete_playlist
    ls ~/.mpd/playlists | sed "s/\.m3u//g"
end
complete -c playlist -f -a "(__fish_complete_playlist)"

