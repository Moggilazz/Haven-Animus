/client/proc/cmd_admin_say(msg as text)
	set category = "Special Verbs"
	set name = "Asay" //Gave this shit a shorter name so you only have to time out "asay" rather than "admin say" to use it --NeoFite
	set hidden = 1

	if(!check_rights(R_ADMIN))	return

	msg = sanitize_uni(msg)
	if(!msg)	return

	log_admin("[key_name(src)] : [msg]")

	if(check_rights(R_ADMIN,0))
		msg = "<span class='adminmod'><span class='prefix'>ADMIN:</span> <EM>[key_name(usr, 1)]</EM> (<a href='?_src_=holder;adminplayerobservejump=\ref[mob]'>JMP</A>): <span class='message'>[msg]</span></span>"
		for(var/client/C in admins)
			if(R_ADMIN & C.holder.rights)
				C << msg

/client/proc/cmd_mod_say(msg as text)
	set category = "Special Verbs"
	set name = "Msay"
	set hidden = 1

	if(!check_rights(R_ADMIN|R_MOD))	return

	msg = sanitize_uni(msg)
	log_admin("MOD: [key_name(src)] : [msg]")

	if (!msg)
		return
	for(var/client/C in admins)
		if((R_ADMIN|R_MOD) & C.holder.rights)
			C << "<span class='mod'><span class='prefix'>MOD:</span> <EM>[key_name(src,1)]</EM> (<A HREF='?src=\ref[C.holder];adminplayerobservejump=\ref[mob]'>JMP</A>): <span class='message'>[msg]</span></span>"
