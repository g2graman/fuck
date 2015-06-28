C=gcc

distance: distance.o

distance.o: distance.c
	gcc -Wall -ansi -c distance.c
	
clean:
	rm distance.o

.PHONY: clean
