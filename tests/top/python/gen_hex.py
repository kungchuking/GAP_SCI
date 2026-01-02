# Convert .bmp image to .dat file

from PIL import Image
import numpy as np
import struct

mode = input('Binary or hexadecimal? Enter b/h: ')
assert mode in ['b', 'h'], 'Invalid mode'

img = Image.open("../bssr_64.bmp")
img = np.array(img).astype(np.float16) / 255.

with open("../bssr_64.dat", "w") as fd:
    for row in img:
        for col in row:
            # -- Get the raw 2-byte representation
            raw_bytes = col.tobytes()
            
            # -- Unpack the bytes into an unsigned short (16-bit integer)
            raw_int = struct.unpack('H', raw_bytes)[0]
            
            # -- Convert the integer to its bin/hex string representation, padded to 16 bits
            
            if mode == 'b':
                binary_representation = bin(raw_int)[2:].zfill(16)
            elif mode == 'h':
                binary_representation = hex(raw_int)[2:].zfill(4)

            print (binary_representation, file=fd)
