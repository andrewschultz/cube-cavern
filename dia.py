# d02 DW of n10. n10 NE of d02. UE of n10 is nothing. SW of d02 is nothing

import re

done = {}

diags = {}

opp_base = {
  "west": "east",
  "east": "west",
  "north": "south",
  "south": "north",
  "up": "down",
  "down": "up"
}

opp_dir = {}

dir_priority = ['up', 'down', 'north', 'south', 'east', 'west' ]

for i in range(0,len(dir_priority)):
	start = i + 1 + ((i + 1) % 2)
	for j in range(start, len(dir_priority)):
		dfr = dir_priority[i] + dir_priority[j]
		dto = dir_priority[i ^ 1] + dir_priority[j ^ 1]
		print(dfr,'<=>',dto)
		opp_dir[dto] = dfr
		opp_dir[dfr] = dto

with open("dia.txt") as file:
	for line in file:
		if not re.search("is.*of", line):
			continue
		line = re.sub("\.", "", line.strip())
		ary = line.split(' ')
		rev = ary[0] + '-' + ary[4]
		fwd = ary[4] + '-' + ary[0]
		if rev in diags.keys():
			# print(ary[2], opp_dir[ary[2]], diags[rev])
			if opp_dir[ary[2]] == diags[rev]:
				if rev not in done.keys():
					print(ary[0],'is',diags[rev],'of',ary[4] + '.')
					done[rev] = 1
			else:
				if rev not in done.keys():
					print(ary[0],'is',ary[2],'of',ary[4] + '.', opp_dir[ary[2]],'of',ary[4],'is nowhere.',ary[4],'is',diags[rev],'of',ary[0] + '.',opp_dir[diags[rev]],'of',ary[0],'is nowhere.')
					# print(rev,diags[rev],'/',fwd,ary[2],'matches')
					done[rev] = 1
		else:
			# print(fwd,'assigned to',ary[2])
			diags[fwd] = ary[2]
