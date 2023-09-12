A = 160;
B = 166;
T = 10;
Fs = 200;
N = Fs*T;
t = (0:N-1)*(1/Fs);
xa = (0.1)*sin(A*pi*t) + cos(B*pi*t);
len1 = blackman(215);
len2 = blackman(415);
len3 = blackman(1115);
len4 = blackman(1515);
len5 = blackman(1915);

x1 = abs(fft(xa(1:215).*len1));
frequencies1 = (0:length(x1)-1) * (Fs/length(x1));
x2 = abs(fft(xa(1:415).*len2));
frequencies2 = (0:length(x2)-1) * (Fs/length(x2));
x3 = abs(fft(xa(1:1115).*len3));
frequencies3 = (0:length(x3)-1) * (Fs/length(x3));
x4 = abs(fft(xa(1:1515).*len4));
frequencies4 = (0:length(x4)-1) * (Fs/length(x4));
x5 = abs(fft(xa(1:1915).*len5));
frequencies5 = (0:length(x5)-1) * (Fs/length(x5));

subplot(3,2,1);
stem(frequencies1 , x1)
subplot(3,2,2);
stem(frequencies2 , x2)
subplot(3,2,3);
stem(frequencies3 , x3)
subplot(3,2,4);
stem(frequencies4 , x4)
subplot(3,2,5:6);
stem(frequencies5 , x5)