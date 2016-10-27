function marlin:find -d 'Find all directories matching patterns in frecency order'
  echo -ns $argv\n | read -z -l -x marlin_patterns

  command awk '
    BEGIN {
      # Read search patterns from Fish.
      split(tolower(ENVIRON["marlin_patterns"]), patterns, "\n");
    }
    {
      # Ensure this record matches.
      for (pattern in patterns) {
        if (!match(tolower($2), patterns[pattern])) {
          next;
        }
      }

      # Update score value and keep paths sorted.
      score = $1 * NR;
      for (i = 1; i <= NR; i++) {
        if (score > scores[i]) {
          for (j = NR; j > i; j--) {
            scores[j] = scores[j - 1];
            paths[j] = paths[j - 1];
          }
          scores[i] = score;
          paths[i] = $2;
          break;
        }
      }
    }
    END {
      # Print out matching paths in order.
      for (i = 1; i <= NR; i++) {
        sub(ENVIRON["HOME"], "~", paths[i]);
        print paths[i];
      }
    }
  ' $MARLIN_HISTORY
end
