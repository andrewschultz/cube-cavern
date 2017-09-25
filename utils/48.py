import itertools

first_only = False

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

def printCmds(tf, j):
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
    cmds.append('gonear d11')
    cmds.append('ne' if tf else 'nw')
    cmds.append('summon ' + colors[j[2]])
    cmds.append('touch')
    cmds.append('sw' if tf else 'se')
    cmds.append('sw' if tf else 'se')
    cmds.append('summon ' + colors[j[3]])
    cmds.append('touch')
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
    for me in ['red', 'orange', 'yellow', 'green', 'blue', 'purple']:
        # print(me, 'to', locrev[me], 'face')
        if to_center:
            cmds.append("gonear " + locrev[me] + "11")
            if not drop_yet:
                cmds.append("drop rope")
                drop_yet = True
            cmds.append(oppo[locrev[me]])
        else:
            cmds.append(locrev[me])
        to_center = not to_center
    cmds.append("gonear " + locrev['red'] + "11")
    cmds.append("tie rope")
    cmd_string = "test c" + str(count) + " with \"" + ("/".join(cmds)) + "\".";
    print(cmd_string)
    # exit()

q = itertools.permutations([1,2,3,4])

colors = ['black', 'white', 'red', 'yellow', 'blue']

for j in q:
    print()
    # print("Test for", j)
    count = count + 1
    printCmds(True, j)
    count = count + 1
    printCmds(False, j)
    if first_only:
        exit()