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
		( NOT_EXPLAINED_FULL_OBS_SEQUENCE )
	)
	(:goal
		(and 
		( TOWER3-FORMED )
		( EXPLAINED_FULL_OBS_SEQUENCE )
		)
	)
	(:metric minimize (total-cost))

)
