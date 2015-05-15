module col052bis.

accumulate lkf-kernel.
accumulate eprover.
accumulate resolution_steps.

resProblem "col052bis" [
(pr 8 (all (X1\ (n (( response c ( common_bird X1 ) ) == ( response X1 ( common_bird X1 ) ))) )) ),
(pr 7 (all (X1\ (all (X2\ (all (X3\ (n (( response ( compose X1 X2 ) X3 ) == ( response X1 ( response X2 X3 ) ))) )) )) )) ),
(pr 5 (n (c == ( compose a b ))) ),
(pr 2 (all (X1\ (p (( response a X1 ) == ( response odd_bird X1 ))) )) )] 
(rsteps [pm (id (idx 7)) (id (idx 5)) 3, pm (id (idx 2)) (id (idx 3)) 1, pm (id (idx 7)) (id (idx 8)) 6, pm (id (idx 1)) (id (idx 6)) 0] estate )
 (map [
pr 6 (all (X1\ (all (X2\ (n (( response c ( common_bird ( compose X1 X2 ) ) ) == ( response X1 ( response X2 ( common_bird ( compose X1 X2 ) ) ) ))) )) )),
pr 0 f-,
pr 1 (all (X1\ (p (( response c X1 ) == ( response odd_bird ( response b X1 ) ))) )),
pr 3 (all (X1\ (n (( response c X1 ) == ( response a ( response b X1 ) ))) ))
]).

inSig response.
inSig compose.
inSig common_bird.

