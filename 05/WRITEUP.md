# Day 5 writeup

Language: Erlang

TO RUN: compile with erlc, and run with:
erl -noshell -s part2 start -s init stop 

1. Erlang is an entirely new way to think about coding.
    It hurt my brain.
2. I didn't know I was capable of making code this bad. The 
    runtimes are something out of a B horror film.
3. part 2 was too much for my algorithm with its horrific time complexity.
    I just manually created 26 different input files, one for each letter
    and ran each by hand.

problem: 
    1. remove all instances of a capital letter followed by a lowercase one
        in a given long ass string.
        ex: aAbcDdeEeFfh -> bceh
    2. one letter was messing up everything. find that letter, remove it, 
        and re-react the string.
        (my letter was k)
