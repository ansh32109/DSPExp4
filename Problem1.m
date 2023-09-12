
alpha = 3; 
f = 15 * alpha;
T = 2;  
Fs = 120;
N = T * Fs; 
t = (0:N-1) * (1/Fs);  

x = sin(2 * pi * f * t);

%part 1 solution
X = fft(x(1:120));  

frequencies = (0:length(X)-1) * (Fs/length(X));  

stem(frequencies, abs(X));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude of DFT of First N Samples');
grid on;
hold on;

%part 2 solution
X2 = fft(x(1:130));
freq = (0:length(X2)-1)*(Fs/length(X2));
stem(freq , abs(X2));
legend("120 samples" , "130 samples");

%part 3 solution
X2 = fft(x(1:240));
freq = (0:length(X2)-1)*(Fs/length(X2));
stem(freq , abs(X2));
legend("120 samples" , "240 samples" , "130 samples");