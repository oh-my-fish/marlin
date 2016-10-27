function marlin:complete
  set -l IFS ','
  commandline -t | read -a -l patterns

  set -l expansions (marlin:find $patterns)

  if set -q expansions[1]
    echo -ns $expansions\n
    return 0
  end

  return 1
end
