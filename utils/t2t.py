import re

chg = {}

with open("t2t.txt") as file:
	for line in file:
		if re.search("\t", line):
			x = line.strip().split("\t")
			chg[x[0]] = x[1]

fout = open("c:\\games\\inform\\triz\\mine\\rube-cube-2.trizbort", "w")

with open("c:\\games\\inform\\triz\\mine\\rube-cube.trizbort") as file:
	for line in file:
		line2 = re.sub(r"name=\"([udnews][0-2]{2})", (lambda x: "name=\"" + chg[x.group(1)]), line, re.IGNORECASE)
		fout.write(line2)

fout.close()