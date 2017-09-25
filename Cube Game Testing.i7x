Version 1/170825 of Cube Game Testing by Andrew Schultz begins here.

volume direction trackers

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

volume test scripts

chapter walkthrough

test fix with "fixsol/n/w/summon earth/touch/e/e/s/s/summon fire/touch/e/d/d/n/n/summon water/touch/d/s/s/w/w/summon air/touch/bcsol".
test fix3 with "fixsol/n/w/summon earth/touch/e/e/s/s/summon fire/touch/e/d/d/n/n/summon water/touch/nwin/l/x tunnels".

test cross with "test fix/ne/drop rope/w/w/u/u/u".
test cross2 with "test fix/ne/drop rope/w/w/d".

[WE = red green NS = purple yellow UD = orange blue]
test fbluef with "test fix/ne/drop rope/u/n/w/w/s/e/u/s/s/d/n/e/d/d/w".
test fblueb with "test fix/ne/drop rope/u/e/s/s/w/n/u/w/w/d/e/n/d/d/s".

test forangef with "test fix/ne/u/u/drop rope/d/s/e/e/n/w/d/n/n/u/s/w/u/u/e".
test forangeb with "test fix/ne/u/u/drop rope/d/w/n/n/e/s/d/e/e/u/w/s/u/u/n".

test fredf with "test fix/nw/u/drop rope/e/u/s/s/d/n/e/d/d/w/u/n/w/w/s".
test fredb with "test fix/nw/u/drop rope/e/n/d/d/s/u/e/s/s/w/n/u/w/w/d".

test fgreenf with "test fix/ne/u/e/drop rope/w/d/n/n/u/s/w/u/u/e/d/s/e/e/n".
test fgreenb with "test fix/ne/u/e/drop rope/w/s/u/u/n/d/w/n/n/e/s/d/e/e/u".

test fyelf with "test fix/se/u/drop rope/n/e/d/d/w/u/n/w/w/s/e/u/s/s/d".
test fyelb with "test fix/se/u/drop rope/n/u/w/w/d/e/n/d/d/s/u/e/s/s/w".

test fpurpf with "test fix/ne/u/n/drop rope/s/w/u/u/e/d/s/e/e/n/w/d/n/n/u".
test fpurpb with "test fix/ne/u/n/drop rope/s/d/e/e/u/w/s/u/u/n/d/w/n/n/e".

test tun with "fixsol/n/w/summon earth/touch/e/e/s/s/summon fire/touch/nw/d"

chapter map testing

test nloop with "n/n/d/d/d/s/s/s/u/u/u/n".
test sloop with "s/s/d/d/d/n/n/n/u/u/u/s".

test wloop with "w/w/d/d/d/e/e/e/u/u/u/w".
test eloop with "e/e/d/d/d/w/w/w/u/u/u/e".

test w2loop with "w/w/n/n/n/e/e/e/s/s/s/w".
test e2loop with "e/e/n/n/n/w/w/w/s/s/s/e".

test all-loop with "test nloop/test sloop/w/test nloop/test sloop/e/e/test nloop/test sloop/w/test wloop/test eloop/n/test wloop/test eloop/s/s/test wloop/test eloop/s/test w2loop/test e2loop/s/test w2loop/test e2loop/s/test w2loop/test e2loop"

Cube Game Testing ends here.

---- DOCUMENTATION ----