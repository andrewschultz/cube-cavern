Version 1/170825 of Rube Cube Testing by Andrew Schultz begins here.

chapter waysing

waysing is an action out of world.

understand the command "ways" as something new.

understand "ways" as waysing.

Bordering relates rooms to each other. The verb to border (he borders, they border, it is bordered) implies the bordering relation.

carry out waysing:
	repeat with d1 running through simple directions:
		repeat with d2 running through simple directions:
			if d2 is d1, next;
			if d2 is opposite of d1, next;
			let Q1 be the room d2 of location of player;
			if Q1 is nothing, next;
			let P1 be the room d1 of Q1;
			let Q2 be the room d1 of location of player;
			if Q2 is nothing, next;
			let P2 be the room d2 of Q2;
			if P2 is P1:
				say "[p1] is [combodir of d1 and d2] of [location of player].";
			else:
				say "[bracket][p2] may be [combodir of d1 and d2] of [location of player].[close bracket][line break]";
				say "[bracket][p1] may be [combodir of d1 and d2] of [location of player].[close bracket][line break]";
	the rule succeeds;

chapter allwaying

allwaying is an action out of world.

understand the command "allway" as something new.

understand "allway" as allwaying.

carry out allwaying:
	repeat with Q running through rooms:
		repeat with Q2 running through all rooms:
			now Q does not border Q2;
	repeat with X running through rooms:
		move player to X;
		try waysing;
	the rule succeeds;

chapter rmnameing

rmnameing is an action out of world.

understand the command "rmname" as something new.

understand "rmname" as rmnameing.

carry out rmnameing:
	repeat with X running through regions:
		say "[X]: [list of rooms in X].";
	the rule succeeds;

Rube Cube Testing ends here.

---- DOCUMENTATION ----