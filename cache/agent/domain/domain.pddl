(define (domain blocksworld)

(:requirements :typing :equality)

(:types 
location locatable - object
blocks - locatable
)

(:predicates
(tower1-formed)
(tower2-formed)
(tower3-formed)
(handsempty)
(clear ?b - blocks)
(holding ?b - blocks)
(on ?b1 ?b2 - blocks)
(ontable ?b - blocks)
)

(:action stack
    :parameters (?b1 ?b2 - blocks)
    :precondition (and
    		  (not (= ?b1 ?b2))
    		  (holding ?b1)
             	  (clear ?b2)
 		  )
    :effect (and
    	    (on ?b1 ?b2)
	    (handsempty)
            (clear ?b1)
            (not (clear ?b2))
            (not (holding ?b1))
       	    )
)

(:action unstack
    :parameters (?b1 ?b2 - blocks)
    :precondition (and
    		  (not (= ?b1 ?b2))
		  (handsempty)
		  (on ?b1 ?b2)
                  (clear ?b1)
                  )
    :effect (and
       	    (not (on ?b1 ?b2))
       	    (not (handsempty))
       	    (not (clear ?b1))
       	    (clear ?b2)
       	    (holding ?b1)
       )
)

(:action pickup
    :parameters (?b - blocks)
    :precondition (and
		  (handsempty)
                  (ontable ?b)
                  (clear ?b)
                  )
    :effect (and
            (holding ?b)
            (not (ontable ?b))
            (not (clear ?b))
            (not (handsempty))
            )
)

(:action putdown
    :parameters (?b - blocks)
    :precondition (and
                  (holding ?b)
                  )
    :effect (and
            (handsempty)
            (clear ?b)
            (ontable ?b)
            (not (holding ?b))
       	    )
)

(:action form2tower
         :parameters (?b1 ?b2 - blocks)
         :precondition (and
                       (on ?b1 ?b2)
                       (ontable ?b2)
                       (clear ?b1)
                       )
        :effect (and
		(tower2-formed)
                )
)

(:action form3tower
         :parameters (?b1 ?b2 ?b3 - blocks)
         :precondition (and
                       (on ?b1 ?b2)
                       (on ?b2 ?b3)
                       (ontable ?b3)
                       (clear ?b1)
                       )
        :effect (and
		(tower3-formed)
                )
)

)

