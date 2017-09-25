"The Cube in the Cavern" by Andrew Schultz

the story headline is "A 3-dimensional text adventure. Well, the map is"

the story description is "A Speedy 3-d Deed-y"

volume includes

include Trivial Niceties by Andrew Schultz.

include Basic Screen Effects by Emily Short. [ watch out! center/central are defined here, so centered/center can cause runtime errrors. This is specific to my game and the mechanics it has.]

section big picture definitions

use no scoring.

section debug to start - not for release

when play begins:
	now debug-state is true;

volume verb simplification arglebargle

understand the command "kiss" as something new.
understand the command "wave" as something new.
understand the command "push" as something new.
understand the command "pull" as something new.
understand the command "read" as something new.
understand the command "sit" as something new.
[enter/exit??]
understand the command "sorry" as something new.
understand the command "search" as something new.
understand the command "set" as something new.
understand the command "burn" as something new.
[listen??]
understand the command "buy" as something new.
[switch beacon??]
understand the command "turn" as something new.
understand the command "cut" as something new.
understand the command "no" as something new.
understand the command "yes" as something new.
understand the command "y" as something new.
[climb beacon??]
Understand the command "scale" as something new.
Understand the command "purchase" as something new.
Understand the command "slice" as something new.
Understand the command "prune" as something new.
Understand the command "chop" as something new.
Understand the command "cut" as something new.
Understand the command "swallow" as something new.
Understand the command "sip" as something new.
Understand the command "drink" as something new.
Understand the command "squash" as something new.
Understand the command "squeeze" as something new.

Understand the command "carry" as something new.
Understand the command "hold" as something new.
Understand the command "throw" as something new.
Understand the command "shed" as something new.
Understand the command "remove" as something new.
Understand the command "stand" as something new.
Understand the command "close" as something new.
Understand the command "open" as something new.
Understand the command "eat" as something new.
Understand the command "answer" as something new.
Understand the command "say" as something new.
Understand the command "shout" as something new.
Understand the command "speak" as something new.
Understand the command "tell" as something new.
Understand the command "ask" as something new.

understand the command "unlock" as something new.
understand the command "attack" as something new.
understand the commands "break", "smash", "hit", "fight", "torture", "wreck", "crack", and "destroy" as something new.

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

to decide what direction is outdir of (r - a region):
	decide on opposite of indir of r;

definition: a region (called x) is aligned:
	if x is mtr, no;
	if raycolor of x is beaccolor of x, yes;
	no;

definition: a region (called R) is explored:
	if number of visited rooms in R is 0, decide no;
	decide yes;

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
	if c1 rainbowlinks c2 or c2 rainbowlinks c1, decide yes;
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
	say "Science has been solved! Well, except for the scratchwork. And the stuff the numerologists proved could never be figured for sure. Everyone knows how the four elements work together. Okay, mostly. And astrology is more accurate than it's ever been. Except when people don't REALLY follow its advice. Anyway, there's got to be only so much more to calculate. Eventually, we'll learn why people don't fall through the flat earth, or why it isn't in free fall if there's gravity, but...all that's just numbers, right? We'll work it out one day! We just don't have enough of those punch-card processors yet!";
	wfak-d;
	say "[line break]As a hotshot double Ph. D. in Psychokinetics and Psychohistory, you weren't surprised you found an important new ancient-looking cave to excavate and explore. You're not just book smart--mood rings work even better on you than on most people, which shows extraordinary intelligence and sensitivity. Why, you eschewed a lucrative career as a psychic for, just, well...knowledge. And when your dowsing instruments detected something odd in a cavern, you were curious indeed! A cube lay beyond a river, and you're lucky you had your assistant to pull you back, because somehow, the center attracted you--even when you were on the bottom! There must have been some powerful life force or something in the center. You fell so hard pulling away, you had to use your entire supply of healing crystals to get back to 100%.";
	wfak-d;
	say "[line break]But you planned ahead! The ideas flew across, around and through the feng shui in your office. Along with your mood ring, you brought some rope, read up on levitation (for when you need to escape the cube again) and consulted a medium and, of course, several of the top magnet therapists. And you discuss how hollow the area beneath the flat earth might be, but science is no good without data, so down you go.";
	wfak-d;
	say "[line break]But enough theorizing! You return to the cavern with the cube. An adventure lies ahead! You probably, like, need to get in harmony and stuff, or balance stuff just right, and you're sure it'll show you its secrets or whatever.";
	wfak-d;
	sort init-list in random order;
	proc-init-list;

to proc-init-list:
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
		now rightcolor of northupeast is entry 1 of init-list;
		now rightcolor of southdowneast is entry 2 of init-list;
		now rightcolor of northdownwest is entry 3 of init-list;
		now rightcolor of southupwest is entry 4 of init-list;
		now beaccolor of bottom face is mix of rightcolor of northdownwest and rightcolor of southdowneast;
		now beaccolor of upper face is mix of rightcolor of northupeast and rightcolor of southupwest;
		now beaccolor of western face is mix of rightcolor of northdownwest and rightcolor of southupwest;
		now beaccolor of eastern face is mix of rightcolor of northupeast and rightcolor of southdowneast;
		now beaccolor of northern face is mix of rightcolor of northdownwest and rightcolor of northupeast;
		now beaccolor of southern face is mix of rightcolor of southdowneast and rightcolor of southupwest;

to decide which number is code-num:
	let index be 1000;
	let retval be 0;
	let idx2 be 0;
	let my-list be { white, red, yellow, blue };
	say "[my-list] vs [init-list].";
	if rightcolor of northupeast is black, now retval is 10000;
	let idx be 0;
	while index > 0:
		increment idx;
		now idx2 is 0;
		repeat with Q running through my-list:
			increment idx2;
			if Q is entry idx of init-list:
				increase retval by index * idx2;
		now index is index / 10;
	decide on retval

init-list is a list of colors variable. init-list is { white, red, yellow, blue }.

to wfak-d:
	if debug-state is false, wfak;

volume the player

the player wears the mood ring. description of mood ring is "The phlogiston in your mood ring is currently colored [ring-color-report]. You can SUMMON any of the four elements ([list of elements]) to change the ring[if ring-color is not black], or if you wait, the ring can go back to black[end if]."

after printing the name of the mood ring while taking inventory, say "(colored [ring-color], being worn)";

description of the player is "People say you look the part of gung-ho theoretician with a flair for  ."

to say ring-color-report:
	if ring-color is white:
		say "[if ring-moves < 3]gray[else]white[end if]";
	else:
		say "[ring-color][if ring-moves < 3 and ring-color is not black], but it's getting a bit dark[end if]"

understand "phlogiston" as mood ring.

check taking off the mood ring:
	say "No, it's an important scientific thingamabob that will help you with your mission." instead;

ring-color is a color that varies. ring-color is usually black.

ring-moves is a number that varies.

every turn when ring-color is not black:
	decrement ring-moves;
	if ring-moves is 2:
		say "The phlogiston in your mood ring is half faded back to black, now.";
	else if ring-moves is 0:
		say "The phlogiston in your mood ring changes back from [ring-color] to black.";
		now ring-color is black;

the player carries the coil of wire rope. description of wire rope is "It's rope you will need to pull the cube, or whatever's in it, down to the surface. You can DROP to tie it at a certain place to go exploring."

after printing the name of wire rope when taking inventory:
	if rope-drop is true, say " (anchored at [init-drop-room])";
	continue the action;

rope-drop is a truth state that varies.

rope-colors is a list of colors variable. rope-colors is {}.

last-top-room is a room that varies.

does the player mean dropping the wire rope when location of player is facecenter and mrlp is aligned: it is very likely.

init-drop-room is a room that varies.

check dropping wire rope:
	if location of player is not facecenter, say "There's no good place to drop it." instead;
	if beacon is in location of player, say "You don't need to tie the rope to the beacon. It might be too fragile to respond to stress." instead;
	if rope-drop is true, say "You already dropped the rope to start." instead;
	now last-rope-region is mrlp;
	now init-drop-room is location of player;
	say "You drop the rope and anchor it. (NOTE: if you want to undo things later, you can RESET to before you dropped the rope).";
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

chapter summoning

does the player mean summoning an element: it is very likely.

summoning is an action applying to one visible thing.

understand the command "summon" as something new.

understand "summon [any thing]" as summoning.

carry out summoning:
	if noun is not an element, say "You can only summon elements. The elements are: [list of elements]." instead;
	say "You reflect on the [noun] for a bit. Your mood ring [if ring-color is conc-color of noun]glows a bit brighter but does not change color[else]changes to [conc-color of noun][one of]. NOTE: in the future, you can SUMMON a color, or even leave off SUMMON altogether[or][stopping][end if].";
	if ever-acc of noun is false:
		say "[line break]SCIENCE TIME: [blah-txt of noun][line break]";
		now ever-acc of noun is true;
	now ring-color is conc-color of noun;
	now ring-moves is 5;
	the rule succeeds.

chapter summoning

colsummoning is an action applying to one color.

understand "summon [color]" as colsummoning.

carry out colsummoning:
	repeat with X running through elements:
		if conc-color of X is the color understood, try summoning X instead;
	say "Uh-oh, we can't summon that color. We should be able to, but we can't.";
	the rule succeeds;

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
	say "[if mrlp is aligned]can[else]will want to[end if]"

prev-reg is a region that varies.

before going:
	if mrlp is mtr, continue the action;
	if noun is inside:
		if location of player is facecenter:
			try going indir of mrlp instead;
		say "You're not at the center, so you wouldn't really be going [indir of mrlp][if number of ever-aligned regions is 0], and you haven't found a way, yet, anyway[end if]." instead;
	if location of player is facecenter:
		if noun is indir of mrlp:
			if tunnel-looped is true:
				say "No, you want to connect the rope all the way through." instead;
			if beacon is visible:
				say "You may want to go that way to get to the center of the cube, but you can't, now." instead;
			continue the action;
	if location of player is corner and noun is descdir of location of player:
		say "You might impale yourself on the corner of the cube. Ouch!" instead;
	if noun is not cromulent:
		say "You can only go [list of ubercromulent directions], or any non-opposite pair of those four directions, along the [mrlp][if location of player is facecenter and number of ever-aligned regions > 0]. You also [can-want] go inside/[indir of mrlp] here in the center[end if]." instead;
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
						say "[if noun is complex]It feels weird shimmying over at a diagonal angle, but there you are[else]Fwoop. You flip over to the [map region of R2][end if].";
					if rope-drop is true and map region of R2 is not last-rope-region and mrlp is not last-rope-region and map region of R2 is not mrlp:
						say " need to put your rope down somewhere close, if you can." instead;
					move player to R2;
					the rule succeeds;
				say "You can't quite go that way. Maybe you should, but you can't." instead;
		say "That would be wandering off into nothing." instead;
	let X be room noun of location of player;
	let mrx be map region of X;
	if rope-drop is true:
		if mrx is not last-rope-region and mrlp is not last-rope-region and mrx is not mrlp:
			say "You need to put your rope down somewhere close, if you can." instead;
	if mrlp is not mrx:
		say "You twist over the side of the cube to the [mrx].[line break]";

after going:
	if init-drop-room is location of player and tunnel-looped is true:
		say "You see where you planted the rope, originally. Power fluxes through the rope as you connect it in a loop. You watch as the cube breaks apart, and the gold sphere pops out and rolls around. You begin to fall, but remembering your levitation lessons, you slow the acceleration...";
		wfak-d;
		say "[line break]The gold sphere cracks open. You see visions...of not five, not six, but OVER ONE HUNDRED ELEMENTS. Of light having speed, of mathematical theorems that prove you can't know anything. You see a vision of circular worlds that pull people to their centers, just like the cube, but THERE IS NOTHING SPECIAL IN THERE. There are visions of machines that not just levitate, but fly to the stars, which you thought was proven illegal.";
		wfak-d;
		say "[line break]Well, you know to be skeptical of fake science when you see it. You realize this might be a  hallucination. But you also realize you can pull the gold sphere to the surface and sell it to a museum for good money.";
		wfak-d;
		say "[line break]But you never talk about what you really saw. You mention you had a vision of the cosmos, and so forth, and you wish you could interpret it, because you suspect you saw what you wanted to see about loving other people being the most important thing, and how the journey is its own reward. You find yourself saying 'There's just ... STUFF WE DON'T UNDERSTAND OUT THERE' with a conviction and mystery few can hope for. You write some motivational books that convince people they're happy, more or less. But every so often some pesky kid comes up to you and asks 'What if there weren't four elements? What if...' And you think back to the cube. You convince a few to take up writing. Even the wildest fantasies can spur rigorous scientific thought. There's a place for combining the humanities and the sciences.";
		end the game saying "YOU, UM, WIN";
		the rule succeeds;
	continue the action;

carry out going when location of player is very center:
	check-rope-tunnel beaccolor of map region of room noun of very center;
	if continue-tunnel is false, the rule succeeds;
	now last-rope-region is map region of room noun of very center;
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

w20 is west of n00. east of w20 is nothing. n00 is north of w20. south of n00 is nothing.

book n10

n10 is an edge privately-named room in northern face. it is east of n00. descdir is down.

book n20

n20 is a corner privately-named room in northern face. it is east of n10. descdir is downeast.

e20 is east of n20. west of e20 is nothing. n20 is north of e20. south of n20 is nothing.

book n01

n01 is an edge privately-named room in northern face. it is up of n00. descdir is west.

w21 is west of n01. east of w21 is nothing. n01 is north of w21. south of n01 is nothing.

book n11

n11 is a facecenter privately-named room in northern face. it is east of n01. it is up of n10. descdir is inside.

book n21

n21 is an edge privately-named room in northern face. it is east of n11. it is up of n20. descdir is east.

e21 is east of n21. west of e21 is nothing. n21 is north of e21. south of n21 is nothing.

book n02

n02 is a corner privately-named room in northern face. it is up of n01. descdir is upwest.

u02 is up of n02. down of u02 is nothing. n02 is north of u02. [?? what is going on south of n02 is nothing.]

w22 is west of n02. east of w22 is nothing. n02 is north of w22. south of n02 is nothing.

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

book very center

the very center is a nonfacial room. it is below u11. it is above d11. it is west of e11. it is east of w11. it is north of s11. it is south of n11. printed name is "The Very Center".

the tunnels are scenery in very center. understand "tunnel" as tunnel.

check examining tunnels:
	if number of aligned regions is 1:
		say "The tunnel back [outdir of random aligned region] is colored [beaccolor of random aligned region]." instead;
	say "The tunnels are colored as follows:[line break]";
	repeat with X running through regions:
		if x is mtr, next;
		if x is aligned, say "[outdir of x]: [beaccolor of x][if beaccolor of x is listed in rope-colors] (with rope through it)[end if].";
	the rule succeeds

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
	d "[raycolor of mrlp] [beaccolor of mrlp].";
	if mrlp is never-aligned:
		say "You're at the right place to go in, but you don't have a way through, yet." instead;
	if mrlp is not aligned:
		say "You're at the right place to go in, but the way through closed." instead;
	check-rope-tunnel beaccolor of mrlp;
	if continue-tunnel is false, the rule succeeds;

continue-tunnel is a truth state that varies.

to check-rope-tunnel (c - a color):
	d "Checking rope and tunnel.";
	now continue-tunnel is true;
	if rope-drop is false:
		say "You glide along a weird [c] tunnel...[paragraph break]";
		continue the action;
	let Q be number of entries in rope-colors;
	if Q is 0:
		say "You glide along a weird [c] tunnel, with your rope trailing...[paragraph break]";
		add c to rope-colors;
		continue the action;
	if c is entry Q in rope-colors:
		remove entry Q from rope-colors;
		say "You pull back the segment of rope you dropped in the [c] tunnel.";
		d "[rope-colors].";
	else:
		if c is listed in rope-colors:
			say "You're pulled from entering the tunnel again with your rope. Perhaps you should choose another tunnel[if player is in very center], or retreat[end if].";
			now continue-tunnel is false;
			continue the action;
		say "You pull your rope through the [c] tunnel...[paragraph break]";
		add c to rope-colors;
		endgame-check;
		d "[rope-colors].";

tunnel-looped is a truth state that varies.

to endgame-check:
	if number of entries in rope-colors is 6:
		repeat with Q running from 1 to 5:
			unless entry Q in rope-colors colorborders entry (Q + 1) in rope-colors:
				continue the action;
		now tunnel-looped is true;
		say "Your rope shimmers in your hand. Surely there's just one more step--to go back to where you entered the first tunnel and connect the rope."

before going in very center (this is the check for basic directions from very center rule):
	if noun is inside:
		say "You're already inside at the center of the asteroid." instead;
	if noun is outside:
		say "There are six ways outside." instead;
	if noun is complex:
		say "Only simple directions work here. Each goes to the center of a different face." instead;
	if noun is not centexit:
		say "Maybe you can make a path like that later, but there is none, now." instead;

book beacons

the beacon is a backdrop. it is in u11, d11, w11, e11, s11, n11. description of beacon is "It sticks out of the ground about a foot. It's colored [beaccolor of mrlp]."

check taking the beacon:
	say "The beacon seems stuck in the ground. It's probably more useful there, anyway." instead;

check tying rope to beacon:
	say "The beacon looks a little fragile. Tying the rope to it might break it. Maybe there is something else to do." instead;

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

book transponders

a cornerthing is a kind of backdrop. a cornerthing has a color called cornercolor. a cornerthing has a color called rightcolor. the rightcolor of a cornerthing is usually black. the cornercolor of a cornerthing is usually black.

Bbordering relates cornerthings to each other. The verb to bborder (he bborders, they bborder, it is bbordered) implies the bbordering relation.

the northupwest transponder is a cornerthing. It is in n02, u02, w22.

the northupeast transponder is a cornerthing. It is in n22, u22, e22.

the southupwest transponder is a cornerthing. It is in s02, u00, w02.

the southupeast transponder is a cornerthing. It is in s22, u20, e02.

the northdownwest transponder is a cornerthing. It is in n00, d02, w20.

the northdowneast transponder is a cornerthing. It is in n20, d22, e20.

the southdownwest transponder is a cornerthing. It is in s00, d00, w00.

the southdowneast transponder is a cornerthing. It is in s20, d20, e00.

the northdownwest transponder bborders the northupwest transponder.
the northupwest transponder bborders the northupeast transponder.
the northupeast transponder bborders the northdowneast transponder.
the northdowneast transponder bborders the northdownwest transponder.

the southdownwest transponder bborders the southupwest transponder.
the southupwest transponder bborders the southupeast transponder.
the southupeast transponder bborders the southdowneast transponder.
the southdowneast transponder bborders the southdownwest transponder.

the northdownwest transponder bborders the southdownwest transponder.
the northdowneast transponder bborders the southdowneast transponder.
the northupwest transponder bborders the southupwest transponder.
the northupeast transponder bborders the southupeast transponder.

does the player mean touching a cornerthing: it is very likely.

description of a cornerthing is usually "It sticks out from the cube at an angle, away from the pointy edge. It's currently colored [cornercolor of the item described][if ever-trans-changed is false]. It seems to draw you to it[end if]."

check taking cornerthing:
	say "You feel a small pulse as you touch it.";
	try touching noun instead;

fixed-beacons is a truth state that varies.

[?? reset rope]

to say froms of (x - a direction):
	say "You step back as a strong electric pulse emits [fromthe of x]. Maybe you can't change this transponder right now"

to say fromthe of (x - a  direction):
	say "from [if x is up]above[else if x is down]below[else]the [x][end if]"

check touching a cornerthing:
	if fixed-beacons is true, say "You don't need to fiddle with the transponders any more." instead;
	if rope-drop is true, say "You're wary of fiddling with the transponders now you're dragging the rope around." instead;
	let ia be number of aligned regions;
	if ring-color is black and cornercolor of noun is black, say "You feel a pulse through your ring. It feels like something more should happen, but it doesn't." instead;
	repeat through table of beacon zaps:
		if con2 entry is noun and cornercolor of con1 entry is not black, say "[froms of mydir entry]." instead;
	repeat through table of beacon zaps:
		if con1 entry is noun and cornercolor of con2 entry is not black, say "[froms of opposite of mydir entry]." instead;
	let oldcolor be raycolor of mrlp;
	if ring-color is black:
		say "The transponder winks back to black.";
	else if cornercolor of noun is black:
		say "A flash of light infuses the transponder. It shortly changes to [ring-color].";
	else:
		say "The transponder [if cornercolor of noun is ring-color]stays[else]changes from [cornercolor of noun] to[end if] [ring-color].";
	now cornercolor of noun is ring-color;
	let newcolor be raycolor of mrlp;
	now ever-trans-changed is true;
	if newcolor is oldcolor, the rule succeeds;
	let na be number of aligned regions;
	unless oldcolor is beaccolor of mrlp or newcolor is beaccolor of mrlp, say "Nothing much seems to happen. Well, yet." instead;
	if oldcolor is beaccolor of mrlp, say "You hear a whirring that ends on a low note [fromthe of centerdir of location of player].";
	if newcolor is beaccolor of mrlp:
		say "You hear a whirring that ends on a high note [fromthe of centerdir of location of player].";
		now mrlp is ever-aligned;
		if number of aligned regions is 6:
			say "The cube shakes a bit. It felt like a few tunnels opened at once.";
			now fixed-beacons is true;
	now all aligned regions are ever-aligned;
	move tunnel backdrop to all tunneled rooms;
	move beacon backdrop to all beaconed rooms;
	if debug-state is true:
		say "(DEBUG) [number of aligned regions] regions ([list of aligned regions]) now aligned.";
	the rule succeeds;

ever-trans-changed is a truth state that varies.

check touching a beacon:
	say "You feel a small pulse, but nothing significant[if ever-trans-changed is true], unlike when you touched that transponder[end if]." instead;

check touching ring:
	say "You adjust your mood ring. Nothing happens. For most people, futzing with a ring might release worry, but you are too calm and analytical minded." instead;

before switching on:
	if noun is beacon or noun is a cornerthing, say "You can't find any switch to flip." instead;

before switching off:
	if noun is beacon or noun is a cornerthing, say "You can't find any switch to flip." instead;

before burning:
	if noun is a cornerthing, say "[if ever-trans-changed is true]You can probably change its color the way you did before[else]Maybe there's a more specific way to change it[end if]";
	if noun is beacon, say "You don't see any way to light it on your own. Besides, it's already sort of lit [beaccolor of mrlp]." instead;
	say "You have no flammable materials, and that's probably a good thing." instead;

to decide which direction is centerdir of (r - a room):
	let q be u00;
	repeat with d running through simple directions:
		if the room d of r is nowhere, next;
		now q is the room d of r;
		if q is facecenter, decide on d;
		repeat with e running through simple directions:
			if the room e of q is nowhere, next;
			if the room e of q is facecenter, decide on combodir of d and e;
	say "**BUG**";
	decide on inside;

table of beacon zaps
con1	con2	mydir
northdownwest	northupwest	up
southdownwest	southupwest	up
northdowneast	northupeast	up
southdowneast	southupeast	up
northupeast	southupeast	south
northupwest	southupwest	south
northdowneast	southdowneast	south
northdownwest	southdownwest	south
northupeast	northupwest	west
northdowneast	northdownwest	west
southupeast	southupwest	west
southupeast	southupwest	west

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
	if cornercolor of b1 entry is not black or cornercolor of b2 entry is not black:
		if cornercolor of b3 entry is not black or cornercolor of b4 entry is not black:
			say "BUG THIS SHOULD NOT HAPPEN: [b1 entry] [cornercolor of b1 entry] [b2 entry] [cornercolor of b2 entry] [b3 entry] [cornercolor of b3 entry] [b4 entry] [cornercolor of b4 entry].";
			decide on brown;
	if cornercolor of b1 entry is not black and cornercolor of b2 entry is not black:
		decide on mix of cornercolor of b1 entry and cornercolor of b2 entry;
	if cornercolor of b3 entry is not black and cornercolor of b4 entry is not black:
		decide on mix of cornercolor of b3 entry and cornercolor of b4 entry;
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
	say "[line break]Thanks to, in alphabetical order, Brian Rushton, Mike Souza, and Mike Spivey for suffering through the early bug-filled variations of this game.";
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
	say "You can move in directions U D N S E W or any sensible combination of the two, e.g. WE doesn't work. IN also works if and when you have passage into the center of the asteroid.[paragraph break]On this plane, you can move [if mrlp is upper face or mrlp is bottom face]NW/NE/SW/SE[else if mrlp is southern face or mrlp is northern face]UE/UW/DE/DW[else if mrlp is eastern face or mrlp is western face]UN/US/DN/DS[end if] (You can reverse the directions, and it won't matter).[paragraph break]You may also want to TOUCH things or SUMMON the four elements: [list of elements]. THINK will summarize where you've been and what you've done[if rope-drop is true and tunnel-looped is false]. RESET will send you back before when you pitched the rope[end if].";
	if debug-state is true:
		say "[paragraph break]You can also use BCSOL to see the beacon solutions, or HALP to see the tunnel solution.";
	the rule succeeds;

chapter jumping

carry out jumping:
	if location of player is very center:
		say "It's tricky, here, and it's unnecesssary, too." instead;
	say "You try out the gravity on this side of the cube. Whee!" instead;

chapter thinking

definition: a cornerthing (called c) is activated:
	if cornercolor of c is black, no;
	yes;

carry out thinking:
	let explore-total be 0;
	if western face is explored or eastern face is explored, increment explore-total;
	if northern face is explored or southern face is explored, increment explore-total;
	if upper face is explored or bottom face is explored, increment explore-total;
	if explore-total < 3, say "You have a feeling you'll need to explore the other faces of the cube to figure what's going on, here." instead;
	if number of visited corner rooms is 0, say "You haven't visited the corner of any face." instead;
	if number of activated cornerthings is 0, say "Maybe you should activate one of the transponders in the corners of the faces." instead;
	if number of activated cornerthings < 4, say "Maybe you should activate more of the transponders in the corners of the faces." instead;
	say "These hints need to be filled out, but, later." instead;
	the rule succeeds;

chapter xyzzying

xyzzying is an action out of world.

understand the command "xyzzy" as something new.

understand "xyzzy" as xyzzying.

carry out xyzzying:
	say "You hone in on your training for three-dimensional reasoning from several different directions. The result is a slight headache. But it's a MOTIVATING headache!";
	the rule succeeds;

chapter reseting

reseting is an action out of world.

understand the command "reset" as something new.

understand "reset" as reseting.

carry out reseting:
	if rope-drop is false, say "You can't reset before dropping the rope." instead;
	if tunnel-looped is true, say "No, you're so close to the end!" instead;
	say "Resetting to where you dropped the rope..." instead;
	now rope-drop is false;
	now rope-colors is {};
	move player to init-drop-room;
	the rule succeeds;

volume parsing

book after parsing a command

after reading a command:
	let XX be indexed text;
	let XX be the player's command in lower case;
	change the text of the player's command to XX;
	if the player's command matches the regular expression "^(air|water|fire|earth|red|white|blue|yellow)$":
		let XX be the player's command;
[		replace the regular expression "^(say|think|shout|speak|yell) " in XX with "";]
		change the text of the player's command to "summon [XX]";

book parser errors

Rule for printing a parser error when the latest parser error is the i beg your pardon error:
	say "You ponder the philosophical implications of the Law of Averages.";

Rule for printing a parser error when the latest parser error is the noun did not make sense in that context error:
	if the player's command includes "summon":
		say "It looks like you tried to summon something. The only things to summon are [list of elements], though you can also refer to them by their colors." instead;
	say "You tried to access something not currently in the world. Maybe that's a result of a typo, or it's minor scenery I forgot to implement and should've, or a bad synonym. But it's not critical to the game.";

Rule for printing a parser error when the latest parser error is the only understood as far as error:
	say "The first word was okay, and you don't need any extra ones."

rule for printing a parser error when the latest parser error is the can't see any such thing error:
	say "I (you) can't see anything here like that."

rule for printing a parser error when the latest parser error is the didn't understand error:
	say "I didn't recognize that verb. For a list of common/useful verbs, type V or VERB or VERBS.";

rule for printing a parser error when the latest parser error is the not a verb I recognise error:
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
		say "You are at the [descdir] corner of the [mrlp]. There's a transponder here--your mood ring is slightly attracted to it. You can go [list of goable directions] along this face, or you can go off this face: [cornerwarp]";
	else if location of player is facecenter:
		say "You are at the center of the [mrlp]. You can go pretty much any direction: [list of goable directions]. [if raycolor of mrlp is beaccolor of mrlp]A tunnel leads inside ([indir of mrlp]) to the center of the cube[else]There's a beacon here, colored [beaccolor of mrlp][end if]";
	else if location of player is edge:
		say "You are at the center of the [descdir] edge of the [mrlp]. You can go [list of goable directions] along this face, or [list of warpable directions] [if number of warpable directions is 1]to a new plane[else]each to a different plane[end if]"

to say cornerwarp:
	let rooms-found be 0;
	repeat with Q running through simple directions:
		let Z be room Q of location of player;
		if Z is not nowhere and map region of Z is not mrlp:
			if rooms-found > 0, say " or ";
			say "[Q] to the [map region of Z]";
			increment rooms-found;

volume beta testing - not for release

when play begins:
	say "Thanks for running the debug version! Use [b]BCSOL[r] to see how to solve the beacon part of the game, or [b]HALP[r] to see how to solve the tunnel part. There are 48 randomly generated possible solutions for the beacons, and you can solve the tunnels 12 different ways.";
	if debug-state is false:
		say "[paragraph break]Note: I like to make sure beta testers have a transcript working. It's a big help to me. Even if you are lost and you feel it might not help, it does. So, after you press a key, you'll be asked to save your transcript to a file.";
		wfak-d;
		try switching the story transcript on;
		say "Transcripts can be sent to blurglecruncheon@gmail.com. Any punctuation before the comment is okay, e.g. *TYPO or ;typo or :typo. I can pick up pretty much any punctuation.";

chapter picking

picking is an action applying to one number.

understand the command "pick" as something new.

understand "pick [number]" as picking.

carry out picking:
	let W be {white, red, yellow, blue};
	let X be true;
	if number understood < 10000, now X is false;
	let Y be 0;
	let Y be the remainder after dividing number understood by 10000;
	let Z be Y / 1000;
	if Z < 1 or Z > 4, say "ERROR bad 1000s digit need 1-4!" instead;
	now rightcolor of northupwest is entry Z of W;
	now rightcolor of northupeast is entry Z of W;
	let Z1 be Y / 100;
	let Z1 be the remainder after dividing Z1 by 10;
	if Z1 < 1 or Z1 > 4, say "ERROR bad 100s digit need 1-4!" instead;
	now rightcolor of southupwest is entry Z1 of W;
	now rightcolor of southupeast is entry Z1 of W;
	let Z2 be Y / 10;
	let Z2 be the remainder after dividing Z2 by 10;
	if Z2 < 1 or Z2 > 4, say "ERROR bad 10s digit need 1-4!" instead;
	now rightcolor of northdownwest is entry Z2 of W;
	now rightcolor of northdowneast is entry Z2 of W;
	let Z3 be Y;
	let Z3 be the remainder after dividing Z3 by 10;
	if Z < 1 or Z > 4, say "ERROR bad 1s digit need 1-4!" instead;
	now rightcolor of southdownwest is entry Z3 of W;
	now rightcolor of southdowneast is entry Z3 of W;
	now init-list is {};
	add entry Z of W to init-list;
	add entry Z1 of W to init-list;
	add entry Z2 of W to init-list;
	add entry Z3 of W to init-list;
	if X is true:
		now rightcolor of northupeast is black;
		now rightcolor of northdownwest is black;
		now rightcolor of southupwest is black;
		now rightcolor of southdowneast is black;
		now beaccolor of upper face is mix of rightcolor of northupwest and rightcolor of southupeast;
		now beaccolor of bottom face is mix of rightcolor of northdowneast and rightcolor of southdownwest;
		now beaccolor of western face is mix of rightcolor of northupwest and rightcolor of southdownwest;
		now beaccolor of eastern face is mix of rightcolor of northdowneast and rightcolor of southupeast;
		now beaccolor of northern face is mix of rightcolor of northupwest and rightcolor of northdowneast;
		now beaccolor of southern face is mix of rightcolor of southupeast and rightcolor of southdownwest;
	else:
		now rightcolor of northupwest is black;
		now rightcolor of northdowneast is black;
		now rightcolor of southupeast is black;
		now rightcolor of southdownwest is black;
		now beaccolor of bottom face is mix of rightcolor of northdownwest and rightcolor of southdowneast;
		now beaccolor of upper face is mix of rightcolor of northupeast and rightcolor of southupwest;
		now beaccolor of western face is mix of rightcolor of northdownwest and rightcolor of southupwest;
		now beaccolor of eastern face is mix of rightcolor of northupeast and rightcolor of southdowneast;
		now beaccolor of northern face is mix of rightcolor of northdownwest and rightcolor of northupeast;
		now beaccolor of southern face is mix of rightcolor of southdowneast and rightcolor of southupwest;
	the rule succeeds;

chapter bcsoling

bcsoling is an action out of world.

understand the command "bcsol" as something new.

understand "bcsol" as bcsoling.

definition: a cornerthing (called q) is unneeded:
	if rightcolor of q is black, yes;
	no;

carry out bcsoling:
	say "TRANSPONDER COLORS:[line break]";
	repeat with x running through cornerthings:
		if rightcolor of x is not black:
			say "[x]: is [cornercolor of x], should be [rightcolor of x].";
	say "(SHOULD BE) UNUSED: [line break]";
	repeat with x running through cornerthings:
		if rightcolor of x is black:
			say "[x]: is [cornercolor of x], should be [rightcolor of x].";
	say "BEACON COLORS:[line break]";
	repeat with x running through regions:
		if x is mtr:
			next;
		say "[x]: ray color is [raycolor of x], beacon color is [beaccolor of x].";
	say "code: [code-num].";
	the rule succeeds;

chapter halping

halping is an action applying to nothing.

understand the command "halp" as something new.

understand "halp" as halping.

carry out halping:
	say "This is one way to solve the tunnels, starting from the top center:[paragraph break]";
	say "D ([beaccolor of upper face]). ";
	if beaccolor of western face colorborders beaccolor of upper face:
		say "W. ([beaccolor of western face]). ";
		if beaccolor of northern face colorborders beaccolor of western face:
			say "N. N. E. S([beaccolor of northern face]). D([beaccolor of bottom face]). E. E. N. W([beaccolor of eastern face]). S([beaccolor of southern face]). U. U. N. ";
		else:
			say "S. S. E. N([beaccolor of southern face]). D([beaccolor of bottom face]). E. E. S. W([beaccolor of eastern face]). N([beaccolor of northern face]). U. U. S. ";
	else:
		say "E. ([beaccolor of eastern face]). ";
		if beaccolor of northern face colorborders beaccolor of eastern face:
			say "N. N. W. S([beaccolor of northern face]). D([beaccolor of bottom face]). W. W. N. E([beaccolor of western face]). S([beaccolor of southern face]). U. U. N. ";
		else:
			say "S. S. W. N([beaccolor of southern face]). D([beaccolor of bottom face]). W. W. S. E([beaccolor of western face]). N([beaccolor of northern face]). U. U. S. ";
	say "Then DROP ROPE again to win.";
	the rule succeeds;

[to say tundir of (d - a direction):
	say "[abbrev of d]([beaccolor of random region with indir of d])"

to say abbrev of (d - a direction):
	say "[if d is north]N[else if d is south]S[else if d is east]E[else if d is west]W[else if d is up]U[else if d is down]D[else]?[end if]"]

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

[include Cube Game Testing by Andrew Schultz.]

[more standard inform stuff below]

book definitions for debug purposes

understand "d11" as d11.
understand "u11" as u11.
understand "n11" as n11.
understand "s11" as s11.
understand "w11" as w11.
understand "e11" as e11.

[u00 = SW u20 = SE]
understand "u00" as u00. understand "u02" as u02. understand "u20" as u20. understand "u22" as u22.

[d00 = SW d20 = SE]
understand "d00" as d00. understand "d02" as d02. understand "d20" as d20. understand "d22" as d22.
