set -q MARLIN_HISTORY
  or set -g MARLIN_HISTORY "$HOME/.marlin-history"


function marlin:pwd-listener --on-variable PWD
  marlin:log $PWD
end

expand-word -p '^,.*$' -e marlin:complete
