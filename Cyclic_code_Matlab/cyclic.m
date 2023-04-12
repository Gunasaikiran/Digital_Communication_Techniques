clc;
%Taking inputs of codeword length,messgebits,generator and Message matrix
n=input('Enter codeword length\n');
k=input('Enter No of msg bits\n');
G=input('Enter Generator matrix\n');
d=dec2bin(0:2^k-1); %Generating message vectors using k;
disp('Message Vectors:');
disp(d);
[i,px]=cyclgen(n,G); %generating matrix using function which does an row operations to get [pk,i] form
% disp('Generator sub matrix using Generator Polynomial:');
% disp(px);
g=circshift(px,[0,k]); %shifting the matrix to form Generator matrix[i,pk]
disp('Generator matrix :');
disp(g);
c=rem(d*g,2);%codevectors=messagevectors*generatormatrix
disp('Code Vectors:');
disp(c);