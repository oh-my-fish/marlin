function marlin:log -a path -d 'Record usage of a path'
  # Canonicalize the path.
  set -lx path (builtin fish_realpath $path)

  # Ensure the history file exists.
  test -f $MARLIN_HISTORY
    or echo -n > $MARLIN_HISTORY

  # Parse existing records, removing the record for the given path and inserting it at the end with an incremented score.
  command awk '
    {
      if ($2 == ENVIRON["path"]) {
        score = $1;
      } else {
        print $0;
      }
    }
    END {
      print (score + 1) "\t" ENVIRON["path"];
    }
  ' $MARLIN_HISTORY > $MARLIN_HISTORY.%self
    or return 1

  # If successful, update the history file.
  command mv $MARLIN_HISTORY.%self $MARLIN_HISTORY
end