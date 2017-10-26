import re

face_of = {"w": "Western",
"e": "Eastern",
"n": "Northern",
"s": "Southern",
"d": "Lower",
"u": "Upper"
}

dir_of = {"w": "west",
"e": "east",
"n": "north",
"s": "south",
"d": "down",
"u": "up"
}

prio = { "w": 1, "e": 1, "n": 2, "s": 2, "u": 3, "d": 3 }

def cmd_print(x):
	if x == '--':
		return
	y = re.sub("\"", "", x)
	y = re.sub("c$", "", y)
	print("> gt", y)
	if len(y) == 1:
		print(face_of[y[0]], "face, center")
	if len(y) == 2:
		print(face_of[y[0]], "face,", dir_of[y[1]], "edge")
	if len(y) == 3:
		print(face_of[y[0]], "face,", dir_of[y[1]] + dir_of[y[2]] if prio[y[1]] > prio[y[2]] else dir_of[y[2]] + dir_of[y[1]], "corner")
	return

get_gotos = False

print("# reg-cc-goto-tests.txt")

with open("story.ni") as file:
	for line in file:
		if line.startswith("s1 (text)"):
			get_gotos = True
			continue
		if not re.search("[a-zA-Z]", line):
			get_gotos = False
		if not get_gotos:
			continue
		a = line.strip().lower().split("\t")
		cmd_print(a[0])
		cmd_print(a[1])
