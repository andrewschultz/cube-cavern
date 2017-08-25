"The Rube on the Cube" by Andrew Schultz

the story headline is "A 3-dimensional text adventure. Well, the map is"

the story description is "A speedy 3-d Deed-y"

volume includes

include Trivial Niceties by Andrew Schultz.

include Basic Screen Effects by Emily Short. [ watch out! center is defined here, so centered/center can cause runtime errrors]

volume region and room definitions

up face is a region.
down face is a region.
west face is a region.
east face is a region.
south face is a region.
north face is a region.

mtr is a region.

a room can be centered, edge, corner or nonfacial.

to decide what region is mrlp: [I'd include this in a header but it complains if you don't use regions]
	if map region of location of player is nothing, decide on mtr;
	decide on map region of location of player.

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

a direction can be complex or simple. a direction is usually simple.

upwest is complex. upeast is complex. upsouth is complex. upnorth is complex.

downwest is complex. downeast is complex. downsouth is complex. downnorth is complex.

understand "uw" as upwest. understand "dw" as downwest.
understand "wu" as upwest. understand "wd" as downwest.

understand "us" as upsouth. understand "ds" as downsouth.
understand "su" as upsouth. understand "sd" as downsouth.

understand "ue" as upeast. understand "de" as downeast.
understand "eu" as upeast. understand "ed" as downeast.

understand "un" as upnorth. understand "dn" as downnorth.
understand "nu" as upnorth. understand "nd" as downnorth.

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
	if map region of the room d of location of player is map region of location of player, decide no;
	decide yes;

definition: a direction (called d) is goable:
	if the room d of location of player is nowhere, decide no;
	if map region of the room d of location of player is map region of location of player, decide yes;
	decide no;

definition: a direction (called d) is cromulent:
	if d is ubercromulent or d is semicromulent, decide yes;
	decide no;

definition: a direction (called d) is semicromulent:
	if d is inside or d is outside, decide yes;
	if d is ubercromulent, decide yes;
	if mrlp is up face or mrlp is down face:
		if d is southeast or d is southwest or d is northwest or d is northeast, decide yes;
	if mrlp is west face or mrlp is east face:
		if d is upsouth or d is downsouth or d is upnorth or d is downnorth, decide yes;
	if mrlp is north face or mrlp is south face:
		if d is upeast or d is upwest or d is downwest or d is downeast, decide yes;
	decide no;

definition: a direction (called d) is ubercromulent:
	if mrlp is north face or mrlp is south face:
		if d is east or d is up or d is west or d is down, decide yes;
	if mrlp is west face or mrlp is east face:
		if d is up or d is south or d is down or d is north, decide yes;
	if mrlp is up face or mrlp is down face:
		if d is east or d is south or d is west or d is north, decide yes;
	decide no;

book wrong way rejects

before going:
	if location of player is corner and noun is descdir:
		say "You might impale yourself on the corner of the cube. Ouch!" instead;
	if noun is not cromulent:
		say "You can only go [list of ubercromulent directions], or any non-opposite pair, on the [mrlp]." instead;

volume up face

book u00

u00 is a corner privately-named room in up face. descdir is southwest.

book u10

u10 is an edge privately-named room in up face. it is north of u00. descdir is south.

book u20

u20 is a corner privately-named room in up face. it is north of u10. descdir is southeast.

book u01

u01 is an edge privately-named room in up face. it is east of u00.

book u11

u11 is a centered privately-named room in up face. it is north of u01. it is east of u10. the player is in u11.

book u21

u21 is an edge privately-named room in up face. it is north of u11. it is east of u20.

book u02

u02 is a corner privately-named room in up face. it is east of u01. descdir is northwest.

book u12

u12 is an edge privately-named room in up face. it is north of u02. it is east of u11.

book u22

u22 is a corner privately-named room in up face. it is north of u12. it is east of u21. descdir is northeast.

volume west face

book w00

w00 is a corner privately-named room in west face. descdir is downsouth.

book w10

w10 is an edge privately-named room in west face. it is north of w00. descdir is south.

book w20

w20 is a corner privately-named room in west face. it is north of w10. descdir is upsouth.

book w01

w01 is an edge privately-named room in west face. it is up of w00. descdir is down.

book w11

w11 is a centered privately-named room in west face. it is north of w01. it is up of w10. descdir is inside.

book w21

w21 is an edge privately-named room in west face. it is north of w11. it is up of w20. descdir is up.

book w02

w02 is a corner privately-named room in west face. it is up of w01. descdir is downnorth.

w02 is west of u00. east of w02 is nothing. u00 is up of w02. down of u00 is nothing.

book w12

w12 is an edge privately-named room in west face. it is north of w02. it is up of w11. descdir is north.

w12 is west of u01. east of w12 is nothing. u01 is up of w12. down of u01 is nothing.

book w22

w22 is a corner privately-named room in west face. it is north of w12. it is up of w21. descdir is upnorth.

w22 is west of u02. east of w22 is nothing. u02 is up of w22. down of u02 is nothing.

volume east face

book e00

e00 is a corner privately-named room in east face. descdir is downsouth.

book e10

e10 is an edge privately-named room in east face. it is up of e00. descdir is south.

book e20

e20 is a corner privately-named room in east face. it is up of e10. descdir is upsouth.

book e01

e01 is an edge privately-named room in east face. it is north of e00. descdir is down.

book e11

e11 is a centered privately-named room in east face. it is up of e01. it is north of e10. descdir is inside.

book e21

e21 is an edge privately-named room in east face. it is up of e11. it is north of e20. descdir is up.

book e02

e02 is a corner privately-named room in east face. it is north of e01. descdir is downnorth.

book e12

e12 is an edge privately-named room in east face. it is up of e02. it is north of e11. descdir is north.

book e22

e22 is a corner privately-named room in east face. it is up of e12. it is north of e21. descdir is upnorth.

volume north face

book n00

n00 is a corner privately-named room in north face.

book n10

n10 is an edge privately-named room in north face. it is east of n00.

book n20

n20 is a corner privately-named room in north face. it is east of n10.

book n01

n01 is an edge privately-named room in north face. it is up of n00.

book n11

n11 is a centered privately-named room in north face. it is east of n01. it is up of n10.

book n21

n21 is an edge privately-named room in north face. it is east of n11. it is up of n20.

book n02

n02 is a corner privately-named room in north face. it is up of n01.

book n12

n12 is an edge privately-named room in north face. it is east of n02. it is up of n11.

book n22

n22 is a corner privately-named room in north face. it is east of n12. it is up of n21.

volume south face

book s00

s00 is a corner privately-named room in south face. descdir is downwest.

book s10

s10 is an edge privately-named room in south face. it is east of s00. descdir is down.

book s20

s20 is a corner privately-named room in south face. it is east of s10. descdir is downeast.

book s01

s01 is an edge privately-named room in south face. it is up of s00. descdir is west.

book s11

s11 is a centered privately-named room in south face. it is east of s01. it is up of s10. descdir is inside.

book s21

s21 is an edge privately-named room in south face. it is east of s11. it is up of s20. descdir is east.

book s02

s02 is a corner privately-named room in south face. it is up of s01. descdir is upwest.

south of u00 is s02. up of s02 is u00. north of s02 is nowhere. down of u00 is nowhere.

book s12

s12 is an edge privately-named room in south face. it is east of s02. it is up of s11. descdir is up.

south of u10 is s12. up of s12 is u10. north of s12 is nowhere. down of u10 is nowhere.

book s12

s22 is a corner privately-named room in south face. it is east of s12. it is up of s21. descdir is upeast.

south of u20 is s22. up of s22 is u20. north of s22 is nowhere. down of u20 is nowhere.

volume down face

book d00

d00 is a corner privately-named room in down face.

book d10

d10 is an edge privately-named room in down face. it is north of d00.

book d20

d20 is a corner privately-named room in down face. it is north of d10.

book d01

d01 is an edge privately-named room in down face. it is east of d00.

book d11

d11 is a centered privately-named room in down face. it is north of d01. it is east of d10.

book d21

d21 is an edge privately-named room in down face. it is north of d11. it is east of d20.

book d02

d02 is a corner privately-named room in down face. it is east of d01.

book d12

d12 is an edge privately-named room in down face. it is north of d02. it is east of d11.

book d22

d22 is a corner privately-named room in down face. it is north of d12. it is east of d21.

volume stock room descriptions

the description of a room is usually "[room-desc].".

the printed name of a room is usually "[mrtc], [if descdir of location of player is inside]center[else][descdir of location of player]".

to say mrtc:
	let Q be "[map region of location of player]";
	say "[Q in title case]"

a room has a direction called descdir. descdir is usually inside.

to say room-desc:
	if location of player is corner:
		say "You are at the [descdir] corner of the [map region of location of player]. You can go [list of goable directions] along this face, or [list of warpable directions] somewhere new";
	else if location of player is centered:
		say "You are at the center of the [map region of location of player]. You can go pretty much any direction: [list of goable directions]";
	else if location of player is edge:
		say "You are at the center of the [descdir] edge of the [map region of location of player]. You can go [list of goable directions] along this face, or [list of warpable directions] [if number of warpable directions is 1]to somewhere new[else]each to a different plane[end if]"

volume debug tests and such - not for release

section for debug purposes

understand "d00" as d00.
understand "n00" as n00.
understand "s00" as s00.
understand "w00" as w00.
understand "e00" as e00.
understand "u00" as u00.
