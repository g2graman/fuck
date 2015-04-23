# fuck

Native bash (bounded) last command correction, inspired by [thefuck](https://github.com/nvbn/thefuck)

--------------------------

## How it works
- `fuck` looks through (the root level of) each directory found in `$PATH` and marks the executable with the minimum levenshtein distance from the believed typo of the last command as the best guess. The believed typo of the last command is found by running that command once more and taking `<COMMAND>` from the string `<COMMAND>: command not found`

- `fuck` uses a variable named `$CHECK_LIMIT` which is currently hard-coded to bound the number of executable files it verifies against, but `fuck` will soon be modularized to accept a parameter for setting `$CHECK_LIMIT`
--------------------------

## How to use it
In order to retrieve the exit status of the last command, we cannot detach a child process for executing `fuck`, therefore immediately after trying to execute a typo, use

    source ./fuck
from where `fuck` is located (***the same directory in which `distance.sh` must also be located***)

### Example
    
    $ asdf parameter1 parameter2
    No command 'asdf' found, did you mean:
	Command 'asdfg' from package 'aoeui' (universe)
	Command 'sdf' from package 'sdf' (universe)
	Command 'sadf' from package 'sysstat' (main)
	asdf: command not found

	source ./fuck
	Last command: asdf parameter1 parameter2
	Typo: asdf
	Best replacement found: cdiff
	cdiff parameter1 parameter2

**Note** it was purposely made that the last line would not get executed but just printed to the screen for the user to execute themself.

-------------------
### Other 

`distance.sh` is a slight modification  (of a Bash implementation of the Levenshtein distance of two strings) from [this source](http://en.wikibooks.org/wiki/Algorithm_Implementation/Strings/Levenshtein_distance#Bash)