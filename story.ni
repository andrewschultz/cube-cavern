"The Rube on the Cube" by Andrew Schultz

the story headline is "A 3-dimensional text adventure. Well, the map is"

the story description is "A speedy 3-d Deed-y"

volume includes

include Trivial Niceties by Andrew Schultz.

include Basic Screen Effects by Emily Short. [ watch out! center/central are defined here, so centered/center can cause runtime errrors. This is specific to my game and the mechanics it has.]

section debug to start - not for release

when play begins:
	now debug-state is true;

volume region and room definitions

upper face is a region.
bottom face is a region.
western face is a region.
eastern face is a region.
southern face is a region.
northern face is a region.

a region has a direction called indir.

indir of upper face is down.
indir of bottom face is up.
indir of northern face is south.
indir of southern face is north.
indir of western face is east.
indir of eastern face is west.

mtr is a region.

a room can be facecenter, edge, corner or nonfacial.

a region can be ever-aligned or never-aligned. a region is usually never-aligned.

to decide what region is mrlp: [I'd include this in a header but it complains if you don't use regions]
	if map region of location of player is nothing, decide on mtr;
	decide on map region of location of player.

definition: a region (called x) is aligned:
	if x is mtr, no;
	if raycolor of x is beaccolor of x, yes;
	no;

last-rope-region is a region that varies.

chapter color definitions

color is a kind of value. the colors are black, red, yellow, blue, white, purple, orange, green, brown.

a color has a color called inverse.

inverse of red is green. inverse of green is red.

inverse of purple is yellow. inverse of yellow is purple.

inverse of orange is blue. inverse of blue is orange.

inverse of brown is brown. inverse of black is white. inverse of white is black.

a region has a color called beaccolor.


rainbowlinking relates one color to one color. The verb to rainbowlink (he rainbowlinks, they rainbowlink, it rainbowlinks, it is rainbowlinked) implies the rainbowlinking relation.

red rainbowlinks orange. orange rainbowlinks yellow. yellow rainbowlinks green. green rainbowlinks blue. blue rainbowlinks purple. purple rainbowlinks red.

to decide whether (c1 - a color) colorborders (c2 - a color):
	if c1 colorborders c2 or c2 colorborders c1, decide yes;
	decide no;

to decide which color is the mix of (a - a color) and (b - a color):
	if a is b, decide on a;
	if a is white or a is black, decide on b;
	if b is white or b is black, decide on a;
	if a is brown or b is brown, decide on brown;
	repeat through table of colormatches:
		if a is c1 entry and b is c2 entry, decide on c3 entry;
		if b is c1 entry and a is c2 entry, decide on c3 entry;
		if a is c2 entry and b is c3 entry, decide on c3 entry;
		if b is c2 entry and a is c3 entry, decide on c3 entry;
	decide on brown;

volume when play begins

when play begins:
	say "It's 2020, and despite all the technological progress--jetpacks, air cars, laser cannons, and so forth--even a time machine prototype--you always felt there was something more. Something out in space. So you joined up with the space program, and you were sent on a mission to an oddly cubic asteroid. The psycho-sensors attached to your ship indicate it may be an even greater well of knowledge and new isotopes than previously thought. Nothing seems to be on the surface, but maybe you can dig into the center...";
	sort init-list in random order;
	if a random chance of 1 in 2 succeeds: [goodness this looks long and drawn out but the alternative is to get the final solution and then to derive what you need to do, which is fraught with error]
		now rightcolor of northupwest is entry 1 of init-list;
		now rightcolor of southupeast is entry 2 of init-list;
		now rightcolor of northdowneast is entry 3 of init-list;
		now rightcolor of southdownwest is entry 4 of init-list;
		now beaccolor of upper face is mix of rightcolor of northupwest and rightcolor of southupeast;
		now beaccolor of bottom face is mix of rightcolor of northdowneast and rightcolor of southdownwest;
		now beaccolor of western face is mix of rightcolor of northupwest and rightcolor of southdownwest;
		now beaccolor of eastern face is mix of rightcolor of northdowneast and rightcolor of southupeast;
		now beaccolor of northern face is mix of rightcolor of northupwest and rightcolor of northdowneast;
		now beaccolor of southern face is mix of rightcolor of southupeast and rightcolor of southdownwest;
	else:
		now rightcolor of northdownwest is entry 1 of init-list;
		now rightcolor of southdowneast is entry 2 of init-list;
		now rightcolor of northupeast is entry 3 of init-list;
		now rightcolor of southupwest is entry 4 of init-list;
		now beaccolor of bottom face is mix of rightcolor of northdownwest and rightcolor of southdowneast;
		now beaccolor of upper face is mix of rightcolor of northupeast and rightcolor of southupwest;
		now beaccolor of western face is mix of rightcolor of northdownwest and rightcolor of southupwest;
		now beaccolor of eastern face is mix of rightcolor of northupeast and rightcolor of southdowneast;
		now beaccolor of northern face is mix of rightcolor of northdownwest and rightcolor of northupeast;
		now beaccolor of southern face is mix of rightcolor of southdowneast and rightcolor of southupwest;
	wfak;

init-list is a list of colors variable. init-list is { white, red, yellow, blue }.

volume the player

the player wears the mood ring. description of mood ring is "Your mood ring is currently [ring-color]."

check taking off the mood ring:
	say "No, it's an important scientific thingamabob that will help you with your mission." instead;

ring-color is a color that varies. ring-color is usually black.

ring-moves is a number that varies.

every turn when ring-color is not black:
	decrement ring-moves;
	if ring-moves is 2:
		say "The mood ring is half faded back to black, now.";
	else if ring-moves is 0:
		say "Your mood ring changes back from [ring-color] to black.";
		now ring-color is black;

the player carries the coil of wire rope. "It's rope you will need to pull the cube, or whatever's in it, down to the surfae. You can DROP to tie it at a certain place, then TIE it."

rope-locations is a list of rooms that varies. rope-locations is {}.

rope-drop is a truth state that varies.

rope-colors is a list of colors variable. rope-colors is {}.

last-top-room is a room that varies.

check dropping wire rope:
	if location of player is not facecenter, say "There's no good place to drop it." instead;
	if beacon is in location of player, say "You don't need to tie the rope to the beacon. It might be too fragile to respond to stress." instead;
	if rope-drop is true, say "You already dropped the rope to start.";
	if rope-drop is false:
		say "You drop the rope.";
		now last-top-room is location of player;
		now rope-drop is true;
		the rule succeeds;

check dropping:
	say "Whatever you drop could get lost forever. Best hang on." instead;

chapter elements

an element is a kind of thing. an element has a color called conc-color. an element has a truth state called ever-acc. an element has text called blah-txt.

air is an element. conc-color of air is white. blah-txt is "People argued if air should have a color, but of course it has to. It's just really, really white: ultra-white, maybe."

fire is an element. conc-color of fire is yellow. blah-txt is "People argued once that fire should be orange, because fire looks orange when humans make it, but these days you know better. How would you make anything yellow, then?"

earth is an element. conc-color of earth is red. blah-txt is "People thought earth should be brown, but then, it's different colors on different planets. Since most dirt has probably gone through a lot of fire and water, it must be red at its true core."

water is an element. conc-color of water is blue. blah-txt is "There was a big fight over whether water should be blue and air, white, or vice versa. A bunch of wars were fought, but during those wars, all the weapons being created totally spurred science! People learned so much. Nowadays people don't joke about if things were reversed unless they want free room and board at the government's (dis)pleasure."

chapter reviewing

does the player mean reviewing an element: it is very likely.

reviewing is an action applying to one visible thing.

understand the command "review" as something new.

understand "review [any thing]" as reviewing.

carry out reviewing:
	if noun is not an element, say "You can only review elements. The elements are: [list of elements]." instead;
	say "You reflect on the [noun] for a bit. Your mood ring [if ring-color is conc-color of noun]glows a bit brighter but does not change color[else]changes to [conc-color of noun][end if].";
	if ever-acc of noun is false:
		say "[line break]SCIENCE TIME: [blah-txt of noun][line break]";
		now ever-acc of noun is true;
	now ring-color is conc-color of noun;
	now ring-moves is 5;
	the rule succeeds.


volume direction definitions

upwest is a direction. opposite of upwest is downeast.

upeast is a direction. opposite of upeast is downwest.

upnorth is a direction. opposite of upnorth is downsouth.

upsouth is a direction. opposite of upsouth is downnorth.

downwest is a direction. opposite of downwest is upeast.

downeast is a direction. opposite of downeast is upwest.

downnorth is a direction. opposite of downnorth is upsouth.

downsouth is a direction. opposite of downsouth is upnorth.

book complexity

a direction can be complex, simple or irrelevant. a direction is usually simple.

inside is irrelevant.

outside is irrelevant.

upwest is complex. upeast is complex. upsouth is complex. upnorth is complex.

downwest is complex. downeast is complex. downsouth is complex. downnorth is complex.

northwest is complex. northeast is complex. southeast is complex. southwest is complex.

understand "uw" as upwest. understand "dw" as downwest.
understand "wu" as upwest. understand "wd" as downwest.

understand "us" as upsouth. understand "ds" as downsouth.
understand "su" as upsouth. understand "sd" as downsouth.

understand "ue" as upeast. understand "de" as downeast.
understand "eu" as upeast. understand "ed" as downeast.

understand "un" as upnorth. understand "dn" as downnorth.
understand "nu" as upnorth. understand "nd" as downnorth.

understand "wn" as northwest.
understand "ws" as southwest.
understand "en" as northeast.
understand "es" as southeast.

to decide which direction is combodir of (da - a  direction) and (db - a direction):
	repeat through table of dirmerge:
		if d1 entry is da and d2 entry is db, decide on d3 entry;
		if d2 entry is da and d1 entry is db, decide on d3 entry;
	decide on nothing;

to decide which direction is uncombo of (da - a  direction) and (db - a direction):
	if whether or not da is complex is whether or not db is complex, decide on nothing;
	repeat through table of dirmerge:
		if db is complex and d2 entry is da and d3 entry is db, decide on d1 entry;
		if db is not complex and d3 entry is da and d2 entry is db, decide on d1 entry;
	decide on nothing;

table of dirmerge
d1	d2	d3
west	up	upwest
east	up	upeast
west	down	downwest
east	down	downeast
north	up	upnorth
south	up	upsouth
north	down	downnorth
south	down	downsouth
east	north	northeast
east	south	southeast
west	north	northwest
west	south	southwest

book definitions

definition: a direction (called d) is warpable:
	if the room d of location of player is nowhere, decide no;
	if map region of the room d of location of player is mrlp, decide no;
	decide yes;

definition: a direction (called d) is goable:
	if the room d of location of player is nowhere, decide no;
	if map region of the room d of location of player is mrlp, decide yes;
	decide no;

definition: a direction (called d) is cromulent:
	if d is ubercromulent or d is semicromulent, decide yes;
	decide no;

definition: a direction (called d) is semicromulent:
	if d is inside or d is outside, decide yes;
	if d is ubercromulent, decide yes;
	if mrlp is upper face or mrlp is bottom face:
		if d is southeast or d is southwest or d is northwest or d is northeast, decide yes;
	if mrlp is western face or mrlp is eastern face:
		if d is upsouth or d is downsouth or d is upnorth or d is downnorth, decide yes;
	if mrlp is northern face or mrlp is southern face:
		if d is upeast or d is upwest or d is downwest or d is downeast, decide yes;
	decide no;

definition: a direction (called d) is ubercromulent:
	if mrlp is northern face or mrlp is southern face:
		if d is east or d is up or d is west or d is down, decide yes;
	if mrlp is western face or mrlp is eastern face:
		if d is up or d is south or d is down or d is north, decide yes;
	if mrlp is upper face or mrlp is bottom face:
		if d is east or d is south or d is west or d is north, decide yes;
	decide no;

book wrong way rejects

to say can-want:
	say "[if number of ever-aligned regions > 0]can[else]want to[end if]"

before going:
	if mrlp is mtr, continue the action;
	if noun is inside:
		if location of player is facecenter:
			try going indir of mrlp instead;
		say "You're not at the center, so you wouldn't really be going [indir of mrlp][if number of ever-aligned regions is 0], and you haven't found a way, yet, anyway[end if]." instead;
	if location of player is facecenter:
		if noun is indir of mrlp:
			if beacon is visible:
				say "You may want to go that way to get to the center of the cube, but you can't, now." instead;
			continue the action;
	if location of player is corner and noun is descdir of location of player:
		say "You might impale yourself on the corner of the cube. Ouch!" instead;
	if noun is not cromulent:
		say "You can only go [list of ubercromulent directions], or any non-opposite pair of those four directions, on the [mrlp][if location of player is facecenter]. You also [can-want] go inside here in the center[end if]." instead;
	let X be room noun of location of player;
	if noun is not simple:
		repeat through table of dirmerge:
			if d3 entry is noun:
				let R1 be the room d1 entry of location of player;
				if R1 is nothing, next;
				let R2 be the room d2 entry of R1;
				if R2 is nothing, next;
				let R3 be the room d1 entry of location of player;
				if R3 is nothing, next;
				let R4 be the room d2 entry of R3;
				if R4 is nothing, next;
				if R4 is R2:
					if mrlp is not map region of R2:
						say "[if noun is complex]It feels weird shimmying over at a diagonal angle, but there you are[else]Fwoop. You flip over to the [map region of x][end if].";
					move player to R2;
					the rule succeeds;
				say "You can't quite go that way. Maybe you should, but you can't." instead;
		say "That would be wandering off into nothing." instead;

carry out going when location of player is very center:
	check-rope-tunnel beaccolor of room noun of very center;
	if the rule failed, the rule succeeds;
	continue the action;

volume upper face

book u00

u00 is a corner privately-named room in upper face. descdir is southwest.

book u10

u10 is an edge privately-named room in upper face. it is east of u00. descdir is south.

book u20

u20 is a corner privately-named room in upper face. it is east of u10. descdir is southeast.

book u01

u01 is an edge privately-named room in upper face. it is north of u00. descdir is west.

book u11

u11 is a facecenter privately-named room in upper face. it is east of u01. it is north of u10. descdir is inside.

the player is in u11.

book u21

u21 is an edge privately-named room in upper face. it is east of u11. it is north of u20. descdir is east.

book u02

u02 is a corner privately-named room in upper face. it is north of u01. descdir is northwest.

book u12

u12 is an edge privately-named room in upper face. it is east of u02. it is north of u11. descdir is north.

book u22

u22 is a corner privately-named room in upper face. it is east of u12. it is north of u21. descdir is northeast.

volume western face

book w00

w00 is a corner privately-named room in western face. descdir is downsouth.

book w10

w10 is an edge privately-named room in western face. it is north of w00. descdir is down.

book w20

w20 is a corner privately-named room in western face. it is north of w10. descdir is downnorth.

book w01

w01 is an edge privately-named room in western face. it is up of w00. descdir is south.

book w11

w11 is a facecenter privately-named room in western face. it is north of w01. it is up of w10. descdir is inside.

book w21

w21 is an edge privately-named room in western face. it is north of w11. it is up of w20. descdir is north.

book w02

w02 is a corner privately-named room in western face. it is up of w01. descdir is upsouth.

w02 is west of u00. east of w02 is nothing. u00 is up of w02. down of u00 is nothing.

book w12

w12 is an edge privately-named room in western face. it is north of w02. it is up of w11. descdir is up.

w12 is west of u01. east of w12 is nothing. u01 is up of w12. down of u01 is nothing.

book w22

w22 is a corner privately-named room in western face. it is north of w12. it is up of w21. descdir is upnorth.

w22 is west of u02. [?? east of w22 is nothing]. u02 is up of w22. down of u02 is nothing.

volume eastern face

book e00

e00 is a corner privately-named room in eastern face. descdir is downsouth.

book e10

e10 is an edge privately-named room in eastern face. it is north of e00. descdir is down.

book e20

e20 is a corner privately-named room in eastern face. it is north of e10. descdir is downnorth.

book e01

e01 is an edge privately-named room in eastern face. it is up of e00. descdir is south.

book e11

e11 is a facecenter privately-named room in eastern face. it is north of e01. it is up of e10. descdir is inside.

book e21

e21 is an edge privately-named room in eastern face. it is north of e11. it is up of e20. descdir is north.

book e02

e02 is a corner privately-named room in eastern face. it is up of e01. descdir is upsouth.

e02 is east of u20. west of e02 is nothing. u20 is up of e02. down of u20 is nothing.

book e12

e12 is an edge privately-named room in eastern face. it is north of e02. it is up of e11. descdir is up.

e12 is east of u21. west of e12 is nothing. u21 is up of e12. down of u21 is nothing.

book e22

e22 is a corner privately-named room in eastern face. it is north of e12. it is up of e21. descdir is upnorth.

e22 is east of u22. west of e22 is nothing. u22 is up of e22. down of u22 is nothing.

volume northern face

book n00

n00 is a corner privately-named room in northern face. descdir is downwest.

w20 is south of n00. north of w20 is nothing. n00 is east of w20. west of w20 is nothing.

book n10

n10 is an edge privately-named room in northern face. it is east of n00. descdir is down.

book n20

n20 is a corner privately-named room in northern face. it is east of n10. descdir is downeast.

e20 is east of n20. west of e20 is nothing. n20 is north of e20. south of n20 is nothing.

book n01

n01 is an edge privately-named room in northern face. it is up of n00. descdir is west.

w21 is south of n01. north of w21 is nothing. n01 is east of w21. west of w21 is nothing.

book n11

n11 is a facecenter privately-named room in northern face. it is east of n01. it is up of n10. descdir is inside.

book n21

n21 is an edge privately-named room in northern face. it is east of n11. it is up of n20. descdir is east.

e21 is east of n21. west of e21 is nothing. n21 is north of e21. south of n21 is nothing.

book n02

n02 is a corner privately-named room in northern face. it is up of n01. descdir is upwest.

u02 is up of n02. down of u02 is nothing. n02 is north of u02. [?? what is going on south of n02 is nothing.]

w22 is south of n02. north of w22 is nothing. n02 is east of w22. west of w22 is nothing.

book n12

n12 is an edge privately-named room in northern face. it is east of n02. it is up of n11. descdir is up.

u12 is up of n12. down of u12 is nothing. n12 is north of u12. south of n12 is nothing.

book n22

n22 is a corner privately-named room in northern face. it is east of n12. it is up of n21. descdir is upeast.

u22 is up of n22. down of u22 is nothing. n22 is north of u22. south of n22 is nothing.

e22 is east of n22. west of e22 is nothing. north of e22 is n22. south of n22 is nothing

volume southern face

book s00

s00 is a corner privately-named room in southern face. descdir is downwest.

west of s00 is w00. south of w00 is s00. east of w00 is nothing. north of s00 is nothing.

book s10

s10 is an edge privately-named room in southern face. it is east of s00. descdir is down.

book s20

s20 is a corner privately-named room in southern face. it is east of s10. descdir is downeast.

e00 is east of s20. west of e00 is nothing. s20 is south of e00. north of s20 is nothing.

book s01

s01 is an edge privately-named room in southern face. it is up of s00. descdir is west.

west of s01 is w01. south of w01 is s01. east of w01 is nothing. north of s01 is nothing.

book s11

s11 is a facecenter privately-named room in southern face. it is east of s01. it is up of s10. descdir is inside.

book s21

s21 is an edge privately-named room in southern face. it is east of s11. it is up of s20. descdir is east.

e01 is east of s21. west of e01 is nothing. s21 is south of e01. north of s21 is nothing.

book s02

s02 is a corner privately-named room in southern face. it is up of s01. descdir is upwest.

west of s02 is w02. south of w02 is s02. east of w02 is nothing. north of s02 is nothing.

south of u00 is s02. up of s02 is u00. north of s02 is nowhere. down of u00 is nowhere.

book s12

s12 is an edge privately-named room in southern face. it is east of s02. it is up of s11. descdir is up.

A homunculus is a person in s12. "A pretty big homunculus is chillin['] here."

south of u10 is s12. up of s12 is u10. north of s12 is nowhere. down of u10 is nowhere.

book s22

s22 is a corner privately-named room in southern face. it is east of s12. it is up of s21. descdir is upeast.

south of u20 is s22. up of s22 is u20. north of s22 is nowhere. down of u20 is nowhere.

e02 is east of s22. west of e02 is nothing. s22 is south of e02. north of s22 is nothing.

volume bottom face

book d00

d00 is a corner privately-named room in bottom face. descdir is southwest.

s00 is south of d00. north of s00 is nothing. d00 is down of s00. up of d00 is nothing.

w00 is west of d00. east of w00 is nothing. d00 is down of w00. up of d00 is nothing.

book d10

d10 is an edge privately-named room in bottom face. it is east of d00. descdir is south.

s10 is south of d10. north of s10 is nothing. d10 is down of s10. up of d10 is nothing.

book d20

d20 is a corner privately-named room in bottom face. it is east of d10. descdir is southeast.

s20 is south of d20. north of s20 is nothing. d20 is down of s20. up of d20 is nothing.

e00 is east of d20. west of e00 is nothing. d20 is down of e00. up of d20 is nothing.

book d01

d01 is an edge privately-named room in bottom face. it is north of d00. descdir is west.

w10 is west of d01. east of w10 is nothing. d01 is down of w10. up of d01 is nothing.

book d11

d11 is a facecenter privately-named room in bottom face. it is east of d01. it is north of d10. descdir is inside.

book d21

d21 is an edge privately-named room in bottom face. it is east of d11. it is north of d20. descdir is east.

a bottle of phlogiston is in d21. description is "No description yet, but it's phlogiston. Trust me."

e10 is east of d21. west of e10 is nothing. d21 is down of e10. up of d21 is nothing.

book d02

d02 is a corner privately-named room in bottom face. it is north of d01. descdir is northwest.

n00 is north of d02. [?? south of n00 is nothing.] d02 is down of n00. up of d02 is nothing.

w20 is west of d02. [?? east of w20 is nothing.] d02 is down of w20. up of d02 is nothing.

book d12

d12 is an edge privately-named room in bottom face. it is east of d02. it is north of d11. descdir is north.

n10 is north of d12. south of n10 is nothing. d12 is down of n10. up of d12 is nothing.

book d22

d22 is a corner privately-named room in bottom face. it is east of d12. it is north of d21. descdir is northeast.

e20 is east of d22. west of e20 is nothing. d22 is down of e20. up of d22 is nothing.

n20 is north of d22. south of n20 is nothing. d22 is down of n20. up of d22 is nothing.

a blank slate is a thing in n20.

book very center

the very center is a nonfacial room. it is below u11. it is above d11. it is west of e11. it is east of w11. it is north of s11. it is south of n11. printed name is "The Very Center".

the tunnels are scenery in very center. understand "tunnel" as tunnel.

check examining tunnels:
	say "The tunnel[if number of aligned regions is 1]is[else]s are[end if] colored as follows:[line break]";
	repeat with X running through regions:
		if x is mtr, next;
		if x is aligned, say "[indir of x]: [beaccolor of x].";

description of very center is "Here in the very center you can go [list of centexit directions] back to the surface through different colored tunnels. There's some weird gold object [object-doing][one of]. It must be what gave those weird...readings[or][stopping]."

the gold spherical object is scenery in very center. "It seems to be projecting a small rainbow. You know, the colors red, orange, yellow, green, blue, purple[one of]. You remember in your science history books, reading about a heretic sentenced to death for insisting that purple should be broken down into indigo and violet. Needlessly complex. Where DO some people get their ideas from?[or].[stopping]"

understand "sphere" and "gold sphere" as gold spherical object.

to say object-doing:
	let al be number of aligned regions;
	if al is 6:
		say "floating in the center of the tunnel intersections";
	else if al is 4:
		say "hanging in the middle of the two-way intersection, so close yet so far from freedom";
	else:
		say "[if al is 3]barely wedged into the tunnel walls[else if al is 2]wedged[else if al is 1]pretty thoroughly wedged[else]hanging around in a buggy way[end if] in to the tunnel walls";

instead of doing something with the gold object:
	if current action is examining, continue the action;
	if current action is taking, say "The gold object seems to repel you magnetically." instead;
	say "The gold object hums mysteriously as you contemplate it. You need to find a way to unlock it, or whatever. Not that it has a lock or anything."

definition: a direction (called di) is centexit:
	if the room di of very center is tunneled, yes;
	no;

before going to very center:
	if mrlp is never-aligned:
		say "You're at the right place to go in, but you don't have a way through, yet." instead;
	if mrlp is not aligned:
		say "You're at the right place to go in, but the way through closed." instead;
	check-rope-tunnel beaccolor of mrlp;
	if continue-tunnel is false, the rule succeeds;

continue-tunnel is a truth state that varies.

to check-rope-tunnel (c - a color):
	now continue-tunnel is true;
	if rope-drop is false:
		say "You glide down a weird [c] tunnel...[paragraph break]";
		continue the action;
	let Q be number of entries in rope-colors;
	if c is entry Q in rope-colors:
		remove entry Q from rope-colors;
		say "You pull back the segment of rope you dropped in the [c] tunnel.";
		d "[rope-colors].";
	else:
		if c is listed in rope-colors:
			say "You're pulled from entering the tunnel again with your rope. Perhaps you should choose another tunnel[if player is in very center], or retreat[end if].";
			now continue-tunnel is false;
			continue the action;
		add c to rope-colors;
		endgame-check;
		d "[rope-colors].";

to endgame-check:
	if number of entries in rope-colors is 6:
		if entry 1 in rope-colors is red and entry 2 in rope-colors is orange and entry 3 in rope-colors is yellow and entry 4 in rope-colors is green and entry 5 in rope-colors is blue and entry 6 in rope-colors is purple:
			now continue-tunnel is false;
			end the story saying "You win, you made a rainbow!";
		else:
			say "Hmm, nothing happens.";

before going in very center:
	if noun is inside:
		say "You're already inside at the center of the asteroid." instead;
	if noun is outside:
		say "There are six ways outside." instead;
	if noun is complex:
		say "Only simple directions work here. Each goes to the center of a different face." instead;
	if noun is not centexit:
		say "Maybe you can make a path like that later, but there is none, now." instead;

book beacons

the beacon is a backdrop. it is in u11, d11, w11, e11, s11, n11.

check taking the beacon:
	say "The beacon seems stuck in the ground." instead;

table of colormatches
c1	c2	c3
red	yellow	orange
red	blue	purple
yellow	blue	green

the tunnel is a backdrop.

definition: a room (called r) is tunneled:
	unless r is facecenter, no;
	if map region of r is aligned, yes;
	no;

definition: a room (called r) is beaconed:
	unless r is facecenter, no;
	if map region of r is aligned, no;
	yes;

book connectors

a conn is a kind of backdrop. a conn has a color called conncolor. a conn has a color called rightcolor. the rightcolor of a conn is usually black. the conncolor of a conn is usually black.

Bbordering relates conns to each other. The verb to bborder (he bborders, they bborder, it is bbordered) implies the bbordering relation.

the northdownwest conductor is a conn. It is in n00, d02, w20.

the northdowneast conductor is a conn. It is in n20, d22, e20.

the northupwest conductor is a conn. It is in n02, u02, w22.

the northupeast conductor is a conn. It is in n22, u22, e22.

the southdownwest conductor is a conn. It is in s00, d00, w00.

the southdowneast conductor is a conn. It is in s20, d20, e00.

the southupwest conductor is a conn. It is in s02, u00, w02.

the southupeast conductor is a conn. It is in s22, u20, e02.

the northdownwest conductor bborders the northupwest conductor.
the northupwest conductor bborders the northupeast conductor.
the northupeast conductor bborders the northdowneast conductor.
the northdowneast conductor bborders the northdownwest conductor.

the southdownwest conductor bborders the southupwest conductor.
the southupwest conductor bborders the southupeast conductor.
the southupeast conductor bborders the southdowneast conductor.
the southdowneast conductor bborders the southdownwest conductor.

the northdownwest conductor bborders the southdownwest conductor.
the northdowneast conductor bborders the southdowneast conductor.
the northupwest conductor bborders the southupwest conductor.
the northupeast conductor bborders the southupeast conductor.

does the player mean touching a conn: it is very likely.

description of a conn is usually "It sticks out from the cube at an angle, away from the pointy edge. It's currently colored [conncolor of the item described]."

fixed-beacons is a truth state that varies.

check touching a conn:
	if fixed-beacons is true, say "You don't need to fiddle with the transponders any more." instead;
	let ia be number of aligned regions;
	if ring-color is black and conncolor of noun is black, say "It feels like something should happen, but it doesn't." instead;
	repeat through table of beacon zaps:
		if con2 entry is noun and conncolor of con1 entry is not black, say "You step back as a strong electric pulse emits from the [mydir entry]. Maybe you can't change this conductor right now." instead;
	let oldcolor be raycolor of mrlp;
	if ring-color is black:
		say "The transponder winks back to black.";
	else if conncolor of noun is black:
		say "A flash of light infuses the transponder. It shortly changes to [ring-color].";
	else:
		say "The transponder changes from [conncolor of noun] to [ring-color].";
	now conncolor of noun is ring-color;
	let newcolor be raycolor of mrlp;
	if newcolor is oldcolor, the rule succeeds;
	let na be number of aligned regions;
	unless oldcolor is beaccolor of mrlp or newcolor is beaccolor of mrlp, say "Nothing much seems to happen. Well, yet." instead;
	if oldcolor is beaccolor of mrlp, say "You hear a whirring that ends on a low note to the [centerdir of location of player].";
	if newcolor is beaccolor of mrlp:
		say "You hear a whirring that ends on a high note to the [centerdir of location of player].";
		now mrlp is ever-aligned;
		if number of aligned regions is 6:
			say "The cube shakes a bit. It felt like a few tunnels opened at once.";
			now fixed-beacons is true;
	move tunnel backdrop to all tunneled rooms;
	move beacon backdrop to all beaconed rooms;
	if debug-state is true:
		say "[number of aligned regions] regions ([list of aligned regions]) now aligned.";
	the rule succeeds;

to decide which direction is centerdir of (r - a room):
	let q be u00;
	repeat with d running through simple directions:
		if the room d of r is nowhere, next;
		now q is the room d of r;
		if q is facecenter, decide on d;
		repeat with e running through simple directions:
			if the room e of q is nowhere, next;
			if the room e of q is facecenter, decide on e;
	say "**BUG**";
	decide on inside;

table of beacon zaps
con1	con2	mydir
northdownwest	northupwest	northwest
southdownwest	southupwest	southwest
northdowneast	northupeast	northeast
southdowneast	southupeast	southeast
northupeast	southupeast	upeast
northupwest	southupwest	upwest
northdowneast	southdowneast	downeast
northdownwest	southdownwest	downwest
northupeast	northupwest	upnorth
northdowneast	northdownwest	downnorth
southupeast	southupwest	upsouth
southupeast	southupwest	downsouth

table of region beacons
myreg	b1	b2	b3	b4
upper face	northupwest	southupeast	northupeast	southupwest
bottom face	northdownwest	southdowneast	northdowneast	southdownwest
western face	northdownwest	southupwest	northupwest	southdownwest
eastern face	northdowneast	southupeast	northupeast	southdowneast
southern face	southdownwest	southupeast	southupwest	southdowneast
northern face	northdownwest	northupeast	northupwest	northdowneast

to decide which color is raycolor of (re - a region):
	let r2 be a random facecenter room in re;
	decide on raycolor of r2;

to decide which color is raycolor of (r - a room):
	let cr be map region of r;
	choose row with myreg of cr in table of region beacons;
	if conncolor of b1 entry is not black or conncolor of b2 entry is not black:
		if conncolor of b3 entry is not black or conncolor of b4 entry is not black:
			say "BUG THIS SHOULD NOT HAPPEN";
			decide on brown;
	if conncolor of b1 entry is not black and conncolor of b2 entry is not black:
		decide on mix of conncolor of b1 entry and conncolor of b2 entry;
	if conncolor of b3 entry is not black and conncolor of b4 entry is not black:
		decide on mix of conncolor of b3 entry and conncolor of b4 entry;
	decide on black;

book glowcolir

volume changed verbs

before waiting:
	say "You pause, as more voluminous ether wafts by." instead;

volume out of world verbs

chapter abouting

abouting is an action out of world.

understand the command "about" as something new.

understand "about" as abouting.

carry out abouting:
	say "I'd thought about a game on a cube for a while, but I didn't seriously consider and plan it until 2017 when a wordplay game fell through. A cube being an unscientific place to walk on, I figured, what else would fit in? That's when I got in with bad science and silly myths I hope you find fun.[paragraph break]Maps are included to help visualize things a bit easier.[paragraph break]Bugs or suggestions can go to blurglecruncheon@gmail.com.";
	the rule succeeds;

chapter creditsing

creditsing is an action out of world.

understand the command "credit" as something new.
understand the command "credits" as something new.

understand "credit" as creditsing.
understand "credits" as creditsing.

carry out creditsing:
	say "Thanks to Genstein and Jason Lautzenheiser for creating and developing Trizbort, so I could write maps that helped me visualize the game maps.";
	say "[line break](fill in testers here).";
	the rule succeeds;

chapter helping

helping is an action out of world.

understand the command "help" as something new.

understand "help" as helping.

carry out helping:
	the rule succeeds;

chapter verbing

verbing is an action out of world.

understand the command "v" as something new.
understand the command "verb" as something new.
understand the command "verbs" as something new.

understand "v" as verbing.
understand "verb" as verbing.
understand "verbs" as verbing.

carry out verbing:
	say "You can move in directions U D N S E W or any sensible combination of the two, e.g. WE doesn't work. IN also works if and when you have passage into the center of the asteroid.[paragraph break]On this plane, you can move [if mrlp is upper face or mrlp is bottom face]NW/NE/SW/SE[else if mrlp is southern face or mrlp is northern face]UE/UW/DE/DW[else if mrlp is eastern face or mrlp is western face]UN/US/DN/DS[end if] (You can reverse the directions, and it won't matter).[paragraph break]You may also want to TOUCH things or REVIEW the four elements: [list of elements]. WAVE to your ship to complete the game.";
	the rule succeeds;

chapter waving hands

the codex is a thing.

instead of waving hands:
	say "You wave to the hoverboard floating in the air. They take you back for evaluation.";
	if player has codex, say "You win!" instead;
	say "You lose!";

chapter xyzzying

xyzzying is an action out of world.

understand the command "xyzzy" as something new.

understand "xyzzy" as xyzzying.

carry out xyzzying:
	say "You hone in on your training for three-dimensional reasoning from several different directions. The result is a slight headache.";
	the rule succeeds;

volume parsing

book after parsing a command

book parser errors

Rule for printing a parser error when the latest parser error is the i beg your pardon error:
	say "You stare around. Wow. It's pretty crazy, on the cube, here.";

Rule for printing a parser error when the latest parser error is the noun did not make sense in that context error:
	if the player's command includes "review":
		say "It looks like you tried to review something. The only things to review are [list of elements]." instead;
	say "You tried to access something not currently in the world. Maybe that's a result of a typo, or it's minor scenery I forgot to implement and should've, or a bad synonym. But it's not critical to the game.";

Rule for printing a parser error when the latest parser error is the only understood as far as error:
	say "The first word was okay, and you don't need any extra ones."

rule for printing a parser error when the latest parser error is the can't see any such thing error:
	say "I (you) can't see anything here like that."

rule for printing a parser error when the latest parser error is the didn't understand error:
	say "I didn't recognize that verb. For a list of common/useful verbs, type V or VERB or VERBS.";

volume stock room descriptions

the description of a room is usually "[room-desc].".

the printed name of a room is usually "[mrtc], [if the item described is facecenter]center[else if the item described is edge][descdir of item described] edge[else][descdir of item described] corner[end if]".

to say mrtc:
	let Q be "[mrlp]";
	say "[Q in title case]"

a room has a direction called descdir. descdir is usually inside.

to say room-desc:
	if location of player is corner:
		say "You are at the [descdir] corner of the [mrlp]. There's a conductor here--your mood ring is slightly attracted to it. You can go [list of goable directions] along this face, or [list of warpable directions] somewhere new";
	else if location of player is facecenter:
		say "You are at the center of the [mrlp]. You can go pretty much any direction: [list of goable directions]. [if raycolor of mrlp is beaccolor of mrlp]A tunnel leads inside ([indir of mrlp]) to the center of the cube[else]There's a beacon here, colored [beaccolor of mrlp][end if]";
	else if location of player is edge:
		say "You are at the center of the [descdir] edge of the [mrlp]. You can go [list of goable directions] along this face, or [list of warpable directions] [if number of warpable directions is 1]to a new plane[else]each to a different plane[end if]"

volume beta testing - not for release

when play begins:
	say "Thanks for running the debug version! Use [b]BCSOL[r] to see how to solve this game. There are 48 randomly generated possible solutions."

chapter bcsoling

bcsoling is an action out of world.

understand the command "bcsol" as something new.

understand "bcsol" as bcsoling.

definition: a conn (called q) is unneeded:
	if rightcolor of q is black, yes;
	no;

carry out bcsoling:
	say "TRANSMITTER COLORS:[line break]";
	repeat with x running through conns:
		if rightcolor of x is not black:
			say "[x]: is [conncolor of x], should be [rightcolor of x].";
	say "UNUSED: [list of unneeded conns].";
	say "BEACON COLORS:[line break]";
	repeat with x running through regions:
		if x is mtr:
			next;
		say "[x]: ray color is [raycolor of x], beacon color is [beaccolor of x].";
	the rule succeeds;

chapter fixsoling

fixsoling is an action out of world.

understand the command "fixsol" as something new.

understand "fixsol" as fixsoling.

carry out fixsoling:
	say "Fixing solution so red in UNW, yellow in USE, blue in DNE, white in DSW.";
	now rightcolor of northupwest is red;
	now rightcolor of southupeast is yellow;
	now rightcolor of northdowneast is blue;
	now rightcolor of southdownwest is white;
	now rightcolor of northdownwest is black;
	now rightcolor of southdowneast is black;
	now rightcolor of northupeast is black;
	now rightcolor of southupwest is black;
	now beaccolor of upper face is orange;
	now beaccolor of bottom face is blue;
	now beaccolor of eastern face is green;
	now beaccolor of western face is red;
	now beaccolor of northern face is purple;
	now beaccolor of southern face is yellow;
	the rule succeeds;

volume debug tests and such - not for release

[uncomment below to unlock weird tests]

include Rube Cube Testing by Andrew Schultz.

[more standard inform stuff below]

book definitions for debug purposes

understand "d00" as d00.
understand "n00" as n00.
understand "s00" as s00.
understand "w00" as w00.
understand "e00" as e00.
understand "u00" as u00.

book tests

test fix with "fixsol/n/w/review earth/touch/e/e/s/s/review fire/touch/e/d/d/n/n/review water/touch/d/s/s/w/w/review air/touch/bcsol"

test tun with "fixsol/n/w/review earth/touch/e/e/s/s/review fire/touch/nw/d"

test nloop with "n/n/d/d/d/s/s/s/u/u/u/n".
test sloop with "s/s/d/d/d/n/n/n/u/u/u/s".

test wloop with "w/w/d/d/d/e/e/e/u/u/u/w".
test eloop with "e/e/d/d/d/w/w/w/u/u/u/e".

test w2loop with "w/w/n/n/n/e/e/e/s/s/s/w".
test e2loop with "e/e/n/n/n/w/w/w/s/s/s/e".

test all-loop with "test nloop/test sloop/w/test nloop/test sloop/e/e/test nloop/test sloop/w/test wloop/test eloop/n/test wloop/test eloop/s/s/test wloop/test eloop/s/test w2loop/test e2loop/s/test w2loop/test e2loop/s/test w2loop/test e2loop"
