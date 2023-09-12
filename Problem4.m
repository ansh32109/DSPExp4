data=load("Exp4Data3.txt");
N=length(data);

hamming_window=hamming(N);
windowed_signal=data.*(hamming_window)';

hamming_fft=fft(windowed_signal, 1e4);

freq_hamming=(0:(length(hamming_fft)-1))/1e4;

figure;
subplot(2,1,1);
plot(freq_hamming, abs(hamming_fft)/1e4);
grid on;
title("DFT Magnitude with Hamming");
xlabel("Frequency (Hz)");
ylabel("Magnitude");

[max_amp_hamming, idx_max_hamming] = findpeaks(abs(hamming_fft)/1e4, "SortStr","descend");
peak_freq_hamming = freq_hamming(idx_max_hamming);

rectangular_window=rectwin(N);
rectangular_signal=data.*(rectangular_window)';

rectangular_fft=fft(rectangular_signal,1e4);

freq_rectangular=(0:length(rectangular_fft)-1)/1e4;

subplot(2,1,2);
plot(freq_rectangular, abs(rectangular_fft)/1e4);
grid on;
title("DFT Magnitude with Rectangular Window");
xlabel("Frequency (Hz)");
ylabel("Magnitude");

[amp_rectangular, id_max_rectangular]=findpeaks(abs(rectangular_fft)/1e4, SortStr="descend");
peak_freq_rectangular=freq_rectangular(id_max_rectangular);

fprintf("Frequency 1 for Hamming: (%.3f)*Fs Hz\n", peak_freq_hamming(1));
fprintf("Frequency 2 for Hamming: (%.3f)*Fs Hz\n", peak_freq_hamming(2));

fprintf("Frequency 1 for Rectangular: (%.3f)*Fs Hz\n", peak_freq_rectangular(1));
fprintf("Frequency 2 for Rectangular: (%.3f)*Fs Hz\n", peak_freq_rectangular(2));