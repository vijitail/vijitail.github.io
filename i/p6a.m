pkg load communications;
sig = repmat([3 3 1 3 3 3 3 3 2 3],1,50);
symbols = [1 2 3];
p = [0.1 0.1 0.8];
dict = huffmandict(symbols,p);
hcode = huffmanenco(sig,dict);
dhsig = huffmandeco(hcode,dict);
isequal(sig,dhsig)
binarySig = de2bi(sig);
seqLen = numel(binarySig)
binaryhcode = de2bi(hcode);
encodedLen = numel(binaryhcode)
