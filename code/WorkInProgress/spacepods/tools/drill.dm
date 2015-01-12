/obj/item/device/spacepod_equipment/tool/drill
	name = "Drill"
	desc = "This is the drill that'll pierce the heavens! (Can be attached to: Combat and Engineering Spacepods)"
	icon_state = "mecha_drill"
	equip_cooldown = 30
	energy_drain = 10
	force = 15

	action(atom/target)
		if(!action_checks(target)) return
		if(isobj(target))
			var/obj/target_obj = target
			if(!target_obj.vars.Find("unacidable") || target_obj.unacidable)	return
		set_ready_state(0)
		chassis.use_power(energy_drain)
		chassis.visible_message("<font color='red'><b>[chassis] starts to drill [target]</b></font>", "You hear the drill.")
		occupant_message("<font color='red'><b>You start to drill [target]</b></font>")
		var/T = chassis.loc
		var/C = target.loc	//why are these backwards? we may never know -Pete
		if(do_after_cooldown(target))
			if(T == chassis.loc && src == chassis.selected)
				if(istype(target, /turf/simulated/wall/r_wall))
					occupant_message("<font color='red'>[target] is too durable to drill through.</font>")
				else if(istype(target, /turf/simulated/mineral))
					for(var/turf/simulated/mineral/M in range(chassis.get_active_part(1),1)|range(chassis.get_active_part(2),1))
						if(get_dir(chassis,M)&chassis.dir)
							M.GetDrilled()
					log_message("Drilled through [target]")
/*					if(locate(/obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp) in chassis.equipment)
						var/obj/structure/ore_box/ore_box = locate(/obj/structure/ore_box) in chassis:cargo
						if(ore_box)
							for(var/obj/item/weapon/ore/ore in range(chassis,1))
								if(get_dir(chassis,ore)&chassis.dir)
									ore.Move(ore_box)*/
				else if(istype(target, /turf/simulated/floor/plating/airless/asteroid))
					for(var/turf/simulated/floor/plating/airless/asteroid/M in range(chassis,1))
						if(get_dir(chassis,M)&chassis.dir)
							M.gets_dug()
					log_message("Drilled through [target]")
/*					if(locate(/obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp) in chassis.equipment)
						var/obj/structure/ore_box/ore_box = locate(/obj/structure/ore_box) in chassis:cargo
						if(ore_box)
							for(var/obj/item/weapon/ore/ore in range(chassis,1))
								if(get_dir(chassis,ore)&chassis.dir)
									ore.Move(ore_box)*/
				else if(target.loc == C)
					log_message("Drilled through [target]")
					target.ex_act(2)
		return 1

/*	can_attach(obj/mecha/M as obj)
		if(..())
			if(istype(M, /obj/mecha/working) || istype(M, /obj/mecha/combat))
				return 1
		return 0*/