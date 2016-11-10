function marlin:log -a path -d 'Record usage of a path'
  # Canonicalize the path.
  set -lx path (realpath $path)

  # Ensure the history file exists.
  test -f $MARLIN_HISTORY
    or echo -n > $MARLIN_HISTORY

  # Parse existing records, removing the record for the given path and inserting it at the end with an incremented score.
  command awk '
    {
      # If the current record matches the path we are logging, save it and move it to the end of file.
      if ($2 == ENVIRON["path"]) {
        score = $1;
      }
      # Before we pass through this record, check if the path still exists. If not, remove the record.
      else if (!system("test -d " $2)) {
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
