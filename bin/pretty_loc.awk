# Given a page, location, severity and source,
# return a canonical string for that location.
#
# E.g., "p. 503, solution 5.3.8 [Pierce 1st ed. **]"
function pretty_loc(page, loc, sev, source,    pretty) {
     pretty = "p. " page
     if (loc != "")
         pretty = pretty ", " loc
     if (source == "s")
         pretty = pretty " [Sumii"
     else if (source == "1")
         pretty = pretty " [Pierce 1st ed."
     else if (source == "2")
         pretty = pretty " [Pierce 2nd ed."
     else if (source == "3")
         pretty = pretty " [Pierce 3rd ed."
     else if (source == "r")
         pretty = pretty " [Pierce exercises"
     if (sev == "t")
         pretty = pretty " *]"
     else if (sev == "nt")
         pretty = pretty " **]"
     else
         pretty = pretty "]"
     return pretty;
}
