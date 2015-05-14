module col063bis.

accumulate lkf-kernel.
accumulate eprover.
accumulate resolution_steps.

resProblem "col063bis" [
(pr 16 (all (X1\ (all (X2\ (n (( apply ( apply t X1 ) X2 ) == ( apply X2 X1 ))) )) )) ),
(pr 14 (all (X1\ (all (X2\ (all (X3\ (n (( apply ( apply ( apply b X1 ) X2 ) X3 ) == ( apply X1 ( apply X2 X3 ) ))) )) )) )) ),
(pr 8 (all (X1\ (p (( apply ( apply ( apply X1 ( f X1 ) ) ( g X1 ) ) ( h X1 ) ) == ( apply ( apply ( h X1 ) ( g X1 ) ) ( f X1 ) ))) )) )] 
(rsteps [pm (id (idx 8)) (id (idx 14)) 7, pm (id (idx 7)) (id (idx 16)) 6, pm (id (idx 6)) (id (idx 14)) 5, pm (id (idx 5)) (id (idx 14)) 4, pm (id (idx 4)) (id (idx 14)) 3, pm (id (idx 3)) (id (idx 14)) 2, pm (id (idx 2)) (id (idx 16)) 1, pm (id (idx 1)) (id (idx 16)) 0] estate )
 (map [
pr 6 (all (X2\ (all (X1\ (p (( apply ( apply ( apply ( apply X2 ( f ( apply ( apply b ( apply t X1 ) ) X2 ) ) ) X1 ) ( g ( apply ( apply b ( apply t X1 ) ) X2 ) ) ) ( h ( apply ( apply b ( apply t X1 ) ) X2 ) ) ) == ( apply ( apply ( h ( apply ( apply b ( apply t X1 ) ) X2 ) ) ( g ( apply ( apply b ( apply t X1 ) ) X2 ) ) ) ( f ( apply ( apply b ( apply t X1 ) ) X2 ) ) ))) )) )),
pr 0 f-,
pr 7 (all (X1\ (all (X2\ (p (( apply ( apply ( apply X1 ( apply X2 ( f ( apply ( apply b X1 ) X2 ) ) ) ) ( g ( apply ( apply b X1 ) X2 ) ) ) ( h ( apply ( apply b X1 ) X2 ) ) ) == ( apply ( apply ( h ( apply ( apply b X1 ) X2 ) ) ( g ( apply ( apply b X1 ) X2 ) ) ) ( f ( apply ( apply b X1 ) X2 ) ) ))) )) )),
pr 4 (all (X1\ (all (X2\ (p (( apply ( apply ( apply X1 ( f ( apply ( apply b ( apply t X2 ) ) ( apply ( apply b b ) X1 ) ) ) ) ( apply X2 ( g ( apply ( apply b ( apply t X2 ) ) ( apply ( apply b b ) X1 ) ) ) ) ) ( h ( apply ( apply b ( apply t X2 ) ) ( apply ( apply b b ) X1 ) ) ) ) == ( apply ( apply ( h ( apply ( apply b ( apply t X2 ) ) ( apply ( apply b b ) X1 ) ) ) ( g ( apply ( apply b ( apply t X2 ) ) ( apply ( apply b b ) X1 ) ) ) ) ( f ( apply ( apply b ( apply t X2 ) ) ( apply ( apply b b ) X1 ) ) ) ))) )) )),
pr 3 (all (X1\ (all (X2\ (all (X3\ (p (( apply ( apply ( apply X1 ( apply X2 ( f ( apply ( apply b ( apply t X3 ) ) ( apply ( apply b b ) ( apply ( apply b X1 ) X2 ) ) ) ) ) ) ( apply X3 ( g ( apply ( apply b ( apply t X3 ) ) ( apply ( apply b b ) ( apply ( apply b X1 ) X2 ) ) ) ) ) ) ( h ( apply ( apply b ( apply t X3 ) ) ( apply ( apply b b ) ( apply ( apply b X1 ) X2 ) ) ) ) ) == ( apply ( apply ( h ( apply ( apply b ( apply t X3 ) ) ( apply ( apply b b ) ( apply ( apply b X1 ) X2 ) ) ) ) ( g ( apply ( apply b ( apply t X3 ) ) ( apply ( apply b b ) ( apply ( apply b X1 ) X2 ) ) ) ) ) ( f ( apply ( apply b ( apply t X3 ) ) ( apply ( apply b b ) ( apply ( apply b X1 ) X2 ) ) ) ) ))) )) )) )),
pr 5 (all (X1\ (all (X2\ (all (X3\ (p (( apply ( apply ( apply ( apply X1 ( apply X2 ( f ( apply ( apply b ( apply t X3 ) ) ( apply ( apply b X1 ) X2 ) ) ) ) ) X3 ) ( g ( apply ( apply b ( apply t X3 ) ) ( apply ( apply b X1 ) X2 ) ) ) ) ( h ( apply ( apply b ( apply t X3 ) ) ( apply ( apply b X1 ) X2 ) ) ) ) == ( apply ( apply ( h ( apply ( apply b ( apply t X3 ) ) ( apply ( apply b X1 ) X2 ) ) ) ( g ( apply ( apply b ( apply t X3 ) ) ( apply ( apply b X1 ) X2 ) ) ) ) ( f ( apply ( apply b ( apply t X3 ) ) ( apply ( apply b X1 ) X2 ) ) ) ))) )) )) )),
pr 1 (all (X1\ (p (( apply ( apply X1 ( f ( apply ( apply b ( apply t t ) ) ( apply ( apply b b ) ( apply ( apply b b ) X1 ) ) ) ) ) ( apply ( h ( apply ( apply b ( apply t t ) ) ( apply ( apply b b ) ( apply ( apply b b ) X1 ) ) ) ) ( g ( apply ( apply b ( apply t t ) ) ( apply ( apply b b ) ( apply ( apply b b ) X1 ) ) ) ) ) ) == ( apply ( apply ( h ( apply ( apply b ( apply t t ) ) ( apply ( apply b b ) ( apply ( apply b b ) X1 ) ) ) ) ( g ( apply ( apply b ( apply t t ) ) ( apply ( apply b b ) ( apply ( apply b b ) X1 ) ) ) ) ) ( f ( apply ( apply b ( apply t t ) ) ( apply ( apply b b ) ( apply ( apply b b ) X1 ) ) ) ) ))) )),
pr 2 (all (X1\ (all (X2\ (p (( apply ( apply X1 ( f ( apply ( apply b ( apply t X2 ) ) ( apply ( apply b b ) ( apply ( apply b b ) X1 ) ) ) ) ) ( apply ( apply X2 ( g ( apply ( apply b ( apply t X2 ) ) ( apply ( apply b b ) ( apply ( apply b b ) X1 ) ) ) ) ) ( h ( apply ( apply b ( apply t X2 ) ) ( apply ( apply b b ) ( apply ( apply b b ) X1 ) ) ) ) ) ) == ( apply ( apply ( h ( apply ( apply b ( apply t X2 ) ) ( apply ( apply b b ) ( apply ( apply b b ) X1 ) ) ) ) ( g ( apply ( apply b ( apply t X2 ) ) ( apply ( apply b b ) ( apply ( apply b b ) X1 ) ) ) ) ) ( f ( apply ( apply b ( apply t X2 ) ) ( apply ( apply b b ) ( apply ( apply b b ) X1 ) ) ) ) ))) )) ))
]).

inSig h.
inSig apply.
inSig g.
inSig f.


