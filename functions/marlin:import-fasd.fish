function marlin:import-fasd -d 'Import history from fasd'
  if not test -f $HOME/.fasd
    echo 'fasd history file not found'
    return 1
  end

  echo -n 'Importing directory entries from fasd... '

  set -l IFS '|'
  while read -l path weight atime
    if test -d $path
      marlin:log $path
    end
  end < $HOME/.fasd

  echo 'Done!'

  return 0
end
