/// Uses the result of choice() as a fixed path
#define SPAWNER_SINGLE 0x1

/// Uses the result of choice() as a weighted list
#define SPAWNER_WEIGHTED 0x2

/// Once one of this type has fired, skip the others
#define SPAWNER_GROUPED 0x4

/// If a grouped spawner didn't fire, place one later
#define SPAWNER_REQUIRED 0x8


/spawner/parent_type = /atom/movable
/spawner/name = "spawner"
/spawner/desc = "create something at round-start according to rules"
/spawner/icon = 'icons/misc/mark.dmi'
/spawner/icon_state = "rup"
/spawner/var/flags
/spawner/var/chance = 100
/spawner/var/static/list/groups = list()


/spawner/proc/choice()


/spawner/Initialize(mapload, finalizing)
	..()
	INIT_DISALLOW_TYPE(/spawner)
	if (!loc)
		return INITIALIZE_HINT_QDEL
	if (chance != 100 && !finalizing)
		if (flags & SPAWNER_GROUPED)
			var/list/group = groups[type]
			if (!group)
				groups[type] = list(FALSE, flags & SPAWNER_REQUIRED, loc)
			else if (group[1])
				return INITIALIZE_HINT_QDEL
			else
				group += loc
		if (!prob(chance))
			return INITIALIZE_HINT_QDEL
		if (flags & SPAWNER_GROUPED)
			var/list/group = groups[type]
			group.Cut()
			group += TRUE
	var/path = choice()
	if (~flags & SPAWNER_SINGLE)
		if (flags & SPAWNER_WEIGHTED)
			path = pickweight(path)
		else
			path = pick(path)
	if (!path)
		return INITIALIZE_HINT_QDEL
	var/atom/A = new path (loc)
	if (pixel_x || pixel_y)
		A.pixel_x = pixel_x
		A.pixel_y = pixel_y
	return INITIALIZE_HINT_QDEL


/hook/lobby/proc/finalize_spawners()
	var/spawner/spawner = /spawner
	var/list/groups = initial(spawner.groups)
	for (spawner as anything in groups)
		var/list/entry = groups[spawner]
		if (!entry[1] && entry[2] && entry.len > 2)
			entry.Cut(1, 3)
			new spawner (pick(entry), TRUE)
	groups.Cut()
	return TRUE
