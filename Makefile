ORIG=errata-pierce-1.txt errata-pierce-2.txt errata-pierce-3.txt \
	errata-sumii.txt

CANON_ORIG=canon.pierce-1 canon.pierce-2 canon.pierce-3	canon.sumii
CANONICALIZED=${CANON_ORIG} canon.exercises-back-refs

errata-combined.txt: ${CANONICALIZED} Makefile bin/expand-errata
	sort -t '%' -k 1n -k 2 ${CANONICALIZED} \
    | bin/expand-errata >"$@"

canon.sumii:	bin/canon-sumii errata-sumii.txt
	bin/canon-sumii <errata-sumii.txt >"$@"

canon.pierce-1:	bin/canon-pierce errata-pierce-1.txt
	bin/canon-pierce -s 1 <errata-pierce-1.txt >"$@"

canon.pierce-2:	bin/canon-pierce errata-pierce-2.txt
	bin/canon-pierce -s 2 <errata-pierce-2.txt >"$@"

canon.pierce-3:	bin/canon-pierce errata-pierce-3.txt
	bin/canon-pierce -s 3 <errata-pierce-3.txt >"$@"

# Extract exercise-related errata and create cross-refs to them.
canon.exercises-back-refs: Makefile bin/canon-cross-ref-exercises \
		${CANON_ORIG}
	sort -s -t '%' -k 1n \
		 canon.pierce-1 canon.pierce-2 canon.pierce-3 canon.sumii \
	| bin/canon-cross-ref-exercises >"$@"

.DUMMY: clean
clean:
	rm -f ${CANONICALIZED}
