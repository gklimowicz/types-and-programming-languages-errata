# Combined Errata for _Types and Programming Languages_ by Benjamin C. Pierce
There are four sets of errata for Pierce's book,
which can be found on his web site
[Types and Programming Languages errata](http://www.cis.upenn.edu/~bcpierce/tapl/errata.txt).

We add a fifth file
that cross-references errata in the exercise solutions
to the pages where the exercise itself appears.

The programs here combine these different lists into a single document,
ordered by page number.

Hopefully, this will make the errata easier to follow
and to note in your edition of the text.

Note that since there appear to be several editions of the book.
The errata list here may not exactly match the edition you have.


## Hand-edited final result file
The file `errata-combined-cleaned-up.txt` is the result
of manually editing a file that is automatically created by the scripts
in the `bin` directory and the `Makefile`.
This is probably the file you are looking for
unless you are interested in improving the scripts.

The `errata-combined.txt` file is created by the `make` command.
There are some deficiencies in this file, though, especially when there are multiple
errata entries on the same page.
The scripts aren't clever enough to know how to put them in the right order,
given how the errata locations are described within a page.
(That's why the hand-edited file mentioned above is better.)


# Method
There is a Makefile that drives a set of shell and AWK scripts,
as that is how the Anasazi roll.

For each source errata file, we create a canonical representation of the errata.
There is one line for each error. Each line is of set of fields separated by "%".
("%" is the most accessible ASCII character not found in the errata files themselves.)

Fields:

1. page number
1. location description on the page
1. severity: empty if very trivial, "t" if trivial, "nt" if non-trivial
1. source: 1, 2, 3 for the edition of Pierce as he organizes them, "s" for Sumii, "r" for the exercise cross-reference.
1. text of the errata, as concatenate lines separated by \a characters.

To combine them,
we concatenate the canonical errata files,
sort the lines by page number,
and expand the lines back to something like their original form.

We take no care to deal with page numbers
that are roman numerals to make sure they show up first.
It just worked out that way.
