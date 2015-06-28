# fuck

Native bash (bounded) last command correction, inspired by [thefuck](https://github.com/nvbn/thefuck)

--------------------------

## How it works
- `fuck` find the name of the executable with the minimum levenshtein distance from the believed typo of the last command as the best guess. The believed typo of the last command is found by running that command once more and taking `<COMMAND>` from the string `<COMMAND>: command not found`

--------------------------

## How to use it
In order to use the C implementation of levenshtein distance, use

	make distance

In order to retrieve the exit status of the last command, we cannot detach a child process for executing `fuck`, therefore immediately after trying to execute a typo, use

    source ./fuck
from where `fuck` is located (***the same directory in which `distance.c` must also be located***)

### Example
    
    $ asdf asdf
    No command 'asdf' found, did you mean:
	Command 'asdfg' from package 'aoeui' (universe)
	Command 'sdf' from package 'sdf' (universe)
	Command 'sadf' from package 'sysstat' (main)
	asdf: command not found

	source ./fuck
	Last command: asdf asdf
	Typo: asdf
	Best replacement found: __ports
	__ports __ports

**Note** it was purposely made that the last line would not get executed but just printed to the screen for the user to execute themself.

-------------------
### Other 

`distance.c` is a C implementation of the Levenshtein distance of two strings from [this source](https://en.wikibooks.org/wiki/Algorithm_Implementation/Strings/Levenshtein_distance#C)
