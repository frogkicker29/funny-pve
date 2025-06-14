//turfs with density = TRUE
/turf/closed
	density = TRUE
	opacity = TRUE

/turf/closed/insert_self_into_baseturfs()
	return

/turf/closed/get_explosion_resistance()
	return 1000000

/turf/closed/void
	name = "void"
	icon = 'icons/turf/floors/space.dmi'
	icon_state = "black"
	mouse_opacity = FALSE

/// Cordon turf marking z-level boundaries and surrounding reservations
/turf/closed/cordon
	name = "world border"
	icon = 'icons/turf/shuttle.dmi'
	icon_state = "pclosed"
	layer = ABOVE_TURF_LAYER
	baseturfs = /turf/closed/cordon

/// Used as placeholder turf when something went really wrong, as per /tg/ string lists handler
/turf/closed/cordon/debug
	name = "debug turf"
	desc = "This turf shouldn't be here and probably result of incorrect turf replacement. Adminhelp about it or report it in an issue."
	color = "#660088"
	baseturfs = /turf/closed/cordon/debug

/turf/closed/mineral //mineral deposits
	name = "Rock"
	icon = 'icons/turf/walls/walls.dmi'
	icon_state = "rock"

/turf/closed/mineral/Initialize(mapload)
	. = ..()
	var/list/step_overlays = list("s" = NORTH, "n" = SOUTH, "w" = EAST, "e" = WEST)
	for(var/direction in step_overlays)
		var/turf/turf_to_check = get_step(src,step_overlays[direction])

		if(istype(turf_to_check,/turf/open))
			turf_to_check.overlays += image('icons/turf/walls/walls.dmi', "rock_side_[direction]", 2.99) //Really high since it's an overhead turf and it shouldn't collide with anything else


//Ground map dense jungle
/turf/closed/gm
	name = "dense jungle"
	icon = 'icons/turf/ground_map.dmi'
	icon_state = "wall2"
	desc = "Some thick jungle."
	baseturfs = /turf/open/gm/grass

	//Not yet
/turf/closed/gm/ex_act(severity)
	switch(severity)
		if(EXPLOSION_THRESHOLD_MEDIUM to INFINITY)
			ScrapeAway()


/turf/closed/gm/dense
	name = "dense jungle wall"
	icon = 'icons/turf/ground_map.dmi'
	icon_state = "wall2"

/turf/closed/gm/dense/Initialize(mapload)
	. = ..()
	if(prob(6))
		icon_state = "wall1"
	else if (prob(5))
		icon_state = "wall3"
	else
		icon_state = "wall2"


//desertdam rock
/turf/closed/desert_rock
	name = "rockwall"
	icon = 'icons/turf/walls/cave.dmi'
	icon_state = "cavewall1"


//ICE WALLS-----------------------------------//

//Ice Wall
/turf/closed/ice
	name = "dense ice wall"
	icon = 'icons/turf/walls/icewall.dmi'
	icon_state = "Single"
	desc = "It is very thick."

/turf/closed/ice/single
	icon_state = "Single"

/turf/closed/ice/end
	icon_state = "End"

/turf/closed/ice/straight
	icon_state = "Straight"

/turf/closed/ice/corner
	icon_state = "Corner"

/turf/closed/ice/junction
	icon_state = "T_Junction"

/turf/closed/ice/intersection
	icon_state = "Intersection"

//Ice Secret Wall
/turf/closed/ice/secret
	desc = "There is something inside..."

/turf/closed/ice/secret/single
	icon_state = "Single"

/turf/closed/ice/secret/end
	icon_state = "End"

/turf/closed/ice/secret/straight
	icon_state = "Straight"

/turf/closed/ice/secret/corner
	icon_state = "Corner"

/turf/closed/ice/secret/junction
	icon_state = "T-Junction"

/turf/closed/ice/secret/intersection
	icon_state = "Intersection"


//Ice Thin Wall
/turf/closed/ice/thin
	name = "thin ice wall"
	icon = 'icons/turf/walls/icewalllight.dmi'
	icon_state = "Single"
	desc = "It is very thin."
	opacity = FALSE

/turf/closed/ice/thin/single
	icon_state = "Single"

/turf/closed/ice/thin/end
	icon_state = "End"

/turf/closed/ice/thin/straight
	icon_state = "Straight"

/turf/closed/ice/thin/corner
	icon_state = "Corner"

/turf/closed/ice/thin/junction
	icon_state = "T_Junction"

/turf/closed/ice/thin/intersection
	icon_state = "Intersection"

//Thin Ice Secret Wall
/turf/closed/ice/thin/secret
	desc = "There is something inside..."

/turf/closed/ice/thin/secret/single
	icon_state = "Single"

/turf/closed/ice/thin/secret/end
	icon_state = "End"

/turf/closed/ice/thin/secret/straight
	icon_state = "Straight"

/turf/closed/ice/thin/secret/corner
	icon_state = "Corner"

/turf/closed/ice/thin/secret/junction
	icon_state = "T-Junction"

/turf/closed/ice/thin/secret/intersection
	icon_state = "Intersection"


//ROCK WALLS------------------------------//

//Icy Rock
/turf/closed/ice_rock
	name = "Icy rock"
	icon = 'icons/turf/walls/rockwall.dmi'

/turf/closed/ice_rock/single
	icon_state = "single"

/turf/closed/ice_rock/singlePart
	icon_state = "single_part"

/turf/closed/ice_rock/singleT
	icon_state = "single_tshape"

/turf/closed/ice_rock/singleEnd
	icon_state = "single_ends"

/turf/closed/ice_rock/fourway
	icon_state = "4-way"

/turf/closed/ice_rock/corners
	icon_state = "full_corners"

//Directional walls each have 4 possible sprites and are
/turf/closed/ice_rock/northWall
	icon_state = "north_wall"

/turf/closed/ice_rock/northWall/Initialize(mapload)
	. = ..()
	setDir(pick(NORTH,SOUTH,EAST,WEST))

/turf/closed/ice_rock/southWall
	icon_state = "south_wall"

/turf/closed/ice_rock/southWall/Initialize(mapload)
	. = ..()
	setDir(pick(NORTH,SOUTH,EAST,WEST))

/turf/closed/ice_rock/westWall
	icon_state = "west_wall"

/turf/closed/ice_rock/westWall/Initialize(mapload)
	. = ..()
	setDir(pick(NORTH,SOUTH,EAST,WEST))

/turf/closed/ice_rock/eastWall
	icon_state = "east_wall"

/turf/closed/ice_rock/eastWall/Initialize(mapload)
	. = ..()
	setDir(pick(NORTH,SOUTH,EAST,WEST))
/turf/closed/ice_rock/cornerOverlay
	icon_state = "corner_overlay"


//SHUTTLE 'WALLS'
//not a child of turf/closed/wall because shuttle walls are magical, don't smoothes with normal walls, etc

/turf/closed/shuttle
	name = "wall"
	icon_state = "wall1"
	icon = 'icons/turf/shuttle.dmi'
	layer = ABOVE_TURF_LAYER
	unacidable = TRUE

/turf/closed/shuttle/is_weedable()
	return FULLY_WEEDABLE

/turf/closed/shuttle/dropship
	icon = 'icons/turf/walls/walls.dmi'
	icon_state = "rasputin1"

/turf/closed/shuttle/ert
	icon = 'icons/turf/ert_shuttle.dmi'
	icon_state = "stan4"

/turf/closed/shuttle/dropship1
	name = "\improper Alamo"
	icon = 'icons/turf/dropship.dmi'
	icon_state = "1"

/turf/closed/shuttle/dropship1/transparent
	opacity = FALSE

/turf/closed/shuttle/dropship2
	name = "\improper Normandy"
	icon = 'icons/turf/dropship2.dmi'
	icon_state = "1"

/turf/closed/shuttle/dropship2/transparent
	opacity = FALSE

/turf/closed/shuttle/midway
	name = "\improper Midway"
	icon = 'icons/turf/dropship4.dmi'
	icon_state = "1"

/turf/closed/shuttle/midway/transparent
	opacity = FALSE

/turf/closed/shuttle/cyclone
	name = "\improper Cyclone"
	icon = 'icons/turf/dropship2.dmi'
	icon_state = "1"

/turf/closed/shuttle/cyclone/transparent
	opacity = FALSE

/turf/closed/shuttle/pmc
	name = "\improper Cash Flow"
	icon = 'icons/turf/dropship_pmc.dmi'
	icon_state = "1"

/turf/closed/shuttle/pmc/transparent
	opacity = FALSE

/turf/closed/shuttle/typhoon
	name = "\improper Typhoon"
	icon = 'icons/turf/dropship3.dmi'
	icon_state = "1"

/turf/closed/shuttle/typhoon/transparent
	opacity = FALSE

/turf/closed/shuttle/tornado
	name = "\improper Tornado"
	icon = 'icons/turf/dropship3.dmi'
	icon_state = "1"

/turf/closed/shuttle/tornado/transparent
	opacity = FALSE

/turf/closed/shuttle/tripoli
	name = "\improper Tripoli"
	icon = 'icons/turf/dropship.dmi'
	icon_state = "1"

/turf/closed/shuttle/tripoli/transparent
	opacity = FALSE

/turf/closed/shuttle/twe_dropship
	name = "\improper UD4-UK"
	icon = 'icons/turf/twedropship.dmi'
	icon_state = "0,0"

/turf/closed/shuttle/twe_dropship/transparent
	opacity = FALSE

/turf/closed/shuttle/dropship3
	name = "\improper Saipan"
	icon = 'icons/turf/dropship3.dmi'
	icon_state = "1"

/turf/closed/shuttle/dropship3/transparent
	opacity = FALSE

/turf/closed/shuttle/dropship3/tornado
	name = "\improper Tornado"

/turf/closed/shuttle/dropship3/tornado/typhoon
	name = "\improper Typhoon"

/turf/closed/shuttle/escapepod
	name = "wall"
	icon = 'icons/turf/escapepods.dmi'
	icon_state = "wall0"

/turf/closed/shuttle/lifeboat
	name = "Lifeboat"
	desc = "Separates you from certain death."
	icon = 'icons/turf/lifeboat.dmi'
	icon_state = "2,0"

/turf/closed/shuttle/lifeboat/transparent
	icon_state = "window1"
	opacity = FALSE

//INSERT EXPLOSION CODE
/turf/closed/shuttle/lifeboat/proc/transform_crash()
	new /turf/open/shuttle/lifeboat(src)

// Elevator walls (directional)
/turf/closed/shuttle/elevator
	icon = 'icons/turf/elevator.dmi'
	icon_state = "wall"

// Wall with gears that animate when elevator is moving
/turf/closed/shuttle/elevator/gears
	icon_state = "wall_gear"

/turf/closed/shuttle/elevator/gears/proc/start()
	icon_state = "wall_gear_animated"

/turf/closed/shuttle/elevator/gears/proc/stop()
	icon_state = "wall_gear"

// Special wall icons
/turf/closed/shuttle/elevator/research
	icon_state = "wall_research"

/turf/closed/shuttle/elevator/dorm
	icon_state = "wall_dorm"

/turf/closed/shuttle/elevator/freight
	icon_state = "wall_freight"

/turf/closed/shuttle/elevator/arrivals
	icon_state = "wall_arrivals"

// Elevator Buttons
/turf/closed/shuttle/elevator/button
	name = "elevator buttons"

/turf/closed/shuttle/elevator/button/research
	icon_state = "wall_button_research"

/turf/closed/shuttle/elevator/button/dorm
	icon_state = "wall_button_dorm"

/turf/closed/shuttle/elevator/button/freight
	icon_state = "wall_button_freight"

/turf/closed/shuttle/elevator/button/arrivals
	icon_state = "wall_button_arrivals"



// Transit Shuttle
/turf/closed/shuttle/transit
	icon = 'icons/turf/shuttle.dmi'
	icon_state = "wall"

/turf/closed/shuttle/transit/horizontal
	icon_state = "swall12"

/turf/closed/shuttle/transit/vertical
	icon_state = "swall3"

/turf/closed/shuttle/transit/bl_corner
	icon_state = "swallc3"

/turf/closed/shuttle/transit/br_corner
	icon_state = "swallc4"

/turf/closed/shuttle/transit/tl_corner
	icon_state = "swallc2"

/turf/closed/shuttle/transit/tr_corner
	icon_state = "swallc1"

/turf/closed/shuttle/transit/l_end
	icon_state = "swall4"

/turf/closed/shuttle/transit/r_end
	icon_state = "swall8"

// Hybrisa Shuttles

/turf/closed/shuttle/dropship2/WY/HorizonRunner
	name = "\improper WY-LWI Horizon Runner HR-150"
	desc = "The WY-LWI Horizon Runner HR-150, a collaborative creation of Lunnar-Welsun Industries and Weyland-Yutani. This small dropship is designed for short-range commercial transport."
	icon = 'icons/turf/dropship5.dmi'

/turf/closed/shuttle/dropship2/WY/StarGlider
	name = "\improper WY-LWI StarGlider SG-200"
	desc = "The WY-LWI StarGlider SG-200, a product of the collaborative ingenuity between Weyland Yutani and Lunnar-Welsun Industries, This small dropship is designed for short-range commercial transport."
	icon = 'icons/turf/dropship5.dmi'

/turf/closed/shuttle/dropship2/WY/transparent
	icon = 'icons/turf/dropship5.dmi'
	opacity = FALSE
