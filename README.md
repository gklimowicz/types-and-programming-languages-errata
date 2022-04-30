# Combined Errata for _Types and Programming Languages_ by Benjamin C. Pierce
There are four sets of errata for Pierce's book, which can be found on his web site [Types and Programming Languages errata](http://www.cis.upenn.edu/~bcpierce/tapl/errata.txt).

The program here can combine these different sets into a single set, ordered by page number.
We augment those four files with one that cross-references errata in the exercise solutions to the exercise itself.

Hopefully, this will make the errata easier to follow and to note in your edition of the text.

# Method
This is a set of shell and AWK scripts, as that is how the Anasazi roll.

For each source errata file, we create a canonical representation of the errata.
There is one line for each error. Each line is of set of fields separated by "%".
("%" is the most accessible ASCII character not found in the errata files themselves.)

Fields:

1. page number
1. location description on the page
1. severity: empty if very trivial, "t" if trivial, "nt" if non-trivial
1. source: 1, 2, 3 for the edition of Pierce as he organizes them, "s" for Sumii, "r" for the exercise cross-reference.
5. text of the errata, as concatenate lines separated by \a characters.

To combine, we concatenate the canonical errata files, sort by page number, and expand the lines back to something like their original form.
We take minimal care to deal with page numbers that are roman numerals to make sure they show up first.
