module eprover4.

accumulate lkf-kernel.
accumulate eprover.
accumulate resolution_steps.

/*
Exactly eprover2 but order reversed between 9 and 12 below
*/
problem "eprover4" (n ((h(g(g(c)))) == (g(g(g(c))))) !-!
(some (X2\ (some (X3\ p ((h(f (g X2) X3)) == (g(X3))))) )) !-!
(some (X1\ p ((f X1 (g X1)) == (g(X1))))) )
(rsteps [resolv (pid (idx 9)) (pid (idx 12)) 6, resolv (pid (idx 4)) (pid (idx 6)) 1] estate)
 (map [
pr 4 (n ((h(g(g(c)))) == (g(g(g(c)))))),
pr 9 (some (X2\ (some (X3\ p ((h(f (g X2) X3)) == (g(X3))))) )) ,
pr 1 t+,
pr 6 (some (X1\ p ((h(g(g(X1)))) == (g(g(g(X1))))))),
pr 12 (some (X1\ p ((f X1 (g X1)) == (g(X1)))))
]).


/* SIgnature */
inSig  g.
inSig  h.
inSig  f.

