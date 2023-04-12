clc;
%Taking inputs of codeword length,messgebits,generator and Message matrix
n=input('Enter codeword length\n');
k=input('Enter No of msg bits\n');
G=input('Enter Generator matrix\n');
for i = 1 : 2^k  
  
  % Iterate through Vector with Specified Increment 
  % or in simple words here we are decrementing 4 till we get 1    
  for j = k : -1 : 1 
    if rem(i - 1, 2 ^ (-j + k + 1)) >= 2 ^ (-j + k)
      M(i, j) = 1;
    else
      M(i, j) = 0;
    end 
  end
end
disp('Message matrix');
disp(M);
code=encode(M,n,k,'linear',G);
%displaying Encoding bits
disp('Encoding Data:'); 
disp(code);
%Generating Parity Matrix using codeword length
P=hammgen(n-k);
E=syndtable(P);
disp('Error Matrix');disp(E);
p1=G(:,k+1:n);P=(p1)';
disp('Parity matrix');disp(P);
I=eye(k-1);H=[P I];h=H';
%Syndrome=E*H'
S=mod(E*h, 2);
disp('Syndrome Table:');disp(S);
weight = zeros(2^k,1);
for i=1:2^k
    for j=1:n
        if code(i,j) == 1
            weight(i) = weight(i) + 1;
        end
    end
end
sort(weight);dmin=weight(2);
disp('Minimum weight(dmin):');disp(dmin);
%error Detection correction
ed=dmin-1;ec=ed/2;
disp('Error Detection:');disp(ed);
disp('Error Correction:');disp(ec);
%Generating Decoded output
M1=decode(code,n,k,'linear',G);
disp('Decoding Data:');disp(M1);