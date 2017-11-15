Version 1/170825 of Cube Cavern Test Commands by Andrew Schultz begins here.

volume direction trackers

chapter alldiring

alldiring is an action applying to nothing.

understand the command "alldir" as something new.

understand "alldir" as alldiring.

carry out alldiring:
	let mr be location of player;
	repeat with Q running through directions:
		say "[bold type]====going [Q] from [mr].[roman type]";
		try going Q;
		if the player is not in mr, move the player to mr, without printing a room description;
	the rule succeeds;

chapter waysing

waysing is an action out of world.

understand the command "ways" as something new.

understand "ways" as waysing.

carry out waysing:
	say "Here we are testing all combinations of directions to see which rooms are which direction from other rooms.";
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

carry out gotestying:
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
	say "Now think-every-turn is [on-off of think-every-turn].";
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
	repeat with V1 running from 1 to 8:
		repeat with V2 running from (V1 + 1) to 8:
			btest V1 and V2;
	try blacking;
	say "Quick summary: twelve failures should be seen, only at:[line break]--1,2 1,3 1,5 2,4[line break]--2,6 3,4 3,7 4,8[line break]--5,6 5,7 6,8 7,8.";
	the rule succeeds;

to decide whether adj of (n1 - a number) and (n2 - a number):
	let Q be n1;
	let Z be n2 - n1;
	if Z < 0, now Z is 0 - Z;
	if Z is 4, decide yes;
	if Z is 2 and remainder after dividing Q by 4 < 3, decide yes;
	if Z is 1 and remainder after dividing Q by 2 is 1, decide yes;
	decide no;

to btest (x - a number) and (y - a number):
	try blacking;
	say "[b]**** [x], [y] SECOND TOUCH SHOULD [if adj of x and y]NOT[end if] BE CHANGEABLE****[r]:[line break]";
	choose row x in table of cheapwins;
	move player to l1 entry, without printing a room description;
	try silently summoning fire;
	try touching myt entry;
	choose row y in table of cheapwins;
	move player to l1 entry, without printing a room description;
	try silently summoning fire;
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

chapter qaing

qaing is an action applying to nothing.

understand the command "qa" as something new.

understand "qa" as qaing.

carry out qaing:
	if number of aligned regions is 6, say "This command won't do any good, now." instead;
	repeat with t running through cornerthings:
		now cornercolor of t is rightcolor of t;
	tun-beac-reset;
	the rule succeeds;

chapter t4ing

t4ing is an action applying to one visible thing.

understand the command "t4" as something new.

understand "t4 [direction]" as t4ing.

does the player mean t4ing up: it is very likely.

carry out t4ing:
	if noun is not a direction, say "You need to apply a direction." instead;
	if noun is not simple, say "You need to apply a simple direction: U D N E S W." instead;
	repeat through table of beacon zaps:
		if mydir entry is noun or mydir entry is opposite of noun:
			now cornercolor of con1 entry is rightcolor of con2 entry;
			now cornercolor of con2 entry is rightcolor of con1 entry;
	tun-beac-reset;
	now all aligned regions are ever-aligned;
	say "Mirror imaged the beacons along the [noun]/[opposite of noun] axis, so you have 4 tunnels." instead;
	the rule succeeds.

chapter g2ing

g2ing is an action applying to one visible thing.

understand the command "g2" as something new.

understand "g2 [direction]" as g2ing.

does the player mean g2ing outdir of mrlp: it is very likely.

carry out g2ing:
	if mrlp is mtr, say "You need to be on a face for this to work." instead;
	if noun is not simple, say "You need a simple direction: U D N E S W." instead;
	repeat through table of region beacons:
		if indir of myreg entry is opposite of noun:
			black-beacons;
			now cornercolor of b1 entry is rightcolor of b1 entry;
			now cornercolor of b2 entry is rightcolor of b2 entry;
			now cornercolor of b3 entry is rightcolor of b3 entry;
			now cornercolor of b4 entry is rightcolor of b4 entry;
			say "[myreg entry] now aligned.";
			tun-beac-reset;
			the rule succeeds;
	say "Couldn't find any beacons to set. Sorry.";
	the rule succeeds.

chapter g3ing

g3ing is an action applying to one visible thing.

understand the command "g3" as something new.

understand "g3 [direction]" as g3ing.

carry out g3ing:
	if mrlp is mtr, say "You need to be on a face for this to work." instead;
	if noun is not complex, say "You need a complex direction: (UDNESW) x (UDNESW), minus equivalent and opposite combinations." instead;
	black-beacons;
	let first-dir be up;
	let second-dir be up;
	repeat through table of dirmerge:
		if noun is d3 entry:
			now first-dir is d1 entry;
			now second-dir is d2 entry;
	let matches be 2;
	repeat through table of region beacons:
		let Q be outdir of myreg entry;
		if Q is first-dir or Q is second-dir:
			now cornercolor of b1 entry is rightcolor of b1 entry;
			now cornercolor of b2 entry is rightcolor of b2 entry;
			now cornercolor of b3 entry is rightcolor of b3 entry;
			now cornercolor of b4 entry is rightcolor of b4 entry;
	if matches < 2, say "Uh oh, was only able to match [matches]. This is a bug." instead;
	say "Both [first-dir] and [second-dir] faces are merged.";
	tun-beac-reset;
	the rule succeeds.

chapter wining

wining is an action applying to nothing.

understand the command "win" as something new.

understand "win" as wining.

carry out wining:
	now all rooms are visited;
	end the game in victory;
	the rule succeeds;

chapter wraping

wraping is an action applying to one visible thing.

understand the command "wrap" as something new.

understand "wrap [direction]" as wraping.

carry out wraping:
	if noun is not simple, say "You need a simple noun." instead;
	if the room noun of location of player is nowhere, say "You can't go that way to start the warp." instead;
	if player is in very center, say "You need to be on a face." instead;
	let startloc be location of player;
	let od be opposite of noun;
	let startreg be mrlp;
	let id be indir of location of player;
	let times-forward be 0;
	while room noun of location of player is not nowhere:
		increment times-forward;
		try going noun;
	try going id;
	try going id;
	try going id;
	try going od;
	try going od;
	try going od;
	try going opposite of id;
	try going opposite of id;
	try going opposite of id;
	while room noun of location of player is not nowhere, try going noun;
	while times-forward < 3:
		increment times-forward;
		try going noun;
	if startloc is not location of player, say "Wound up in [location of player], should've wound up back at [startloc].";
	the rule succeeds;

chapter extra testing verbs

report verbing:
	say "Here are testing specific commands.";
	say "QA = quick advance. Colors all the beacons correctly.";
	say "T4 = Make 4 tunnels. You can specify a direction. It and its opposite will not be open.";
	say "G2 (direction) = get 2 right. The direction is the face they'll be right on. The default is the one you're on.";
	say "G3 (direction) = get 3 right. The direction is diagonal and will be the two faces they'll be right on. There is no default.";
	say "WAYS = shows the ways between your location and the next room.";
	say "ALLWAY = all the ways between rooms.";
	say "WARP (direction) = warp around the cube starting a certain direction.";
	say "GOTEST toggles the gotest variable. GOTESTY forces it to true.";
	say "THIMK = toggle think-every-turn.";
	say "RMNAME = show room names by region.";
	say "BLACK = reset transponders to black. Superseded by CLEAR/CLEAN.";
	say "BORDTEST is a unit test to check adjacent beacons conflict properly.";

Cube Cavern Test Commands ends here.

---- DOCUMENTATION ----