def split_twos(s):
    return [s[x:x+2] for x in xrange(0,len(s),2)]

d1 = "55EB38E653DB9C4A5160A2F1DAC8D7BA498E4465E2EF5533738E19D251604DEC"
d2 = "53EF25F91CC88D1E566CBB9C5924E7141591222D3AD128D933AE413AA82BDEA8"
d3 = "44E22EF34E899804532FB8F3D7D8BE8AE7ED55769F5C9837EB5A6CDB94022D7C"

messages = [
    "charge",
    "prepare ambush",
    "raid trenches",
    "tank attack",
    "bomber attack",
    "battleship attack",
    "submarine attack",
    "fire missiles",
    "sniper fire",
    "encircle enemy",
    "full frontal assault",
    "retreat",
    "feint retreat",
    "skirmish",
    "blockade",
    "lay mines",
    "fortify",
    "create distraction",
    "clear and hold",
    "split up",
    "set up a perimeter",
    "destroy bridges",
    "sabotage enemy missile defense",
    "restore formation",
    "launch the nukes"
]

sd1 = map(lambda x: int(x, 16), split_twos(d1))
sd2 = map(lambda x: int(x, 16), split_twos(d2))
sd3 = map(lambda x: int(x, 16), split_twos(d3))
    

d12 = [0]*len(sd1)
d23 = [0]*len(sd2)
d13 = [0]*len(sd3)

for i,c in enumerate(sd1):
    d12[i] = sd1[i] ^ sd2[i]
    
for i,c in enumerate(sd2):
    d23[i] = sd2[i] ^ sd3[i]

for i,c in enumerate(sd3):
    d13[i] = sd1[i] ^ sd3[i]

for w1 in messages:
    for w2 in messages:
        for a,d in {"d12": d12, "d23": d23, "d13": d13}.iteritems():
            matched = True
            for i in xrange(min(len(w1), len(w2))):
                if (ord(w1[i]) ^ ord(w2[i]) != d[i]):
                    matched = False
                    break
            if matched:
                print a + " " + w1 + " / " + w2
