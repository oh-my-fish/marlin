# Marlin
A silvery, fast learning and interactive directory navigator. Marlin provides quick access to your most frequently and recently used directories from right in your [Fish] shell.

Marlin is similar in design to popular scripts like [fasd], [z], and [autojump], but is designed to take advantage of the unique features of Fish to provide an even more powerful tool. It is also designed to have a simpler implementation to provide the best performance and not lag your shell.

Here is a list of key features:

- **Lightweight on resources**: Marlin only runs when you change directories or try to complete a path; it does not have pre-exec or post-exec hooks.
- **Path expansion for any command**: Paths can be searched and expanded in any command, not just `cd`.
- **Frequent and recent paths**: Results are ordered based on both the frequency you visit a directory and how recently you visited it.
- **Interactive searching**: If more than one result matches an expansion, you can interactively choose a directory using an interactive filter tool like [fzf], [selecta], or [peco].

## Install
Install with [Oh My Fish][omf]:

```fish
$ omf install marlin
```

That's it, Marlin is ready to go!

## Usage
Marlin learns the directories you frequent while you navigate the filesystem. After `cd`ing around a few times, you can recall those directories using _comma expansion_, Marlin's way of substituting queries with a path. A comma expansion has the following form:

    ,query1,query2,query3,...

Each query is a case-insensitive regular expression that is applied to your directory history and filter only matching directories. To execute the expansion, just press the <kbd>TAB</kbd> key and the query will be replaced dynamically with the matching result. You can continue to press <kbd>TAB</kbd> to switch through all of the matching results in order of relevancy.

If you have an interactive filter tool installed like [fzf], [selecta], or [peco], you can use one of those tools to page through multiple results instead. The popular tools will be used automatically if installed. To use a specific tool, set the `$FILTER` environment variable to the command desired. You can also disable interactive filtering by setting `$FILTER` to be empty:

```fish
set -g FILTER
```

## Importing history
You can import your history from fasd by running the `marlin:import-fasd` command.

## License
[MIT][mit] © [sagebind][author] et [al][contributors]


[author]: http://github.com/sagebind
[autojump]: https://github.com/wting/autojump
[contributors]: https://github.com/oh-my-fish/plugin-fasd/graphs/contributors
[fasd]: https://github.com/clvv/
[fish]: http://fishshell.com
[fzf]: https://github.com/junegunn/fzf
[mit]: http://opensource.org/licenses/MIT
[omf]: https://www.github.com/oh-my-fish/oh-my-fish
[peco]: https://github.com/peco/peco
[selecta]: https://github.com/garybernhardt/selecta
[z]: https://github.com/rupa/z
