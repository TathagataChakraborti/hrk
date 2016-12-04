(define
	(problem grounded-BLOCKSWORLD-COLOR)
	(:domain grounded-BLOCKSWORLD)
	(:init
		(= (total-cost) 0)
		( ONTABLE_PINK )
		( ONTABLE_YELLOW )
		( ONTABLE_GREEN )
		( ONTABLE_BLUE )
		( ONTABLE_RED )
		( CLEAR_PINK )
		( CLEAR_YELLOW )
		( CLEAR_GREEN )
		( CLEAR_BLUE )
		( CLEAR_RED )
		( HANDSEMPTY )
	)
	(:goal
		(and 
		( TOWER3-FORMED )
		)
	)

)
