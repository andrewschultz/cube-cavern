"The Rube on the Cube" by Andrew Schultz

the story headline is "A 3-dimensional text adventure. Well, the map is"

the story description is "A speedy 3-d Deed-y"

volume region and room definitions

up face is a region.
down face is a region.
west face is a region.
east face is a region.
south face is a region.
north face is a region.

a room can be central, edge, corner or nonfacial.

volume direction definitions

upwest is a direction. opposite of upwest is downeast.

upeast is a direction. opposite of upeast is downwest.

upnorth is a direction. opposite of upnorth is downsouth.

upsouth is a direction. opposite of upsouth is downnorth.

volume up face

u00 is a corner privately-named room in up face. descdir is southwest.

u10 is an edge privately-named room in up face. it is north of u00. descdir is south.

u20 is a corner privately-named room in up face. it is north of u10. descdir is southeast.

u01 is an edge privately-named room in up face. it is east of u00.

u11 is a central privately-named room in up face. it is north of u01. it is east of u10.

u21 is an edge privately-named room in up face. it is north of u11. it is east of u20.

u02 is a corner privately-named room in up face. it is east of u01. descdir is northwest.

u12 is an edge privately-named room in up face. it is north of u02. it is east of u11.

u22 is a corner privately-named room in up face. it is north of u12. it is east of u21. descdir is northeast.

volume west face

w00 is a corner privately-named room in west face. descdir is downsouth.

w10 is an edge privately-named room in west face. it is up of w00. descdir is south.

w20 is a corner privately-named room in west face. it is up of w10. descdir is upsouth.

w01 is an edge privately-named room in west face. it is north of w00. descdir is down.

w11 is a central privately-named room in west face. it is up of w01. it is north of w10. descdir is inside.

w21 is an edge privately-named room in west face. it is up of w11. it is north of w20. descdir is up.

w02 is a corner privately-named room in west face. it is north of w01. descdir is downnorth.

w12 is an edge privately-named room in west face. it is up of w02. it is north of w11. descdir is north.

w22 is a corner privately-named room in west face. it is up of w12. it is north of w21. descdir is upnorth.

volume east face

e00 is a corner privately-named room in east face. descdir is downsouth.

e10 is an edge privately-named room in east face. it is up of e00. descdir is south.

e20 is a corner privately-named room in east face. it is up of e10. descdir is upsouth.

e01 is an edge privately-named room in east face. it is north of e00. descdir is down.

e11 is a central privately-named room in east face. it is up of e01. it is north of e10. descdir is inside.

e21 is an edge privately-named room in east face. it is up of e11. it is north of e20. descdir is up.

e02 is a corner privately-named room in east face. it is north of e01. descdir is downnorth.

e12 is an edge privately-named room in east face. it is up of e02. it is north of e11. descdir is north.

e22 is a corner privately-named room in east face. it is up of e12. it is north of e21. descdir is upnorth.

volume north face

n00 is a corner privately-named room in north face.
n10 is an edge privately-named room in north face. it is north of n00.
n20 is a corner privately-named room in north face. it is north of n10.
n01 is an edge privately-named room in north face. it is east of n00.
n11 is a central privately-named room in north face. it is north of n01. it is east of n10.
n21 is an edge privately-named room in north face. it is north of n11. it is east of n20.
n02 is a corner privately-named room in north face. it is east of n01.
n12 is an edge privately-named room in north face. it is north of n02. it is east of n11.
n22 is a corner privately-named room in north face. it is north of n12. it is east of n21.

volume south face

s00 is a corner privately-named room in south face.
s10 is an edge privately-named room in south face. it is north of s00.
s20 is a corner privately-named room in south face. it is north of s10.
s01 is an edge privately-named room in south face. it is east of s00.
s11 is a central privately-named room in south face. it is north of s01. it is east of s10.
s21 is an edge privately-named room in south face. it is north of s11. it is east of s20.
s02 is a corner privately-named room in south face. it is east of s01.
s12 is an edge privately-named room in south face. it is north of s02. it is east of s11.
s22 is a corner privately-named room in south face. it is north of s12. it is east of s21.

volume down face

d00 is a corner privately-named room in down face.
d10 is an edge privately-named room in down face. it is north of d00.
d20 is a corner privately-named room in down face. it is north of d10.
d01 is an edge privately-named room in down face. it is east of d00.
d11 is a central privately-named room in down face. it is north of d01. it is east of d10.
d21 is an edge privately-named room in down face. it is north of d11. it is east of d20.
d02 is a corner privately-named room in down face. it is east of d01.
d12 is an edge privately-named room in down face. it is north of d02. it is east of d11.
d22 is a corner privately-named room in down face. it is north of d12. it is east of d21.

volume stock room descriptions

the description of a room is usually "[room-desc].".

the printed name of a room is usually "[mrtc], [if descdir of location of player is inside]center[else][descdir of location of player]".

to say mrtc:
	let Q be "[map region of location of player]";
	say "[Q in title case]"

a room has a direction called descdir. descdir is usually inside.

before going:
	if location of player is corner and noun is descdir:
		say "You might impale yourself on the corner of the cube. Ouch!" instead;

to say room-desc:
	if location of player is corner:
		say "You are at the [descdir] corner of the [map region of location of player]. You can go [list of goable directions] along this face, or [list of warpable directions] somewhere new";
	else if location of player is central:
		say "You are at the center of the [map region of location of player]. You can go pretty much any direction: [list of goable directions]";
	else if location of player is edge:
		say "You are at the center of the [descdir] edge of the [map region of location of player]. You can go [list of goable directions] along this face, or [list of warpable directions] somewhere new"

section for debug purposes - not for release

understand "d00" as d00.
understand "n00" as n00.
understand "s00" as s00.
understand "w00" as w00.
understand "e00" as e00.
understand "u00" as u00.

volume direction definitions and functions

definition: a direction (called d) is warpable:
	if the room d of location of player is nowhere, decide no;
	if map region of the room d of location of player is map region of location of player, decide no;
	decide yes;

definition: a direction (called d) is goable:
	if the room d of location of player is nowhere, decide no;
	if map region of the room d of location of player is map region of location of player, decide yes;
	decide no;
