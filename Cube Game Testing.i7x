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

chapter non-wins

test 2of2 with "pick 1234/nw/white/touch/se/se/red/touch/e/nd/nd/yellow/touch/n/uw/s/u/n/n/d/tie rope to rope".
test 2of3 with "pick 11234/nw/white/touch/se/se/red/touch/e/nd/nd/yellow/touch/us/drop rope/w/n/e/e/s/tie rope to rope".
test 4of4 with "pick 11234/sw/blue/touch/ne/ne/yellow/touch/e/ds/ds/d/red/touch/nw/nw/white/touch/n/eu/drop rope/s/w/s/s/e/n/e/n/n/w/tie rope".

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

chapter all 48

test c1 with "pick 11234/nw/summon white/touch/se/se/summon red/touch/gonear d11/ne/summon yellow/touch/sw/sw/summon blue/touch/gonear u11/drop rope/d/e/gonear n11/s/d/gonear w11/e/s/gonear u11/tie rope".
test c2 with "pick 1234/ne/summon white/touch/sw/sw/summon red/touch/gonear d11/nw/summon yellow/touch/se/se/summon blue/touch/gonear u11/drop rope/d/w/gonear n11/s/d/gonear e11/w/s/gonear u11/tie rope".

test c3 with "pick 11243/nw/summon white/touch/se/se/summon red/touch/gonear d11/ne/summon blue/touch/sw/sw/summon yellow/touch/gonear u11/drop rope/d/s/gonear w11/e/d/gonear n11/s/e/gonear u11/tie rope".
test c4 with "pick 1243/ne/summon white/touch/sw/sw/summon red/touch/gonear d11/nw/summon blue/touch/se/se/summon yellow/touch/gonear u11/drop rope/d/s/gonear e11/w/d/gonear n11/s/w/gonear u11/tie rope".

test c5 with "pick 11324/nw/summon white/touch/se/se/summon yellow/touch/gonear d11/ne/summon red/touch/sw/sw/summon blue/touch/gonear n11/drop rope/s/e/gonear u11/d/s/gonear w11/e/d/gonear n11/tie rope".
test c6 with "pick 1324/ne/summon white/touch/sw/sw/summon yellow/touch/gonear d11/nw/summon red/touch/se/se/summon blue/touch/gonear n11/drop rope/s/w/gonear u11/d/s/gonear e11/w/d/gonear n11/tie rope".

test c7 with "pick 11342/nw/summon white/touch/se/se/summon yellow/touch/gonear d11/ne/summon blue/touch/sw/sw/summon red/touch/gonear w11/drop rope/e/s/gonear u11/d/e/gonear n11/s/d/gonear w11/tie rope".
test c8 with "pick 1342/ne/summon white/touch/sw/sw/summon yellow/touch/gonear d11/nw/summon blue/touch/se/se/summon red/touch/gonear e11/drop rope/w/s/gonear u11/d/w/gonear n11/s/d/gonear e11/tie rope".

test c9 with "pick 11423/nw/summon white/touch/se/se/summon blue/touch/gonear d11/ne/summon red/touch/sw/sw/summon yellow/touch/gonear n11/drop rope/s/d/gonear w11/e/s/gonear u11/d/e/gonear n11/tie rope".
test c10 with "pick 1423/ne/summon white/touch/sw/sw/summon blue/touch/gonear d11/nw/summon red/touch/se/se/summon yellow/touch/gonear n11/drop rope/s/d/gonear e11/w/s/gonear u11/d/w/gonear n11/tie rope".

test c11 with "pick 11432/nw/summon white/touch/se/se/summon blue/touch/gonear d11/ne/summon yellow/touch/sw/sw/summon red/touch/gonear w11/drop rope/e/d/gonear n11/s/e/gonear u11/d/s/gonear w11/tie rope".
test c12 with "pick 1432/ne/summon white/touch/sw/sw/summon blue/touch/gonear d11/nw/summon yellow/touch/se/se/summon red/touch/gonear e11/drop rope/w/d/gonear n11/s/w/gonear u11/d/s/gonear e11/tie rope".

test c13 with "pick 12134/nw/summon red/touch/se/se/summon white/touch/gonear d11/ne/summon yellow/touch/sw/sw/summon blue/touch/gonear u11/drop rope/d/n/gonear e11/w/d/gonear s11/n/w/gonear u11/tie rope".
test c14 with "pick 2134/ne/summon red/touch/sw/sw/summon white/touch/gonear d11/nw/summon yellow/touch/se/se/summon blue/touch/gonear u11/drop rope/d/n/gonear w11/e/d/gonear s11/n/e/gonear u11/tie rope".

test c15 with "pick 12143/nw/summon red/touch/se/se/summon white/touch/gonear d11/ne/summon blue/touch/sw/sw/summon yellow/touch/gonear u11/drop rope/d/w/gonear s11/n/d/gonear e11/w/n/gonear u11/tie rope".
test c16 with "pick 2143/ne/summon red/touch/sw/sw/summon white/touch/gonear d11/nw/summon blue/touch/se/se/summon yellow/touch/gonear u11/drop rope/d/e/gonear s11/n/d/gonear w11/e/n/gonear u11/tie rope".

test c17 with "pick 12314/nw/summon red/touch/se/se/summon yellow/touch/gonear d11/ne/summon white/touch/sw/sw/summon blue/touch/gonear n11/drop rope/s/u/gonear e11/w/s/gonear d11/u/w/gonear n11/tie rope".
test c18 with "pick 2314/ne/summon red/touch/sw/sw/summon yellow/touch/gonear d11/nw/summon white/touch/se/se/summon blue/touch/gonear n11/drop rope/s/u/gonear w11/e/s/gonear d11/u/e/gonear n11/tie rope".

test c19 with "pick 12341/nw/summon red/touch/se/se/summon yellow/touch/gonear d11/ne/summon blue/touch/sw/sw/summon white/touch/gonear w11/drop rope/e/u/gonear s11/n/e/gonear d11/u/n/gonear w11/tie rope".
test c20 with "pick 2341/ne/summon red/touch/sw/sw/summon yellow/touch/gonear d11/nw/summon blue/touch/se/se/summon white/touch/gonear e11/drop rope/w/u/gonear s11/n/w/gonear d11/u/n/gonear e11/tie rope".

test c21 with "pick 12413/nw/summon red/touch/se/se/summon blue/touch/gonear d11/ne/summon white/touch/sw/sw/summon yellow/touch/gonear n11/drop rope/s/w/gonear d11/u/s/gonear e11/w/u/gonear n11/tie rope".
test c22 with "pick 2413/ne/summon red/touch/sw/sw/summon blue/touch/gonear d11/nw/summon white/touch/se/se/summon yellow/touch/gonear n11/drop rope/s/e/gonear d11/u/s/gonear w11/e/u/gonear n11/tie rope".

test c23 with "pick 12431/nw/summon red/touch/se/se/summon blue/touch/gonear d11/ne/summon yellow/touch/sw/sw/summon white/touch/gonear w11/drop rope/e/n/gonear d11/u/e/gonear s11/n/u/gonear w11/tie rope".
test c24 with "pick 2431/ne/summon red/touch/sw/sw/summon blue/touch/gonear d11/nw/summon yellow/touch/se/se/summon white/touch/gonear e11/drop rope/w/n/gonear d11/u/w/gonear s11/n/u/gonear e11/tie rope".

test c25 with "pick 13124/nw/summon yellow/touch/se/se/summon white/touch/gonear d11/ne/summon red/touch/sw/sw/summon blue/touch/gonear e11/drop rope/w/n/gonear u11/d/w/gonear s11/n/d/gonear e11/tie rope".
test c26 with "pick 3124/ne/summon yellow/touch/sw/sw/summon white/touch/gonear d11/nw/summon red/touch/se/se/summon blue/touch/gonear w11/drop rope/e/n/gonear u11/d/e/gonear s11/n/d/gonear w11/tie rope".

test c27 with "pick 13142/nw/summon yellow/touch/se/se/summon white/touch/gonear d11/ne/summon blue/touch/sw/sw/summon red/touch/gonear s11/drop rope/n/w/gonear u11/d/n/gonear e11/w/d/gonear s11/tie rope".
test c28 with "pick 3142/ne/summon yellow/touch/sw/sw/summon white/touch/gonear d11/nw/summon blue/touch/se/se/summon red/touch/gonear s11/drop rope/n/e/gonear u11/d/n/gonear w11/e/d/gonear s11/tie rope".

test c29 with "pick 13214/nw/summon yellow/touch/se/se/summon red/touch/gonear d11/ne/summon white/touch/sw/sw/summon blue/touch/gonear e11/drop rope/w/u/gonear n11/s/w/gonear d11/u/s/gonear e11/tie rope".
test c30 with "pick 3214/ne/summon yellow/touch/sw/sw/summon red/touch/gonear d11/nw/summon white/touch/se/se/summon blue/touch/gonear w11/drop rope/e/u/gonear n11/s/e/gonear d11/u/s/gonear w11/tie rope".

test c31 with "pick 13241/nw/summon yellow/touch/se/se/summon red/touch/gonear d11/ne/summon blue/touch/sw/sw/summon white/touch/gonear s11/drop rope/n/u/gonear w11/e/n/gonear d11/u/e/gonear s11/tie rope".
test c32 with "pick 3241/ne/summon yellow/touch/sw/sw/summon red/touch/gonear d11/nw/summon blue/touch/se/se/summon white/touch/gonear s11/drop rope/n/u/gonear e11/w/n/gonear d11/u/w/gonear s11/tie rope".

test c33 with "pick 13412/nw/summon yellow/touch/se/se/summon blue/touch/gonear d11/ne/summon white/touch/sw/sw/summon red/touch/gonear d11/drop rope/u/w/gonear n11/s/u/gonear e11/w/s/gonear d11/tie rope".
test c34 with "pick 3412/ne/summon yellow/touch/sw/sw/summon blue/touch/gonear d11/nw/summon white/touch/se/se/summon red/touch/gonear d11/drop rope/u/e/gonear n11/s/u/gonear w11/e/s/gonear d11/tie rope".

test c35 with "pick 13421/nw/summon yellow/touch/se/se/summon blue/touch/gonear d11/ne/summon red/touch/sw/sw/summon white/touch/gonear d11/drop rope/u/n/gonear w11/e/u/gonear s11/n/e/gonear d11/tie rope".
test c36 with "pick 3421/ne/summon yellow/touch/sw/sw/summon blue/touch/gonear d11/nw/summon red/touch/se/se/summon white/touch/gonear d11/drop rope/u/n/gonear e11/w/u/gonear s11/n/w/gonear d11/tie rope".

test c37 with "pick 14123/nw/summon blue/touch/se/se/summon white/touch/gonear d11/ne/summon red/touch/sw/sw/summon yellow/touch/gonear e11/drop rope/w/d/gonear s11/n/w/gonear u11/d/n/gonear e11/tie rope".
test c38 with "pick 4123/ne/summon blue/touch/sw/sw/summon white/touch/gonear d11/nw/summon red/touch/se/se/summon yellow/touch/gonear w11/drop rope/e/d/gonear s11/n/e/gonear u11/d/n/gonear w11/tie rope".

test c39 with "pick 14132/nw/summon blue/touch/se/se/summon white/touch/gonear d11/ne/summon yellow/touch/sw/sw/summon red/touch/gonear s11/drop rope/n/d/gonear e11/w/n/gonear u11/d/w/gonear s11/tie rope".
test c40 with "pick 4132/ne/summon blue/touch/sw/sw/summon white/touch/gonear d11/nw/summon yellow/touch/se/se/summon red/touch/gonear s11/drop rope/n/d/gonear w11/e/n/gonear u11/d/e/gonear s11/tie rope".

test c41 with "pick 14213/nw/summon blue/touch/se/se/summon red/touch/gonear d11/ne/summon white/touch/sw/sw/summon yellow/touch/gonear e11/drop rope/w/s/gonear d11/u/w/gonear n11/s/u/gonear e11/tie rope".
test c42 with "pick 4213/ne/summon blue/touch/sw/sw/summon red/touch/gonear d11/nw/summon white/touch/se/se/summon yellow/touch/gonear w11/drop rope/e/s/gonear d11/u/e/gonear n11/s/u/gonear w11/tie rope".

test c43 with "pick 14231/nw/summon blue/touch/se/se/summon red/touch/gonear d11/ne/summon yellow/touch/sw/sw/summon white/touch/gonear s11/drop rope/n/e/gonear d11/u/n/gonear w11/e/u/gonear s11/tie rope".
test c44 with "pick 4231/ne/summon blue/touch/sw/sw/summon red/touch/gonear d11/nw/summon yellow/touch/se/se/summon white/touch/gonear s11/drop rope/n/w/gonear d11/u/n/gonear e11/w/u/gonear s11/tie rope".

test c45 with "pick 14312/nw/summon blue/touch/se/se/summon yellow/touch/gonear d11/ne/summon white/touch/sw/sw/summon red/touch/gonear d11/drop rope/u/s/gonear e11/w/u/gonear n11/s/w/gonear d11/tie rope".
test c46 with "pick 4312/ne/summon blue/touch/sw/sw/summon yellow/touch/gonear d11/nw/summon white/touch/se/se/summon red/touch/gonear d11/drop rope/u/s/gonear w11/e/u/gonear n11/s/e/gonear d11/tie rope".

test c47 with "pick 14321/nw/summon blue/touch/se/se/summon yellow/touch/gonear d11/ne/summon red/touch/sw/sw/summon white/touch/gonear d11/drop rope/u/e/gonear s11/n/u/gonear w11/e/n/gonear d11/tie rope".
test c48 with "pick 4321/ne/summon blue/touch/sw/sw/summon yellow/touch/gonear d11/nw/summon red/touch/se/se/summon white/touch/gonear d11/drop rope/u/w/gonear s11/n/u/gonear e11/w/n/gonear d11/tie rope".

test c1a with "pick 11234/nw/summon white/touch/se/se/summon red/touch/nw/n/n/d/d/d/s/ne/summon yellow/touch/sw/sw/summon blue/touch/ne/n/n/u/u/u/s/drop rope/d/e/n/n/w/s/d/w/w/u/e/s/u/u/n/tie rope".

Cube Game Testing ends here.

---- DOCUMENTATION ----