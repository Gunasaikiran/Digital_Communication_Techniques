X = input('Enter the number of symbol:');
N =1:X;
disp('The Number of symbols are N:');
disp(N);
P = input('enter the probabilities =');
disp('The probabilities are:');
disp(P);
S=sort(P,'descend');
disp('The sorted probabilities are :');
disp(S);
[dict,avglen]=huffmandict(N,S);
disp('The average length of the code is:');
disp(avglen);
H=0;
for i=1:X
H=H+(P(i)*log2(1/P(i)));
end
disp('Entropy is :');
disp(H);
disp('bits/msg');
E=(H/avglen)*100;
disp('Effciency is :');disp(E);
codeword=huffmanenco(N,dict);
disp('The codewords are :');disp(codeword);
decode=huffmandeco(codeword,dict);
disp('The decoded output is:');disp(decode);