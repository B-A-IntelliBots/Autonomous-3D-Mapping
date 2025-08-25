raw_signal = load('YourSampledSignalFile.txt');
dt = 0.001; % Sampling interval in seconds
time = (1:length(raw_signal)) * dt;
n = (-fix(length(raw_signal)/2)):(fix(length(raw_signal)/2));
freq_spectrum = fftshift(fft(raw_signal));

% Figure 1: Original Signal in Time Domain
figure
plot(time, raw_signal, 'r', 'LineWidth', 1.25);
xlabel('Time (s)');
ylabel('Angular Velocity (RPM)');
title('Original Signal');
grid on

% Figure 2: FFT of Original Signal to detect where the high-frequencies (noise) exist
figure
stem(n / length(n) * 2 * pi, abs(freq_spectrum) / length(n));
xlabel('Normalized Frequency (rad/sample)');
ylabel('Magnitude');
title('Frequency Spectrum of Original Signal');
grid on

