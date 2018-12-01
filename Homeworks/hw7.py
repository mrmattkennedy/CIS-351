import math
import sys

###############################################
#                   Cache
#            _____________________
#           |0xFFFFFFFF|0xFFFFFFFF|
#           |0xFFFFFFFF|0xFFFFFFFF|
#           |0xFFFFFFFF|0xFFFFFFFF|
#           |0xFFFFFFFF|0xFFFFFFFF|
#            ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
#   Capacity = block size * way size * set size
###############################################

totalBits = 32
blocks = 8
base = 2

def nWay(hexData, binData, ways):
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
    count = 0
    print("\n" + str(ways) + " ways:\n")

    for num in binData:
        hitTag = ""
        #convert int to binary, shift right to get rid of set and 00, [2:] to remove 0b
        tag = bin(int(num, base) >> tag_bits_offset)[2:].zfill(tag_size)            
        #get rid of 00, take last set_bits_size nums
        set = (bin(int(num, base) >> 2))[-set_bits_size:]                   
        set = int(set, base)    #convert to int base 10
        if num_sets == 1:       #log base 2 (1) = 0, so this is necessary
            set = 0

        if tag in cache[set]:
            hitTag = "hit"
            hits += 1 
        else:
            hitTag = "miss"
            lru = min(mostRecent[set])                                  #least recently used
            cache[set][lru] = tag
            mostRecent[set][lru] = ways
            mostRecent[set][:] = [num - 1 for num in mostRecent[set]]
            misses += 1        
        print("#" + str(count+1) + ": 0x" + hexData[count] + "/" + num + " at set " + bin(set)[2:].zfill(set_bits_size) + "/" + str(set) + " " + hitTag)
        count += 1
        for elem in cache:
            print(elem)
        print("\n")
    
    print("Hits: " + str(hits))
    print("Misses: " + str(misses))

                          
def getData(hexData, binData):
    ways = [1, 2, 4]
    count = 0
    for num in binData:
        temp = ""
        for way in ways:
            num_sets = int(blocks / way)                #number of sets = # blocks / # ways
            set_bits_size = int(math.log(num_sets, 2))  #set bit size = log base 2 (number of sets)
            tag_bits_offset = set_bits_size + 2         #00 + set bits
            tag_size = totalBits - tag_bits_offset      #number of bits in tag = 32 - set bits - 2 (for 00)
            
            #convert int to binary, shift right to get rid of set and 00, [2:] to remove 0b
            tag = bin(int(num, base) >> tag_bits_offset)[2:].zfill(tag_size)         
            #get rid of 00, take last set_bits_size nums
            set = (bin(int(num, base) >> 2))[-set_bits_size:].zfill(set_bits_size)

            temp += "#Ways: " + str(way) + "\tSet-" + str(set) + "\tTag-" + str(tag) + "\n"

        print("#" + str(count+1) + ": 0x" + hexData[count] + " => " + num + "\n" + temp + "\n")
        count += 1
        
hexData = ["F000CA7C",
        "110092AC",
        "AB20CAE8",
        "12A0CA94",
        "30A0CA50",
        "F0FFCA60",
        "F0BDCAE8",
        "F220CA8C",
        "12A0CA94",
        "2300CA34",
        "23A0CA20",
        "12A0CA94",
        "23A0CA9C",
        "F000CA7C",
        "110092AC",
        "76A0CAC4",
        "F0BBCAD4",
        "F000CA7C"
        ]
binData = []
scale = 16 #hex

for num in hexData:
    temp = bin(int(num, scale))[2:].zfill(totalBits) #fill leading zeros
    binData.append(temp)


print("\n\n")
for ways in sys.argv[1:]:
       nWay(hexData, binData, int(ways))
#getData(hexData, binData)
