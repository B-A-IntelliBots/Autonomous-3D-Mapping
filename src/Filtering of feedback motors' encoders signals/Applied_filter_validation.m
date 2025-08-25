%% Load the raw signal
raw_signal = load('YourSampledSignalFile.txt');

%% Sampling information
dt = 0.001; % Sampling interval in seconds
time = (0:length(raw_signal)-1) * dt;

%% Apply FIR filter
filtered_signal = filter(FilterObjectName, raw_signal);

%% Compute FFTs
raw_fft = fftshift(fft(raw_signal));
filtered_fft = fftshift(fft(filtered_signal));
freq = linspace(-pi, pi, length(raw_signal)); % Normalized frequency

%% Figure 1: Original vs Filtered Signal in Time Domain
figure
plot(time, raw_signal, 'r', 'LineWidth', 1.25);
hold on
plot(time, filtered_signal, 'b', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Angular Velocity (RPM)');
title('Original vs Filtered Signal');
legend('Original Signal', 'Filtered Signal');
grid on
hold off

%% Figure 2: Original Signal Only
figure
plot(time, raw_signal, 'r', 'LineWidth', 1.25);
xlabel('Time (s)');
ylabel('Angular Velocity (RPM)');
title('Original Signal');
grid on

%% Figure 3: Filtered Signal Only
figure
plot(time, filtered_signal, 'b', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Angular Velocity (RPM)');
title('Filtered Signal');
grid on

%% Figure 4: FFT of Filtered Signal
figure
stem(freq, abs(filtered_fft) / length(raw_signal));
xlabel('Normalized Frequency (rad/sample)');
ylabel('Magnitude');
title('Frequency Spectrum of Filtered Signal');
grid on

%% Figure 5: FFT of Original Signal
figure
stem(freq, abs(raw_fft) / length(raw_signal));
xlabel('Normalized Frequency (rad/sample)');
ylabel('Magnitude');
title('Frequency Spectrum of Original Signal');
grid on
