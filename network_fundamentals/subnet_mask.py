def pp(ip):
    for b in ip[:-1]:
        print(str(b)+".", end="")
    print(ip[-1])

def bpp(ip):
    for b in ip:
        print(bin(b)[2:], "| ", end="")
    print()

def bit_not(n, numbits=8):
    # 1 << numbits - 1
    # produces mask 111...numbits
    return (1 << numbits) - 1 - n

mask = "255.255.240.0"
parts = []
for i in mask.strip().split("."):
    parts.append(int(i))

pp(parts)


highest = []
# get highest address
for i in parts:
    highest.append(bit_not(i))
highest[-1] -= 1


pp(highest)
