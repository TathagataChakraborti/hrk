(define
	(domain grounded-BLOCKSWORLD)
	(:requirements :strips :action-costs)
	(:predicates
		( HOLDING_RED )
		( HOLDING_BLUE )
		( HOLDING_GREEN )
		( HOLDING_YELLOW )
		( HOLDING_PINK )
		( ON_RED_BLUE )
		( ON_RED_GREEN )
		( ON_RED_YELLOW )
		( ON_RED_PINK )
		( ON_BLUE_RED )
		( ON_BLUE_GREEN )
		( ON_BLUE_YELLOW )
		( ON_BLUE_PINK )
		( ON_GREEN_RED )
		( ON_GREEN_BLUE )
		( ON_GREEN_YELLOW )
		( ON_GREEN_PINK )
		( ON_YELLOW_RED )
		( ON_YELLOW_BLUE )
		( ON_YELLOW_GREEN )
		( ON_YELLOW_PINK )
		( ON_PINK_RED )
		( ON_PINK_BLUE )
		( ON_PINK_GREEN )
		( ON_PINK_YELLOW )
		( TOWER2-FORMED )
		( TOWER3-FORMED )
		( HANDSEMPTY )
		( CLEAR_PINK )
		( CLEAR_YELLOW )
		( CLEAR_GREEN )
		( CLEAR_BLUE )
		( CLEAR_RED )
		( ONTABLE_PINK )
		( ONTABLE_YELLOW )
		( ONTABLE_GREEN )
		( ONTABLE_BLUE )
		( ONTABLE_RED )
	) 
	(:action FORM3TOWER_PINK_YELLOW_PINK
		:parameters ()
		:precondition
		(and
			( CLEAR_PINK )
			( ONTABLE_PINK )
			( ON_YELLOW_PINK )
			( ON_PINK_YELLOW )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_PINK_YELLOW_GREEN
		:parameters ()
		:precondition
		(and
			( CLEAR_PINK )
			( ONTABLE_GREEN )
			( ON_YELLOW_GREEN )
			( ON_PINK_YELLOW )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_PINK_YELLOW_BLUE
		:parameters ()
		:precondition
		(and
			( CLEAR_PINK )
			( ONTABLE_BLUE )
			( ON_YELLOW_BLUE )
			( ON_PINK_YELLOW )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_PINK_YELLOW_RED
		:parameters ()
		:precondition
		(and
			( CLEAR_PINK )
			( ONTABLE_RED )
			( ON_YELLOW_RED )
			( ON_PINK_YELLOW )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_PINK_GREEN_PINK
		:parameters ()
		:precondition
		(and
			( CLEAR_PINK )
			( ONTABLE_PINK )
			( ON_GREEN_PINK )
			( ON_PINK_GREEN )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_PINK_GREEN_YELLOW
		:parameters ()
		:precondition
		(and
			( CLEAR_PINK )
			( ONTABLE_YELLOW )
			( ON_GREEN_YELLOW )
			( ON_PINK_GREEN )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_PINK_GREEN_BLUE
		:parameters ()
		:precondition
		(and
			( CLEAR_PINK )
			( ONTABLE_BLUE )
			( ON_GREEN_BLUE )
			( ON_PINK_GREEN )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_PINK_GREEN_RED
		:parameters ()
		:precondition
		(and
			( CLEAR_PINK )
			( ONTABLE_RED )
			( ON_GREEN_RED )
			( ON_PINK_GREEN )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_PINK_BLUE_PINK
		:parameters ()
		:precondition
		(and
			( CLEAR_PINK )
			( ONTABLE_PINK )
			( ON_BLUE_PINK )
			( ON_PINK_BLUE )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_PINK_BLUE_YELLOW
		:parameters ()
		:precondition
		(and
			( CLEAR_PINK )
			( ONTABLE_YELLOW )
			( ON_BLUE_YELLOW )
			( ON_PINK_BLUE )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_PINK_BLUE_GREEN
		:parameters ()
		:precondition
		(and
			( CLEAR_PINK )
			( ONTABLE_GREEN )
			( ON_BLUE_GREEN )
			( ON_PINK_BLUE )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_PINK_BLUE_RED
		:parameters ()
		:precondition
		(and
			( CLEAR_PINK )
			( ONTABLE_RED )
			( ON_BLUE_RED )
			( ON_PINK_BLUE )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_PINK_RED_PINK
		:parameters ()
		:precondition
		(and
			( CLEAR_PINK )
			( ONTABLE_PINK )
			( ON_RED_PINK )
			( ON_PINK_RED )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_PINK_RED_YELLOW
		:parameters ()
		:precondition
		(and
			( CLEAR_PINK )
			( ONTABLE_YELLOW )
			( ON_RED_YELLOW )
			( ON_PINK_RED )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_PINK_RED_GREEN
		:parameters ()
		:precondition
		(and
			( CLEAR_PINK )
			( ONTABLE_GREEN )
			( ON_RED_GREEN )
			( ON_PINK_RED )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_PINK_RED_BLUE
		:parameters ()
		:precondition
		(and
			( CLEAR_PINK )
			( ONTABLE_BLUE )
			( ON_RED_BLUE )
			( ON_PINK_RED )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_YELLOW_PINK_YELLOW
		:parameters ()
		:precondition
		(and
			( CLEAR_YELLOW )
			( ONTABLE_YELLOW )
			( ON_PINK_YELLOW )
			( ON_YELLOW_PINK )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_YELLOW_PINK_GREEN
		:parameters ()
		:precondition
		(and
			( CLEAR_YELLOW )
			( ONTABLE_GREEN )
			( ON_PINK_GREEN )
			( ON_YELLOW_PINK )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_YELLOW_PINK_BLUE
		:parameters ()
		:precondition
		(and
			( CLEAR_YELLOW )
			( ONTABLE_BLUE )
			( ON_PINK_BLUE )
			( ON_YELLOW_PINK )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_YELLOW_PINK_RED
		:parameters ()
		:precondition
		(and
			( CLEAR_YELLOW )
			( ONTABLE_RED )
			( ON_PINK_RED )
			( ON_YELLOW_PINK )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_YELLOW_GREEN_PINK
		:parameters ()
		:precondition
		(and
			( CLEAR_YELLOW )
			( ONTABLE_PINK )
			( ON_GREEN_PINK )
			( ON_YELLOW_GREEN )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_YELLOW_GREEN_YELLOW
		:parameters ()
		:precondition
		(and
			( CLEAR_YELLOW )
			( ONTABLE_YELLOW )
			( ON_GREEN_YELLOW )
			( ON_YELLOW_GREEN )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_YELLOW_GREEN_BLUE
		:parameters ()
		:precondition
		(and
			( CLEAR_YELLOW )
			( ONTABLE_BLUE )
			( ON_GREEN_BLUE )
			( ON_YELLOW_GREEN )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_YELLOW_GREEN_RED
		:parameters ()
		:precondition
		(and
			( CLEAR_YELLOW )
			( ONTABLE_RED )
			( ON_GREEN_RED )
			( ON_YELLOW_GREEN )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_YELLOW_BLUE_PINK
		:parameters ()
		:precondition
		(and
			( CLEAR_YELLOW )
			( ONTABLE_PINK )
			( ON_BLUE_PINK )
			( ON_YELLOW_BLUE )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_YELLOW_BLUE_YELLOW
		:parameters ()
		:precondition
		(and
			( CLEAR_YELLOW )
			( ONTABLE_YELLOW )
			( ON_BLUE_YELLOW )
			( ON_YELLOW_BLUE )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_YELLOW_BLUE_GREEN
		:parameters ()
		:precondition
		(and
			( CLEAR_YELLOW )
			( ONTABLE_GREEN )
			( ON_BLUE_GREEN )
			( ON_YELLOW_BLUE )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_YELLOW_BLUE_RED
		:parameters ()
		:precondition
		(and
			( CLEAR_YELLOW )
			( ONTABLE_RED )
			( ON_BLUE_RED )
			( ON_YELLOW_BLUE )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_YELLOW_RED_PINK
		:parameters ()
		:precondition
		(and
			( CLEAR_YELLOW )
			( ONTABLE_PINK )
			( ON_RED_PINK )
			( ON_YELLOW_RED )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_YELLOW_RED_YELLOW
		:parameters ()
		:precondition
		(and
			( CLEAR_YELLOW )
			( ONTABLE_YELLOW )
			( ON_RED_YELLOW )
			( ON_YELLOW_RED )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_YELLOW_RED_GREEN
		:parameters ()
		:precondition
		(and
			( CLEAR_YELLOW )
			( ONTABLE_GREEN )
			( ON_RED_GREEN )
			( ON_YELLOW_RED )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_YELLOW_RED_BLUE
		:parameters ()
		:precondition
		(and
			( CLEAR_YELLOW )
			( ONTABLE_BLUE )
			( ON_RED_BLUE )
			( ON_YELLOW_RED )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_GREEN_PINK_YELLOW
		:parameters ()
		:precondition
		(and
			( CLEAR_GREEN )
			( ONTABLE_YELLOW )
			( ON_PINK_YELLOW )
			( ON_GREEN_PINK )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_GREEN_PINK_GREEN
		:parameters ()
		:precondition
		(and
			( CLEAR_GREEN )
			( ONTABLE_GREEN )
			( ON_PINK_GREEN )
			( ON_GREEN_PINK )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_GREEN_PINK_BLUE
		:parameters ()
		:precondition
		(and
			( CLEAR_GREEN )
			( ONTABLE_BLUE )
			( ON_PINK_BLUE )
			( ON_GREEN_PINK )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_GREEN_PINK_RED
		:parameters ()
		:precondition
		(and
			( CLEAR_GREEN )
			( ONTABLE_RED )
			( ON_PINK_RED )
			( ON_GREEN_PINK )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_GREEN_YELLOW_PINK
		:parameters ()
		:precondition
		(and
			( CLEAR_GREEN )
			( ONTABLE_PINK )
			( ON_YELLOW_PINK )
			( ON_GREEN_YELLOW )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_GREEN_YELLOW_GREEN
		:parameters ()
		:precondition
		(and
			( CLEAR_GREEN )
			( ONTABLE_GREEN )
			( ON_YELLOW_GREEN )
			( ON_GREEN_YELLOW )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_GREEN_YELLOW_BLUE
		:parameters ()
		:precondition
		(and
			( CLEAR_GREEN )
			( ONTABLE_BLUE )
			( ON_YELLOW_BLUE )
			( ON_GREEN_YELLOW )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_GREEN_YELLOW_RED
		:parameters ()
		:precondition
		(and
			( CLEAR_GREEN )
			( ONTABLE_RED )
			( ON_YELLOW_RED )
			( ON_GREEN_YELLOW )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_GREEN_BLUE_PINK
		:parameters ()
		:precondition
		(and
			( CLEAR_GREEN )
			( ONTABLE_PINK )
			( ON_BLUE_PINK )
			( ON_GREEN_BLUE )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_GREEN_BLUE_YELLOW
		:parameters ()
		:precondition
		(and
			( CLEAR_GREEN )
			( ONTABLE_YELLOW )
			( ON_BLUE_YELLOW )
			( ON_GREEN_BLUE )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_GREEN_BLUE_GREEN
		:parameters ()
		:precondition
		(and
			( CLEAR_GREEN )
			( ONTABLE_GREEN )
			( ON_BLUE_GREEN )
			( ON_GREEN_BLUE )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_GREEN_BLUE_RED
		:parameters ()
		:precondition
		(and
			( CLEAR_GREEN )
			( ONTABLE_RED )
			( ON_BLUE_RED )
			( ON_GREEN_BLUE )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_GREEN_RED_PINK
		:parameters ()
		:precondition
		(and
			( CLEAR_GREEN )
			( ONTABLE_PINK )
			( ON_RED_PINK )
			( ON_GREEN_RED )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_GREEN_RED_YELLOW
		:parameters ()
		:precondition
		(and
			( CLEAR_GREEN )
			( ONTABLE_YELLOW )
			( ON_RED_YELLOW )
			( ON_GREEN_RED )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_GREEN_RED_GREEN
		:parameters ()
		:precondition
		(and
			( CLEAR_GREEN )
			( ONTABLE_GREEN )
			( ON_RED_GREEN )
			( ON_GREEN_RED )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_GREEN_RED_BLUE
		:parameters ()
		:precondition
		(and
			( CLEAR_GREEN )
			( ONTABLE_BLUE )
			( ON_RED_BLUE )
			( ON_GREEN_RED )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_BLUE_PINK_YELLOW
		:parameters ()
		:precondition
		(and
			( CLEAR_BLUE )
			( ONTABLE_YELLOW )
			( ON_PINK_YELLOW )
			( ON_BLUE_PINK )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_BLUE_PINK_GREEN
		:parameters ()
		:precondition
		(and
			( CLEAR_BLUE )
			( ONTABLE_GREEN )
			( ON_PINK_GREEN )
			( ON_BLUE_PINK )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_BLUE_PINK_BLUE
		:parameters ()
		:precondition
		(and
			( CLEAR_BLUE )
			( ONTABLE_BLUE )
			( ON_PINK_BLUE )
			( ON_BLUE_PINK )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_BLUE_PINK_RED
		:parameters ()
		:precondition
		(and
			( CLEAR_BLUE )
			( ONTABLE_RED )
			( ON_PINK_RED )
			( ON_BLUE_PINK )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_BLUE_YELLOW_PINK
		:parameters ()
		:precondition
		(and
			( CLEAR_BLUE )
			( ONTABLE_PINK )
			( ON_YELLOW_PINK )
			( ON_BLUE_YELLOW )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_BLUE_YELLOW_GREEN
		:parameters ()
		:precondition
		(and
			( CLEAR_BLUE )
			( ONTABLE_GREEN )
			( ON_YELLOW_GREEN )
			( ON_BLUE_YELLOW )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_BLUE_YELLOW_BLUE
		:parameters ()
		:precondition
		(and
			( CLEAR_BLUE )
			( ONTABLE_BLUE )
			( ON_YELLOW_BLUE )
			( ON_BLUE_YELLOW )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_BLUE_YELLOW_RED
		:parameters ()
		:precondition
		(and
			( CLEAR_BLUE )
			( ONTABLE_RED )
			( ON_YELLOW_RED )
			( ON_BLUE_YELLOW )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_BLUE_GREEN_PINK
		:parameters ()
		:precondition
		(and
			( CLEAR_BLUE )
			( ONTABLE_PINK )
			( ON_GREEN_PINK )
			( ON_BLUE_GREEN )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_BLUE_GREEN_YELLOW
		:parameters ()
		:precondition
		(and
			( CLEAR_BLUE )
			( ONTABLE_YELLOW )
			( ON_GREEN_YELLOW )
			( ON_BLUE_GREEN )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_BLUE_GREEN_BLUE
		:parameters ()
		:precondition
		(and
			( CLEAR_BLUE )
			( ONTABLE_BLUE )
			( ON_GREEN_BLUE )
			( ON_BLUE_GREEN )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_BLUE_GREEN_RED
		:parameters ()
		:precondition
		(and
			( CLEAR_BLUE )
			( ONTABLE_RED )
			( ON_GREEN_RED )
			( ON_BLUE_GREEN )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_BLUE_RED_PINK
		:parameters ()
		:precondition
		(and
			( CLEAR_BLUE )
			( ONTABLE_PINK )
			( ON_RED_PINK )
			( ON_BLUE_RED )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_BLUE_RED_YELLOW
		:parameters ()
		:precondition
		(and
			( CLEAR_BLUE )
			( ONTABLE_YELLOW )
			( ON_RED_YELLOW )
			( ON_BLUE_RED )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_BLUE_RED_GREEN
		:parameters ()
		:precondition
		(and
			( CLEAR_BLUE )
			( ONTABLE_GREEN )
			( ON_RED_GREEN )
			( ON_BLUE_RED )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_BLUE_RED_BLUE
		:parameters ()
		:precondition
		(and
			( CLEAR_BLUE )
			( ONTABLE_BLUE )
			( ON_RED_BLUE )
			( ON_BLUE_RED )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_RED_PINK_YELLOW
		:parameters ()
		:precondition
		(and
			( CLEAR_RED )
			( ONTABLE_YELLOW )
			( ON_PINK_YELLOW )
			( ON_RED_PINK )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_RED_PINK_GREEN
		:parameters ()
		:precondition
		(and
			( CLEAR_RED )
			( ONTABLE_GREEN )
			( ON_PINK_GREEN )
			( ON_RED_PINK )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_RED_PINK_BLUE
		:parameters ()
		:precondition
		(and
			( CLEAR_RED )
			( ONTABLE_BLUE )
			( ON_PINK_BLUE )
			( ON_RED_PINK )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_RED_PINK_RED
		:parameters ()
		:precondition
		(and
			( CLEAR_RED )
			( ONTABLE_RED )
			( ON_PINK_RED )
			( ON_RED_PINK )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_RED_YELLOW_PINK
		:parameters ()
		:precondition
		(and
			( CLEAR_RED )
			( ONTABLE_PINK )
			( ON_YELLOW_PINK )
			( ON_RED_YELLOW )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_RED_YELLOW_GREEN
		:parameters ()
		:precondition
		(and
			( CLEAR_RED )
			( ONTABLE_GREEN )
			( ON_YELLOW_GREEN )
			( ON_RED_YELLOW )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_RED_YELLOW_BLUE
		:parameters ()
		:precondition
		(and
			( CLEAR_RED )
			( ONTABLE_BLUE )
			( ON_YELLOW_BLUE )
			( ON_RED_YELLOW )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_RED_YELLOW_RED
		:parameters ()
		:precondition
		(and
			( CLEAR_RED )
			( ONTABLE_RED )
			( ON_YELLOW_RED )
			( ON_RED_YELLOW )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_RED_GREEN_PINK
		:parameters ()
		:precondition
		(and
			( CLEAR_RED )
			( ONTABLE_PINK )
			( ON_GREEN_PINK )
			( ON_RED_GREEN )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_RED_GREEN_YELLOW
		:parameters ()
		:precondition
		(and
			( CLEAR_RED )
			( ONTABLE_YELLOW )
			( ON_GREEN_YELLOW )
			( ON_RED_GREEN )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_RED_GREEN_BLUE
		:parameters ()
		:precondition
		(and
			( CLEAR_RED )
			( ONTABLE_BLUE )
			( ON_GREEN_BLUE )
			( ON_RED_GREEN )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_RED_GREEN_RED
		:parameters ()
		:precondition
		(and
			( CLEAR_RED )
			( ONTABLE_RED )
			( ON_GREEN_RED )
			( ON_RED_GREEN )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_RED_BLUE_PINK
		:parameters ()
		:precondition
		(and
			( CLEAR_RED )
			( ONTABLE_PINK )
			( ON_BLUE_PINK )
			( ON_RED_BLUE )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_RED_BLUE_YELLOW
		:parameters ()
		:precondition
		(and
			( CLEAR_RED )
			( ONTABLE_YELLOW )
			( ON_BLUE_YELLOW )
			( ON_RED_BLUE )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_RED_BLUE_GREEN
		:parameters ()
		:precondition
		(and
			( CLEAR_RED )
			( ONTABLE_GREEN )
			( ON_BLUE_GREEN )
			( ON_RED_BLUE )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM3TOWER_RED_BLUE_RED
		:parameters ()
		:precondition
		(and
			( CLEAR_RED )
			( ONTABLE_RED )
			( ON_BLUE_RED )
			( ON_RED_BLUE )
		)
		:effect
		(and
			( TOWER3-FORMED )
		)
	)
	(:action FORM2TOWER_PINK_YELLOW
		:parameters ()
		:precondition
		(and
			( CLEAR_PINK )
			( ONTABLE_YELLOW )
			( ON_PINK_YELLOW )
		)
		:effect
		(and
			( TOWER2-FORMED )
		)
	)
	(:action FORM2TOWER_PINK_GREEN
		:parameters ()
		:precondition
		(and
			( CLEAR_PINK )
			( ONTABLE_GREEN )
			( ON_PINK_GREEN )
		)
		:effect
		(and
			( TOWER2-FORMED )
		)
	)
	(:action FORM2TOWER_PINK_BLUE
		:parameters ()
		:precondition
		(and
			( CLEAR_PINK )
			( ONTABLE_BLUE )
			( ON_PINK_BLUE )
		)
		:effect
		(and
			( TOWER2-FORMED )
		)
	)
	(:action FORM2TOWER_PINK_RED
		:parameters ()
		:precondition
		(and
			( CLEAR_PINK )
			( ONTABLE_RED )
			( ON_PINK_RED )
		)
		:effect
		(and
			( TOWER2-FORMED )
		)
	)
	(:action FORM2TOWER_YELLOW_PINK
		:parameters ()
		:precondition
		(and
			( CLEAR_YELLOW )
			( ONTABLE_PINK )
			( ON_YELLOW_PINK )
		)
		:effect
		(and
			( TOWER2-FORMED )
		)
	)
	(:action FORM2TOWER_YELLOW_GREEN
		:parameters ()
		:precondition
		(and
			( CLEAR_YELLOW )
			( ONTABLE_GREEN )
			( ON_YELLOW_GREEN )
		)
		:effect
		(and
			( TOWER2-FORMED )
		)
	)
	(:action FORM2TOWER_YELLOW_BLUE
		:parameters ()
		:precondition
		(and
			( CLEAR_YELLOW )
			( ONTABLE_BLUE )
			( ON_YELLOW_BLUE )
		)
		:effect
		(and
			( TOWER2-FORMED )
		)
	)
	(:action FORM2TOWER_YELLOW_RED
		:parameters ()
		:precondition
		(and
			( CLEAR_YELLOW )
			( ONTABLE_RED )
			( ON_YELLOW_RED )
		)
		:effect
		(and
			( TOWER2-FORMED )
		)
	)
	(:action FORM2TOWER_GREEN_PINK
		:parameters ()
		:precondition
		(and
			( CLEAR_GREEN )
			( ONTABLE_PINK )
			( ON_GREEN_PINK )
		)
		:effect
		(and
			( TOWER2-FORMED )
		)
	)
	(:action FORM2TOWER_GREEN_YELLOW
		:parameters ()
		:precondition
		(and
			( CLEAR_GREEN )
			( ONTABLE_YELLOW )
			( ON_GREEN_YELLOW )
		)
		:effect
		(and
			( TOWER2-FORMED )
		)
	)
	(:action FORM2TOWER_GREEN_BLUE
		:parameters ()
		:precondition
		(and
			( CLEAR_GREEN )
			( ONTABLE_BLUE )
			( ON_GREEN_BLUE )
		)
		:effect
		(and
			( TOWER2-FORMED )
		)
	)
	(:action FORM2TOWER_GREEN_RED
		:parameters ()
		:precondition
		(and
			( CLEAR_GREEN )
			( ONTABLE_RED )
			( ON_GREEN_RED )
		)
		:effect
		(and
			( TOWER2-FORMED )
		)
	)
	(:action FORM2TOWER_BLUE_PINK
		:parameters ()
		:precondition
		(and
			( CLEAR_BLUE )
			( ONTABLE_PINK )
			( ON_BLUE_PINK )
		)
		:effect
		(and
			( TOWER2-FORMED )
		)
	)
	(:action FORM2TOWER_BLUE_YELLOW
		:parameters ()
		:precondition
		(and
			( CLEAR_BLUE )
			( ONTABLE_YELLOW )
			( ON_BLUE_YELLOW )
		)
		:effect
		(and
			( TOWER2-FORMED )
		)
	)
	(:action FORM2TOWER_BLUE_GREEN
		:parameters ()
		:precondition
		(and
			( CLEAR_BLUE )
			( ONTABLE_GREEN )
			( ON_BLUE_GREEN )
		)
		:effect
		(and
			( TOWER2-FORMED )
		)
	)
	(:action FORM2TOWER_BLUE_RED
		:parameters ()
		:precondition
		(and
			( CLEAR_BLUE )
			( ONTABLE_RED )
			( ON_BLUE_RED )
		)
		:effect
		(and
			( TOWER2-FORMED )
		)
	)
	(:action FORM2TOWER_RED_PINK
		:parameters ()
		:precondition
		(and
			( CLEAR_RED )
			( ONTABLE_PINK )
			( ON_RED_PINK )
		)
		:effect
		(and
			( TOWER2-FORMED )
		)
	)
	(:action FORM2TOWER_RED_YELLOW
		:parameters ()
		:precondition
		(and
			( CLEAR_RED )
			( ONTABLE_YELLOW )
			( ON_RED_YELLOW )
		)
		:effect
		(and
			( TOWER2-FORMED )
		)
	)
	(:action FORM2TOWER_RED_GREEN
		:parameters ()
		:precondition
		(and
			( CLEAR_RED )
			( ONTABLE_GREEN )
			( ON_RED_GREEN )
		)
		:effect
		(and
			( TOWER2-FORMED )
		)
	)
	(:action FORM2TOWER_RED_BLUE
		:parameters ()
		:precondition
		(and
			( CLEAR_RED )
			( ONTABLE_BLUE )
			( ON_RED_BLUE )
		)
		:effect
		(and
			( TOWER2-FORMED )
		)
	)
	(:action UNSTACK_PINK_YELLOW
		:parameters ()
		:precondition
		(and
			( CLEAR_PINK )
			( ON_PINK_YELLOW )
			( HANDSEMPTY )
		)
		:effect
		(and
			( CLEAR_YELLOW )
			( HOLDING_PINK )
			(not ( ON_PINK_YELLOW ))
			(not ( HANDSEMPTY ))
			(not ( CLEAR_PINK ))
		)
	)
	(:action UNSTACK_PINK_GREEN
		:parameters ()
		:precondition
		(and
			( CLEAR_PINK )
			( ON_PINK_GREEN )
			( HANDSEMPTY )
		)
		:effect
		(and
			( CLEAR_GREEN )
			( HOLDING_PINK )
			(not ( ON_PINK_GREEN ))
			(not ( HANDSEMPTY ))
			(not ( CLEAR_PINK ))
		)
	)
	(:action UNSTACK_PINK_BLUE
		:parameters ()
		:precondition
		(and
			( CLEAR_PINK )
			( ON_PINK_BLUE )
			( HANDSEMPTY )
		)
		:effect
		(and
			( CLEAR_BLUE )
			( HOLDING_PINK )
			(not ( ON_PINK_BLUE ))
			(not ( HANDSEMPTY ))
			(not ( CLEAR_PINK ))
		)
	)
	(:action UNSTACK_PINK_RED
		:parameters ()
		:precondition
		(and
			( CLEAR_PINK )
			( ON_PINK_RED )
			( HANDSEMPTY )
		)
		:effect
		(and
			( CLEAR_RED )
			( HOLDING_PINK )
			(not ( ON_PINK_RED ))
			(not ( HANDSEMPTY ))
			(not ( CLEAR_PINK ))
		)
	)
	(:action UNSTACK_YELLOW_PINK
		:parameters ()
		:precondition
		(and
			( CLEAR_YELLOW )
			( ON_YELLOW_PINK )
			( HANDSEMPTY )
		)
		:effect
		(and
			( CLEAR_PINK )
			( HOLDING_YELLOW )
			(not ( ON_YELLOW_PINK ))
			(not ( HANDSEMPTY ))
			(not ( CLEAR_YELLOW ))
		)
	)
	(:action UNSTACK_YELLOW_GREEN
		:parameters ()
		:precondition
		(and
			( CLEAR_YELLOW )
			( ON_YELLOW_GREEN )
			( HANDSEMPTY )
		)
		:effect
		(and
			( CLEAR_GREEN )
			( HOLDING_YELLOW )
			(not ( ON_YELLOW_GREEN ))
			(not ( HANDSEMPTY ))
			(not ( CLEAR_YELLOW ))
		)
	)
	(:action UNSTACK_YELLOW_BLUE
		:parameters ()
		:precondition
		(and
			( CLEAR_YELLOW )
			( ON_YELLOW_BLUE )
			( HANDSEMPTY )
		)
		:effect
		(and
			( CLEAR_BLUE )
			( HOLDING_YELLOW )
			(not ( ON_YELLOW_BLUE ))
			(not ( HANDSEMPTY ))
			(not ( CLEAR_YELLOW ))
		)
	)
	(:action UNSTACK_YELLOW_RED
		:parameters ()
		:precondition
		(and
			( CLEAR_YELLOW )
			( ON_YELLOW_RED )
			( HANDSEMPTY )
		)
		:effect
		(and
			( CLEAR_RED )
			( HOLDING_YELLOW )
			(not ( ON_YELLOW_RED ))
			(not ( HANDSEMPTY ))
			(not ( CLEAR_YELLOW ))
		)
	)
	(:action UNSTACK_GREEN_PINK
		:parameters ()
		:precondition
		(and
			( CLEAR_GREEN )
			( ON_GREEN_PINK )
			( HANDSEMPTY )
		)
		:effect
		(and
			( CLEAR_PINK )
			( HOLDING_GREEN )
			(not ( ON_GREEN_PINK ))
			(not ( HANDSEMPTY ))
			(not ( CLEAR_GREEN ))
		)
	)
	(:action UNSTACK_GREEN_YELLOW
		:parameters ()
		:precondition
		(and
			( CLEAR_GREEN )
			( ON_GREEN_YELLOW )
			( HANDSEMPTY )
		)
		:effect
		(and
			( CLEAR_YELLOW )
			( HOLDING_GREEN )
			(not ( ON_GREEN_YELLOW ))
			(not ( HANDSEMPTY ))
			(not ( CLEAR_GREEN ))
		)
	)
	(:action UNSTACK_GREEN_BLUE
		:parameters ()
		:precondition
		(and
			( CLEAR_GREEN )
			( ON_GREEN_BLUE )
			( HANDSEMPTY )
		)
		:effect
		(and
			( CLEAR_BLUE )
			( HOLDING_GREEN )
			(not ( ON_GREEN_BLUE ))
			(not ( HANDSEMPTY ))
			(not ( CLEAR_GREEN ))
		)
	)
	(:action UNSTACK_GREEN_RED
		:parameters ()
		:precondition
		(and
			( CLEAR_GREEN )
			( ON_GREEN_RED )
			( HANDSEMPTY )
		)
		:effect
		(and
			( CLEAR_RED )
			( HOLDING_GREEN )
			(not ( ON_GREEN_RED ))
			(not ( HANDSEMPTY ))
			(not ( CLEAR_GREEN ))
		)
	)
	(:action UNSTACK_BLUE_PINK
		:parameters ()
		:precondition
		(and
			( CLEAR_BLUE )
			( ON_BLUE_PINK )
			( HANDSEMPTY )
		)
		:effect
		(and
			( CLEAR_PINK )
			( HOLDING_BLUE )
			(not ( ON_BLUE_PINK ))
			(not ( HANDSEMPTY ))
			(not ( CLEAR_BLUE ))
		)
	)
	(:action UNSTACK_BLUE_YELLOW
		:parameters ()
		:precondition
		(and
			( CLEAR_BLUE )
			( ON_BLUE_YELLOW )
			( HANDSEMPTY )
		)
		:effect
		(and
			( CLEAR_YELLOW )
			( HOLDING_BLUE )
			(not ( ON_BLUE_YELLOW ))
			(not ( HANDSEMPTY ))
			(not ( CLEAR_BLUE ))
		)
	)
	(:action UNSTACK_BLUE_GREEN
		:parameters ()
		:precondition
		(and
			( CLEAR_BLUE )
			( ON_BLUE_GREEN )
			( HANDSEMPTY )
		)
		:effect
		(and
			( CLEAR_GREEN )
			( HOLDING_BLUE )
			(not ( ON_BLUE_GREEN ))
			(not ( HANDSEMPTY ))
			(not ( CLEAR_BLUE ))
		)
	)
	(:action UNSTACK_BLUE_RED
		:parameters ()
		:precondition
		(and
			( CLEAR_BLUE )
			( ON_BLUE_RED )
			( HANDSEMPTY )
		)
		:effect
		(and
			( CLEAR_RED )
			( HOLDING_BLUE )
			(not ( ON_BLUE_RED ))
			(not ( HANDSEMPTY ))
			(not ( CLEAR_BLUE ))
		)
	)
	(:action UNSTACK_RED_PINK
		:parameters ()
		:precondition
		(and
			( CLEAR_RED )
			( ON_RED_PINK )
			( HANDSEMPTY )
		)
		:effect
		(and
			( CLEAR_PINK )
			( HOLDING_RED )
			(not ( ON_RED_PINK ))
			(not ( HANDSEMPTY ))
			(not ( CLEAR_RED ))
		)
	)
	(:action UNSTACK_RED_YELLOW
		:parameters ()
		:precondition
		(and
			( CLEAR_RED )
			( ON_RED_YELLOW )
			( HANDSEMPTY )
		)
		:effect
		(and
			( CLEAR_YELLOW )
			( HOLDING_RED )
			(not ( ON_RED_YELLOW ))
			(not ( HANDSEMPTY ))
			(not ( CLEAR_RED ))
		)
	)
	(:action UNSTACK_RED_GREEN
		:parameters ()
		:precondition
		(and
			( CLEAR_RED )
			( ON_RED_GREEN )
			( HANDSEMPTY )
		)
		:effect
		(and
			( CLEAR_GREEN )
			( HOLDING_RED )
			(not ( ON_RED_GREEN ))
			(not ( HANDSEMPTY ))
			(not ( CLEAR_RED ))
		)
	)
	(:action UNSTACK_RED_BLUE
		:parameters ()
		:precondition
		(and
			( CLEAR_RED )
			( ON_RED_BLUE )
			( HANDSEMPTY )
		)
		:effect
		(and
			( CLEAR_BLUE )
			( HOLDING_RED )
			(not ( ON_RED_BLUE ))
			(not ( HANDSEMPTY ))
			(not ( CLEAR_RED ))
		)
	)
	(:action STACK_PINK_YELLOW
		:parameters ()
		:precondition
		(and
			( CLEAR_YELLOW )
			( HOLDING_PINK )
		)
		:effect
		(and
			( ON_PINK_YELLOW )
			( HANDSEMPTY )
			( CLEAR_PINK )
			(not ( CLEAR_YELLOW ))
			(not ( HOLDING_PINK ))
		)
	)
	(:action STACK_PINK_GREEN
		:parameters ()
		:precondition
		(and
			( CLEAR_GREEN )
			( HOLDING_PINK )
		)
		:effect
		(and
			( ON_PINK_GREEN )
			( HANDSEMPTY )
			( CLEAR_PINK )
			(not ( CLEAR_GREEN ))
			(not ( HOLDING_PINK ))
		)
	)
	(:action STACK_PINK_BLUE
		:parameters ()
		:precondition
		(and
			( CLEAR_BLUE )
			( HOLDING_PINK )
		)
		:effect
		(and
			( ON_PINK_BLUE )
			( HANDSEMPTY )
			( CLEAR_PINK )
			(not ( CLEAR_BLUE ))
			(not ( HOLDING_PINK ))
		)
	)
	(:action STACK_PINK_RED
		:parameters ()
		:precondition
		(and
			( CLEAR_RED )
			( HOLDING_PINK )
		)
		:effect
		(and
			( ON_PINK_RED )
			( HANDSEMPTY )
			( CLEAR_PINK )
			(not ( CLEAR_RED ))
			(not ( HOLDING_PINK ))
		)
	)
	(:action STACK_YELLOW_PINK
		:parameters ()
		:precondition
		(and
			( CLEAR_PINK )
			( HOLDING_YELLOW )
		)
		:effect
		(and
			( ON_YELLOW_PINK )
			( HANDSEMPTY )
			( CLEAR_YELLOW )
			(not ( CLEAR_PINK ))
			(not ( HOLDING_YELLOW ))
		)
	)
	(:action STACK_YELLOW_GREEN
		:parameters ()
		:precondition
		(and
			( CLEAR_GREEN )
			( HOLDING_YELLOW )
		)
		:effect
		(and
			( ON_YELLOW_GREEN )
			( HANDSEMPTY )
			( CLEAR_YELLOW )
			(not ( CLEAR_GREEN ))
			(not ( HOLDING_YELLOW ))
		)
	)
	(:action STACK_YELLOW_BLUE
		:parameters ()
		:precondition
		(and
			( CLEAR_BLUE )
			( HOLDING_YELLOW )
		)
		:effect
		(and
			( ON_YELLOW_BLUE )
			( HANDSEMPTY )
			( CLEAR_YELLOW )
			(not ( CLEAR_BLUE ))
			(not ( HOLDING_YELLOW ))
		)
	)
	(:action STACK_YELLOW_RED
		:parameters ()
		:precondition
		(and
			( CLEAR_RED )
			( HOLDING_YELLOW )
		)
		:effect
		(and
			( ON_YELLOW_RED )
			( HANDSEMPTY )
			( CLEAR_YELLOW )
			(not ( CLEAR_RED ))
			(not ( HOLDING_YELLOW ))
		)
	)
	(:action STACK_GREEN_PINK
		:parameters ()
		:precondition
		(and
			( CLEAR_PINK )
			( HOLDING_GREEN )
		)
		:effect
		(and
			( ON_GREEN_PINK )
			( HANDSEMPTY )
			( CLEAR_GREEN )
			(not ( CLEAR_PINK ))
			(not ( HOLDING_GREEN ))
		)
	)
	(:action STACK_GREEN_YELLOW
		:parameters ()
		:precondition
		(and
			( CLEAR_YELLOW )
			( HOLDING_GREEN )
		)
		:effect
		(and
			( ON_GREEN_YELLOW )
			( HANDSEMPTY )
			( CLEAR_GREEN )
			(not ( CLEAR_YELLOW ))
			(not ( HOLDING_GREEN ))
		)
	)
	(:action STACK_GREEN_BLUE
		:parameters ()
		:precondition
		(and
			( CLEAR_BLUE )
			( HOLDING_GREEN )
		)
		:effect
		(and
			( ON_GREEN_BLUE )
			( HANDSEMPTY )
			( CLEAR_GREEN )
			(not ( CLEAR_BLUE ))
			(not ( HOLDING_GREEN ))
		)
	)
	(:action STACK_GREEN_RED
		:parameters ()
		:precondition
		(and
			( CLEAR_RED )
			( HOLDING_GREEN )
		)
		:effect
		(and
			( ON_GREEN_RED )
			( HANDSEMPTY )
			( CLEAR_GREEN )
			(not ( CLEAR_RED ))
			(not ( HOLDING_GREEN ))
		)
	)
	(:action STACK_BLUE_PINK
		:parameters ()
		:precondition
		(and
			( CLEAR_PINK )
			( HOLDING_BLUE )
		)
		:effect
		(and
			( ON_BLUE_PINK )
			( HANDSEMPTY )
			( CLEAR_BLUE )
			(not ( CLEAR_PINK ))
			(not ( HOLDING_BLUE ))
		)
	)
	(:action STACK_BLUE_YELLOW
		:parameters ()
		:precondition
		(and
			( CLEAR_YELLOW )
			( HOLDING_BLUE )
		)
		:effect
		(and
			( ON_BLUE_YELLOW )
			( HANDSEMPTY )
			( CLEAR_BLUE )
			(not ( CLEAR_YELLOW ))
			(not ( HOLDING_BLUE ))
		)
	)
	(:action STACK_BLUE_GREEN
		:parameters ()
		:precondition
		(and
			( CLEAR_GREEN )
			( HOLDING_BLUE )
		)
		:effect
		(and
			( ON_BLUE_GREEN )
			( HANDSEMPTY )
			( CLEAR_BLUE )
			(not ( CLEAR_GREEN ))
			(not ( HOLDING_BLUE ))
		)
	)
	(:action STACK_BLUE_RED
		:parameters ()
		:precondition
		(and
			( CLEAR_RED )
			( HOLDING_BLUE )
		)
		:effect
		(and
			( ON_BLUE_RED )
			( HANDSEMPTY )
			( CLEAR_BLUE )
			(not ( CLEAR_RED ))
			(not ( HOLDING_BLUE ))
		)
	)
	(:action STACK_RED_PINK
		:parameters ()
		:precondition
		(and
			( CLEAR_PINK )
			( HOLDING_RED )
		)
		:effect
		(and
			( ON_RED_PINK )
			( HANDSEMPTY )
			( CLEAR_RED )
			(not ( CLEAR_PINK ))
			(not ( HOLDING_RED ))
		)
	)
	(:action STACK_RED_YELLOW
		:parameters ()
		:precondition
		(and
			( CLEAR_YELLOW )
			( HOLDING_RED )
		)
		:effect
		(and
			( ON_RED_YELLOW )
			( HANDSEMPTY )
			( CLEAR_RED )
			(not ( CLEAR_YELLOW ))
			(not ( HOLDING_RED ))
		)
	)
	(:action STACK_RED_GREEN
		:parameters ()
		:precondition
		(and
			( CLEAR_GREEN )
			( HOLDING_RED )
		)
		:effect
		(and
			( ON_RED_GREEN )
			( HANDSEMPTY )
			( CLEAR_RED )
			(not ( CLEAR_GREEN ))
			(not ( HOLDING_RED ))
		)
	)
	(:action STACK_RED_BLUE
		:parameters ()
		:precondition
		(and
			( CLEAR_BLUE )
			( HOLDING_RED )
		)
		:effect
		(and
			( ON_RED_BLUE )
			( HANDSEMPTY )
			( CLEAR_RED )
			(not ( CLEAR_BLUE ))
			(not ( HOLDING_RED ))
		)
	)
	(:action PUTDOWN_PINK
		:parameters ()
		:precondition
		(and
			( HOLDING_PINK )
		)
		:effect
		(and
			( HANDSEMPTY )
			( CLEAR_PINK )
			( ONTABLE_PINK )
			(not ( HOLDING_PINK ))
		)
	)
	(:action PUTDOWN_YELLOW
		:parameters ()
		:precondition
		(and
			( HOLDING_YELLOW )
		)
		:effect
		(and
			( HANDSEMPTY )
			( CLEAR_YELLOW )
			( ONTABLE_YELLOW )
			(not ( HOLDING_YELLOW ))
		)
	)
	(:action PUTDOWN_GREEN
		:parameters ()
		:precondition
		(and
			( HOLDING_GREEN )
		)
		:effect
		(and
			( HANDSEMPTY )
			( CLEAR_GREEN )
			( ONTABLE_GREEN )
			(not ( HOLDING_GREEN ))
		)
	)
	(:action PUTDOWN_BLUE
		:parameters ()
		:precondition
		(and
			( HOLDING_BLUE )
		)
		:effect
		(and
			( HANDSEMPTY )
			( CLEAR_BLUE )
			( ONTABLE_BLUE )
			(not ( HOLDING_BLUE ))
		)
	)
	(:action PUTDOWN_RED
		:parameters ()
		:precondition
		(and
			( HOLDING_RED )
		)
		:effect
		(and
			( HANDSEMPTY )
			( CLEAR_RED )
			( ONTABLE_RED )
			(not ( HOLDING_RED ))
		)
	)
	(:action PICKUP_PINK
		:parameters ()
		:precondition
		(and
			( CLEAR_PINK )
			( ONTABLE_PINK )
			( HANDSEMPTY )
		)
		:effect
		(and
			( HOLDING_PINK )
			(not ( ONTABLE_PINK ))
			(not ( CLEAR_PINK ))
			(not ( HANDSEMPTY ))
		)
	)
	(:action PICKUP_YELLOW
		:parameters ()
		:precondition
		(and
			( CLEAR_YELLOW )
			( ONTABLE_YELLOW )
			( HANDSEMPTY )
		)
		:effect
		(and
			( HOLDING_YELLOW )
			(not ( ONTABLE_YELLOW ))
			(not ( CLEAR_YELLOW ))
			(not ( HANDSEMPTY ))
		)
	)
	(:action PICKUP_GREEN
		:parameters ()
		:precondition
		(and
			( CLEAR_GREEN )
			( ONTABLE_GREEN )
			( HANDSEMPTY )
		)
		:effect
		(and
			( HOLDING_GREEN )
			(not ( ONTABLE_GREEN ))
			(not ( CLEAR_GREEN ))
			(not ( HANDSEMPTY ))
		)
	)
	(:action PICKUP_BLUE
		:parameters ()
		:precondition
		(and
			( CLEAR_BLUE )
			( ONTABLE_BLUE )
			( HANDSEMPTY )
		)
		:effect
		(and
			( HOLDING_BLUE )
			(not ( ONTABLE_BLUE ))
			(not ( CLEAR_BLUE ))
			(not ( HANDSEMPTY ))
		)
	)
	(:action PICKUP_RED
		:parameters ()
		:precondition
		(and
			( CLEAR_RED )
			( ONTABLE_RED )
			( HANDSEMPTY )
		)
		:effect
		(and
			( HOLDING_RED )
			(not ( ONTABLE_RED ))
			(not ( CLEAR_RED ))
			(not ( HANDSEMPTY ))
		)
	)

)
