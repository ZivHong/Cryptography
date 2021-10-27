import sys

fileName = sys.argv[1]
out = sys.argv[2]
# fileName = "1024-ofb.txt"
# out = "test.txt"
offset = 55
def bitstring_to_bytes(s): # convert 0bxxxxx to bytes
    return int(s, 2).to_bytes((len(s) + 7) // 8, byteorder=sys.byteorder)

fh = open(fileName, "r+b")
output = open(out, 'w+b')
output.write(fh.read(offset))
fh.seek(offset)
text = fh.read(1)
bin_text = bin(int.from_bytes(text, byteorder=sys.byteorder))
s= list(bin_text)
if bin_text[-1]=='1' : s[-1]='0'
else: s[-1]='1'
bin_text = "".join(s)
patch = bitstring_to_bytes(bin_text[2:])
output.write(patch)
fh.seek(offset+1)
output.write(fh.read())