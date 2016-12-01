(define (problem blocksworld-color)
(:domain blocksworld)

(:objects 
red blue green yellow pink - blocks
)

(:init
(handsempty)
(clear red)
(clear blue)
(clear green)
(clear yellow)
(clear pink)
(ontable red)
(ontable blue)
(ontable green)
(ontable yellow)
(ontable pink)
)

(:goal
(and
(tower3-formed)
)

)
)
