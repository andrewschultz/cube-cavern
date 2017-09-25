import itertools

first_only = False

go_near = False

count = 0

oppo = { 'u':'d', 'd':'u', 'n':'s', 's':'n', 'e':'w', 'w':'e' }

def display():
    for a in q:
        print(a)

def display_combo():
    for a in colors:
        for b in colors:
            print(a, "+", b, "=", x(a,b))

def x(a, b):
    if a == 'white' or a == 'black':
        return b
    if b == 'white' or b == 'black':
        return a
    if a == b:
        return a
    if a is 'blue' and b is 'yellow':
        return 'green'
    if a is 'yellow' and b is 'blue':
        return 'green'
    if a is 'blue' and b is 'red':
        return 'purple'
    if a is 'red' and b is 'blue':
        return 'purple'
    if a is 'yellow' and b is 'red':
        return 'orange'
    if a is 'red' and b is 'yellow':
        return 'orange'
    return 'NaC'

def center_face_switch(x, y, z, w):
    if y == z:
        return
    if w is True:
        x.append("gonear " + y + "11")
        return
    neutdir = 'n'
    if y is 'n' or z is 'n':
        neutdir = 'u'
    if oppo[y] == z:
        x.append(neutdir)
        x.append(neutdir)
        x.append(z)
        x.append(z)
        x.append(z)
        x.append(oppo[neutdir])
        return
    x.append(z)
    x.append(z)
    x.append(oppo[y])

def printCmds(tf, j, rb_ord):
    codenum = 0
    for r in range(0, 4):
        codenum = codenum * 10
        codenum = codenum + j[r]
    if tf:
        codenum = codenum + 10000
    cmds = []
    cmds.append('pick ' + str(codenum))
    cmds.append('nw' if tf else 'ne')
    cmds.append('summon ' + colors[j[0]])
    cmds.append('touch')
    cmds.append('se' if tf else 'sw')
    cmds.append('se' if tf else 'sw')
    cmds.append('summon ' + colors[j[1]])
    cmds.append('touch')
    if go_near:
        cmds.append('gonear d11')
    else:
        cmds.append('nw' if tf else 'ne')
        cmds.append('n')
        cmds.append('n')
        cmds.append('d')
        cmds.append('d')
        cmds.append('d')
        cmds.append('s')
    cmds.append('ne' if tf else 'nw')
    cmds.append('summon ' + colors[j[2]])
    cmds.append('touch')
    cmds.append('sw' if tf else 'se')
    cmds.append('sw' if tf else 'se')
    cmds.append('summon ' + colors[j[3]])
    cmds.append('touch')
    if not go_near:
        cmds.append('ne' if tf else 'nw')
    loccol = {}
    locrev = {}
    loccol['u'] = x(colors[j[0]], colors[j[1]])
    loccol['d'] = x(colors[j[2]], colors[j[3]])
    loccol['n'] = x(colors[j[0]], colors[j[2]])
    loccol['s'] = x(colors[j[1]], colors[j[3]])
    loccol['w'] = x(colors[j[0]], colors[j[3]])
    # print(j[1], j[2], colors[j[1]], colors[j[2]])
    loccol['e'] = x(colors[j[1]], colors[j[2]])
    if not tf:
        (loccol['w'], loccol['e']) = (loccol['e'], loccol['w'])
    for k in loccol.keys():
        locrev[loccol[k]] = k
    to_center = True
    drop_yet = False
    curface = 'd'
    color_order = ['red', 'orange', 'yellow', 'green', 'blue', 'purple']
    col_rot = - (rb_ord % len(color_order))
    color_order = color_order[col_rot:] + color_order[:col_rot]
    if rb_ord >= len(color_order):
        color_order = color_order[::-1]
    for me in color_order:
        # print(me, 'to', locrev[me], 'face')
        if to_center:
            center_face_switch(cmds, curface, locrev[me], go_near)
            if not drop_yet:
                cmds.append("drop rope")
                drop_yet = True
            cmds.append(oppo[locrev[me]])
        else:
            cmds.append(locrev[me])
        to_center = not to_center
        curface = locrev[me]
    center_face_switch(cmds, curface, locrev[color_order[0]], go_near)
    cmds.append("tie rope")
    cmd_string = "test c" + str(count) + ('' if go_near else 'a') + " with \"" + ("/".join(cmds)) + "\".";
    print(cmd_string)
    # exit()

q = itertools.permutations([1,2,3,4])

colors = ['black', 'white', 'red', 'yellow', 'blue']

for j in q:
    print()
    # print("Test for", j)
    count = count + 1
    printCmds(True, j, 0)
    count = count + 1
    printCmds(False, j, 0)
    if first_only:
        exit()