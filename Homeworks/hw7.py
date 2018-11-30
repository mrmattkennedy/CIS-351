import math
import sys

########################
#     Cache
#    _______
#   |___|___|}
#   |___|___| } set size
#   |___|___| }
#   |___|___|}
#       V
#    way size
########################

totalBits = 32
blocks = 8
base = 2

def nWay(binData, ways):
    if blocks % ways != 0:
        print("Ways is not a valid value")
        return

    num_sets = int(blocks / ways)               #number of sets = # blocks / # ways
    set_bits_size = int(math.log(num_sets, 2))  #set bit size = log base 2 (number of sets)
    tag_bits_offset = set_bits_size + 2         #00 + set bits
    tag_size = totalBits - tag_bits_offset      #number of bits in tag = 32 - set bits - 2 (for 00)

    #no shallow copy method works for cache to most recent, not sure why.
    cache = [[0] * ways for i in range(num_sets)] #create list of lists, set * ways
    mostRecent = [[0] * ways for i in range(num_sets)] #create list of lists, set * ways

    misses = 0
    hits = 0
    for num in binData:
        #convert int to binary, shift right to get rid of set and 00, [2:] to remove 0b
        tag = bin(int(num, base) >> tag_bits_offset)[2:].zfill(tag_size)            
        #get rid of 00, take last set_bits_size nums
        set = (bin(int(num, base) >> 2))[-set_bits_size:]                   
        set = int(set, base)    #convert to int base 10
        if num_sets == 1:       #log base 2 (1) = 0, so this is necessary
            set = 0

        if tag in cache[set]:
            print(num + " at " + str(set) + " hit")                     #hit
            hits += 1 
        else:
            print(num + " at " + str(set) + " miss")                    #miss
            lru = min(mostRecent[set])                                  #least recently used
            cache[set][lru] = tag
            mostRecent[set][lru] = ways
            mostRecent[set][:] = [num - 1 for num in mostRecent[set]]
            misses += 1

    print("Hits: " + str(hits))
    print("Misses: " + str(misses))
    for elem in cache:
        print(elem)

hexdata = ["F000CA7C",
        "110092AC",
        "AB20CAE8",
        "12A0CA94",
        "30A0CA50",
        "F0FFCA60",
        "F0BDCAE8",
        "F220CA8C",
        "12A0CA94",
        "2300CA34",
        "12A0CA94",
        "23A0CA9C",
        "F000CA7C",
        "F000CA7C",
        "110092AC",
        "76A0CAC4",
        "F0BBCAD4",
        "F000CA7C"
        ]
binData = []
scale = 16 #hex

for num in hexdata:
    temp = bin(int(num, scale))[2:].zfill(totalBits) #fill leading zeros
    print(num + " => " + temp)
    binData.append(temp)

print("\n\n")
for ways in sys.argv[1:]:
       nWay(binData, int(ways))

