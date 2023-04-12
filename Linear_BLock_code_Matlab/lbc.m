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
      %Generating Parity Matrix using generator matrix
      P=G(:,k+1:n);
      disp('Parity matrix');
      disp(P);
      %c=mp
      c=mod(M*P, 2);
      %displaying Codewords
      disp('Code words vector');
      disp(c);
      weight = zeros(2^k,1);
      for i=1:2^k
           for j=1:k
              if M(i,j) == 1
                 weight(i) = weight(i) + 1;
              end
           end
      end
      for i=1:2^k
           for j=1:n-k
               if c(i,j) == 1
                 weight(i) = weight(i) + 1;
               end
           end
      end
      sort(weight);
      %Finding minimum no of ones
      dmin=weight(2);
      disp('Minimum weight(dmin):');
      disp(dmin);
      %error Detection,correction
      ed=dmin-1;ec=ed/2;
      disp('Error Detection:');disp(ed);
      disp('Error Correction:');disp(ec);

