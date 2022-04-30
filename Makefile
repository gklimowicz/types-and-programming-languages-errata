ERRATA=errata-pierce-1.txt errata-pierce-2.txt errata-pierce-3.txt \
	errata-sumii.txt

CANONICALIZED=canon.pierce-1 canon.pierce-2 canon.pierce-3 \
	canon.sumii canon.exercises-back-refs

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

canon.exercises-back-refs:	bin/canon-pierce errata-exercises-back-refs.txt
	bin/canon-pierce -s r <errata-exercises-back-refs.txt >"$@"

errata-exercises-back-refs.txt: ${ERRATA} Makefile
	(echo "SUBSTANTIVE ERRORS"; echo; \
	 sed -n -e 's/.*p[.]* \(5[0-9][0-9][^,]*\).*[Ss]olution \([1-9][0-9]*\.[1-9][0-9]*\.[1-9][0-9]*\).*/p. X, Exercise \2%    See the errata in the solution on p. \1%/p' \
	      ${ERRATA} \
	 | sort -t ' ' -k 4n -u \
	 | tr '%' '\n' \
	 | sed -e '/ 5\.2\.4/s/X/61/' \
		   -e '/ 5\.3\.8/s/X/73/' \
		   -e '/ 11\.4\.1/s/X/123/' \
		   -e '/ 11\.8\.2/s/X/130/' \
		   -e '/ 12\.1\.7/s/X/152/' \
		   -e '/ 17\.3\.1/s/X/223/' \
		   -e '/ 21\.5\.2/s/X/291/' \
		   -e '/ 21\.8\.5/s/X/302/' \
		   -e '/ 23\.4\.9/s/X/350/' \
		   -e '/ 25\.2\.1/s/X/382/' \
		   -e '/ 32\.7\.2/s/X/485/') >"$@"

.DUMMY: clean
clean:
	rm -f ${CANONICALIZED}
