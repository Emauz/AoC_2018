from sys import stdin

sum = 0
reached = []
i = 0
while(True):
    print("loop" + str(i))
    i += 1
    with open("input") as f:
        for line in f:
            if sum in reached:
                print(sum)
                exit()
            else:
                reached.append(sum)
                sum += int(line)
