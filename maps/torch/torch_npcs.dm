/obj/random_multi/single_item/punitelly
	name = "Multi Point - Warrant Officer Punitelli"
	id = "Punitelli"
	item_path = /mob/living/carbon/human/monkey/punitelli

/mob/living/carbon/human/monkey/punitelli/New()
	..()
	name = "Warrant Officer Punitelli"
	real_name = name
	gender = MALE
	var/obj/item/clothing/C
	C = new /obj/item/clothing/under/solgov/utility/expeditionary/monkey(src)
	equip_to_appropriate_slot(C)
	put_in_hands(new /obj/item/reagent_containers/food/drinks/glass2/coffeecup/punitelli)
	equip_to_appropriate_slot(new /obj/item/clothing/mask/smokable/cigarette/jerichos)
	if(prob(50))
		equip_to_appropriate_slot(new /obj/item/clothing/shoes/sandal)

/spawner/runtime/name = "random cat (runtime)"
/spawner/runtime/flags = SPAWNER_GROUPED|SPAWNER_REQUIRED|SPAWNER_SINGLE
/spawner/runtime/chance = 0
/spawner/runtime/choice()
	return /mob/living/simple_animal/friendly/cat/fluff/Runtime

/obj/random_multi/single_item/poppy
	name = "Multi Point - Poppy"
	id = "Poppy"
	item_path = /mob/living/simple_animal/friendly/opossum/poppy