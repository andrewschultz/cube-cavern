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

chapter gotesting

gotesting is an action out of world.

understand the command "gotest" as something new.

understand "gotest" as gotesting.

carry out gotesting:
	now go-test is whether or not go-test is false;
	say "Go-test is now [if go-test is true]on[else]off[end if].";
	the rule succeeds;

chapter aving

aving is an action out of world.

understand the command "av" as something new.

understand "av" as aving.

carry out aving:
	say "Turning all rooms to visited.";
	now all rooms are visited;
	the rule succeeds;

chapter gotesting

gotestying is an action out of world.

understand the command "gotesty" as something new.

understand "gotesty" as gotesting.

carry out gotesting:
	now go-test is true;
	say "Go-test is now on.";
	the rule succeeds;

chapter rmnameing

rmnameing is an action out of world.

understand the command "rmname" as something new.

understand "rmname" as rmnameing.

carry out rmnameing:
	repeat with X running through regions:
		say "[X]: [list of rooms in X].";
	the rule succeeds;

chapter thimking

thimking is an action out of world.

understand the command "thimk" as something new.

understand "thimk" as thimking.

think-every-turn is a truth state that varies.

carry out thimking:
	now think-every-turn is whether or not think-every-turn is false;
	the rule succeeds;

every turn when think-every-turn is true:
	try think2ing instead;

chapter cheapwining

cheapwin0ing is an action out of world.

cheapwining is an action applying to one number.

carry out cheapwin0ing:
	try cheapwining 0 instead;

understand the command "cheatwin" as something new.
understand the command "cheapwin" as something new.

understand "cheapwin" as cheapwin0ing.
understand "cheatwin" as cheapwin0ing.

understand "cheapwin [number]" as cheapwining.
understand "cheatwin [number]" as cheapwining.

to centmove (r1 - a region) and (r2 - a region):
	if r1 is r2, continue the action;
	if indir of r1 is outdir of r2:
		let Q be a random perpendicular direction;
		try going Q;
		try going Q;
		try going outdir of r2;
		try going outdir of r2;
		try going outdir of r2;
		try going opposite of Q;
	else:
		try going outdir of r2;
		try going outdir of r2;
		try going indir of r1;

carry out cheapwining:
	if number understood > 7 or number understood < 0:
		say "You need a number from 0 to 7. 1-3 fixes which cheapwin room to examine, with 0 random. 0/4 decides whether you have a long or short walkthrough." instead;
	let Y be the remainder after dividing the number understood by 4;
	let Z be the number understood / 4;
	let C be a random cornerthing;
	repeat through table of cheapwins:
		if rightcolor of myt entry is black, next;
		if Y is 0:
			if a random chance of 1 in 3 succeeds:
				move player to l1 entry, without printing a room description;
			else if a random chance of 1 in 2 succeeds:
				move player to l2 entry, without printing a room description;
			else:
				move player to l3 entry, without printing a room description;
		else if Y is 1:
			move player to l1 entry, without printing a room description;
		else if Y is 2:
			move player to l2 entry, without printing a room description;
		else if Y is 1:
			move player to l3 entry, without printing a room description;
		now C is a random visible cornerthing;
		try colsummoning rightcolor of C;
		d "touching [c].";
		try touching C;
	if Z is 1: [this is the cheap cheater way not using moves]
		move player to very center;
		try going outdir of revregion of red;
		let R be revregion of red;
		move player to very center;
		try going outdir of revregion of orange;
		move player to very center;
		try going outdir of revregion of yellow;
		move player to very center;
		try going outdir of revregion of green;
		move player to very center;
		try going outdir of revregion of blue;
		move player to very center;
		try going outdir of revregion of purple;
		move player to a random facecenter room in R;
		try tying wire rope to wire rope;
		the rule succeeds;
	let RR be revregion of red;
	consider the every turn rules;
	move player to random facecenter room in mrlp;
	d "Moving from [mrlp] to [RR], red tunnel exit.";
	centmove mrlp and RR;
	try dropping rope;
	d "Moving inside in red tunnel.";
	d "[indir of mrlp].";
	rand-perp;
	try going indir of RR;
	d "Moving outside in orange tunnel.";
	try going outdir of revregion of orange;
	now RR is revregion of yellow;
	move player to a random facecenter room in RR;
	d "Moving inside in yellow tunnel.";
	try going indir of RR;
	d "Moving outside in green tunnel.";
	try going outdir of revregion of green;
	now RR is revregion of blue;
	move player to a random facecenter room in RR;
	d "Moving inside in blue tunnel.";
	try going indir of RR;
	d "Moving outside in purple tunnel.";
	try going outdir of revregion of purple;
	now RR is revregion of red;
	move player to a random facecenter room in RR;
	try tying wire rope to wire rope;
	the rule succeeds;

to rand-perp:
	let Q be a random perpendicular direction;
	d "Going [q] then [opposite of q].";
	try going Q;
	try going opposite of Q;

definition: a direction (called d) is perpendicular:
	unless d is simple, no;
	if d is outdir of mrlp, no;
	if d is indir of mrlp, no;
	yes;

table of cheapwins
myt	l1	l2	l3
northupwest	n02	u02	w22
northupeast	n22	u22	e22
southupwest	s02	u00	w02
southupeast	s22	u20	e02
northdownwest	n00	d02	w20
northdowneast	n20	d22	e20
southdownwest	s00	d00	w00
southdowneast	s20	d20	e00

chapter bordtesting

bordtesting is an action out of world.

understand the command "bordtest" as something new.

understand "bordtest" as bordtesting.

carry out bordtesting:
	btest 1 and 2;
	btest 1 and 3;
	btest 1 and 5;
	btest 2 and 4;
	btest 3 and 4;
	btest 3 and 7;
	btest 4 and 8;
	btest 5 and 7;
	try blacking;
	the rule succeeds;

to btest (x - a number) and (y - a number):
	try blacking;
	say "[b]SHOULD WORK[r]:[line break]";
	choose row x in table of cheapwins;
	move player to l1 entry, without printing a room description;
	try summoning fire;
	try touching myt entry;
	say "[b]SHOULDN'T WORK [x] [y][r]:[line break]";
	choose row y in table of cheapwins;
	move player to l1 entry, without printing a room description;
	try summoning fire;
	try touching myt entry;

chapter blacking

blacking is an action out of world.

understand the command "black" as something new.

understand "black" as blacking.

carry out blacking:
	repeat with Q running through cornerthings:
		now cornercolor of Q is black;
	say "All transponders reset to black.";
	the rule succeeds;

volume test scripts

chapter non-wins

test 2of2 with "pick 11234/ne/white/touch/sw/sw/red/touch/w/nd/nd/yellow/touch/n/ue/drop rope/s/u/n/n/d/tie rope to rope".
test 2of3 with "pick 11234/nw/white/touch/se/se/red/touch/e/nd/nd/yellow/touch/us/drop rope/w/n/e/e/s/tie rope to rope".
test 4of4 with "pick 11234/sw/blue/touch/ne/ne/yellow/touch/e/ds/ds/d/red/touch/nw/nw/white/touch/n/eu/drop rope/s/w/s/s/e/n/e/n/n/w/tie rope".

chapter walkthrough

test fix with "fixsol/n/w/summon earth/touch/e/e/s/s/summon fire/touch/e/d/d/n/n/summon water/touch/d/s/s/w/w/summon air/touch/bcsol".
test fix3 with "fixsol/n/w/summon earth/touch/e/e/s/s/summon fire/touch/e/d/d/n/n/summon water/touch/nw/in/l/x tunnels".

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

test c1-0a with "pick 11234/av/nw/summon white/touch/se/se/summon red/touch/nw/n/n/d/d/d/s/ne/summon yellow/touch/sw/sw/summon blue/touch/ne/n/n/u/u/u/s/drop rope/d/e/n/n/w/s/d/w/w/u/e/s/u/u/n/tie rope".
test c1-1a with "pick 11234/av/nw/summon white/touch/se/se/summon red/touch/nw/n/n/d/d/d/s/ne/summon yellow/touch/sw/sw/summon blue/touch/ne/s/s/u/drop rope/n/u/e/e/d/w/n/d/d/s/u/w/s/s/e/tie rope".
test c1-2a with "pick 11234/av/nw/summon white/touch/se/se/summon red/touch/nw/n/n/d/d/d/s/ne/summon yellow/touch/sw/sw/summon blue/touch/ne/w/w/u/drop rope/e/s/u/u/n/d/e/n/n/w/s/d/w/w/u/tie rope".
test c1-3a with "pick 11234/av/nw/summon white/touch/se/se/summon red/touch/nw/n/n/d/d/d/s/ne/summon yellow/touch/sw/sw/summon blue/touch/ne/drop rope/u/w/s/s/e/n/u/e/e/d/w/n/d/d/s/tie rope".
test c1-4a with "pick 11234/av/nw/summon white/touch/se/se/summon red/touch/nw/n/n/d/d/d/s/ne/summon yellow/touch/sw/sw/summon blue/touch/ne/n/n/u/drop rope/s/d/w/w/u/e/s/u/u/n/d/e/n/n/w/tie rope".
test c1-5a with "pick 11234/av/nw/summon white/touch/se/se/summon red/touch/nw/n/n/d/d/d/s/ne/summon yellow/touch/sw/sw/summon blue/touch/ne/e/e/u/drop rope/w/n/d/d/s/u/w/s/s/e/n/u/e/e/d/tie rope".
test c1-6a with "pick 11234/av/nw/summon white/touch/se/se/summon red/touch/nw/n/n/d/d/d/s/ne/summon yellow/touch/sw/sw/summon blue/touch/ne/s/s/u/drop rope/n/w/d/d/e/u/n/e/e/s/w/u/s/s/d/tie rope".
test c1-7a with "pick 11234/av/nw/summon white/touch/se/se/summon red/touch/nw/n/n/d/d/d/s/ne/summon yellow/touch/sw/sw/summon blue/touch/ne/w/w/u/drop rope/e/d/n/n/u/s/e/u/u/w/d/s/w/w/n/tie rope".
test c1-8a with "pick 11234/av/nw/summon white/touch/se/se/summon red/touch/nw/n/n/d/d/d/s/ne/summon yellow/touch/sw/sw/summon blue/touch/ne/drop rope/u/n/e/e/s/w/u/s/s/d/n/w/d/d/e/tie rope".
test c1-9a with "pick 11234/av/nw/summon white/touch/se/se/summon red/touch/nw/n/n/d/d/d/s/ne/summon yellow/touch/sw/sw/summon blue/touch/ne/n/n/u/drop rope/s/e/u/u/w/d/s/w/w/n/e/d/n/n/u/tie rope".
test c1-10a with "pick 11234/av/nw/summon white/touch/se/se/summon red/touch/nw/n/n/d/d/d/s/ne/summon yellow/touch/sw/sw/summon blue/touch/ne/e/e/u/drop rope/w/u/s/s/d/n/w/d/d/e/u/n/e/e/s/tie rope".
test c1-11a with "pick 11234/av/nw/summon white/touch/se/se/summon red/touch/nw/n/n/d/d/d/s/ne/summon yellow/touch/sw/sw/summon blue/touch/ne/n/n/u/u/u/s/drop rope/d/s/w/w/n/e/d/n/n/u/s/e/u/u/w/tie rope".

chapter direction testing

test ud with "ne/sw/ws/en/nw/se/es/wn".
test uds with "gonear u11/test ud/gonear d11/test ud".
test ns with "ue/dw/wd/eu/uw/de/ed/wu".
test nss with "gonear n11/test ns/gonear s11/test ns".
test ew with "un/ds/sd/nu/us/dn/nd/su".
test ews with "gonear e11/test ew/gonear w11/test ew".

test uofftest with "gotesty/gonear u11/nw/test udofftest".
test dofftest with "gotesty/gonear d11/nw/test udofftest".
test udofftest with "sw/w/nw/n/ne/
e/nw/n/ne/
e/nw/n/ne/e/se/
s/ne/e/se/
s/ne/e/se/s/sw/
w/se/s/sw/
w/se/s/sw/w/nw/
n/sw/w/nw/
ne/se/sw/nw/se/ne/nw/sw".

test nofftest with "gotesty/gonear n11/uw/test nsofftest".
test sofftest with "gotesty/gonear s11/uw/test nsofftest".
test nsofftest with "dw/w/uw/u/ue/
e/uw/u/ue/
e/uw/u/ue/e/de/
s/ue/e/de/
s/ue/e/de/d/dw/
w/de/d/dw/
w/de/d/dw/w/uw/
u/dw/w/uw/
ue/de/dw/uw/de/ue/uw/dw"

test eofftest with "gotesty/gonear e11/us/test ewofftest".
test wofftest with "gotesty/gonear w11/us/test ewofftest".
test ewofftest with "ds/s/us/u/un/
n/us/u/un/
n/us/u/un/n/dn/
d/un/n/dn/
d/un/n/dn/d/ds/
s/dn/d/ds/
s/dn/d/ds/s/us/
u/ds/s/us/
un/dn/ds/us/dn/un/us/ds
"

test viewstrung with "pick 11234/sw/blue/touch/ne/ne/yellow/touch/e/ds/ds/d/red/touch/nw/nw/white/touch/n/eu/drop rope/s/w/s/s/e/n/e/w/s/n/e/s/s/w/w".

Cube Game Testing ends here.

---- DOCUMENTATION ----