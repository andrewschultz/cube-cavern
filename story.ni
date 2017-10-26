"The Cube in the Cavern" by Andrew Schultz

the story headline is "A 3-dimensional text adventure (well, the map is)"

the story description is "A Speedy 3-d Deed-y"

the release number is 1.

volume includes

include Trivial Niceties by Andrew Schultz.

include Drink Your Ovaltine by Andrew Schultz.

include Basic Screen Effects by Emily Short. [ watch out! center/central are defined here, so centered/center can cause runtime errrors. This is specific to my game and the mechanics it has.]

release along with an interpreter.

release along with cover art.

section big picture definitions

use no scoring.

section debug variables that need to be defined

go-test is a truth state that varies.

section debug to start - not for release

when play begins:
	say "DEBUG NOTE: [init-drop-room].";
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
understand the command "buy" as something new.
understand the command "turn" as something new.
understand the command "cut" as something new.
understand the command "no" as something new.
understand the command "yes" as something new.
understand the command "y" as something new.
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

a room can be facecenter, edge, corner or nonfacial.

a room can be roped. a room is usually not roped.

a region can be ever-aligned or never-aligned. a region is usually never-aligned.

a region can be alignable or unalignable. a region is usually alignable.

mtr is an unalignable region.

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

to decide what region is revregion of (c - a color):
	repeat with Q running through regions:
		if beaccolor of Q is c, decide on Q;
	decide on mtr;

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

a color can be elemental. a color is usually not elemental. white, red, yellow, and blue are elemental.

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

section status line stuff

you-won is a truth state that varies.

you-lost is a truth state that varies.

to re-status: (- DrawStatusLine(); -);

to say rhsl:
	if you-won is true:
		say "KNOWLEDGE";
	else if you-lost is true:
		say "OH NOES";
	else if number of nonblack cornerthings < 4 or number of aligned regions is 0:
		say "[number of nonblack cornerthings]/4";
	else if tunnel-looped is false:
		say "[number of entries in rope-colors]/6";
	else:
		say "TIE THE ROPE"

volume when play begins

when play begins:
	now right hand status line is "[rhsl]";
	say "Before we begin, there is a text map or two which does not play well with screen readers or some HTML browsers. If you are using a browser, the image on the left will be superior to the in-game text map.[paragraph break]Are you using a screen reader?";
	if the player no-consents:
		say "[b]NOTE[r]: this game may be extra tricky if you are vision-impaired, but I hope you are still able to enjoy it.[paragraph break]";
		now screenread is true;
	say "Screen reading support is now [on-off of screenread]. You can toggle it with SCREEN.[paragraph break]Also, when the cursor appears without the > prompt, as below, push any key to continue.";
	wfak-d;
	say "Science has been solved! Well, except for the scratchwork. And the stuff the numerologists proved could never be figured for sure. Everyone knows how the four elements work together. Okay, mostly. And astrology is more accurate than it's ever been. Except when people don't REALLY follow its advice. Anyway, there's got to be only so much more to calculate. Eventually, we'll learn why people don't fall through the flat earth, or why it isn't in free fall if there's gravity, but...all that's just numbers, right? We'll work it out one day! We just don't have enough of those punch-card processors yet!";
	wfak-d;
	say "[line break]As a hotshot double Ph. D. in Psychokinetics and Psychohistory, you weren't surprised you found an important new ancient-looking cave to excavate and explore. You're not just book smart--mood rings work even better on you than on most people, which shows extraordinary intelligence and sensitivity. Why, you eschewed a lucrative career as a psychic for, just, well...knowledge. And when your dowsing instruments detected something odd in a cavern, you were curious indeed! A cube lay beyond a river, and you're lucky you had your assistant to pull you back, because somehow, you felt pulled towards the center! Your assistant tied you down so you could explore briefly, and YOU WERE ABLE TO WALK UPSIDE-DOWN. What sort of crazy science was this? Any fool familiar with the Law of Gravity would know there must have been some powerful life force or something in the center. You fell so hard when you were pulled away, you had to use your entire supply of healing crystals to get back to 100%.";
	wfak-d;
	say "[line break]But you planned ahead! The ideas flew across, around and through the feng shui in your office. Along with your mood ring, you brought some rope, read up on levitation (for when you need to escape the cube again) and consulted a medium and, of course, several of the top magnet therapists. And you discussed how hollow the area beneath the flat earth might be.";
	wfak-d;
	say "[line break]Science without data is nothing, though! You knew you had to return to the cavern that held the cube. Carefully, you mapped the cube out. Perhaps the cube has hidden some great universal message that goes beyond mere language. Perhaps it holds keys to the universe you had only imagined.";
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

to decide which number is code-num of (t - a truth state):
	let mag be 5;
	if t is true, now mag is mag * 2;
	let index be mag * mag * mag;
	let retval be 0;
	let idx2 be 0;
	let my-list be { white, red, yellow, blue };
	[say "[my-list] vs [init-list].";]
	if rightcolor of northupeast is black, now retval is index * mag;
	let idx be 0;
	while index > 0:
		increment idx;
		now idx2 is 0;
		repeat with Q running through my-list:
			increment idx2;
			if Q is entry idx of init-list:
				increase retval by index * idx2;
		now index is index / mag;
	decide on retval.

init-list is a list of colors variable. init-list is { white, red, yellow, blue }.

to wfak-d:
	if debug-state is false, wfak;

volume the player

the player wears the mood ring. description of mood ring is "The phlogiston in your mood ring is currently colored [ring-color-report]. You can SUMMON any of the four elements ([list of elements]) to change the ring[if ring-color is not black], or if you wait, the ring can go back to black[end if]."

the player carries the map. description of map is "You scribbled this map before getting on the cube, just so you would be able to regain your bearings on the place where you walked upside down. You can READ it."

check dropping the map:
	say "You're pretty sure you've visualized it all, but no need to get cocky. Better hold on to it." instead;

mapreading is an action out of world.

understand the command "map" as something new.

understand "map" as mapreading.

carry out mapreading:
	try reading the map instead;

instead of taking inventory:
	if the number of things enclosed by the player is 0, say "You are empty-handed." instead;
	say "You are carrying: [line break]";
	list the contents of the player, with newlines, indented, with extra indentation;

after printing the name of the mood ring while taking inventory:
	say " (colored [ring-color], being worn)";
	the rule succeeds;

description of the player is "You didn't need to wear anything special for this exploration."

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

chapter rope stuff

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
	say "You drop the rope and anchor it. ([b]NOTE[r]: if you want to undo things later, you can [b]RESET[r] to before you dropped the rope, which is hopefully easier than walking back your progress. Or you can [b]TAKE[r] the rope right now if you maybe want to anchor the rope elsewhere).";
	now last-top-room is location of player;
	now rope-drop is true;
	the rule succeeds;

check taking wire rope:
	if rope-drop is true:
		if init-drop-room is location of player and number of entries in rope-colors is 0:
			say "You pick up the rope.";
			now last-top-room is u00;
			now init-drop-room is u00;
			now rope-drop is false;
		else:
			say "You will need to backtrack to [init-drop-room] (or just RESET) to unhitch the rope.";
		the rule succeeds;
	say "You may need to drop the rope later, but for now, you have a good hold on it."

check dropping:
	say "Whatever you drop could get lost forever. Best hang on." instead;

volume elements

chapter elements

an element is a kind of thing. an element has a color called conc-color. an element can be ever-acc. an element is usually not ever-acc. an element has text called blah-txt.

air is an element. conc-color of air is white. blah-txt is "People argued if air should have a color, but of course it has to. It's just really, really white: ultra-white, maybe."

fire is an element. conc-color of fire is yellow. blah-txt is "People argued once that fire should be orange, because fire looks orange when humans make it, but these days you know better. How would you make anything yellow, then?"

earth is an element. conc-color of earth is red. blah-txt is "People thought earth should be brown, but then, it's different colors on different planets. Since most dirt has probably gone through a lot of fire and water, it must be red at its true core."

water is an element. conc-color of water is blue. blah-txt is "There was a big fight over whether water should be blue and air, white, or vice versa. A bunch of wars were fought, but during those wars, all the weapons being created totally spurred science! People learned so much. Nowadays people don't joke about if things were reversed unless they want free room and board at the government's (dis)pleasure."

chapter summoning colors

understand the command "summon" as something new.

colsummoning is an action applying to one color.

understand "summon [color]" as colsummoning.

carry out colsummoning:
	repeat with X running through elements:
		if conc-color of X is the color understood, try summoning X instead;
	if the color understood is black:
		if ring-color is black, say "Your mood ring already is black." instead;
		now ring-color is black;
		now ring-moves is 0;
		say "You wait a bit for the mood ring to cool down and return to black." instead;
	say "Uh-oh, we can't summon that color. We can only summon the four elemental colors.";
	the rule succeeds;

chapter summoning elements

does the player mean summoning an element: it is very likely.

summoning is an action applying to one visible thing.

understand "summon [any thing]" as summoning.

all-4-acc is a truth state that varies.

carry out summoning:
	if player is in very center, say "Nothing happens. The weird gold sphere may be mucking with things, here." instead;
	if noun is beacon and beaccolor of mrlp is elemental:
		say "It makes sense to summon the same color element as the beacon nearby, so you do.[paragraph break]";
		try colsummoning beaccolor of mrlp instead;
	if noun is not an element, say "You can only summon elements. The elements are: [list of elements]." instead;
	say "You reflect on the [noun] for a bit. Your mood ring [if ring-color is conc-color of noun]glows a bit brighter but does not change color[else]changes to [conc-color of noun][one of]. [b]NOTE[r]: in the future, you can SUMMON a color, or even leave off SUMMON altogether[or][stopping][end if].";
	if noun is not ever-acc:
		say "[line break]SCIENCE TIME: [blah-txt of noun][line break]";
		now noun is ever-acc;
	now ring-color is conc-color of noun;
	now ring-moves is 5;
	if all-4-acc is false:
		if all elements are ever-acc:
			say "[line break]GAME NOTE: you can just type an element or the color you wish to change in the future, without SUMMON.";
			now all-4-acc is true;
	the rule succeeds.

chapter cing

cing is an action applying to one color.

understand the command "c" as something new.

understand "c [color]" as cing.

carry out cing:
	if location of player is not corner, say "C only works near a transponder to touch." instead;
	now ring-color is color understood;
	try touching a random visible cornerthing;
	now c-known is true;
	the rule succeeds;

c-known is a truth state that varies.

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

the main go check rule is listed before the can't go that way rule in the check going rules.

check going (this is the main go check rule):
	now last-room is location of player;
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
		say "You can only go [list of ubercromulent directions], or any combination (see DIRS for details), along the [mrlp][if location of player is facecenter and number of ever-aligned regions > 0]. You also [can-want] go inside/[indir of mrlp] here in the center[end if]." instead;
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
						if go-test is true:
							say "TESTING NOTE: you would've moved to [r2] in [map region of R2]." instead;
						say "[if noun is complex]It feels weird shimmying over at a diagonal angle, but there you are[else]Fwoop. You flip over to the [map region of R2][end if].";
					if rope-drop is true and map region of R2 is not last-rope-region and mrlp is not last-rope-region and map region of R2 is not mrlp:
						say " need to put your rope down somewhere close, if you can." instead;
					if path-violated is false and path-achieved is false:
						now path-violated is true;
						say "A diagonal move ruins your try to visit everywhere without retracing your path. So, if you want, undo.";
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
		if go-test is true:
			say "TESTING NOTE: you would've moved to [X] in [mrx] from [mrlp]." instead;
		say "You twist over the side of the cube to the [mrx].[line break]";
	continue the action;

gotohintyet is a truth state that varies.

last-room is a room that varies.

after looking:
	if gotohintyet is false:
		if mrlp is not upper face:
			say "[b]NOTE[r]: if the geography is intimidating, you can use the GT/GO TO command to return somewhere you have been, or even go somewhere you guess might be relevant. For instance, the start is [b]u or uc[r] would return you to the upper face center, and [revgoto of last-room] would return you to where you were ([last-room]), while [revgoto of location of player] would send you where you are now. [b]goto dsw[r] or [b]goto dws[r] would each send you the same corner of the cube bottom--you can use GOTO on where you haven't been, yet.";
			now gotohintyet is true;
	continue the action;

the cherry picking rule is listed before the check new arrival rule in the carry out looking rulebook.

to decide which number is thoughtfulness:
	decide on number of visited edge rooms + number of visited corner rooms;

carry out looking (this is the cherry picking rule):
	if location of player is unvisited and location of player is edge:
		if the remainder after dividing thoughtfulness by 3 is 0:
			choose row thoughtfulness / 3 in table of goofy observations;
			if there is an init-obs entry, say "[init-obs entry][line break]";

chapter exping

exping is an action out of world.

understand the command "exp" as something new.

understand "exp" as exping.

carry out exping:
	let Q be thoughtfulness / 3;
	if Q is 0, say "You haven't had any random observations yet. Explore a little, and you'll get one." instead;
	if Q > number of rows in table of goofy observations, now Q is number of rows in table of goofy observations;
	choose row Q in table of goofy observations;
	say "Explanation of the most recent observation while wandering the cube: [end-obs entry][line break]";
	the rule succeeds;

definition: a direction (called d) is rubiks:
	if d is not simple, no;
	if d is indir of mrlp or d is outdir of mrlp, no;
	yes;

to say revgoto of (rm - a room):
	repeat through table of gotos:
		if rm is jumpy entry:
			say "goto [b][s1 entry][if there is an s2 entry] or [s2 entry][end if][r]";
			continue the action;

does the player mean tying rope to rope when tunnel-looped is true or location of player is init-drop-room: it is very likely.

to say maybe-clue:
	say "[if path-achieved is true]. After your long, precise trek, you have the brilliant idea that a similar cube might reveal different words if you went through the center differently: you could reverse the order (purple first), or you could shift what you started with, or both[else]Hmm[end if]"

check tying rope to rope:
	let TS be whether or not number of unvisited rooms > 0;
	if tunnel-looped is true:
		if location of player is not init-drop-room:
			say "Maybe go back to where you originally dropped the rope in the center of the [map region of init-drop-room]." instead;
		say "Power fluxes through the rope as you connect it in a loop. You watch as the cube breaks apart, and the gold sphere pops out and rolls around. You begin to fall, but remembering your levitation lessons, you slow the acceleration...";
		wfak-d;
		say "[line break]The gold sphere cracks open. You see visions...of not five, not six, but OVER ONE HUNDRED ELEMENTS. Of light having speed, of mathematical theorems that prove you can't know anything. You see a vision of circular worlds that pull people to their centers, just like the cube, but THERE IS NOTHING SPECIAL IN THERE. There are visions of machines that not just levitate, but fly to the stars, which you thought was proven impossible.";
		wfak-d;
		say "[if TS is true]A voice hums through your mind that you solved the cube but did not explore ALL, so part of a vision is hidden from you[else][line break]There's also a vision of a few letters: [drink-your-ovaltine][maybe-clue].";
		wfak-d;
		say "[line break]Well, you know to be skeptical of fake science when you see it. You realize this might be a hallucination. But you also realize you can pull the gold sphere to the surface and sell it to a museum for good money.";
		wfak-d;
		say "[line break]But you never talk about what you really saw[if TS is true], even when your calculations show there must be three similar cubes in caverns elsewhere[end if]. You mention you had a cosmic vision, and so forth, and you wish you could interpret it, but all you remember are the parts about loving other people being important and how the journey is its own reward, and how that's true with lots of technology, or little. You find yourself saying 'There's just ... STUFF WE DON'T UNDERSTAND OUT THERE' with a conviction and mystery few can hope for. Many people in high governmental positions clap you on the back in public and say 'This... this... THIS is a person who has integrated the scientific with the emotional! An example to all!'";
		wfak-d;
		say "[line break]You write some bestselling motivational books that convince people they can be happy, more or less, if they just follow some simple steps, and if they don't, that's their fault. But every so often some pesky kid comes up to you and asks 'What if there weren't four elements? What if... why, what if you'd run the rope through differently?' Youthful imagination! You convince a few such kids to take up writing instead. Even the wildest, wrongest fantasies can spur rigorous scientific thought.";
		now you-won is true;
		re-status;
		end the story finally saying "YOU HAVE ACHIEVED KNOWLEDGE";
		the rule succeeds;
	if rope-drop is true:
		if location of player is init-drop-room:
			if number of entries in rope-colors > 1:
				say "You tie the rope to itself. [if number of entries in rope-colors < number of aligned regions]Maybe you didn't thread the cube completely, but eh well, no big deal[else if number of aligned regions < 6]Maybe you could've created a few other tunnels, but the important thing is, you've anchored the whole cube[else]The rope is pulsing weirdly, but you've figured what to do with it[end if], right?";
				wfak-d;
				say "[line break]You throw the rope hard enough that it breaks the cube's gravity. As it hits a cavern wall, you feel the cube pulled...and it starts to crumble...and the gold ball rushes out of the cavern. When you return to the surface, people tell you of the wonderful fireworks as it exploded in the sky. They were sure you did all you could to capture what was in it. But you aren't.";
				now you-lost is true;
				re-status;
				end the story saying "THE KNOWLEDGE REMAINS HIDDEN";
				the rule succeeds;
			else:
				say "You already dropped the rope here. Time to get a move on." instead;
		if location of player is facecenter or location of player is very center:
			say "Maybe tie the rope at the start of the tunnel where you first went inside, on the [map region of init-drop-room]." instead;
		say "You started tying the rope at one of the tunnels." instead;
	say "This doesn't seem like a good place to make a loop." instead;

check tying rope to:
	if second noun is gold spherical object, say "There's no good surface on the weird gold object, and it sort of magnetically repels you anyway." instead;
	if second noun is tunnel, try dropping rope instead;
	if second noun is beacon, say "The beacon might snap if you pull the rope away." instead;
	if second noun is ring, say "You couldn't tie the rope around the ring without removing the ring, and you don't want to remove the ring." instead;
	if second noun is a cornerthing, say "The [noun] might snap if you pull the rope away." instead;

check tying something to:
	if second noun is rope and noun is not rope, try tying noun to second noun instead;

after going:
	if path-violated is false:
		if location of player is visited or location of player is very center, now path-violated is true;
		if noun is not simple, now path-violated is true;
		if path-violated is true, say "Oops. You [if noun is not simple]moved diagonally[else]moved onto a square you'd been to[end if].";
		if path-violated is false and number of unvisited rooms is 2:
			now path-achieved is true;
			if path-tracking is true, say "You have visited all the squares on the cube in order!";
	continue the action;

after going:
	if init-drop-room is location of player and tunnel-looped is true:
		say "You see where you planted the rope, originally. You can probably TIE the end you're holding to the other end, then ...";
	continue the action;

carry out going when location of player is very center:
	check-rope-tunnel beaccolor of map region of room noun of very center;
	if continue-tunnel is false, the rule succeeds;
	now last-rope-region is map region of room noun of very center;
	now last-top-room is room noun of very center;
	continue the action;

chapter dirsing

dirsing is an action out of world.

understand the command "dir" as something new.
understand the command "dirs" as something new.

understand "dir" and "dirs" as dirsing.

carry out dirsing:
	if mrlp is mtr, say "[if number of centexit directions is 0]You can't go anywhere, which is a BUG. Sorry. Try undoing your last actions[else]You can go [list of centexit directions] from here[end if]." instead;
	say "The directions you can move on the [mrlp] are: [face-dirs].";
	the rule succeeds;

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

the tunnels are scenery in very center. understand "tunnel" as tunnels when player is in very center.

understand "blue/red/orange/yellow/violet/green tunnel/tunnels" as tunnels

[?? red tunnel]

instead of entering tunnels:
	if number of aligned regions is 1, try going outdir of random aligned region instead;
	say "There are too many ways to go. You need to pick a specific direction."

check examining tunnels:
	if number of aligned regions is 0, say "There should be a way out, but there's not, which is a BUG." instead;
	if number of aligned regions is 1:
		say "The tunnel back [outdir of random aligned region] is colored [beaccolor of random aligned region]." instead;
	say "The tunnels are colored as follows:[line break]";
	repeat with X running through alignable regions:
		if x is aligned, say "[outdir of x]: [beaccolor of x][if beaccolor of x is listed in rope-colors] (with rope through it)[end if].";
	the rule succeeds;

description of very center is "Here in the very center you can [if number of centexit directions is 1]only go back [only-vc-dir][else if number of centexit directions is 0]not go anywhere(a BUG, please let me know how, and hope you can UNDO)[else]go [list of centexit directions] back to the surface through different colored tunnels[end if].[paragraph break][one of]There's some weird gold object[or]That weird gold object is still[stopping] [object-doing][one of]. It must be what gave those readings that attracted you to the cube in the first place[or][stopping]."

to say only-vc-dir:
	let J be a random centexit direction;
	say "[J] through a [beaccolor of map region of room J of very center] tunnel";

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

check going to very center:
	d "[raycolor of mrlp] [beaccolor of mrlp].";
	if mrlp is never-aligned:
		if mrlp is aligned:
			say "*";
			continue the action; [this is a sneaky way to skip over a bug where something is aligned AND never-aligned]
		say "You're at the right place to go in, but you don't have a way through, yet." instead;
	if mrlp is not aligned:
		say "You're at the right place to go in, but the way through closed." instead;
	check-rope-tunnel beaccolor of mrlp;
	if continue-tunnel is false, the rule succeeds;

to rope-adjust (ts - a truth state):
	let NE be number of entries in rope-colors;
	let R1 be random facecenter room in revregion of entry NE in rope-colors;
	let R2 be random facecenter room in revregion of entry (NE - 1) in rope-colors;
	d "ROPE: [ne] [rope-colors]";
	d "ROPE: start [unless ts is true]de-[end if]roping [ne] [r1] [entry (ne - 1) in rope-colors] and [ne - 1] [r2] [entry ne in rope-colors].";
	repeat through table of ropetracing:
		if (r1 is l1 entry and r2 is l2 entry) or (r1 is l2 entry and r2 is l1 entry):
			if ts is true:
				now l3 entry is roped;
				now l4 entry is roped;
			else:
				now l3 entry is not roped;
				now l4 entry is not roped;
			d "ROPE: [l3 entry] and [l4 entry] [unless ts is true]de-[end if]roped.";
			continue the action;

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
		say "You pull back the segment of rope you dropped in the [c] tunnel.";
		remove entry Q from rope-colors;
		let NE be number of entries in rope-colors;
		if NE is 2 or NE is 4:
			rope-adjust false;
		d "[rope-colors].";
	else:
		if c is listed in rope-colors:
			say "You're pulled from entering the tunnel again with your rope. Perhaps you should choose another tunnel[if player is in very center], or retreat[end if].";
			now continue-tunnel is false;
			continue the action;
		say "You pull your rope through the [c] tunnel...[paragraph break]";
		add c to rope-colors;
		let NE be number of entries in rope-colors;
		if NE is 3 or NE is 5:
			rope-adjust true;
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

check going in very center (this is the check for basic directions from very center rule):
	if noun is inside:
		say "You're already inside at the center of the asteroid." instead;
	if noun is outside:
		say "There are six ways outside." instead;
	if noun is complex:
		say "Only simple directions work here. Each goes to the center of a different face." instead;
	if noun is not centexit:
		say "Maybe you can make a path like that later, but there is none, now." instead;

book cube backdrop

the cube is a backdrop. the cube is everywhere. description of cube is "[if player is in very center]It's as shiny on the inside as the outside[else if location of player is facecenter]From here, you can only really see the face you're on, which is impressively shiny[else if location of player is edge]You can see two faces from where you're standing[else if location of player is corner]You can see three faces--half the cube--from here[end if]."

instead of doing something with the cube:
	if current action is examining, continue the action;
	if current action is entering and location of player is facecenter, try going indir of mrlp;
	if current action is pushing or current action is pulling, say "You immediately have a nightmarish vision of one-third of the cube rotating a full ninety degrees. Then another third, at a right angle to it, rotating. And again. And, bizarrely, someone actually having fun figuring how to get the cube back as it was. An unsettling vision!" instead;
	say "You can't do much with the cube except walk on[if number of aligned regions > 1] or around[end if] it."

understand "face" as cube.
understand "upper/u face" as cube when mrlp is upper face.
understand "bottom/d face" as cube when mrlp is bottom face.
understand "western/west/w face" as cube when mrlp is western face.
understand "eastern/east/e face" as cube when mrlp is eastern face.
understand "southern/south/s face" as cube when mrlp is southern face.
understand "northern/north/n face" as cube when mrlp is northern face.

book beacons

the beacon is a backdrop. it is in u11, d11, w11, e11, s11, n11. description of beacon is "It sticks out of the ground about a couple feet. It's colored [beaccolor of mrlp]."

understand "purple beacon" and "purple" as beacon when beaccolor of mrlp is purple and location of player is facecenter.
understand "orange beacon" and "orange" as beacon when beaccolor of mrlp is orange and location of player is facecenter.
understand "yellow beacon" and "yellow" as beacon when beaccolor of mrlp is yellow and location of player is facecenter.
understand "red beacon" and "red" as beacon when beaccolor of mrlp is red and location of player is facecenter.
understand "green beacon" and "green" as beacon when beaccolor of mrlp is green and location of player is facecenter.
understand "blue beacon" and "blue" as beacon when beaccolor of mrlp is blue and location of player is facecenter.

check taking the beacon:
	say "The beacon seems stuck in the ground. It's probably more useful there, anyway." instead;

check tying rope to beacon:
	say "The beacon looks a little fragile. Tying the rope to it might break it. Maybe there is something else to do." instead;

the tunnel is a backdrop.

instead of entering tunnel, try going inside;

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

chapter each one

the northupwest transponder is a cornerthing. It is in n02, u02, w22.

the northupeast transponder is a cornerthing. It is in n22, u22, e22.

the southupwest transponder is a cornerthing. It is in s02, u00, w02.

the southupeast transponder is a cornerthing. It is in s22, u20, e02.

the northdownwest transponder is a cornerthing. It is in n00, d02, w20.

the northdowneast transponder is a cornerthing. It is in n20, d22, e20.

the southdownwest transponder is a cornerthing. It is in s00, d00, w00.

the southdowneast transponder is a cornerthing. It is in s20, d20, e00.

chapter doing with cornerthings

does the player mean touching a cornerthing: it is very likely.

instead of touching the player: say "You steeple your fingers, which has been proven to give 25% more thoughts, with 25% more quality. Unless, of course, you start to worry how soon those great new thoughts will pop up. Which you do, so it's all void."

description of a cornerthing is usually "It sticks out from the cube at an angle, away from the pointy edge. It's currently colored [cornercolor of the item described][if ever-trans-changed is false]. It seems to draw you to it[end if]."

check taking cornerthing:
	say "You feel a small pulse as you touch it.";
	try touching noun instead;

fixed-beacons is a truth state that varies.

to say froms of (x - a direction):
	say "You step back as a strong electric pulse emits [fromthe of x]. Maybe you can't change this transponder right now"

to say fromthe of (x - a  direction):
	say "from [if x is up]above[else if x is down]below[else]the [x][end if]"

to decide what number is regionbin:
	let ret be 0;
	if upper face is aligned, increase ret by 32;
	if bottom face is aligned, increase ret by 16;
	if northern face is aligned, increase ret by 8;
	if southern face is aligned, increase ret by 4;
	if eastern face is aligned, increase ret by 2;
	if western face is aligned, increase ret by 1;
	decide on ret;

fourwarned is a truth state that varies.

this is the avoid-zapped rule:
	let zaps be 0;
	let lastdir be inside;
	repeat through table of beacon zaps:
		if con2 entry is noun and cornercolor of con1 entry is not black:
			increment zaps;
			now lastdir is opposite of mydir entry;
	repeat through table of beacon zaps:
		if con1 entry is noun and cornercolor of con2 entry is not black:
			increment zaps;
			now lastdir is mydir entry;
	if zaps is 0, the rule succeeds;
	say "You step back as a strong electric pulse emits [if zaps is 3]from several different directions[else if zaps is 2]from two different directions[else][fromthe of lastdir][end if].";
	the rule fails;

check touching a cornerthing:
	if fixed-beacons is true, say "You don't need to fiddle with the transponders any more." instead;
	if rope-drop is true, say "You're wary of fiddling with the transponders now you're dragging the rope around." instead;
	let ia be number of aligned regions;
	if ring-color is black and cornercolor of noun is black, say "You see the darkness in your ring swirl. It feels like something more should happen, but it doesn't." instead;
	consider the avoid-zapped rule;
	if the rule failed, the rule fails;
	now ray-bug is false;
	let oldcolor be raycolor of mrlp;
	if ring-color is black:
		say "The transponder winks back to black.";
	else if cornercolor of noun is black:
		say "A flash of light infuses the transponder. It shortly changes from black to [ring-color].";
	else:
		say "The transponder [if cornercolor of noun is ring-color]stays[else]changes from [cornercolor of noun] to[end if] [ring-color].";
	let na-then be number of aligned regions;
	let atot-then be regionbin;
	let nochange be whether or not cornercolor of noun is ring-color;
	now cornercolor of noun is ring-color;
	let newcolor be raycolor of mrlp;
	now ever-trans-changed is true;
	let na-now be number of aligned regions;
	let atot-now be regionbin;
	d "[oldcolor]/[newcolor] vs [beaccolor of mrlp].";
	if oldcolor is beaccolor of mrlp and newcolor is not beaccolor of mrlp:
		say "[line break]You hear a whirring that ends on a low note [fromthe of centerdir of location of player].";
	else if newcolor is beaccolor of mrlp and oldcolor is not beaccolor of mrlp:
		say "[line break]You hear a whirring that ends on a high note [fromthe of centerdir of location of player].";
		now mrlp is ever-aligned;
		if number of aligned regions is 6:
			say "[line break]The cube shakes a bit. It felt like a few tunnels opened at once.";
			now fixed-beacons is true;
		else if number of aligned regions is 4:
			say "[line break]You feel very close to your goal yet very far away at the same time. Weird.";
	else if na-now > na-then:
		say "[line break]You hear a distant whirring that ends on a high note, but you can't tell from where.";
	else if na-now < na-then:
		say "[line break]You hear a distant whirring that ends on a low note, but you can't tell from where.";
	else if atot-now is not atot-then:
		say "[line break]You hear weird whirrings--from where, you can't say.";
	else if nochange is false:
		say "[line break]Nothing else seems to happen, but then, there are other places to visit.";
	now all aligned regions are ever-aligned;
	tun-beac-reset;
	if fourwarned is false and number of nonblack cornerthings is 4 and number of aligned regions < 6:
		now fourwarned is true;
		say "[line break]NOTE: if you want to reset what you've done with the transponders, [b]CLEAR[r] will do so.";
	if debug-state is true:
		say "[line break](DEBUG) [number of aligned regions] regions ([list of aligned regions]) now aligned.";
	if ray-bug is true:
		say "[line break]You hear a fizzling noise. Something has happened that really, really shouldn't. It won't affect your ability to win the game, but you might want to undo things.";
		now ray-bug is false;
	if all-4-acc is true and c-known is false:
		say "[line break]NOTE: C (color) around a beacon is now shorthand to change that beacon's color.";
		now c-known is true;
	the rule succeeds;

definition: a cornerthing (called q) is nonblack:
	if cornercolor of q is black, decide no;
	decide yes;

to tun-beac-reset:
	move tunnel backdrop to all tunneled rooms;
	move beacon backdrop to all beaconed rooms;

ever-trans-changed is a truth state that varies.

check touching a beacon:
	say "You feel a small pulse, but nothing significant[if ever-trans-changed is true], unlike when you touched that transponder[end if]." instead;

check touching ring:
	say "You adjust your mood ring. Nothing happens. For most people, futzing with a ring might release worry, but you are too calm and analytical minded." instead;

check touching cube:
	say "It is metallic and shiny and smooth." instead;

instead of listening:
	say "It's silent. Helps you focus on what you need to do here, I guess."

before switching on:
	if noun is beacon or noun is a cornerthing, say "[if ever-trans-changed is true]You already found another way to change things, by SUMMONing and TOUCHing[else]You can't find any switch to flip. Maybe try something else[end if]." instead;
	if noun is gold, say "You see no switch on the weird gold thing." instead;
	say "You don't need to use the verb SWITCH to win the game." instead;

before switching off:
	try switching on noun instead;

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

to decide which color is raycolor of (re - a region):
	let r2 be a random facecenter room in re;
	decide on raycolor of r2;

ray-bug is a truth state that varies.

to decide which color is raycolor of (r - a room):
	let cr be map region of r;
	choose row with myreg of cr in table of region beacons;
	if cornercolor of b1 entry is not black or cornercolor of b2 entry is not black:
		if cornercolor of b3 entry is not black or cornercolor of b4 entry is not black:
			d "*BUG* ADJACENT TRANSPONDERS WERE FLIPPED ON: [b1 entry] [cornercolor of b1 entry] [b2 entry] [cornercolor of b2 entry] [b3 entry] [cornercolor of b3 entry] [b4 entry] [cornercolor of b4 entry].";
			now ray-bug is true;
			decide on brown;
	if cornercolor of b1 entry is not black and cornercolor of b2 entry is not black:
		decide on mix of cornercolor of b1 entry and cornercolor of b2 entry;
	if cornercolor of b3 entry is not black and cornercolor of b4 entry is not black:
		decide on mix of cornercolor of b3 entry and cornercolor of b4 entry;
	decide on black;

chapter shortcut verb

volume changed verbs

chapter attacking

instead of attacking:
	if noun is gold, say "You're here to see what the gold thing is, not destroy it." instead;
	if noun is beacon, say "It doesn't appear to have military potential. Best lay off it." instead;
	if noun is a cornerthing, say "No. If it had offensive capability, it might already have used it on you." instead;
	say "The only thing a scientist like you should be attacking is abstract problems." instead;

chapter opening

check opening:
	if noun is tunnel or noun is tunnels, say "You already have a tunnel open. You're pretty sure you did so remotely, too." instead;
	if noun is beacon or noun is a cornerthing, say "It's too narrow to contain anything on the inside." instead;
	say "You don't need to open anything directly in this game." instead;

chapter closing

check closing:
	if noun is tunnel, say "It looks like you opened the tunnel without being nearby, so you'd need to close it remotely. Not that you need to." instead;
	if noun is tunnels, say "That would be dangerous, and it won't help you." instead;
	if noun is beacon or noun is a cornerthing, say "It's already closed." instead;
	say "You don't need to close anything in this game. Well, not directly." instead;

chapter waiting

before waiting:
	say "[one of]Numbers pass through your head, until an uninteresting one snaps you back into action.[or]You imagine the reception you'll get when you get back to the surface. They will be surprised, whenever you do![in random order]" instead;

chapter reading

understand the command "read" as something new.
understand "read [thing]" as reading.

reading is an action applying to one thing.

does the player mean reading the map: it is very likely.

read-warn is a truth state that varies.

html-warn is a truth state that varies.

check reading:
	if noun is not map and read-warn is false:
		now read-warn is true;
		say "NOTE: READing counts as examining, except for the map.";
		try examining the noun instead;
	if screenread is true, say "The text map plays havoc with screen readers, so I disabled it. Sorry." instead;
	if html-warn is false:
		say "NOTE: If you are running this in a web browser, the map on the left hopefully suffices to show how the faces link together.[paragraph break]";
		now html-warn is true;
	say "(You can see a graphical version with the game assembly)[paragraph break][fixed letter spacing][line break]         TO N                TO U
[line break]         | | |              / / /
[line break]        -u-u-u-T          -n-n-n-+
[line break]  TO N|/ | | | O          / / /  |/T
[line break]      w -u-u-u-         -n-n-n-+ e O
[line break]    |/|/ | | | E        / / /  |/|/
[line break]    w w -u-u-u-       -n-n-n-+ e e U
[line break]  |/|/|/ | | |        / / /  |/|/|/
[line break]  w w w  | | |       | | |   e e e
[line break] /|/|/|  / / /       | | |  /|/|/|
[line break]T w w  -s-s-s-      -d-d-d-- e e
[line break]O/|/|  / / /     TO  | | |  /|/|
[line break]  w  -s-s-s- TO   W -d-d-d-- e
[line break]D/|  / / /    E      | | |  /| TO S
[line break]   -s-s-s-          -d-d-d--
[line break]   / / /             | | |
[line break]   to D              to S
[line break]
[line break]  N U
[line break]  |/
[line break]W-*-E
[line break] /|
[line break]D S[variable letter spacing][paragraph break]" instead;

volume gotoing

gotoing is an action applying to one topic.

understand the commands "go to" and "gt" as something new.
understand "go to [text]" and "gt [text]" as gotoing.
understand "go to" and "gt" as gotohing.

gotohing is an action out of world.

carry out gotohing:
	now gotohintyet is true;
		say "You can go to any of the 54 outer locations with three or fewer keystrokes.[paragraph break]The six center squares: U or UC, E or EC, etc.[line break]The twenty-four edge squares: UN, UW, UE, US, etc. (note NU, WU, EU, SU will send you to different faces).[line break]The twenty-four corner squares: USW, USE, UNW, UNE, etc. You should be able to switch the second and third directions at will.[paragraph break][b]NOTE[r]: unfortunately, but you have to use GT before, as otherwise the room abbreviation might get confused with a direction to go." instead;

carry out gotoing:
	if location of player is very center, say "You need to surface before using GOTO." instead;
	now gotohintyet is true;
	repeat through table of gotos:
		if "[topic understood]" exactly matches the text "[s1 entry]" or there is an s2 entry and "[topic understood]" exactly matches the text "[s2 entry]":
			if jumpy entry is location of player:
				say "You're already there!" instead;
			if ring-moves > 1:
				say "You make sure to keep your ring's [ring-color]ness charged as you go...[paragraph break]";
				now ring-moves is 4;
			if path-violated is false:
				now path-violated is true;
				if path-tracking is true, say "The 'go to' command disables the visit-each-square-once bonus. UNDO to undo this move.";
			move player to jumpy entry;
			the rule succeeds;
	say "Sorry, there's no shortcut like that. Type just GT or GO TO to see the abbreviations." instead;

volume out of world verbs

chapter abouting

abouting is an action out of world.

understand the command "about" as something new.

understand "about" as abouting.

carry out abouting:
	say "I'd thought about a game on a cube for a while, but I didn't seriously consider and plan it until September 2017, just before the start of IFComp, when a wordplay game fell through.[paragraph break]A cube being an unscientific and ridiculous place to walk on, I figured, what else would fit in? That's when I got in with bad science and silly myths I hope you find fun.[paragraph break]A PDF map is included with the story file to help visualize things a bit easier. There is a general walkthrough strategy as well--there are forty-eight possible different starting configurations.[paragraph break]Bugs or suggestions can go to blurglecruncheon@gmail.com. There's always something to add or fix, it seems, but hopefully not too much.";
	the rule succeeds;

chapter creditsing

creditsing is an action out of world.

understand the command "credit" as something new.
understand the command "credits" as something new.

understand "credit" as creditsing.
understand "credits" as creditsing.

carry out creditsing:
	say "Thanks to, in alphabetical order, Brian Rushton, Mike Souza, Mike Spivey, and Marnix van den Bos for suffering through the early bug-filled variations of this game and for their support in a bit of a time crunch. Thanks also to an fellow competitor who wished to remain anonymous, for finding a bug in the comp version of the game. It's really cool that even though IFComp is a competition, people are ... cooperative.";
	say "[line break]Thanks to Brian Stovall and Matt Weiner for reporting bugs in-comp that spurred me to check off on a few other features and special cases.";
	say "[line break]Thanks to Genstein and Jason Lautzenheiser for creating and developing Trizbort, which has helped me organize and visualize other games in addition to this. http://www.trizbort.com has this app, though it's Windows only unless you're really good with emulators.";
	say "[line break]Cover art font is Neuropol X Font by Raymond Larabie at typodermicfonts.com via 1001fonts.com.";
	the rule succeeds;

chapter helping

chapter verbing

verbing is an action out of world.

understand the command "v" as something new.
understand the command "verb" as something new.
understand the command "verbs" as something new.

understand "v" as verbing.
understand "verb" as verbing.
understand "verbs" as verbing.

to say face-dirs:
	say "[if mrlp is upper face or mrlp is bottom face]NW/NE/SW/SE[else if mrlp is southern face or mrlp is northern face]UE/UW/DE/DW[else if mrlp is eastern face or mrlp is western face]UN/US/DN/DS[end if] or, reversed, [if mrlp is upper face or mrlp is bottom face]WN/EN/WS/ES[else if mrlp is southern face or mrlp is northern face]EU/WU/ED/WD[else if mrlp is eastern face or mrlp is western face]NU/SU/ND/SD[end if]"

carry out verbing:
	say "You can move in any of the standard directions, e.g. U/D/N/S/E/W. IN also works if and when you have passage into the center of the asteroid.[paragraph break]On the [mrlp], you can make diagonal movements like [face-dirs].[paragraph break]You may also want to [b]TOUCH[r] things or [b]SUMMON[r] the four elements: [list of elements][if all-4-acc is true]. Or you can just type the element or color you want[end if][if c-known is true].[paragraph break][b]C (color)[r] changes the ring color and touches a beacon[end if].[paragraph break][b]THINK[r] or [b]HELP[r] or [b]HINT[r] will summarize where you've been and what you've done[if rope-drop is true and tunnel-looped is false]. [b]RESET[r] will send you back before when you pitched the rope[end if]. You can also GO TO/GT any location on the cube, in abbreviated form (e.g. UNW goes to the northwest corner of the upper face)[if path-in-verbs is true]. You can type PATH to toggle path tracking, if you are trying to touch every outside square once before moving on[end if].[paragraph break]If visualization is tricky, READ MAP gives a textual representation of the PDF map included with the game.";
	if thoughtfulness > 3, say "[line break]EXP will also reveal what your most recent wandering thought or random find meant, if you didn't quite get the joke.";
	if debug-state is true:
		say "[line break]You can also use [b]BCSOL[r] to see the beacon solutions, or [b]HALP[r] to see the tunnel solution.";
	continue the action;

chapter climbing

instead of climbing:
	if noun is tunnel, say "Just go out in the direction you want to go." instead;
	if noun is beacon or noun is a cornerthing, say "No, [the noun] would probably snap under your weight." instead;
	if noun is gold, say "You're way bigger than it." instead;
	if noun is rope, say "You can climb it to get off the cube once you're done." instead;
	say "There's no need to climb in this game." instead;

chapter jumping

carry out jumping:
	if location of player is very center:
		say "It's tricky, here, and it's unnecesssary, too." instead;
	say "You try out the gravity on this side of the cube. Whee!" instead;

chapter walkthroughing

walkthroughing is an action out of world.

understand the command "walkthrough" as something new.
understand the command "walkthru" as something new.

understand "walkthrough" as walkthroughing.
understand "walkthru" as walkthroughing.

carry out walkthroughing:
	say "How to get through the game depends on some random initial configurations, so I can't overtly give one. A walkthrough should be in the package with the game.";
	the rule succeeds;

chapter thinking

definition: a cornerthing (called c) is activated:
	if cornercolor of c is black, no;
	yes;

think2ing is an action out of world.

understand the command "think" as something new.
understand the command "help" as something new.
understand the command "hint" as something new.
understand "think" and "help" and "hint" as think2ing.

carry out think2ing:
	let explore-total be 0;
	let got-yet be false;
	if number of ever-acc elements is 0:
		say "You may wish to tinker with SUMMON on your mood ring." instead;
	else:
		say "Here is a list of [if all-4-acc is true]all the elements[else]the elements you've summoned,[end if] and their colors: ";
		now got-yet is false;
		repeat with Q running through elements:
			if got-yet is true, say ", ";
			now got-yet is true;
			say "[Q]=[conc-color of Q]";
		say "[if all-4-acc is true]. You can also type them, or their colors, as commands without SUMMON.[paragraph break]";
	if western face is explored or eastern face is explored, increment explore-total;
	if northern face is explored or southern face is explored, increment explore-total;
	if upper face is explored or bottom face is explored, increment explore-total;
	if explore-total < 3, say "You have a feeling you'll need to explore the other faces of the cube to figure what's going on, here." instead;
	if number of visited corner rooms is 0, say "You haven't visited the corner of any face." instead;
	let ACO be number of activated cornerthings;
	if ACO < 4, say "Maybe you should activate [if ACO is 0]one[else]more[end if] of the transponders in the corners of the faces." instead;
	if number of ever-aligned regions is 0, say "Maybe you should figure a way into the center of the cube." instead;
	if number of aligned regions is 0, say "Maybe you could re-open a tunnel you closed." instead;
	if very center is not visited, say "Maybe it's time to go inside one of the tunnels you made." instead;
	if rope-drop is false, say "Maybe it's time to figure when and where to DROP your rope." instead;
	say "You dropped the rope in [init-drop-room].[paragraph break]";
	let ERC be number of entries in rope-colors;
	if ERC < 6, say "Maybe you should figure a way to thread the rope through the cube[if ERC > 0]some more[end if]." instead;
	if tunnel-looped is false, say "Maybe you looped the rope wrong and you can/should RESET and try again." instead;
	say "It looks like the only thing left to do is to tie the rope to itself." instead;
	the rule succeeds;

chapter xyzzying

xyzzying is an action out of world.

understand the command "xyzzy" as something new.

understand "xyzzy" as xyzzying.

carry out xyzzying:
	say "You hone in on your three-dimensional reasoning, visualization and general calculations. You even solve a trivial set of three equations with three unknowns. The result is a slight headache. But it's a MOTIVATING headache!";
	the rule succeeds;

chapter reseting

reseting is an action out of world.

understand the command "reset" as something new.

understand "reset" as reseting.

carry out reseting:
	if rope-drop is false, say "You can't reset before dropping the rope." instead;
	if tunnel-looped is true, say "No, you're so close to the end!" instead;
	say "Resetting to just before you dropped the rope...";
	now rope-drop is false;
	now rope-colors is {};
	move player to init-drop-room;
	now init-drop-room is u00; [this is the initial value for each, since u00 is the first room ever. This is hacky code, but otherwise the game displays something that's not there]
	now last-top-room is u00;
	now all rooms are not roped;
	the rule succeeds;

chapter clearing

clearing is an action out of world.

understand the command "clear" as something new.
understand the command "clean" as something new.

understand "clear" as clearing.
understand "clean" as clearing.

carry out clearing:
	if rope-drop is true, say "You don't need to clear the transponders with the rope down. Doing so would muck up the tunnels." instead;
	if number of nonblack cornerthings is 0, say "There are no transponders to reset." instead;
	if number of aligned regions is 6:
		say "Fourth wall note: this is probably a bad idea. Do so anyway?";
		unless the player consents:
			say "Ok.";
			continue the action;
	if number of visible cornerthings is 1:
		let RVC be random visible cornerthing;
		if cornercolor of RVC is not black, say "The transponder nearby winks out to black.[paragraph break]";
	let colored-stuff be 0;
	repeat with J running through cornerthings:
		if cornercolor of J is not black, increment colored-stuff;
	if colored-stuff is 0, say "There's nothing to clear." instead;
	say "(NOTE: [if colored-stuff > 1][colored-stuff in words] beacons[else]beacon[end if] cleared back to black.)[paragraph break]";
	black-beacons;
	if player is in very center:
		say "(Moving you back to where you started, because being trapped in the center would be uncool)[paragraph break]";
		move player to u11;
		if ring-color is not black:
			now ring-color is black;
			say "Your ring resets to black.";
	else if tunnel is visible:
		say "The open tunnel nearby closes.";
	tun-beac-reset;
	the rule succeeds;

to black-beacons:
	repeat with Q running through cornerthings:
		now cornercolor of Q is black;

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
	say "You ponder the philosophical implications of the Law of Averages as more voluminous ether rushes by.";

Rule for printing a parser error when the latest parser error is the noun did not make sense in that context error:
	if the player's command includes "summon":
		say "It looks like you tried to summon something. The only things to summon are [list of elements], though you can also refer to them by their colors." instead;
	say "You tried to access something not currently in the world. Maybe that's a result of a typo, or it's minor scenery I forgot to implement and should've, or a bad synonym. But it's not critical to the game.";

Rule for printing a parser error when the latest parser error is the only understood as far as error:
	say "The first word was okay, and you don't need any extra ones."

rule for printing a parser error when the latest parser error is the can't see any such thing error:
	say "There's nothing visible here like that."

rule for printing a parser error when the latest parser error is the didn't understand error:
	say "I didn't recognize that verb. For a list of common/useful verbs, type V or VERB or VERBS.";

rule for printing a parser error when the latest parser error is the not a verb I recognise error:
	say "I didn't recognize that verb. For a list of common/useful verbs, type V or VERB or VERBS.";

volume path tracking segment

path-violated is a truth state that varies.

path-achieved is a truth state that varies.

path-violated-note is a truth state that varies.

path-in-verbs is a truth state that varies.

path-tracking is a truth state that varies.

chapter pathing

pathing is an action out of world.

understand the command "path" as something new.

understand "path" as pathing.

carry out pathing:
	now path-in-verbs is true;
	now path-tracking is whether or not path-tracking is false;
	say "Path tracking is now [on-off of path-tracking].";
	if path-violated is true and path-violated-note is false:
		say "[line break]NOTE: You've already looped around to a location twice, so toggling path notification won't do anything any more.";
	else if path-achieved is true:
		say "[line break]NOTE: you already ran the path through without revisiting a square, so this option is not very useful.";
	the rule succeeds;

volume stock room descriptions

the description of a room is usually "[room-desc].".

to say descedge of (x - a room):
	let Q be descdir of X;
	say "[if Q is up]upper[else if Q is down]lower[else][Q][end if]"

the printed name of a room is usually "[mrtc], [if the item described is facecenter]center[else if the item described is edge][descedge of item described] edge[else][descdir of item described] corner[end if]".

to say mrtc:
	let Q be "[map region of the item described]";
	say "[Q in title case]"

a room has a direction called descdir. descdir is usually inside.

to say rope-here:
	say ". [if number of entries in rope-colors is 0]You've staked your wire rope here[else]Here's where you originally staked the wire rope. You can TIE it to itself to secure the cube[end if]"

to say room-desc:
	if location of player is corner:
		let rvc be random visible cornerthing;
		say "You are at the [descdir] corner of the [mrlp]. You can go [list of goable directions] along this face, or you can go off this face: [cornerwarp].[paragraph break]There's a transponder here[if cornercolor of rvc is not black], lit [cornercolor of rvc][else], and it's dark[end if]. Your mood ring is slightly attracted to it";
	else if location of player is facecenter:
		say "You are at the center of the [mrlp]. You can go pretty much any direction: [list of goable directions]. [if raycolor of mrlp is beaccolor of mrlp]A tunnel leads inside ([indir of mrlp]) to the center of the cube[else][paragraph break]There's a beacon here, colored [beaccolor of mrlp][end if][if init-drop-room is location of player][rope-here]";
	else if location of player is edge:
		say "You are at the center of the [descdir] edge of the [mrlp][if location of player is roped]. You've previously strung your wire rope through here[end if]. You can go [list of goable directions] along this face, or [list of warpable directions] [if number of warpable directions is 1]to a new face[else]each to a different face[end if]"

to say cornerwarp:
	let rooms-found be 0;
	repeat with Q running through simple directions:
		let Z be room Q of location of player;
		if Z is not nowhere and map region of Z is not mrlp:
			if rooms-found > 0, say " or ";
			say "[Q] to the [map region of Z]";
			increment rooms-found;

volume silly mistakes

understand "ud" and "du" and "ns" and "sn" and "ew" and "we" as a mistake ("Those are opposite directions, so you can't go diagonally that way.")

volume tables

table of colormatches [trivial color combinations]
c1	c2	c3
red	yellow	orange
red	blue	purple
yellow	blue	green

table of ropetracing [this says how the rope links between adjacent center squares]
l1	l2	l3	l4
u11	e11	u21	e12
u11	w11	u01	w12
u11	n11	u12	n12
u11	s11	u10	s12
e11	s11	e01	s21
s11	w11	s01	w01
w11	n11	w21	n01
n11	e11	n21	e21
d11	e11	d21	e10
d11	w11	d01	w10
d11	n11	d12	n10
d11	s11	d10	s10

table of dirmerge [this merges two simple directions, as you'd expect, but there's no Inform operation]
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

table of beacon zaps [we could use a bordering relationship to say which beacons cancel each other out, but I also wanted to clue directions of the adjacent beacon pairs]
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
southdowneast	southdownwest	west

table of region beacons [which beacons can be seen in which region? Perhaps we don't need a table, but it's easier this way]
myreg	b1	b2	b3	b4
upper face	northupwest	southupeast	northupeast	southupwest
bottom face	northdownwest	southdowneast	northdowneast	southdownwest
western face	northdownwest	southupwest	northupwest	southdownwest
eastern face	northdowneast	southupeast	northupeast	southdowneast
southern face	southdownwest	southupeast	southupwest	southdowneast
northern face	northdownwest	northupeast	northupwest	northdowneast

table of goofy observations [to give in game observations and explanations at the end]
init-obs	end-obs
"You find a single dried cherry on the ground. You pick it up and eat it. It's delicious, no pits even, and it's proof this cube or what's in it must support very interesting life indeed."	"The dried cherry means cherry picking, or ignoring data that doesn't help you."
"You find two small pointy solids on the ground. Each has five faces: a square base, with equilateral triangles off two opposite edges and a trapezoid off the other two. You futz with them until you make a pyramid, then pitch them. They sink into the cube's surface. You feel infinitesimally smarter."	"The two piece pyramid puzzle is a sort of intelligence test."
"Looking [indir of mrlp], you see a circle with a chunk out of it, zooming around a maze of much smaller dots it gobbles up. What odd benighted ritual could this signify?"	"The circle with the chunk that gobbles dots is Pac-Man."
"Away from the cube, you watch tetrominoes in, err, freefall on the side of the cavern. They lock into place when they hit a pile of already fallen shapes, and when a whole line is made, one vanishes. You stare until the pile reaches the top. When you turn away and look back, it's gone, but you still try to develop mental strategies for dealing with the mirror-image l-shaped and zigzag pieces, and you're sure YOU could have kept going a bit longer, if just given the chance. Distracting!"	"The falling blocks are Tetris."
"You notice a pack of cards on the ground. It shuffles itself into eight rows then begins sorting cards so that they are chained in order and by opposite color--9, 8, 7, 6 (the number of dots makes the values clear). Smaller cards begin to vanish. Just as you think you've figured all the rules, the 'game' is over. For no reason, the number 11982 flares into your mind and sticks there and makes you feel helpless and silly and stupid for a moment."	"The card game is FreeCell, and 11982 is the only unsolvable game in Windows's predetermined random set."
"Your head swims as the [mrlp] seems to divide up into nine squares of six colors total. The [mrlp] rapidly swings [random rubiks direction] a quarter-turn. Then it starts swinging other directions until the [mrlp] is all one color and, apparently, so are the other faces. How would someone know how to fix this so quickly? What could be the benefit? You blink, and the cube is as desolate and metallic as before."	"The upheaval in the cube is a Rubik's Cube."
"The cube suddenly feels very cold, and you think you hear rhyming spoken lyrics. They're profane and sometimes over the line, but overall they're catchy and make some very good points. You feel as if it's OK to be mad with your problems every once in a while, or even to mellow out later in life but still care about social issues."	"This is a reference to rapper/actor Ice Cube."
"Four cubes are drawn here: a very small one and three others: nine, ten and twelve times its size, respectively. Hmm. You do some quick calculations and realize the significance. Then you wonder if any cube is the sum of two other cubes, before remembering that sort of impractical stuff distracts people from more socially relevant astrology."	"There is a story about Hardy claiming 1729 was an uninteresting number and Ramanujan saying no, it's the lowest sum of 2 cubes 2 different ways. Also, x^3+y^3=z^3 is Fermat's Theorem for n=3."
"You notice a perfectly trisected angle drawn into the cube. You absentmindedly rub it out. It doesn't seem like that big of a deal."	"It's been proven impossible to trisect an arbitrary angle."
"Out of nowhere, you wonder when mathematicians will ever figure out the quintic formula. It probably just requires a cool trick, like the cubic formula did, and nobody's been clever enough, yet. Still, it's lower priority than good honest practical astrology."	"Galois proved there was no quintic formula."
"You feel glad you're not on a tetrahedron or octahedron. Those would be too pointy at the corners! And you might slip around a dodecahedron or icosahedron too much."	"There are five regular solids (similar faces, same number of faces joined at each vertex). A cube is the most recognizable."
"You refresh yourself on the implications of the important philosophical argument about how the sum of reciprocals of whole numbers converges, but it takes so long, it only sort of counts."	"The harmonic series (1+1/2+1/3+...+1/x) is approximately the natural logarithm of x + Euler's constant."
"You ponder magnets. Magnets are weird. But their existence is proof it's OK for opposites to attract. Perhaps they are formed by some mirror image lattices of the four elements. You remember some foolish suggestion in advanced science that understanding magnets would open up a whole new bucket of worms."	"Magnets have nothing to do with elements, though the idea of spin is roughly related to symmetry or handedness."
"You feel sorrow you won't live to see science create the most perfect song. I mean, there's a formula for note frequency, so a formula for good songs must be out there, just way too complicated for now. Of course, you can't do the same for books, since words have context."	"While there's a lot of mathematics that goes into songs, and there are a lot of mathematical principles in how much of an effect to use, aesthetics are still out of reach."
"You wonder if the cube holds the secrets to a perpetual motion machine. Some negative nancies say it's not possible, but that's not the sort of gung-ho can-do philosophy that built the punch card machines!"

table of gotos [this maps an abbreviation to a room. The room's shorthand is face + direction from center]
s1 (text)	s2 (text)	jumpy
"unw"	"uwn"	u02
"un"	--	u12
"une"	"uen"	u22
"uw"	--	u01
"u"	"uc"	u11
"ue"	--	u21
"usw"	"uws"	u00
"us"	--	u10
"use"	"ues"	u20 [end u]
"dnw"	"dwn"	d02
"dn"	--	d12
"dne"	"den"	d22
"dw"	--	d01
"d"	"dc"	d11
"de"	--	d21
"dsw"	"dws"	d00
"ds"	--	d10
"dse"	"des"	d20 [end d]
"nuw"	"nwu"	n02
"nu"	--	n12
"nue"	"neu"	n22
"nw"	--	n01
"n"	"nc"	n11
"ne"	--	n21
"ndw"	"nwd"	n00
"nd"	--	n10
"nde"	"ned"	n20 [end n]
"suw"	"swu"	s02
"su"	--	s12
"sue"	"seu"	s22
"sw"	--	s01
"s"	"sc"	s11
"se"	--	s21
"sdw"	"swd"	s00
"sd"	--	s10
"sde"	"sed"	s20 [end s]
"end"	"edn"	e20
"en"	--	e21
"enu"	"eun"	e22
"ed"	--	e10
"e"	"ec"	e11
"eu"	--	e12
"esd"	"eds"	e00
"es"	--	e01
"esu"	"eus"	e02 [end e]
"wnd"	"wdn"	w20
"wn"	--	w21
"wnu"	"wun"	w22
"wd"	--	w10
"w"	"wc"	w11
"wu"	--	w12
"wsd"	"wds"	w00
"ws"	--	w01
"wsu"	"wus"	w02 [end w]

volume endgame stuff

book endgame tweaks

Table of Final Question Options (continued)
final question wording	only if victorious	topic	final response rule	final response activity
"see (EXP)LANATIONS for your random thoughts"	true	"exp/explanations"	exp-all rule	--

this is the exp-all rule:
	let count be 0;
	repeat through table of goofy observations:
		say "([count * 3]) '[init-obs entry]': [bold type][end-obs entry][roman type][paragraph break]";
		increment count;
		if count > thoughtfulness / 3:
			say "NOTE: this is as far as you got with the wandering observations. You get a new one for every three non-center squares you explore. See more anyway?";
			unless the player consents:
				say "OK. You can type EXP again if you change your mind.";
				the rule succeeds;
			now count is 0;
		if the remainder after dividing count by 4 is 0 and count is not 12, wfak-d;
	the rule succeeds;

volume beta testing - not for release

when play begins:
	say "Thanks for running the Beta version! Use [b]BCSOL[r] to see how to solve the beacon part of the game, or [b]HALP[r] to see how to solve the tunnel part. There are 48 randomly generated possible solutions for the beacons, and you can solve the tunnels 12 different ways.";
	if debug-state is false:
		say "[paragraph break]Note: I like to make sure beta testers have a transcript working. It's a big help to me. Even if you are lost and you feel your wandering might not help, it often does--I may realize a way to make the game a LOT more user friendly and less opaque.[paragraph break]So, after you press a key, you'll be asked to save your transcript to a file.";
		wfak-d;
		try switching the story transcript on;
		say "Transcripts can be sent to blurglecruncheon@gmail.com. Any punctuation before the comment is okay, e.g. *TYPO or ;typo or :typo. I can pick up pretty much any punctuation.";
	say "[line break]NOTE: I have a way to get rid of this text before release, and I'll check to make sure the testing commands aren't available to the player, so don't worry about that. Also, for my own debugging reference (in case you get stuck), the non-spoiler configuration number is [code-num of false].";

chapter picking

picking is an action applying to one number.

understand the command "pick" as something new.

understand "pick [number]" as picking.

carry out picking:
	say "Picking number [the number understood]...";
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
	say "Successful.";
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
	repeat with x running through alignable regions:
		say "[x]: ray color is [raycolor of x], beacon color is [beaccolor of x].";
	say "code: [code-num of true].";
	the rule succeeds;

chapter halping

halping is an action applying to nothing.

understand the command "halp" as something new.

understand "halp" as halping.

carry out halping:
	if fixed-beacons is false:
		say "You need to fix the beacons first (SUMMON element/color, TOUCH transponder). Here's how to.";
		try bcsoling instead;
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

include Cube Game Testing by Andrew Schultz.

[more standard inform stuff below]

test patrol with "nw/e/e/s/s/w/w/n/n/
gonear d11/nw/e/e/s/s/w/w/n/n/
gonear e11/u/s/d/d/n/n/u/u/s/
gonear w11/u/s/d/d/n/n/u/u/s/
gonear s11/u/e/d/d/w/w/u/u/e/
gonear n11/u/e/d/d/w/w/u/u/e/"

test goto with "gt unw/gt uwn/gt un/gt une/gt uen/gt uw/gt u/gt uc/gt ue/gt usw/gt uws/gt us/gt use/gt ues/
gt dnw/gt dwn/gt dn/gt dne/gt den/gt dw/gt d/gt dc/gt de/gt dsw/gt dws/gt ds/gt dse/gt des/
gt suw/gt swu/gt su/gt seu/gt sue/gt sw/gt s/gt sc/gt se/gt swd/gt sdw/gt sd/gt sed/gt sde/
gt nuw/gt nwu/gt nu/gt neu/gt nue/gt nw/gt n/gt nc/gt ne/gt nwd/gt ndw/gt nd/gt ned/gt nde/
gt wun/gt wnu/gt wu/gt wus/gt wsu/gt wn/gt w/gt wc/gt ws/gt wdn/gt wnd/gt wd/gt wsd/gt wds/
gt eun/gt enu/gt eu/gt eus/gt esu/gt en/gt e/gt ec/gt es/gt edn/gt end/gt ed/gt esd/gt eds
"

test pathy with "path/s/w/n/n/e/e/s/s/e/n/n/d/s/s/d/n/n/n/w/w/u/e/e/u/w/w/w/s/s/d/n/n/d/s/s/d/n/n/e/e/s/w/s/e/s/u/u/w/d/d/w/u/u"

test ns-edge-clash with "nw/red/touch/e/e/yellow/touch/clear/red/touch/w/w/yellow/touch/clear/s/s/red/touch/e/e/yellow/touch/clear/red/touch/w/w/yellow/touch/clear".

test ud-edge-clash with "un/red/touch/s/s/yellow/touch/clear/red/touch/n/n/yellow/touch/clear/d/d/red/touch/s/s/yellow/touch/clear/red/touch/n/n/yellow/touch/clear".

test ew-edge-clash with "uw/red/touch/d/d/yellow/touch/clear/red/touch/u/u/yellow/touch/clear/e/e/red/touch/d/d/yellow/touch/clear/red/touch/u/u/yellow/touch"

test w-ud-edge-clash with "gonear w11/test ud-edge-clash".
test e-ud-edge-clash with "gonear e11/test ud-edge-clash".

test u-ns-edge-clash with "gonear u11/test ns-edge-clash".
test d-ns-edge-clash with "gonear d11/test ns-edge-clash".

test n-ew-edge-clash with "gonear n11/test ew-edge-clash".
test s-ew-edge-clash with "gonear s11/test ew-edge-clash".

test touch-2 with "nw/red/touch/se/se/yellow/touch/n/n/white/touch".
test touch-3 with "nw/red/touch/se/se/yellow/touch/n/n/e/d/d/white/touch/u/u/u/blue/touch".

chapter temporary tests

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

chapter rcing

rcing is an action out of world.

understand the command "rc" as something new.

understand "rc" as rcing.

carry out rcing:
	say "[rope-colors].";
	the rule succeeds;

chapter fcing

fcing is an action applying to one visible thing.

understand the command "fc" as something new.

understand "fc [direction]" as fcing.
understand "fc [thing]" as fcing.

carry out fcing:
	if noun is not a direction, say "FC only applies to directions." instead;
	if noun is not simple, say "Only simple directions work with FC." instead;;
	move player to the room noun of very center;
	the rule succeeds.
