Randomgrams
===========

Usage: ./bin/randomgrams \<N\>

\<N\> is an integer used to generate a random character string of that
length.

Randomgrams then finds and prints the English anagrams based on the generated string.

**NB**: the program assumes a standard Linux installation with an English
dictionary file located at /usr/share/dict/words.

**NB**: the program generates and seeks for N! possible anagrams. This can
easily amount to a non-halting operation given only a relatively small N. (10!
is 3,628,800).

