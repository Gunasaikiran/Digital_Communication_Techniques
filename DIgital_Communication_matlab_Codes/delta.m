%% Delta Modulation (DM)
%delta modulation = 1-bit differential pulse code modulation (DPCM)
predictor = [0 1];
step=0.3; 
partition = [0];
codebook = [-1*step step]; %DM quantizer
t = [0:pi/20:2*pi];
x = 1.1*sin(2*pi*0.1*t); 

encodedx = dpcmenco(x,codebook,partition,predictor);
decodedx = dpcmdeco(encodedx,codebook,predictor);
distor = sum((x-decodedx).^2)/length(x); 
% plots
figure,
subplot(3,1,1);
plot(t,x);
xlabel('time');
title('original signal');
subplot(3,1,2);
stairs(t,10*codebook(encodedx+1),'--');
xlabel('time');
title('DM output');
subplot(3,1,3);
plot(t,x);
hold;
stairs(t,decodedx);
grid;
xlabel('time');
title('received signal');