# Generate script for testfixture_1

import struct
import numpy as np
from random import random, uniform

def to_bin(x):
    return bin(struct.unpack('H', np.float16(x).tobytes())[0])[2:].zfill(16)

def to_hex(x):
    return hex(struct.unpack('H', np.float16(x).tobytes())[0])[2:].zfill(4)

def hex_to_float16(hex_str):
    # Convert hex string to 2 bytes
    byte_data = bytes.fromhex(hex_str)
    # Unpack the bytes as a 16-bit unsigned integer
    uint16_val = struct.unpack('>H', byte_data)[0]  # Big-endian
    # View the bits as a float16 using numpy
    float16_val = np.frombuffer(np.uint16(uint16_val).tobytes(), dtype=np.float16)[0]
    return float16_val

fd = open('float.dat', 'w')

for x in range(20):
    a = np.float16(uniform(-6e4, 6e4))
    b = np.float16(uniform(-6e4, 6e4))
    r = np.float16(a - b)
    overflow = 1 if abs(r) > np.finfo(np.float16).max else 0
    print(to_hex(a), to_hex(b), to_hex(r), overflow)
    print(f'a_in <= 16\'h{to_hex(a)};\nb_in <= 16\'h{to_hex(b)};\n#20', file = fd)