/spawner/toolbox/name = "random toolbox"
/spawner/toolbox/flags = SPAWNER_WEIGHTED
/spawner/toolbox/choice()
	return list(
		/obj/item/storage/toolbox/mechanical = 30,
		/obj/item/storage/toolbox/electrical = 20,
		/obj/item/storage/toolbox/emergency = 20,
		/obj/item/storage/toolbox/syndicate = 1
	)
