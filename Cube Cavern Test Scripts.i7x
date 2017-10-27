Version 1/170825 of Cube Cavern Test Scripts by Andrew Schultz begins here.

volume test scripts

chapter non-wins

test 2of2 with "pick 11234/ne/white/touch/sw/sw/red/touch/w/nd/nd/yellow/touch/n/ue/drop rope/s/u/n/n/d/tie rope to rope".
test 2of3 with "pick 11234/nw/white/touch/se/se/red/touch/e/nd/nd/yellow/touch/us/drop rope/w/n/e/e/s/tie rope to rope".
test 4of4 with "pick 11234/sw/blue/touch/ne/ne/yellow/touch/e/ds/ds/d/red/touch/nw/nw/white/touch/n/eu/drop rope/s/w/s/s/e/n/e/n/n/w/tie rope".

chapter walkthrough

test fix with "fixsol/n/w/summon earth/touch/e/e/s/s/summon fire/touch/e/d/d/n/n/summon water/touch/d/s/s/w/w/summon air/touch/bcsol".
test fix3 with "fixsol/n/w/summon earth/touch/e/e/s/s/summon fire/touch/e/d/d/n/n/summon water/touch/nw/in/l/x tunnels".

test cross with "test fix/ne/drop rope/w/w/u/u/u".
test cross2 with "test fix/ne/drop rope/w/w/d".

[WE = red green NS = purple yellow UD = orange blue]
test fbluef with "test fix/ne/drop rope/u/n/w/w/s/e/u/s/s/d/n/e/d/d/w".
test fblueb with "test fix/ne/drop rope/u/e/s/s/w/n/u/w/w/d/e/n/d/d/s".

test forangef with "test fix/ne/u/u/drop rope/d/s/e/e/n/w/d/n/n/u/s/w/u/u/e".
test forangeb with "test fix/ne/u/u/drop rope/d/w/n/n/e/s/d/e/e/u/w/s/u/u/n".

test fredf with "test fix/nw/u/drop rope/e/u/s/s/d/n/e/d/d/w/u/n/w/w/s".
test fredb with "test fix/nw/u/drop rope/e/n/d/d/s/u/e/s/s/w/n/u/w/w/d".

test fred1r with "test fix/nw/u/drop rope/e/reset".
test fred2r with "test fix/nw/u/drop rope/e/u/reset".

test fred3 with "test fix/nw/u/drop rope/e/u/s/s/d/n/reset".
test fred4 with "test fix/nw/u/drop rope/e/u/s/s/d/n/e/reset".

test fred5 with "test fix/nw/u/drop rope/e/u/s/s/d/n/e/d/d/w/u/reset".
test fred6 with "test fix/nw/u/drop rope/e/u/s/s/d/n/e/d/d/w/u/n/reset".

test fredlazy with "test fix/nw/u/drop rope/e/u/w/w/d/tie rope".
test fredwrong with "test fix/nw/u/drop rope/e/e/u/u/w/d/d/n/n/u/s/s/w/w/n/tie rope".

test fgreenf with "test fix/ne/u/e/drop rope/w/d/n/n/u/s/w/u/u/e/d/s/e/e/n".
test fgreenb with "test fix/ne/u/e/drop rope/w/s/u/u/n/d/w/n/n/e/s/d/e/e/u".

test fyelf with "test fix/se/u/drop rope/n/e/d/d/w/u/n/w/w/s/e/u/s/s/d".
test fyelb with "test fix/se/u/drop rope/n/u/w/w/d/e/n/d/d/s/u/e/s/s/w".

test fpurpf with "test fix/ne/u/n/drop rope/s/w/u/u/e/d/s/e/e/n/w/d/n/n/u".
test fpurpb with "test fix/ne/u/n/drop rope/s/d/e/e/u/w/s/u/u/n/d/w/n/n/e".

test tun with "fixsol/n/w/summon earth/touch/e/e/s/s/summon fire/touch/nw/d"

chapter map testing

test nloop with "n/n/d/d/d/s/s/s/u/u/u/n".
test sloop with "s/s/d/d/d/n/n/n/u/u/u/s".

test wloop with "w/w/d/d/d/e/e/e/u/u/u/w".
test eloop with "e/e/d/d/d/w/w/w/u/u/u/e".

test w2loop with "w/w/n/n/n/e/e/e/s/s/s/w".
test e2loop with "e/e/n/n/n/w/w/w/s/s/s/e".

test all-loop with "test nloop/test sloop/w/test nloop/test sloop/e/e/test nloop/test sloop/w/test wloop/test eloop/n/test wloop/test eloop/s/s/test wloop/test eloop/s/test w2loop/test e2loop/s/test w2loop/test e2loop/s/test w2loop/test e2loop"

chapter all 48

test c1 with "pick 11234/nw/summon white/touch/se/se/summon red/touch/gonear d11/ne/summon yellow/touch/sw/sw/summon blue/touch/gonear u11/drop rope/d/e/gonear n11/s/d/gonear w11/e/s/gonear u11/tie rope".
test c2 with "pick 1234/ne/summon white/touch/sw/sw/summon red/touch/gonear d11/nw/summon yellow/touch/se/se/summon blue/touch/gonear u11/drop rope/d/w/gonear n11/s/d/gonear e11/w/s/gonear u11/tie rope".

[test c3 with "pick 11243/nw/summon white/touch/se/se/summon red/touch/gonear d11/ne/summon blue/touch/sw/sw/summon yellow/touch/gonear u11/drop rope/d/s/gonear w11/e/d/gonear n11/s/e/gonear u11/tie rope".
test c4 with "pick 1243/ne/summon white/touch/sw/sw/summon red/touch/gonear d11/nw/summon blue/touch/se/se/summon yellow/touch/gonear u11/drop rope/d/s/gonear e11/w/d/gonear n11/s/w/gonear u11/tie rope".

test c5 with "pick 11324/nw/summon white/touch/se/se/summon yellow/touch/gonear d11/ne/summon red/touch/sw/sw/summon blue/touch/gonear n11/drop rope/s/e/gonear u11/d/s/gonear w11/e/d/gonear n11/tie rope".
test c6 with "pick 1324/ne/summon white/touch/sw/sw/summon yellow/touch/gonear d11/nw/summon red/touch/se/se/summon blue/touch/gonear n11/drop rope/s/w/gonear u11/d/s/gonear e11/w/d/gonear n11/tie rope".

test c7 with "pick 11342/nw/summon white/touch/se/se/summon yellow/touch/gonear d11/ne/summon blue/touch/sw/sw/summon red/touch/gonear w11/drop rope/e/s/gonear u11/d/e/gonear n11/s/d/gonear w11/tie rope".
test c8 with "pick 1342/ne/summon white/touch/sw/sw/summon yellow/touch/gonear d11/nw/summon blue/touch/se/se/summon red/touch/gonear e11/drop rope/w/s/gonear u11/d/w/gonear n11/s/d/gonear e11/tie rope".

test c9 with "pick 11423/nw/summon white/touch/se/se/summon blue/touch/gonear d11/ne/summon red/touch/sw/sw/summon yellow/touch/gonear n11/drop rope/s/d/gonear w11/e/s/gonear u11/d/e/gonear n11/tie rope".
test c10 with "pick 1423/ne/summon white/touch/sw/sw/summon blue/touch/gonear d11/nw/summon red/touch/se/se/summon yellow/touch/gonear n11/drop rope/s/d/gonear e11/w/s/gonear u11/d/w/gonear n11/tie rope".

test c11 with "pick 11432/nw/summon white/touch/se/se/summon blue/touch/gonear d11/ne/summon yellow/touch/sw/sw/summon red/touch/gonear w11/drop rope/e/d/gonear n11/s/e/gonear u11/d/s/gonear w11/tie rope".
test c12 with "pick 1432/ne/summon white/touch/sw/sw/summon blue/touch/gonear d11/nw/summon yellow/touch/se/se/summon red/touch/gonear e11/drop rope/w/d/gonear n11/s/w/gonear u11/d/s/gonear e11/tie rope".

test c13 with "pick 12134/nw/summon red/touch/se/se/summon white/touch/gonear d11/ne/summon yellow/touch/sw/sw/summon blue/touch/gonear u11/drop rope/d/n/gonear e11/w/d/gonear s11/n/w/gonear u11/tie rope".
test c14 with "pick 2134/ne/summon red/touch/sw/sw/summon white/touch/gonear d11/nw/summon yellow/touch/se/se/summon blue/touch/gonear u11/drop rope/d/n/gonear w11/e/d/gonear s11/n/e/gonear u11/tie rope".

test c15 with "pick 12143/nw/summon red/touch/se/se/summon white/touch/gonear d11/ne/summon blue/touch/sw/sw/summon yellow/touch/gonear u11/drop rope/d/w/gonear s11/n/d/gonear e11/w/n/gonear u11/tie rope".
test c16 with "pick 2143/ne/summon red/touch/sw/sw/summon white/touch/gonear d11/nw/summon blue/touch/se/se/summon yellow/touch/gonear u11/drop rope/d/e/gonear s11/n/d/gonear w11/e/n/gonear u11/tie rope".

test c17 with "pick 12314/nw/summon red/touch/se/se/summon yellow/touch/gonear d11/ne/summon white/touch/sw/sw/summon blue/touch/gonear n11/drop rope/s/u/gonear e11/w/s/gonear d11/u/w/gonear n11/tie rope".
test c18 with "pick 2314/ne/summon red/touch/sw/sw/summon yellow/touch/gonear d11/nw/summon white/touch/se/se/summon blue/touch/gonear n11/drop rope/s/u/gonear w11/e/s/gonear d11/u/e/gonear n11/tie rope".

test c19 with "pick 12341/nw/summon red/touch/se/se/summon yellow/touch/gonear d11/ne/summon blue/touch/sw/sw/summon white/touch/gonear w11/drop rope/e/u/gonear s11/n/e/gonear d11/u/n/gonear w11/tie rope".
test c20 with "pick 2341/ne/summon red/touch/sw/sw/summon yellow/touch/gonear d11/nw/summon blue/touch/se/se/summon white/touch/gonear e11/drop rope/w/u/gonear s11/n/w/gonear d11/u/n/gonear e11/tie rope".

test c21 with "pick 12413/nw/summon red/touch/se/se/summon blue/touch/gonear d11/ne/summon white/touch/sw/sw/summon yellow/touch/gonear n11/drop rope/s/w/gonear d11/u/s/gonear e11/w/u/gonear n11/tie rope".
test c22 with "pick 2413/ne/summon red/touch/sw/sw/summon blue/touch/gonear d11/nw/summon white/touch/se/se/summon yellow/touch/gonear n11/drop rope/s/e/gonear d11/u/s/gonear w11/e/u/gonear n11/tie rope".

test c23 with "pick 12431/nw/summon red/touch/se/se/summon blue/touch/gonear d11/ne/summon yellow/touch/sw/sw/summon white/touch/gonear w11/drop rope/e/n/gonear d11/u/e/gonear s11/n/u/gonear w11/tie rope".
test c24 with "pick 2431/ne/summon red/touch/sw/sw/summon blue/touch/gonear d11/nw/summon yellow/touch/se/se/summon white/touch/gonear e11/drop rope/w/n/gonear d11/u/w/gonear s11/n/u/gonear e11/tie rope".

test c25 with "pick 13124/nw/summon yellow/touch/se/se/summon white/touch/gonear d11/ne/summon red/touch/sw/sw/summon blue/touch/gonear e11/drop rope/w/n/gonear u11/d/w/gonear s11/n/d/gonear e11/tie rope".
test c26 with "pick 3124/ne/summon yellow/touch/sw/sw/summon white/touch/gonear d11/nw/summon red/touch/se/se/summon blue/touch/gonear w11/drop rope/e/n/gonear u11/d/e/gonear s11/n/d/gonear w11/tie rope".

test c27 with "pick 13142/nw/summon yellow/touch/se/se/summon white/touch/gonear d11/ne/summon blue/touch/sw/sw/summon red/touch/gonear s11/drop rope/n/w/gonear u11/d/n/gonear e11/w/d/gonear s11/tie rope".
test c28 with "pick 3142/ne/summon yellow/touch/sw/sw/summon white/touch/gonear d11/nw/summon blue/touch/se/se/summon red/touch/gonear s11/drop rope/n/e/gonear u11/d/n/gonear w11/e/d/gonear s11/tie rope".

test c29 with "pick 13214/nw/summon yellow/touch/se/se/summon red/touch/gonear d11/ne/summon white/touch/sw/sw/summon blue/touch/gonear e11/drop rope/w/u/gonear n11/s/w/gonear d11/u/s/gonear e11/tie rope".
test c30 with "pick 3214/ne/summon yellow/touch/sw/sw/summon red/touch/gonear d11/nw/summon white/touch/se/se/summon blue/touch/gonear w11/drop rope/e/u/gonear n11/s/e/gonear d11/u/s/gonear w11/tie rope".

test c31 with "pick 13241/nw/summon yellow/touch/se/se/summon red/touch/gonear d11/ne/summon blue/touch/sw/sw/summon white/touch/gonear s11/drop rope/n/u/gonear w11/e/n/gonear d11/u/e/gonear s11/tie rope".
test c32 with "pick 3241/ne/summon yellow/touch/sw/sw/summon red/touch/gonear d11/nw/summon blue/touch/se/se/summon white/touch/gonear s11/drop rope/n/u/gonear e11/w/n/gonear d11/u/w/gonear s11/tie rope".

test c33 with "pick 13412/nw/summon yellow/touch/se/se/summon blue/touch/gonear d11/ne/summon white/touch/sw/sw/summon red/touch/gonear d11/drop rope/u/w/gonear n11/s/u/gonear e11/w/s/gonear d11/tie rope".
test c34 with "pick 3412/ne/summon yellow/touch/sw/sw/summon blue/touch/gonear d11/nw/summon white/touch/se/se/summon red/touch/gonear d11/drop rope/u/e/gonear n11/s/u/gonear w11/e/s/gonear d11/tie rope".

test c35 with "pick 13421/nw/summon yellow/touch/se/se/summon blue/touch/gonear d11/ne/summon red/touch/sw/sw/summon white/touch/gonear d11/drop rope/u/n/gonear w11/e/u/gonear s11/n/e/gonear d11/tie rope".
test c36 with "pick 3421/ne/summon yellow/touch/sw/sw/summon blue/touch/gonear d11/nw/summon red/touch/se/se/summon white/touch/gonear d11/drop rope/u/n/gonear e11/w/u/gonear s11/n/w/gonear d11/tie rope".

test c37 with "pick 14123/nw/summon blue/touch/se/se/summon white/touch/gonear d11/ne/summon red/touch/sw/sw/summon yellow/touch/gonear e11/drop rope/w/d/gonear s11/n/w/gonear u11/d/n/gonear e11/tie rope".
test c38 with "pick 4123/ne/summon blue/touch/sw/sw/summon white/touch/gonear d11/nw/summon red/touch/se/se/summon yellow/touch/gonear w11/drop rope/e/d/gonear s11/n/e/gonear u11/d/n/gonear w11/tie rope".

test c39 with "pick 14132/nw/summon blue/touch/se/se/summon white/touch/gonear d11/ne/summon yellow/touch/sw/sw/summon red/touch/gonear s11/drop rope/n/d/gonear e11/w/n/gonear u11/d/w/gonear s11/tie rope".
test c40 with "pick 4132/ne/summon blue/touch/sw/sw/summon white/touch/gonear d11/nw/summon yellow/touch/se/se/summon red/touch/gonear s11/drop rope/n/d/gonear w11/e/n/gonear u11/d/e/gonear s11/tie rope".

test c41 with "pick 14213/nw/summon blue/touch/se/se/summon red/touch/gonear d11/ne/summon white/touch/sw/sw/summon yellow/touch/gonear e11/drop rope/w/s/gonear d11/u/w/gonear n11/s/u/gonear e11/tie rope".
test c42 with "pick 4213/ne/summon blue/touch/sw/sw/summon red/touch/gonear d11/nw/summon white/touch/se/se/summon yellow/touch/gonear w11/drop rope/e/s/gonear d11/u/e/gonear n11/s/u/gonear w11/tie rope".

test c43 with "pick 14231/nw/summon blue/touch/se/se/summon red/touch/gonear d11/ne/summon yellow/touch/sw/sw/summon white/touch/gonear s11/drop rope/n/e/gonear d11/u/n/gonear w11/e/u/gonear s11/tie rope".
test c44 with "pick 4231/ne/summon blue/touch/sw/sw/summon red/touch/gonear d11/nw/summon yellow/touch/se/se/summon white/touch/gonear s11/drop rope/n/w/gonear d11/u/n/gonear e11/w/u/gonear s11/tie rope".

test c45 with "pick 14312/nw/summon blue/touch/se/se/summon yellow/touch/gonear d11/ne/summon white/touch/sw/sw/summon red/touch/gonear d11/drop rope/u/s/gonear e11/w/u/gonear n11/s/w/gonear d11/tie rope".
test c46 with "pick 4312/ne/summon blue/touch/sw/sw/summon yellow/touch/gonear d11/nw/summon white/touch/se/se/summon red/touch/gonear d11/drop rope/u/s/gonear w11/e/u/gonear n11/s/e/gonear d11/tie rope".

test c47 with "pick 14321/nw/summon blue/touch/se/se/summon yellow/touch/gonear d11/ne/summon red/touch/sw/sw/summon white/touch/gonear d11/drop rope/u/e/gonear s11/n/u/gonear w11/e/n/gonear d11/tie rope".
test c48 with "pick 4321/ne/summon blue/touch/sw/sw/summon yellow/touch/gonear d11/nw/summon red/touch/se/se/summon white/touch/gonear d11/drop rope/u/w/gonear s11/n/u/gonear e11/w/n/gonear d11/tie rope".]

test c1-0a with "pick 11234/av/nw/summon white/touch/se/se/summon red/touch/nw/n/n/d/d/d/s/ne/summon yellow/touch/sw/sw/summon blue/touch/ne/n/n/u/u/u/s/drop rope/d/e/n/n/w/s/d/w/w/u/e/s/u/u/n/tie rope".
test c1-1a with "pick 11234/av/nw/summon white/touch/se/se/summon red/touch/nw/n/n/d/d/d/s/ne/summon yellow/touch/sw/sw/summon blue/touch/ne/s/s/u/drop rope/n/u/e/e/d/w/n/d/d/s/u/w/s/s/e/tie rope".
test c1-2a with "pick 11234/av/nw/summon white/touch/se/se/summon red/touch/nw/n/n/d/d/d/s/ne/summon yellow/touch/sw/sw/summon blue/touch/ne/w/w/u/drop rope/e/s/u/u/n/d/e/n/n/w/s/d/w/w/u/tie rope".
test c1-3a with "pick 11234/av/nw/summon white/touch/se/se/summon red/touch/nw/n/n/d/d/d/s/ne/summon yellow/touch/sw/sw/summon blue/touch/ne/drop rope/u/w/s/s/e/n/u/e/e/d/w/n/d/d/s/tie rope".
[test c1-4a with "pick 11234/av/nw/summon white/touch/se/se/summon red/touch/nw/n/n/d/d/d/s/ne/summon yellow/touch/sw/sw/summon blue/touch/ne/n/n/u/drop rope/s/d/w/w/u/e/s/u/u/n/d/e/n/n/w/tie rope".
test c1-5a with "pick 11234/av/nw/summon white/touch/se/se/summon red/touch/nw/n/n/d/d/d/s/ne/summon yellow/touch/sw/sw/summon blue/touch/ne/e/e/u/drop rope/w/n/d/d/s/u/w/s/s/e/n/u/e/e/d/tie rope".
test c1-6a with "pick 11234/av/nw/summon white/touch/se/se/summon red/touch/nw/n/n/d/d/d/s/ne/summon yellow/touch/sw/sw/summon blue/touch/ne/s/s/u/drop rope/n/w/d/d/e/u/n/e/e/s/w/u/s/s/d/tie rope".
test c1-7a with "pick 11234/av/nw/summon white/touch/se/se/summon red/touch/nw/n/n/d/d/d/s/ne/summon yellow/touch/sw/sw/summon blue/touch/ne/w/w/u/drop rope/e/d/n/n/u/s/e/u/u/w/d/s/w/w/n/tie rope".
test c1-8a with "pick 11234/av/nw/summon white/touch/se/se/summon red/touch/nw/n/n/d/d/d/s/ne/summon yellow/touch/sw/sw/summon blue/touch/ne/drop rope/u/n/e/e/s/w/u/s/s/d/n/w/d/d/e/tie rope".
test c1-9a with "pick 11234/av/nw/summon white/touch/se/se/summon red/touch/nw/n/n/d/d/d/s/ne/summon yellow/touch/sw/sw/summon blue/touch/ne/n/n/u/drop rope/s/e/u/u/w/d/s/w/w/n/e/d/n/n/u/tie rope".
test c1-10a with "pick 11234/av/nw/summon white/touch/se/se/summon red/touch/nw/n/n/d/d/d/s/ne/summon yellow/touch/sw/sw/summon blue/touch/ne/e/e/u/drop rope/w/u/s/s/d/n/w/d/d/e/u/n/e/e/s/tie rope".
test c1-11a with "pick 11234/av/nw/summon white/touch/se/se/summon red/touch/nw/n/n/d/d/d/s/ne/summon yellow/touch/sw/sw/summon blue/touch/ne/n/n/u/u/u/s/drop rope/d/s/w/w/n/e/d/n/n/u/s/e/u/u/w/tie rope".]

chapter direction testing

test ud with "ne/sw/ws/en/nw/se/es/wn".
test uds with "gonear u11/test ud/gonear d11/test ud".
test ns with "ue/dw/wd/eu/uw/de/ed/wu".
test nss with "gonear n11/test ns/gonear s11/test ns".
test ew with "un/ds/sd/nu/us/dn/nd/su".
test ews with "gonear e11/test ew/gonear w11/test ew".

test uofftest with "gotesty/gonear u11/nw/test udofftest".
test dofftest with "gotesty/gonear d11/nw/test udofftest".
test udofftest with "sw/w/nw/n/ne/
e/nw/n/ne/
e/nw/n/ne/e/se/
s/ne/e/se/
s/ne/e/se/s/sw/
w/se/s/sw/
w/se/s/sw/w/nw/
n/sw/w/nw/
ne/se/sw/nw/se/ne/nw/sw".

test nofftest with "gotesty/gonear n11/uw/test nsofftest".
test sofftest with "gotesty/gonear s11/uw/test nsofftest".
test nsofftest with "dw/w/uw/u/ue/
e/uw/u/ue/
e/uw/u/ue/e/de/
s/ue/e/de/
s/ue/e/de/d/dw/
w/de/d/dw/
w/de/d/dw/w/uw/
u/dw/w/uw/
ue/de/dw/uw/de/ue/uw/dw"

test eofftest with "gotesty/gonear e11/us/test ewofftest".
test wofftest with "gotesty/gonear w11/us/test ewofftest".
test ewofftest with "ds/s/us/u/un/
n/us/u/un/
n/us/u/un/n/dn/
d/un/n/dn/
d/un/n/dn/d/ds/
s/dn/d/ds/
s/dn/d/ds/s/us/
u/ds/s/us/
un/dn/ds/us/dn/un/us/ds
"

test viewstrung with "pick 11234/sw/blue/touch/ne/ne/yellow/touch/e/ds/ds/d/red/touch/nw/nw/white/touch/n/eu/drop rope/s/w/s/s/e/n/e/w/s/n/e/s/s/w/w".

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

Cube Cavern Test Scripts ends here.

---- DOCUMENTATION ----