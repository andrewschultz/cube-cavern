"The Rube on the Cube" by Andrew

volume region definitions

up face is a region.
downface is a region.
westface is a region.
eastface is a region.
southface is a region.
northface is a region.

a room can be central, edge, corner or nonfacial.

volume up face

u00 is a corner room in up face. descdir is southwest.

u10 is a room in up face. it is north of u00. descdir is south.

u20 is a corner room in up face. it is north of u10. descdir is southeast.

u01 is a room in up face. it is east of u00.

u11 is a central room in up face. it is north of u01. it is east of u10.

u21 is a room in up face. it is north of u11. it is east of u20.

u02 is a corner room in up face. it is east of u01. descdir is northwest.

u12 is a room in up face. it is north of u02. it is east of u11.

u22 is a corner room in up face. it is north of u12. it is east of u21. descdir is northeast.

volume westface

w00 is a corner room in westface.
w10 is a room in westface. it is north of w00.
w20 is a corner room in westface. it is north of w10.
w01 is a room in westface. it is east of w00.
w11 is a central room in westface. it is north of w01. it is east of w10.
w21 is a room in westface. it is north of w11. it is east of w20.
w02 is a corner room in westface. it is east of w01.
w12 is a room in westface. it is north of w02. it is east of w11.
w22 is a corner room in westface. it is north of w12. it is east of w21.

volume eastface

e00 is a corner room in eastface.
e10 is a room in eastface. it is north of e00.
e20 is a corner room in eastface. it is north of e10.
e01 is a room in eastface. it is east of e00.
e11 is a central room in eastface. it is north of e01. it is east of e10.
e21 is a room in eastface. it is north of e11. it is east of e20.
e02 is a corner room in eastface. it is east of e01.
e12 is a room in eastface. it is north of e02. it is east of e11.
e22 is a corner room in eastface. it is north of e12. it is east of e21.

volume northface

n00 is a corner room in northface.
n10 is a room in northface. it is north of n00.
n20 is a corner room in northface. it is north of n10.
n01 is a room in northface. it is east of n00.
n11 is a central room in northface. it is north of n01. it is east of n10.
n21 is a room in northface. it is north of n11. it is east of n20.
n02 is a corner room in northface. it is east of n01.
n12 is a room in northface. it is north of n02. it is east of n11.
n22 is a corner room in northface. it is north of n12. it is east of n21.

volume southface

s00 is a corner room in southface.
s10 is a room in southface. it is north of s00.
s20 is a corner room in southface. it is north of s10.
s01 is a room in southface. it is east of s00.
s11 is a central room in southface. it is north of s01. it is east of s10.
s21 is an edge room in southface. it is north of s11. it is east of s20.
s02 is a corner room in southface. it is east of s01.
s12 is an edge room in southface. it is north of s02. it is east of s11.
s22 is a corner room in southface. it is north of s12. it is east of s21.

volume downface

d00 is a corner room in downface.
d10 is an edge room in downface. it is north of d00.
d20 is a corner room in downface. it is north of d10.
d01 is an edge room in downface. it is east of d00.
d11 is a central room in downface. it is north of d01. it is east of d10.
d21 is an edge room in downface. it is north of d11. it is east of d20.
d02 is a corner room in downface. it is east of d01.
d12 is an edge room in downface. it is north of d02. it is east of d11.
d22 is a corner room in downface. it is north of d12. it is east of d21.

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

volume direction definitions and functions

definition: a direction (called d) is warpable:
	if the room d of location of player is nowhere, decide no;
	if map region of the room d of location of player is map region of location of player, decide no;
	decide yes;

definition: a direction (called d) is goable:
	if the room d of location of player is nowhere, decide no;
	if map region of the room d of location of player is map region of location of player, decide yes;
	decide no;
