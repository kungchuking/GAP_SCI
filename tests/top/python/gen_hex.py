from PIL import Image
import numpy as np
import struct

img = Image.open("../bssr2_64.bmp")
img = np.array(img).astype(np.float16) / 255.

with open("../bssr2_64.dat", "w") as fd:
    for row in img:
        for col in row:
            # -- Get the raw 2-byte representation
            raw_bytes = col.tobytes()
            
            # -- Unpack the bytes into an unsigned short (16-bit integer)
            raw_int = struct.unpack('H', raw_bytes)[0]
            
            # -- Convert the integer to its binary string representation, padded to 16 bits
            binary_representation = bin(raw_int)[2:].zfill(16)
    
            print (binary_representation, file=fd)
