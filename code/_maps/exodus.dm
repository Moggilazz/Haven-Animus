#if !defined(MAP_FILE)

        #include "mapfiles\tgstation2.dmm"

        #define MAP_FILE "tgstation2.dmm"
        #define MAP_NAME "NSS Exodus"

#elif !defined(MAP_OVERRIDE)

	#warn a map has already been included, ignoring /tg/station 2.

#endif

var/station_name = "NSS Exodus"
var/vessel_type = "station"
var/list/vessel_z = list(1)
var/asteroid_z = 8
var/centcomm_z = 2